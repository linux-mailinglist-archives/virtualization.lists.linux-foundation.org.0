Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C7438B392
	for <lists.virtualization@lfdr.de>; Thu, 20 May 2021 17:48:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D59A3404BF;
	Thu, 20 May 2021 15:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fY65EevsS9rB; Thu, 20 May 2021 15:48:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69426401ED;
	Thu, 20 May 2021 15:48:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CC14C0001;
	Thu, 20 May 2021 15:48:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC374C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 15:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD64140EDF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 15:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id atlY_AsZkM2T
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 15:48:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C563140E9B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 15:48:22 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-OUwm_plVM2qSqXcyk3-WTg-1; Thu, 20 May 2021 11:47:12 -0400
X-MC-Unique: OUwm_plVM2qSqXcyk3-WTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A77D3805F03;
 Thu, 20 May 2021 15:47:11 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-99.ams2.redhat.com [10.36.112.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D969A10013C1;
 Thu, 20 May 2021 15:47:09 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: [PATCH v4 3/5] fuse: Make fuse_fill_super_submount() static
Date: Thu, 20 May 2021 17:46:52 +0200
Message-Id: <20210520154654.1791183-4-groug@kaod.org>
In-Reply-To: <20210520154654.1791183-1-groug@kaod.org>
References: <20210520154654.1791183-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Cc: linux-kernel@vger.kernel.org, Max Reitz <mreitz@redhat.com>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Vivek Goyal <vgoyal@redhat.com>
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

This function used to be called from fuse_dentry_automount(). This code
was moved to fuse_get_tree_submount() in the same file since then. It
is unlikely there will ever be another user. No need to be extern in
this case.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 fs/fuse/fuse_i.h | 9 ---------
 fs/fuse/inode.c  | 4 ++--
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index d7fcf59a6a0e..e2f5c8617e0d 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1081,15 +1081,6 @@ void fuse_send_init(struct fuse_mount *fm);
  */
 int fuse_fill_super_common(struct super_block *sb, struct fuse_fs_context *ctx);
 
-/*
- * Fill in superblock for submounts
- * @sb: partially-initialized superblock to fill in
- * @parent_fi: The fuse_inode of the parent filesystem where this submount is
- * 	       mounted
- */
-int fuse_fill_super_submount(struct super_block *sb,
-			     struct fuse_inode *parent_fi);
-
 /*
  * Get the mountable root for the submount
  * @fsc: superblock configuration context
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 74e5205f203c..123b53d1c3c6 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1275,8 +1275,8 @@ static void fuse_sb_defaults(struct super_block *sb)
 		sb->s_xattr = fuse_no_acl_xattr_handlers;
 }
 
-int fuse_fill_super_submount(struct super_block *sb,
-			     struct fuse_inode *parent_fi)
+static int fuse_fill_super_submount(struct super_block *sb,
+				    struct fuse_inode *parent_fi)
 {
 	struct fuse_mount *fm = get_fuse_mount_super(sb);
 	struct super_block *parent_sb = parent_fi->inode.i_sb;
-- 
2.26.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
