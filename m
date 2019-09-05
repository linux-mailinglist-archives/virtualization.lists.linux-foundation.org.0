Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA26AAC6E
	for <lists.virtualization@lfdr.de>; Thu,  5 Sep 2019 21:51:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B7214142E;
	Thu,  5 Sep 2019 19:49:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A876F17FB
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 19:49:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 61B8A8B0
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 19:49:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8FA9307D851;
	Thu,  5 Sep 2019 19:49:26 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.137])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C33BA5D6A3;
	Thu,  5 Sep 2019 19:49:26 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 160592253A5; Thu,  5 Sep 2019 15:49:18 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	miklos@szeredi.hu
Subject: [PATCH 13/18] virtiofs: Do not access virtqueue in request submission
	path
Date: Thu,  5 Sep 2019 15:48:54 -0400
Message-Id: <20190905194859.16219-14-vgoyal@redhat.com>
In-Reply-To: <20190905194859.16219-1-vgoyal@redhat.com>
References: <20190905194859.16219-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 05 Sep 2019 19:49:27 +0000 (UTC)
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

In request submission path it is possible that virtqueue is already gone
due to driver->remove(). So do not access it in dev_dbg(). Use pr_debug()
instead.

If virtuqueue is gone, this will result in NULL pointer deference.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 fs/fuse/virtio_fs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 40259368a6bd..01bbf2c0e144 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -888,10 +888,10 @@ __releases(fiq->waitq.lock)
 	fs = fiq->priv;
 	fc = fs->vqs[queue_id].fud->fc;
 
-	dev_dbg(&fs->vqs[queue_id].vq->vdev->dev,
-		"%s: opcode %u unique %#llx nodeid %#llx in.len %u out.len %u\n",
-		__func__, req->in.h.opcode, req->in.h.unique, req->in.h.nodeid,
-		req->in.h.len, fuse_len_args(req->out.numargs, req->out.args));
+	pr_debug("%s: opcode %u unique %#llx nodeid %#llx in.len %u out.len %u"
+		 "\n", __func__, req->in.h.opcode, req->in.h.unique,
+		 req->in.h.nodeid, req->in.h.len,
+		 fuse_len_args(req->out.numargs, req->out.args));
 
 	fpq = &fs->vqs[queue_id].fud->pq;
 	spin_lock(&fpq->lock);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
