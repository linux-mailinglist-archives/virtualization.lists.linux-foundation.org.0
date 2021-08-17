Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9647C3EE44A
	for <lists.virtualization@lfdr.de>; Tue, 17 Aug 2021 04:22:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 304F3404AF;
	Tue, 17 Aug 2021 02:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbt-O8SVub_1; Tue, 17 Aug 2021 02:22:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A7C3A40425;
	Tue, 17 Aug 2021 02:22:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 070D6C000E;
	Tue, 17 Aug 2021 02:22:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 026B4C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 02:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFEB76080C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 02:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MlOzUsW4DPBF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 02:22:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B478607DC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 02:22:26 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R681e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UjHTKZU_1629166943; 
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UjHTKZU_1629166943) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 17 Aug 2021 10:22:24 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: vgoyal@redhat.com,
	stefanha@redhat.com,
	miklos@szeredi.hu
Subject: [PATCH v4 7/8] fuse: support changing per-file DAX flag inside guest
Date: Tue, 17 Aug 2021 10:22:19 +0800
Message-Id: <20210817022220.17574-8-jefflexu@linux.alibaba.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210817022220.17574-1-jefflexu@linux.alibaba.com>
References: <20210817022220.17574-1-jefflexu@linux.alibaba.com>
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

Fuse client can enable or disable per-file DAX inside kernel/guest by
chattr(1). Similarly the new state won't be updated until the file is
closed and reopened later.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/fuse/ioctl.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/ioctl.c b/fs/fuse/ioctl.c
index 546ea3d58fb4..a9ed53c5dbd1 100644
--- a/fs/fuse/ioctl.c
+++ b/fs/fuse/ioctl.c
@@ -469,8 +469,6 @@ int fuse_fileattr_set(struct user_namespace *mnt_userns,
 	if (fa->flags_valid) {
 		err = fuse_priv_ioctl(inode, ff, FS_IOC_SETFLAGS,
 				      &flags, sizeof(flags));
-		if (err)
-			goto cleanup;
 	} else {
 		memset(&xfa, 0, sizeof(xfa));
 		xfa.fsx_xflags = fa->fsx_xflags;
@@ -483,6 +481,19 @@ int fuse_fileattr_set(struct user_namespace *mnt_userns,
 				      &xfa, sizeof(xfa));
 	}
 
+	if (err)
+		goto cleanup;
+
+	if (IS_ENABLED(CONFIG_FUSE_DAX)) {
+		bool newdax;
+
+		if (fa->flags_valid)
+			newdax = flags & FS_DAX_FL;
+		else
+			newdax = fa->fsx_xflags & FS_XFLAG_DAX;
+		fuse_dax_dontcache(inode, newdax);
+	}
+
 cleanup:
 	fuse_priv_ioctl_cleanup(inode, ff);
 
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
