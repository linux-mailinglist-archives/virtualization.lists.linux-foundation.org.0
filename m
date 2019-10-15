Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 068A2D7E17
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 19:47:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4F551F79;
	Tue, 15 Oct 2019 17:46:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3495CF79
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 17:46:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E18E489D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 17:46:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 800BF7FDE5;
	Tue, 15 Oct 2019 17:46:45 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88B8A101E248;
	Tue, 15 Oct 2019 17:46:35 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 1D9002240F2; Tue, 15 Oct 2019 13:46:35 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org,
	virtio-fs@redhat.com
Subject: [PATCH 2/5] virtiofs: No need to check fpq->connected state
Date: Tue, 15 Oct 2019 13:46:23 -0400
Message-Id: <20191015174626.11593-3-vgoyal@redhat.com>
In-Reply-To: <20191015174626.11593-1-vgoyal@redhat.com>
References: <20191015174626.11593-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 15 Oct 2019 17:46:45 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: miklos@szeredi.hu, chirantan@chromium.org, dgilbert@redhat.com,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	vgoyal@redhat.com
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

In virtiofs we keep per queue connected state in virtio_fs_vq->connected
and use that to end request if queue is not connected. And virtiofs does
not even touch fpq->connected state.

We probably need to merge these two at some point of time. For now, simplify
the code a bit and do not worry about checking state of fpq->connected.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 fs/fuse/virtio_fs.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 24ac6f8bf3f7..3b7f7409e77b 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -960,13 +960,6 @@ __releases(fiq->lock)
 
 	fpq = &fs->vqs[queue_id].fud->pq;
 	spin_lock(&fpq->lock);
-	if (!fpq->connected) {
-		spin_unlock(&fpq->lock);
-		req->out.h.error = -ENODEV;
-		pr_err("virtio-fs: %s disconnected\n", __func__);
-		fuse_request_end(fc, req);
-		return;
-	}
 	list_add_tail(&req->list, fpq->processing);
 	spin_unlock(&fpq->lock);
 	set_bit(FR_SENT, &req->flags);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
