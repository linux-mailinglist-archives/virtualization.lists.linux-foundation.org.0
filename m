Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0F36BAB3
	for <lists.virtualization@lfdr.de>; Wed, 17 Jul 2019 12:54:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4DA65EC0;
	Wed, 17 Jul 2019 10:53:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CB145EB9
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 10:53:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 308BA25A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 10:53:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA9923083362;
	Wed, 17 Jul 2019 10:53:30 +0000 (UTC)
Received: from hp-dl380pg8-01.lab.eng.pek2.redhat.com
	(hp-dl380pg8-01.lab.eng.pek2.redhat.com [10.73.8.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D8CE1001B16;
	Wed, 17 Jul 2019 10:53:27 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V3 05/15] vhost: introduce helpers to manipulate shadow used
	ring
Date: Wed, 17 Jul 2019 06:52:45 -0400
Message-Id: <20190717105255.63488-6-jasowang@redhat.com>
In-Reply-To: <20190717105255.63488-1-jasowang@redhat.com>
References: <20190717105255.63488-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 17 Jul 2019 10:53:30 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, maxime.coquelin@redhat.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

We open coding vq->heads[] in net.c for:

1) implementing batching which in fact a shadow used ring
   implementation.
2) maintain pending heads in order which is in fact another kind of
   shadow used ring

But this expose used ring layout for device which makes it hard to
introduce new kind of ring like packed virtqueue. So this patch
introduces two types of shadow used ring API:

1) shadow used ring API for batch updating of used heads
2) zerocopy shadow used API for maintaining pending heads and batch
   updating used heads

This can help to hide the used ring layout from device. Device should
not mix using those two kinds of APIs.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vhost.c | 95 +++++++++++++++++++++++++++++++++++++------
 drivers/vhost/vhost.h | 18 ++++++++
 2 files changed, 100 insertions(+), 13 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index e781db88dfca..5bfca5b76b05 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -486,6 +486,7 @@ static void vhost_vq_reset(struct vhost_dev *dev,
 #if VHOST_ARCH_CAN_ACCEL_UACCESS
 	vhost_reset_vq_maps(vq);
 #endif
+	vq->nheads = 0;
 }
 
 static int vhost_worker(void *data)
@@ -2790,25 +2791,28 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 }
 EXPORT_SYMBOL_GPL(vhost_get_vq_desc);
 
-/* Reverse the effect of vhost_get_vq_desc. Useful for error handling. */
-void vhost_discard_vq_desc(struct vhost_virtqueue *vq, int n)
+static void vhost_withdraw_shadow_used(struct vhost_virtqueue *vq, int count)
 {
-	vq->last_avail_idx -= n;
+	BUG_ON(count > vq->nheads);
+	vq->nheads -= count;
 }
-EXPORT_SYMBOL_GPL(vhost_discard_vq_desc);
 
-/* After we've used one of their buffers, we tell them about it.  We'll then
- * want to notify the guest, using eventfd. */
-int vhost_add_used(struct vhost_virtqueue *vq, unsigned int head, int len)
+/* Reverse the effect of vhost_get_vq_desc and
+ * vhost_add_shadow_used. Useful for error handleing
+ */
+void vhost_discard_shadow_used(struct vhost_virtqueue *vq, int n)
 {
-	struct vring_used_elem heads = {
-		cpu_to_vhost32(vq, head),
-		cpu_to_vhost32(vq, len)
-	};
+	vhost_withdraw_shadow_used(vq, n);
+	vhost_discard_vq_desc(vq, n);
+}
+EXPORT_SYMBOL_GPL(vhost_discard_shadow_used);
 
-	return vhost_add_used_n(vq, &heads, 1);
+/* Reverse the effect of vhost_get_vq_desc. Useful for error handling. */
+void vhost_discard_vq_desc(struct vhost_virtqueue *vq, int n)
+{
+	vq->last_avail_idx -= n;
 }
-EXPORT_SYMBOL_GPL(vhost_add_used);
+EXPORT_SYMBOL_GPL(vhost_discard_vq_desc);
 
 static int __vhost_add_used_n(struct vhost_virtqueue *vq,
 			    struct vring_used_elem *heads,
@@ -2842,6 +2846,41 @@ static int __vhost_add_used_n(struct vhost_virtqueue *vq,
 	return 0;
 }
 
+void vhost_set_zc_used_len(struct vhost_virtqueue *vq,
+			       int idx, int len)
+{
+	vq->heads[idx].len = len;
+}
+EXPORT_SYMBOL_GPL(vhost_set_zc_used_len);
+
+int vhost_get_zc_used_len(struct vhost_virtqueue *vq, int idx)
+{
+	return vq->heads[idx].len;
+}
+EXPORT_SYMBOL_GPL(vhost_get_zc_used_len);
+
+void vhost_set_zc_used(struct vhost_virtqueue *vq,
+			   int idx, unsigned int head, int len)
+{
+	vq->heads[idx].id = head;
+	vq->heads[idx].len = len;
+}
+EXPORT_SYMBOL_GPL(vhost_set_zc_used);
+
+void vhost_add_shadow_used(struct vhost_virtqueue *vq,
+			   unsigned int head, int len)
+{
+	vhost_set_zc_used(vq, vq->nheads, head, len);
+	++vq->nheads;
+}
+EXPORT_SYMBOL_GPL(vhost_add_shadow_used);
+
+int vhost_get_shadow_used_count(struct vhost_virtqueue *vq)
+{
+	return vq->nheads;
+}
+EXPORT_SYMBOL_GPL(vhost_get_shadow_used_count);
+
 /* After we've used one of their buffers, we tell them about it.  We'll then
  * want to notify the guest, using eventfd. */
 int vhost_add_used_n(struct vhost_virtqueue *vq, struct vring_used_elem *heads,
@@ -2879,6 +2918,19 @@ int vhost_add_used_n(struct vhost_virtqueue *vq, struct vring_used_elem *heads,
 }
 EXPORT_SYMBOL_GPL(vhost_add_used_n);
 
+/* After we've used one of their buffers, we tell them about it.  We'll then
+ * want to notify the guest, using eventfd. */
+int vhost_add_used(struct vhost_virtqueue *vq, unsigned int head, int len)
+{
+	struct vring_used_elem heads = {
+		cpu_to_vhost32(vq, head),
+		cpu_to_vhost32(vq, len)
+	};
+
+	return vhost_add_used_n(vq, &heads, 1);
+}
+EXPORT_SYMBOL_GPL(vhost_add_used);
+
 static bool vhost_notify(struct vhost_dev *dev, struct vhost_virtqueue *vq)
 {
 	__u16 old, new;
@@ -2945,6 +2997,23 @@ void vhost_add_used_and_signal_n(struct vhost_dev *dev,
 }
 EXPORT_SYMBOL_GPL(vhost_add_used_and_signal_n);
 
+void vhost_flush_shadow_used_and_signal(struct vhost_virtqueue *vq)
+
+{
+	if (!vq->nheads)
+		return;
+
+	vhost_add_used_and_signal_n(vq->dev, vq, vq->heads, vq->nheads);
+	vq->nheads = 0;
+}
+EXPORT_SYMBOL_GPL(vhost_flush_shadow_used_and_signal);
+
+void vhost_flush_zc_used_and_signal(struct vhost_virtqueue *vq, int idx, int n)
+{
+	vhost_add_used_and_signal_n(vq->dev, vq, &vq->heads[idx], n);
+}
+EXPORT_SYMBOL_GPL(vhost_flush_zc_used_and_signal);
+
 /* return true if we're sure that avaiable ring is empty */
 bool vhost_vq_avail_empty(struct vhost_virtqueue *vq)
 {
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index e054f178d8b0..175eb5ebf954 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -163,6 +163,7 @@ struct vhost_virtqueue {
 	struct iovec iotlb_iov[64];
 	struct iovec *indirect;
 	struct vring_used_elem *heads;
+	int nheads;
 	/* Protected by virtqueue mutex. */
 	struct vhost_umem *umem;
 	struct vhost_umem *iotlb;
@@ -241,10 +242,27 @@ int vhost_vq_init_access(struct vhost_virtqueue *);
 int vhost_add_used(struct vhost_virtqueue *, unsigned int head, int len);
 int vhost_add_used_n(struct vhost_virtqueue *, struct vring_used_elem *heads,
 		     unsigned count);
+
 void vhost_add_used_and_signal(struct vhost_dev *, struct vhost_virtqueue *,
 			       unsigned int id, int len);
 void vhost_add_used_and_signal_n(struct vhost_dev *, struct vhost_virtqueue *,
 			       struct vring_used_elem *heads, unsigned count);
+
+/* Zerocopy shadow used ring API */
+void vhost_set_zc_used_len(struct vhost_virtqueue *vq,
+			   int idx, int len);
+int vhost_get_zc_used_len(struct vhost_virtqueue *vq, int idx);
+void vhost_flush_zc_used_and_signal(struct vhost_virtqueue *vq, int idx, int n);
+void vhost_set_zc_used(struct vhost_virtqueue *vq, int idx,
+		       unsigned int head, int len);
+
+/* Non zerocopy shadow used ring API */
+void vhost_add_shadow_used(struct vhost_virtqueue *vq, unsigned int head,
+			   int len);
+void vhost_flush_shadow_used_and_signal(struct vhost_virtqueue *vq);
+void vhost_discard_shadow_used(struct vhost_virtqueue *vq, int n);
+int vhost_get_shadow_used_count(struct vhost_virtqueue *vq);
+
 void vhost_signal(struct vhost_dev *, struct vhost_virtqueue *);
 void vhost_disable_notify(struct vhost_virtqueue *vq);
 bool vhost_vq_avail_empty(struct vhost_virtqueue *vq);
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
