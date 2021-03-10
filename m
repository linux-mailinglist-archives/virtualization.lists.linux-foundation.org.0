Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 36967333778
	for <lists.virtualization@lfdr.de>; Wed, 10 Mar 2021 09:37:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BB9D4EBA7;
	Wed, 10 Mar 2021 08:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4fcBHQIkEa4X; Wed, 10 Mar 2021 08:37:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8F0C4EBB4;
	Wed, 10 Mar 2021 08:37:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8424DC0010;
	Wed, 10 Mar 2021 08:37:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A27E5C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 08:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8401C43195
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 08:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIImKPl4ZXua
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 08:37:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDC8343194
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 08:37:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5F87968B05; Wed, 10 Mar 2021 09:37:23 +0100 (CET)
Date: Wed, 10 Mar 2021 09:37:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: make alloc_anon_inode more useful
Message-ID: <20210310083723.GC5217@lst.de>
References: <20210309155348.974875-1-hch@lst.de>
 <20210310040545.GM3479805@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310040545.GM3479805@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>,
 Nadav Amit <namit@vmware.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Nitin Gupta <ngupta@vflare.org>
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

On Wed, Mar 10, 2021 at 04:05:45AM +0000, Matthew Wilcox wrote:
> On Tue, Mar 09, 2021 at 04:53:39PM +0100, Christoph Hellwig wrote:
> > this series first renames the existing alloc_anon_inode to
> > alloc_anon_inode_sb to clearly mark it as requiring a superblock.
> > 
> > It then adds a new alloc_anon_inode that works on the anon_inode
> > file system super block, thus removing tons of boilerplate code.
> > 
> > The few remainig callers of alloc_anon_inode_sb all use alloc_file_pseudo
> > later, but might also be ripe for some cleanup.
> 
> On a somewhat related note, could I get you to look at
> drivers/video/fbdev/core/fb_defio.c?
> 
> As far as I can tell, there's no need for fb_deferred_io_aops to exist.
> We could just set file->f_mapping->a_ops to NULL, and set_page_dirty()
> would do the exact same thing this code does (except it would get the
> return value correct).

> But maybe that would make something else go wrong that distinguishes
> between page->mapping being NULL and page->mapping->a_ops->foo being NULL?

I can't find any place in the kernel that treats a NULL aops different
from not having the method it is looking for. 

> Completely untested patch ...

the patch looks mostly good to me.

>  	}
> -#ifdef CONFIG_FB_DEFERRED_IO
> -	if (info->fbdefio)
> -		fb_deferred_io_open(info, inode, file);
> -#endif
> +	file->f_mapping->a_ops = NULL;

But I'd also skip this.  Drivers generally do not set aops, but if they
do a funtion like this really should not override it.  This will require
an audit of the callers, though.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
