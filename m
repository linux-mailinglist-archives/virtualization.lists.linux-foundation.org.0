Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A3920091
	for <lists.virtualization@lfdr.de>; Thu, 16 May 2019 09:48:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 62A1F265;
	Thu, 16 May 2019 07:48:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 63056C2C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 07:48:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 124B32C3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 07:48:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E4D33082135;
	Thu, 16 May 2019 07:48:03 +0000 (UTC)
Received: from hp-dl380pg8-02.lab.eng.pek2.redhat.com
	(hp-dl380pg8-02.lab.eng.pek2.redhat.com [10.73.8.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3CA365D6A9;
	Thu, 16 May 2019 07:48:00 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 4/4] vhost: scsi: add weight support
Date: Thu, 16 May 2019 03:47:42 -0400
Message-Id: <1557992862-27320-5-git-send-email-jasowang@redhat.com>
In-Reply-To: <1557992862-27320-1-git-send-email-jasowang@redhat.com>
References: <1557992862-27320-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 16 May 2019 07:48:03 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: pbonzini@redhat.com, stefanha@redhat.com
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

This patch will check the weight and exit the loop if we exceeds the
weight. This is useful for preventing scsi kthread from hogging cpu
which is guest triggerable.

This addresses CVE-2019-3900.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Fixes: 057cbf49a1f0 ("tcm_vhost: Initial merge for vhost level target fabric driver")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/scsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index d830579..3a59f47 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -918,7 +918,7 @@ static void vhost_scsi_submission_work(struct work_struct *work)
 	struct iov_iter in_iter, prot_iter, data_iter;
 	u64 tag;
 	u32 exp_data_len, data_direction;
-	int ret, prot_bytes;
+	int ret, prot_bytes, c = 0;
 	u16 lun;
 	u8 task_attr;
 	bool t10_pi = vhost_has_feature(vq, VIRTIO_SCSI_F_T10_PI);
@@ -938,7 +938,7 @@ static void vhost_scsi_submission_work(struct work_struct *work)
 
 	vhost_disable_notify(&vs->dev, vq);
 
-	for (;;) {
+	do {
 		ret = vhost_scsi_get_desc(vs, vq, &vc);
 		if (ret)
 			goto err;
@@ -1118,7 +1118,7 @@ static void vhost_scsi_submission_work(struct work_struct *work)
 			break;
 		else if (ret == -EIO)
 			vhost_scsi_send_bad_target(vs, vq, vc.head, vc.out);
-	}
+	} while (likely(!vhost_exceeds_weight(vq, ++c, 0)));
 out:
 	mutex_unlock(&vq->mutex);
 }
@@ -1177,7 +1177,7 @@ static void vhost_scsi_submission_work(struct work_struct *work)
 	} v_req;
 	struct vhost_scsi_ctx vc;
 	size_t typ_size;
-	int ret;
+	int ret, c = 0;
 
 	mutex_lock(&vq->mutex);
 	/*
@@ -1191,7 +1191,7 @@ static void vhost_scsi_submission_work(struct work_struct *work)
 
 	vhost_disable_notify(&vs->dev, vq);
 
-	for (;;) {
+	do {
 		ret = vhost_scsi_get_desc(vs, vq, &vc);
 		if (ret)
 			goto err;
@@ -1270,7 +1270,7 @@ static void vhost_scsi_submission_work(struct work_struct *work)
 			break;
 		else if (ret == -EIO)
 			vhost_scsi_send_bad_target(vs, vq, vc.head, vc.out);
-	}
+	} while (likely(!vhost_exceeds_weight(vq, ++c, 0)));
 out:
 	mutex_unlock(&vq->mutex);
 }
-- 
1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
