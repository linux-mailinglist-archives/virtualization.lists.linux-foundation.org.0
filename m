Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ED60C29297
	for <lists.virtualization@lfdr.de>; Fri, 24 May 2019 10:13:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 765B4F51;
	Fri, 24 May 2019 08:12:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CDDA3CD9
	for <virtualization@lists.linux-foundation.org>;
	Fri, 24 May 2019 08:12:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7147BF4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 24 May 2019 08:12:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A98B03082B6B;
	Fri, 24 May 2019 08:12:56 +0000 (UTC)
Received: from hp-dl380pg8-01.lab.eng.pek2.redhat.com
	(hp-dl380pg8-01.lab.eng.pek2.redhat.com [10.73.8.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8589E19C4F;
	Fri, 24 May 2019 08:12:45 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: [PATCH net-next 3/6] vhost: rename vq_iotlb_prefetch() to
	vq_meta_prefetch()
Date: Fri, 24 May 2019 04:12:15 -0400
Message-Id: <20190524081218.2502-4-jasowang@redhat.com>
In-Reply-To: <20190524081218.2502-1-jasowang@redhat.com>
References: <20190524081218.2502-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 24 May 2019 08:12:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: hch@infradead.org, christophe.de.dinechin@gmail.com,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	James.Bottomley@hansenpartnership.com, linux-mm@kvack.org,
	jglisse@redhat.com, jrdr.linux@gmail.com, davem@davemloft.net,
	linux-arm-kernel@lists.infradead.org
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

Rename the function to be more accurate since it actually tries to
prefetch vq metadata address in IOTLB. And this will be used by
following patch to prefetch metadata virtual addresses.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/net.c   | 4 ++--
 drivers/vhost/vhost.c | 4 ++--
 drivers/vhost/vhost.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index df51a35cf537..bf55f995ebae 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -971,7 +971,7 @@ static void handle_tx(struct vhost_net *net)
 	if (!sock)
 		goto out;
 
-	if (!vq_iotlb_prefetch(vq))
+	if (!vq_meta_prefetch(vq))
 		goto out;
 
 	vhost_disable_notify(&net->dev, vq);
@@ -1140,7 +1140,7 @@ static void handle_rx(struct vhost_net *net)
 	if (!sock)
 		goto out;
 
-	if (!vq_iotlb_prefetch(vq))
+	if (!vq_meta_prefetch(vq))
 		goto out;
 
 	vhost_disable_notify(&net->dev, vq);
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index e78c195448f0..b353a00094aa 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -1313,7 +1313,7 @@ static bool iotlb_access_ok(struct vhost_virtqueue *vq,
 	return true;
 }
 
-int vq_iotlb_prefetch(struct vhost_virtqueue *vq)
+int vq_meta_prefetch(struct vhost_virtqueue *vq)
 {
 	size_t s = vhost_has_feature(vq, VIRTIO_RING_F_EVENT_IDX) ? 2 : 0;
 	unsigned int num = vq->num;
@@ -1332,7 +1332,7 @@ int vq_iotlb_prefetch(struct vhost_virtqueue *vq)
 			       num * sizeof(*vq->used->ring) + s,
 			       VHOST_ADDR_USED);
 }
-EXPORT_SYMBOL_GPL(vq_iotlb_prefetch);
+EXPORT_SYMBOL_GPL(vq_meta_prefetch);
 
 /* Can we log writes? */
 /* Caller should have device mutex but not vq mutex */
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index 9490e7ddb340..7a7fc001265f 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -209,7 +209,7 @@ bool vhost_enable_notify(struct vhost_dev *, struct vhost_virtqueue *);
 int vhost_log_write(struct vhost_virtqueue *vq, struct vhost_log *log,
 		    unsigned int log_num, u64 len,
 		    struct iovec *iov, int count);
-int vq_iotlb_prefetch(struct vhost_virtqueue *vq);
+int vq_meta_prefetch(struct vhost_virtqueue *vq);
 
 struct vhost_msg_node *vhost_new_msg(struct vhost_virtqueue *vq, int type);
 void vhost_enqueue_msg(struct vhost_dev *dev,
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
