Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14B3E9E12
	for <lists.virtualization@lfdr.de>; Thu, 12 Aug 2021 07:46:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 286584002B;
	Thu, 12 Aug 2021 05:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QvN4iObuflYW; Thu, 12 Aug 2021 05:46:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CE333404ED;
	Thu, 12 Aug 2021 05:46:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66363C0023;
	Thu, 12 Aug 2021 05:46:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79489C001A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 05:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8FAB40580
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 05:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZUuL-wy-Qcu2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 05:46:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 539E540560
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 05:46:22 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R531e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UilCXZJ_1628747179; 
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UilCXZJ_1628747179) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 12 Aug 2021 13:46:20 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: vgoyal@redhat.com,
	stefanha@redhat.com,
	miklos@szeredi.hu
Subject: [PATCH 2/2] virtiofs: reduce lock contention on fpq->lock
Date: Thu, 12 Aug 2021 13:46:18 +0800
Message-Id: <20210812054618.26057-3-jefflexu@linux.alibaba.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812054618.26057-1-jefflexu@linux.alibaba.com>
References: <20210812054618.26057-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, virtio-fs@redhat.com,
 bo.liu@linux.alibaba.com, joseph.qi@linux.alibaba.com,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Liu Bo <bo.liu@linux.alibaba.com>

Since %req has been removed from fpq->processing_list, no one except
request_wait_answer() is looking at this %req and request_wait_answer()
waits only on FINISH flag, it's OK to remove fpq->lock after %req is
dropped from the list.

Signed-off-by: Liu Bo <bo.liu@linux.alibaba.com>
Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/fuse/virtio_fs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 0050132e2787..7dbf5502c57e 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -557,7 +557,6 @@ static void copy_args_from_argbuf(struct fuse_args *args, struct fuse_req *req)
 static void virtio_fs_request_complete(struct fuse_req *req,
 				       struct virtio_fs_vq *fsvq)
 {
-	struct fuse_pqueue *fpq = &fsvq->fud->pq;
 	struct fuse_args *args;
 	struct fuse_args_pages *ap;
 	unsigned int len, i, thislen;
@@ -586,9 +585,7 @@ static void virtio_fs_request_complete(struct fuse_req *req,
 		}
 	}
 
-	spin_lock(&fpq->lock);
 	clear_bit(FR_SENT, &req->flags);
-	spin_unlock(&fpq->lock);
 
 	fuse_request_end(req);
 	spin_lock(&fsvq->lock);
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
