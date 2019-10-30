Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C3BE9E64
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 16:08:16 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 232EBE99;
	Wed, 30 Oct 2019 15:07:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 70202E58
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:07:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C929B63D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572448069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=ly9ZLmJFIT1Dvi1Eb6dZoycLAw+2NQKYUEey1TmqA6k=;
	b=MzdBW7u3aLI6i/9mP00Aw3RYlMm0hBdB7rgbdSP5kYD/Jjfaw+Ywer4E8J/+cf4ZR5wY+Y
	2nqjFz2lArnIch6IgLiWXaCcdNjwBQ3gp+kJDgishT1w2Kzp0o+k6qxJOE9ZznRhHwd4Zt
	vvHpboXB/Bihj5o3vDIZCOJ7iuPFQoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-282-pQEtktDAMAOGDd4mIRTP6Q-1; Wed, 30 Oct 2019 11:07:46 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24DAC2B8;
	Wed, 30 Oct 2019 15:07:45 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B47B5D6D4;
	Wed, 30 Oct 2019 15:07:39 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id D8C39223900; Wed, 30 Oct 2019 11:07:38 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtio-fs@redhat.com
Subject: [PATCH 1/3] virtiofs: Use a common function to send forget
Date: Wed, 30 Oct 2019 11:07:17 -0400
Message-Id: <20191030150719.29048-2-vgoyal@redhat.com>
In-Reply-To: <20191030150719.29048-1-vgoyal@redhat.com>
References: <20191030150719.29048-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: pQEtktDAMAOGDd4mIRTP6Q-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dgilbert@redhat.com, miklos@szeredi.hu, stefanha@redhat.com,
	vgoyal@redhat.com, virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Currently we are duplicating logic to send forgets at two places. Consolidate
the code by calling one helper function.

This also uses virtqueue_add_outbuf() instead of virtqueue_add_sgs(). Former
is simpler to call.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 fs/fuse/virtio_fs.c | 150 +++++++++++++++++++-------------------------
 1 file changed, 63 insertions(+), 87 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index a5c86048b96e..6cc7be170cb8 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -313,17 +313,71 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
 	}
 }
 
+/*
+ * Returns 1 if queue is full and sender should wait a bit before sending
+ * next request, 0 otherwise.
+ */
+static int send_forget_request(struct virtio_fs_vq *fsvq,
+			       struct virtio_fs_forget *forget,
+			       bool in_flight)
+{
+	struct scatterlist sg;
+	struct virtqueue *vq;
+	int ret = 0;
+	bool notify;
+
+	spin_lock(&fsvq->lock);
+	if (!fsvq->connected) {
+		if (in_flight)
+			dec_in_flight_req(fsvq);
+		kfree(forget);
+		goto out;
+	}
+
+	sg_init_one(&sg, forget, sizeof(*forget));
+	vq = fsvq->vq;
+	dev_dbg(&vq->vdev->dev, "%s\n", __func__);
+
+	ret = virtqueue_add_outbuf(vq, &sg, 1, forget, GFP_ATOMIC);
+	if (ret < 0) {
+		if (ret == -ENOMEM || ret == -ENOSPC) {
+			pr_debug("virtio-fs: Could not queue FORGET: err=%d."
+				 " Will try later\n", ret);
+			list_add_tail(&forget->list, &fsvq->queued_reqs);
+			schedule_delayed_work(&fsvq->dispatch_work,
+					      msecs_to_jiffies(1));
+			if (!in_flight)
+				inc_in_flight_req(fsvq);
+			/* Queue is full */
+			ret = 1;
+		} else {
+			pr_debug("virtio-fs: Could not queue FORGET: err=%d."
+				 " Dropping it.\n", ret);
+			kfree(forget);
+			if (in_flight)
+				dec_in_flight_req(fsvq);
+		}
+		goto out;
+	}
+
+	if (!in_flight)
+		inc_in_flight_req(fsvq);
+	notify = virtqueue_kick_prepare(vq);
+	spin_unlock(&fsvq->lock);
+
+	if (notify)
+		virtqueue_notify(vq);
+	return ret;
+out:
+	spin_unlock(&fsvq->lock);
+	return ret;
+}
+
 static void virtio_fs_hiprio_dispatch_work(struct work_struct *work)
 {
 	struct virtio_fs_forget *forget;
 	struct virtio_fs_vq *fsvq = container_of(work, struct virtio_fs_vq,
 						 dispatch_work.work);
-	struct virtqueue *vq = fsvq->vq;
-	struct scatterlist sg;
-	struct scatterlist *sgs[] = {&sg};
-	bool notify;
-	int ret;
-
 	pr_debug("virtio-fs: worker %s called.\n", __func__);
 	while (1) {
 		spin_lock(&fsvq->lock);
@@ -335,43 +389,9 @@ static void virtio_fs_hiprio_dispatch_work(struct work_struct *work)
 		}
 
 		list_del(&forget->list);
-		if (!fsvq->connected) {
-			dec_in_flight_req(fsvq);
-			spin_unlock(&fsvq->lock);
-			kfree(forget);
-			continue;
-		}
-
-		sg_init_one(&sg, forget, sizeof(*forget));
-
-		/* Enqueue the request */
-		dev_dbg(&vq->vdev->dev, "%s\n", __func__);
-		ret = virtqueue_add_sgs(vq, sgs, 1, 0, forget, GFP_ATOMIC);
-		if (ret < 0) {
-			if (ret == -ENOMEM || ret == -ENOSPC) {
-				pr_debug("virtio-fs: Could not queue FORGET: err=%d. Will try later\n",
-					 ret);
-				list_add_tail(&forget->list,
-						&fsvq->queued_reqs);
-				schedule_delayed_work(&fsvq->dispatch_work,
-						msecs_to_jiffies(1));
-			} else {
-				pr_debug("virtio-fs: Could not queue FORGET: err=%d. Dropping it.\n",
-					 ret);
-				dec_in_flight_req(fsvq);
-				kfree(forget);
-			}
-			spin_unlock(&fsvq->lock);
-			return;
-		}
-
-		notify = virtqueue_kick_prepare(vq);
 		spin_unlock(&fsvq->lock);
-
-		if (notify)
-			virtqueue_notify(vq);
-		pr_debug("virtio-fs: worker %s dispatched one forget request.\n",
-			 __func__);
+		if (send_forget_request(fsvq, forget, true))
+			return;
 	}
 }
 
@@ -710,14 +730,9 @@ __releases(fiq->lock)
 {
 	struct fuse_forget_link *link;
 	struct virtio_fs_forget *forget;
-	struct scatterlist sg;
-	struct scatterlist *sgs[] = {&sg};
 	struct virtio_fs *fs;
-	struct virtqueue *vq;
 	struct virtio_fs_vq *fsvq;
-	bool notify;
 	u64 unique;
-	int ret;
 
 	link = fuse_dequeue_forget(fiq, 1, NULL);
 	unique = fuse_get_unique(fiq);
@@ -739,46 +754,7 @@ __releases(fiq->lock)
 		.nlookup = link->forget_one.nlookup,
 	};
 
-	sg_init_one(&sg, forget, sizeof(*forget));
-
-	/* Enqueue the request */
-	spin_lock(&fsvq->lock);
-
-	if (!fsvq->connected) {
-		kfree(forget);
-		spin_unlock(&fsvq->lock);
-		goto out;
-	}
-
-	vq = fsvq->vq;
-	dev_dbg(&vq->vdev->dev, "%s\n", __func__);
-
-	ret = virtqueue_add_sgs(vq, sgs, 1, 0, forget, GFP_ATOMIC);
-	if (ret < 0) {
-		if (ret == -ENOMEM || ret == -ENOSPC) {
-			pr_debug("virtio-fs: Could not queue FORGET: err=%d. Will try later.\n",
-				 ret);
-			list_add_tail(&forget->list, &fsvq->queued_reqs);
-			schedule_delayed_work(&fsvq->dispatch_work,
-					msecs_to_jiffies(1));
-			inc_in_flight_req(fsvq);
-		} else {
-			pr_debug("virtio-fs: Could not queue FORGET: err=%d. Dropping it.\n",
-				 ret);
-			kfree(forget);
-		}
-		spin_unlock(&fsvq->lock);
-		goto out;
-	}
-
-	inc_in_flight_req(fsvq);
-	notify = virtqueue_kick_prepare(vq);
-
-	spin_unlock(&fsvq->lock);
-
-	if (notify)
-		virtqueue_notify(vq);
-out:
+	send_forget_request(fsvq, forget, false);
 	kfree(link);
 }
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
