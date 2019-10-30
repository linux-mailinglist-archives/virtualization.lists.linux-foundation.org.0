Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E3027E9E5C
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 16:07:56 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BEE38E7C;
	Wed, 30 Oct 2019 15:07:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1897CE52
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:07:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 6CD0D8A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572448067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=X/BAPwzaK/VJWK6Euc/hOkg2V08gfO99tWNJkHvuumY=;
	b=WI5ijDCQKfSyolh+7I+IC2nosJfWCJG0KEcHQ9uyNlalqVyvcXmVjNehd3LIwMRbk8pXe0
	a+HRBHE0PysbpSdsWe2MPaoNhLjWes9j/cCVKsJBUitg5/QM8LEYIrLebKaDuq+jaZfxSA
	CqejIo+pmPiPLKR+o6Fsy4pHQHfP2ss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-400-71cRbL-gN9-DhBO2t6aLVw-1; Wed, 30 Oct 2019 11:07:46 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFE5F107ACC0;
	Wed, 30 Oct 2019 15:07:44 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B6C160C85;
	Wed, 30 Oct 2019 15:07:39 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id E0B832256E4; Wed, 30 Oct 2019 11:07:38 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtio-fs@redhat.com
Subject: [PATCH 3/3] virtiofs: Use completions while waiting for queue to be
	drained
Date: Wed, 30 Oct 2019 11:07:19 -0400
Message-Id: <20191030150719.29048-4-vgoyal@redhat.com>
In-Reply-To: <20191030150719.29048-1-vgoyal@redhat.com>
References: <20191030150719.29048-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 71cRbL-gN9-DhBO2t6aLVw-1
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

While we wait for queue to finish draining, use completions instead of
uslee_range(). This is better way of waiting for event.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 fs/fuse/virtio_fs.c | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 43224db8d9ed..b5ba83ef1914 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -35,6 +35,7 @@ struct virtio_fs_vq {
 	struct fuse_dev *fud;
 	bool connected;
 	long in_flight;
+	struct completion in_flight_zero; /* No inflight requests */
 	char name[24];
 } ____cacheline_aligned_in_smp;
 
@@ -85,6 +86,8 @@ static inline void dec_in_flight_req(struct virtio_fs_vq *fsvq)
 {
 	WARN_ON(fsvq->in_flight <= 0);
 	fsvq->in_flight--;
+	if (!fsvq->in_flight)
+		complete(&fsvq->in_flight_zero);
 }
 
 static void release_virtio_fs_obj(struct kref *ref)
@@ -115,22 +118,23 @@ static void virtio_fs_drain_queue(struct virtio_fs_vq *fsvq)
 	WARN_ON(fsvq->in_flight < 0);
 
 	/* Wait for in flight requests to finish.*/
-	while (1) {
-		spin_lock(&fsvq->lock);
-		if (!fsvq->in_flight) {
-			spin_unlock(&fsvq->lock);
-			break;
-		}
+	spin_lock(&fsvq->lock);
+	if (fsvq->in_flight) {
+		/* We are holding virtio_fs_mutex. There should not be any
+		 * waiters waiting for completion.
+		 */
+		reinit_completion(&fsvq->in_flight_zero);
+		spin_unlock(&fsvq->lock);
+		wait_for_completion(&fsvq->in_flight_zero);
+	} else {
 		spin_unlock(&fsvq->lock);
-		/* TODO use completion instead of timeout */
-		usleep_range(1000, 2000);
 	}
 
 	flush_work(&fsvq->done_work);
 	flush_delayed_work(&fsvq->dispatch_work);
 }
 
-static void virtio_fs_drain_all_queues(struct virtio_fs *fs)
+static void virtio_fs_drain_all_queues_locked(struct virtio_fs *fs)
 {
 	struct virtio_fs_vq *fsvq;
 	int i;
@@ -141,6 +145,19 @@ static void virtio_fs_drain_all_queues(struct virtio_fs *fs)
 	}
 }
 
+static void virtio_fs_drain_all_queues(struct virtio_fs *fs)
+{
+	/* Provides mutual exclusion between ->remove and ->kill_sb
+	 * paths. We don't want both of these draining queue at the
+	 * same time. Current completion logic reinits completion
+	 * and that means there should not be any other thread
+	 * doing reinit or waiting for completion already.
+	 */
+	mutex_lock(&virtio_fs_mutex);
+	virtio_fs_drain_all_queues_locked(fs);
+	mutex_unlock(&virtio_fs_mutex);
+}
+
 static void virtio_fs_start_all_queues(struct virtio_fs *fs)
 {
 	struct virtio_fs_vq *fsvq;
@@ -581,6 +598,7 @@ static int virtio_fs_setup_vqs(struct virtio_device *vdev,
 	INIT_LIST_HEAD(&fs->vqs[VQ_HIPRIO].end_reqs);
 	INIT_DELAYED_WORK(&fs->vqs[VQ_HIPRIO].dispatch_work,
 			virtio_fs_hiprio_dispatch_work);
+	init_completion(&fs->vqs[VQ_HIPRIO].in_flight_zero);
 	spin_lock_init(&fs->vqs[VQ_HIPRIO].lock);
 
 	/* Initialize the requests virtqueues */
@@ -591,6 +609,7 @@ static int virtio_fs_setup_vqs(struct virtio_device *vdev,
 				  virtio_fs_request_dispatch_work);
 		INIT_LIST_HEAD(&fs->vqs[i].queued_reqs);
 		INIT_LIST_HEAD(&fs->vqs[i].end_reqs);
+		init_completion(&fs->vqs[i].in_flight_zero);
 		snprintf(fs->vqs[i].name, sizeof(fs->vqs[i].name),
 			 "requests.%u", i - VQ_REQUEST);
 		callbacks[i] = virtio_fs_vq_done;
@@ -684,7 +703,7 @@ static void virtio_fs_remove(struct virtio_device *vdev)
 	/* This device is going away. No one should get new reference */
 	list_del_init(&fs->list);
 	virtio_fs_stop_all_queues(fs);
-	virtio_fs_drain_all_queues(fs);
+	virtio_fs_drain_all_queues_locked(fs);
 	vdev->config->reset(vdev);
 	virtio_fs_cleanup_vqs(vdev, fs);
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
