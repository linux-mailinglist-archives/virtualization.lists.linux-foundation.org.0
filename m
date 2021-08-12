Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1C03E9E10
	for <lists.virtualization@lfdr.de>; Thu, 12 Aug 2021 07:46:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A155960A88;
	Thu, 12 Aug 2021 05:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkDo5nqZrcoo; Thu, 12 Aug 2021 05:46:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 65A3D60A6D;
	Thu, 12 Aug 2021 05:46:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6E77C000E;
	Thu, 12 Aug 2021 05:46:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 648D4C000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 05:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FAFC40581
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 05:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3GY_PR2OpWYt
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 05:46:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E69E540555
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 05:46:22 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UilC9jt_1628747179; 
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UilC9jt_1628747179) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 12 Aug 2021 13:46:19 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: vgoyal@redhat.com,
	stefanha@redhat.com,
	miklos@szeredi.hu
Subject: [PATCH 1/2] fuse: disable atomic_o_trunc if no_open is enabled
Date: Thu, 12 Aug 2021 13:46:17 +0800
Message-Id: <20210812054618.26057-2-jefflexu@linux.alibaba.com>
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

When 'no_open' is used by virtiofsd, guest kernel won't send OPEN request
any more.  However, with atomic_o_trunc, SETATTR request is also omitted in
OPEN(O_TRUNC) so that the backend file is not truncated.  With a following
GETATTR, inode size on guest side is updated to be same with that on host
side, the end result is that O_TRUNC semantic is broken.

This disables atomic_o_trunc as well if with no_open.

Reviewed-by: Peng Tao <tao.peng@linux.alibaba.com>
Signed-off-by: Liu Bo <bo.liu@linux.alibaba.com>
Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/fuse/file.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index b494ff08f08c..1231128f8dd6 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -151,10 +151,16 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 			fuse_file_free(ff);
 			return ERR_PTR(err);
 		} else {
-			if (isdir)
+			if (isdir) {
 				fc->no_opendir = 1;
-			else
+			} else {
 				fc->no_open = 1;
+				/*
+				 * In case of no_open, disable atomic_o_trunc as
+				 * well.
+				 */
+				fc->atomic_o_trunc = 0;
+			}
 		}
 	}
 
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
