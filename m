Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F6FAAC6A
	for <lists.virtualization@lfdr.de>; Thu,  5 Sep 2019 21:51:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4A36A1B60;
	Thu,  5 Sep 2019 19:49:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5AE471B38
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 19:49:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 90029894
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 19:49:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED7973082DDD;
	Thu,  5 Sep 2019 19:49:25 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.137])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DAFA5C1D4;
	Thu,  5 Sep 2019 19:49:18 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id C154F22539A; Thu,  5 Sep 2019 15:49:17 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	miklos@szeredi.hu
Subject: [PATCH 02/18] virtiofs: Check whether hiprio queue is connected at
	submission time
Date: Thu,  5 Sep 2019 15:48:43 -0400
Message-Id: <20190905194859.16219-3-vgoyal@redhat.com>
In-Reply-To: <20190905194859.16219-1-vgoyal@redhat.com>
References: <20190905194859.16219-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 05 Sep 2019 19:49:26 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mst@redhat.com, linux-kernel@vger.kernel.org, dgilbert@redhat.com,
	virtio-fs@redhat.com, stefanha@redhat.com, vgoyal@redhat.com
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

For hiprio queue (forget requests), we are keeping a state in queue whether
queue is connected or not. If queue is not connected, do not try to submit
request and return error instead.

As of now, we are checking for this state only in path where worker tries
to submit forget after first attempt failed. Check this state even in
the path when request is being submitted first time.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 fs/fuse/virtio_fs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index a708ccb65662..e9497b565dd8 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -577,9 +577,16 @@ __releases(fiq->waitq.lock)
 	sg_init_one(&sg, forget, sizeof(*forget));
 
 	/* Enqueue the request */
+	spin_lock(&fsvq->lock);
+
+	if (!fsvq->connected) {
+		kfree(forget);
+		spin_unlock(&fsvq->lock);
+		goto out;
+	}
+
 	vq = fsvq->vq;
 	dev_dbg(&vq->vdev->dev, "%s\n", __func__);
-	spin_lock(&fsvq->lock);
 
 	ret = virtqueue_add_sgs(vq, sgs, 1, 0, forget, GFP_ATOMIC);
 	if (ret < 0) {
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
