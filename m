Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1667F332B12
	for <lists.virtualization@lfdr.de>; Tue,  9 Mar 2021 16:55:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CCE783A8E;
	Tue,  9 Mar 2021 15:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swTFJAG-nlmS; Tue,  9 Mar 2021 15:55:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B1AD83D53;
	Tue,  9 Mar 2021 15:55:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18717C0001;
	Tue,  9 Mar 2021 15:55:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15585C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 15:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0476A600CB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 15:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5e8dRWaEnnai
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 15:55:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 495EC6F49A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 15:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=TAB/jSR7P4i0tEpg6lVq01ZMIeZeWk00j+JpXBqlTDM=; b=T+H3yeYw5iLZv7pUgmsb25tUIS
 qPrxwvgXhTEZ/+r7gvFNaBtHWVhs+PHbFoxnkj3u3ZSdxQ1KPpmoPcESzA3k/SeQfbnnw7C7vmFV4
 ht9K8Nznds34Ck8c6U8ozAmgx/WZQEIqhVXZbzxQSPAkP1/qbORT5eOL56k3VB2PCjAbitpXHbgpu
 eiUF8/HeYWm75kV2gwxDcBw/l/+jgr0vuiYgcG+wnyVuvaRla7CnP3FJUd9MYQ7g8c4vFTQtC0aGz
 WlQPsUmOhiOmPqoIXuA+dDB2dUutIqClmDeHaP1qDtnQAjooDHIbfuprZiwSY9pToikcKK3d8G5z+
 Cxq7OdwQ==;
Received: from [2001:4bb8:180:9884:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lJegY-000lMp-OH; Tue, 09 Mar 2021 15:54:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 2/9] fs: add an argument-less alloc_anon_inode
Date: Tue,  9 Mar 2021 16:53:41 +0100
Message-Id: <20210309155348.974875-3-hch@lst.de>
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

Add a new alloc_anon_inode helper that allocates an inode on
the anon_inode file system.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/anon_inodes.c            | 15 +++++++++++++--
 include/linux/anon_inodes.h |  1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
index 4745fc37014332..b6a8ea71920bc3 100644
--- a/fs/anon_inodes.c
+++ b/fs/anon_inodes.c
@@ -63,7 +63,7 @@ static struct inode *anon_inode_make_secure_inode(
 	const struct qstr qname = QSTR_INIT(name, strlen(name));
 	int error;
 
-	inode = alloc_anon_inode_sb(anon_inode_mnt->mnt_sb);
+	inode = alloc_anon_inode();
 	if (IS_ERR(inode))
 		return inode;
 	inode->i_flags &= ~S_PRIVATE;
@@ -225,13 +225,24 @@ int anon_inode_getfd_secure(const char *name, const struct file_operations *fops
 }
 EXPORT_SYMBOL_GPL(anon_inode_getfd_secure);
 
+/**
+ * alloc_anon_inode - create a new anonymous inode
+ *
+ * Create an inode on the anon_inode file system and return it.
+ */
+struct inode *alloc_anon_inode(void)
+{
+	return alloc_anon_inode_sb(anon_inode_mnt->mnt_sb);
+}
+EXPORT_SYMBOL_GPL(alloc_anon_inode);
+
 static int __init anon_inode_init(void)
 {
 	anon_inode_mnt = kern_mount(&anon_inode_fs_type);
 	if (IS_ERR(anon_inode_mnt))
 		panic("anon_inode_init() kernel mount failed (%ld)\n", PTR_ERR(anon_inode_mnt));
 
-	anon_inode_inode = alloc_anon_inode_sb(anon_inode_mnt->mnt_sb);
+	anon_inode_inode = alloc_anon_inode();
 	if (IS_ERR(anon_inode_inode))
 		panic("anon_inode_init() inode allocation failed (%ld)\n", PTR_ERR(anon_inode_inode));
 
diff --git a/include/linux/anon_inodes.h b/include/linux/anon_inodes.h
index 71881a2b6f7860..b5ae9a6eda9923 100644
--- a/include/linux/anon_inodes.h
+++ b/include/linux/anon_inodes.h
@@ -21,6 +21,7 @@ int anon_inode_getfd_secure(const char *name,
 			    const struct file_operations *fops,
 			    void *priv, int flags,
 			    const struct inode *context_inode);
+struct inode *alloc_anon_inode(void);
 
 #endif /* _LINUX_ANON_INODES_H */
 
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
