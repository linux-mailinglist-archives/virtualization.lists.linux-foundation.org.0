Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A02F332B2C
	for <lists.virtualization@lfdr.de>; Tue,  9 Mar 2021 16:56:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EDC483D88;
	Tue,  9 Mar 2021 15:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XYLWv8qTal4R; Tue,  9 Mar 2021 15:56:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id F09A683D89;
	Tue,  9 Mar 2021 15:56:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F0D2C0001;
	Tue,  9 Mar 2021 15:56:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF059C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 15:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D79C94BF7C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 15:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mX_OFGC9L7Kg
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 15:56:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1736D4BEF2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=H2ld+QgidDGzgxm+N1lJ7nVSOxHC57yc0v6xTacIbY4=; b=iK2JlFyhSt2fAxdUtndJ31jjUd
 hNycyMaLROgr5IP/6Vd9G0ejFwt4PjtbUOIllT6lpcyNO5JSrh2jzNp2gMWO+ruzsynjop/tobJfY
 Ktw36wP3bjGaJFUqad8boRQbzSj/WVqC2vdDF1erI4/UR8j/TiljW5ZWLiSLDSKyNVvtr+fZ51EBV
 pCBrYUDXEQT4MqRPo4dXzQFXnfTWXGQxciUvtoMiNYfJ8YId0Jxl0+zNdyZ/Wd4dtmXuU6KZ77azt
 BWf2kqMD8H4xw36e5pyhM+5SVtwMNqv43fs7ARRc/rD1HyYU5hEmwq8fHIT4tm/rith+FefXPeIqW
 /gsKX6iQ==;
Received: from [2001:4bb8:180:9884:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lJehM-000lUZ-SR; Tue, 09 Mar 2021 15:55:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 7/9] iomem: remove the iomem file system
Date: Tue,  9 Mar 2021 16:53:46 +0100
Message-Id: <20210309155348.974875-8-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309155348.974875-1-hch@lst.de>
References: <20210309155348.974875-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jason Gunthorpe <jgg@nvidia.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>,
 Nadav Amit <namit@vmware.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>
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

Just use the generic anon_inode file system.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/resource.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index 0fd091a3f2fc66..12560553c26796 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -26,6 +26,7 @@
 #include <linux/mm.h>
 #include <linux/mount.h>
 #include <linux/resource_ext.h>
+#include <linux/anon_inodes.h>
 #include <uapi/linux/magic.h>
 #include <asm/io.h>
 
@@ -1838,37 +1839,14 @@ static int __init strict_iomem(char *str)
 	return 1;
 }
 
-static int iomem_fs_init_fs_context(struct fs_context *fc)
-{
-	return init_pseudo(fc, DEVMEM_MAGIC) ? 0 : -ENOMEM;
-}
-
-static struct file_system_type iomem_fs_type = {
-	.name		= "iomem",
-	.owner		= THIS_MODULE,
-	.init_fs_context = iomem_fs_init_fs_context,
-	.kill_sb	= kill_anon_super,
-};
-
 static int __init iomem_init_inode(void)
 {
-	static struct vfsmount *iomem_vfs_mount;
-	static int iomem_fs_cnt;
 	struct inode *inode;
-	int rc;
-
-	rc = simple_pin_fs(&iomem_fs_type, &iomem_vfs_mount, &iomem_fs_cnt);
-	if (rc < 0) {
-		pr_err("Cannot mount iomem pseudo filesystem: %d\n", rc);
-		return rc;
-	}
 
-	inode = alloc_anon_inode_sb(iomem_vfs_mount->mnt_sb);
+	inode = alloc_anon_inode();
 	if (IS_ERR(inode)) {
-		rc = PTR_ERR(inode);
-		pr_err("Cannot allocate inode for iomem: %d\n", rc);
-		simple_release_fs(&iomem_vfs_mount, &iomem_fs_cnt);
-		return rc;
+		pr_err("Cannot allocate inode for iomem: %zd\n", PTR_ERR(inode));
+		return PTR_ERR(inode);
 	}
 
 	/*
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
