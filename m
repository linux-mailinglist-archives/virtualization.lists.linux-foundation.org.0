Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C122333436
	for <lists.virtualization@lfdr.de>; Wed, 10 Mar 2021 05:07:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF6564318F;
	Wed, 10 Mar 2021 04:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffu3irM-4zOB; Wed, 10 Mar 2021 04:07:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2120243190;
	Wed, 10 Mar 2021 04:07:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0AB5C0001;
	Wed, 10 Mar 2021 04:07:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A696C000F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 04:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30E466F6A8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 04:07:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6WLbo6vMksG
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 04:07:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 855B46F69A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 04:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MZP04mmRYHSUMNN7Bbpif73MByRe1GqD/bRFFteUyfw=; b=ldgU6n02jJhSaG5jfG/yFXoBjb
 jqO0xwes2kpfTznTIioIJ6OLRsJ2Rf5BKvl+WRQqfq3ithfHHVTOrh+OiOVFLlkCnr6A6dP6sA/8g
 Wx51dHg8mloZlZdg/ttj4KY3k1GlayTwG64TE/tu12bbfG6O36fKXrVbls/MysL7RmCmrJuMq9H77
 VBewHZHaWWnTDDLy4jE9fWXCsINUJACeVhrwMp5LBIjUn60fkuv0edawFzc9/FSWl1eoHTIxAvExX
 cxW2jUeNPKjL+VpiGPOtLh+akLXAvSlyp6mUR091Ti2VOzOqnxnANFHSVocMPKcksPzQ0Z/4ngUfM
 3R7+aFkQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lJq6T-002MKD-Jm; Wed, 10 Mar 2021 04:05:49 +0000
Date: Wed, 10 Mar 2021 04:05:45 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: make alloc_anon_inode more useful
Message-ID: <20210310040545.GM3479805@casper.infradead.org>
References: <20210309155348.974875-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309155348.974875-1-hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>,
 Nadav Amit <namit@vmware.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Nitin Gupta <ngupta@vflare.org>
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

On Tue, Mar 09, 2021 at 04:53:39PM +0100, Christoph Hellwig wrote:
> this series first renames the existing alloc_anon_inode to
> alloc_anon_inode_sb to clearly mark it as requiring a superblock.
> 
> It then adds a new alloc_anon_inode that works on the anon_inode
> file system super block, thus removing tons of boilerplate code.
> 
> The few remainig callers of alloc_anon_inode_sb all use alloc_file_pseudo
> later, but might also be ripe for some cleanup.

On a somewhat related note, could I get you to look at
drivers/video/fbdev/core/fb_defio.c?

As far as I can tell, there's no need for fb_deferred_io_aops to exist.
We could just set file->f_mapping->a_ops to NULL, and set_page_dirty()
would do the exact same thing this code does (except it would get the
return value correct).

But maybe that would make something else go wrong that distinguishes
between page->mapping being NULL and page->mapping->a_ops->foo being NULL?
Completely untested patch ...

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index a591d291b231..441ec31d3e4d 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -151,17 +151,6 @@ static const struct vm_operations_struct fb_deferred_io_vm_ops = {
 	.page_mkwrite	= fb_deferred_io_mkwrite,
 };
 
-static int fb_deferred_io_set_page_dirty(struct page *page)
-{
-	if (!PageDirty(page))
-		SetPageDirty(page);
-	return 0;
-}
-
-static const struct address_space_operations fb_deferred_io_aops = {
-	.set_page_dirty = fb_deferred_io_set_page_dirty,
-};
-
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	vma->vm_ops = &fb_deferred_io_vm_ops;
@@ -212,14 +201,6 @@ void fb_deferred_io_init(struct fb_info *info)
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_init);
 
-void fb_deferred_io_open(struct fb_info *info,
-			 struct inode *inode,
-			 struct file *file)
-{
-	file->f_mapping->a_ops = &fb_deferred_io_aops;
-}
-EXPORT_SYMBOL_GPL(fb_deferred_io_open);
-
 void fb_deferred_io_cleanup(struct fb_info *info)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 06f5805de2de..c4ba76359f22 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1415,10 +1415,7 @@ __releases(&info->lock)
 		if (res)
 			module_put(info->fbops->owner);
 	}
-#ifdef CONFIG_FB_DEFERRED_IO
-	if (info->fbdefio)
-		fb_deferred_io_open(info, inode, file);
-#endif
+	file->f_mapping->a_ops = NULL;
 out:
 	unlock_fb_info(info);
 	if (res)
diff --git a/include/linux/fb.h b/include/linux/fb.h
index ecfbcc0553a5..a8dccd23c249 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -659,9 +659,6 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
 /* drivers/video/fb_defio.c */
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
 extern void fb_deferred_io_init(struct fb_info *info);
-extern void fb_deferred_io_open(struct fb_info *info,
-				struct inode *inode,
-				struct file *file);
 extern void fb_deferred_io_cleanup(struct fb_info *info);
 extern int fb_deferred_io_fsync(struct file *file, loff_t start,
 				loff_t end, int datasync);
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
