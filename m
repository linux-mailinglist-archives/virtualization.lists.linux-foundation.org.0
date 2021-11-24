Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 280E645B487
	for <lists.virtualization@lfdr.de>; Wed, 24 Nov 2021 07:51:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BE8B40120;
	Wed, 24 Nov 2021 06:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9PKJpan8xSLY; Wed, 24 Nov 2021 06:50:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3B14C400E4;
	Wed, 24 Nov 2021 06:50:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 837CBC0036;
	Wed, 24 Nov 2021 06:50:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2163EC0012
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 06:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F08754025B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 06:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hrdb5F9StSTX
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 06:50:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61AB14024A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 06:50:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E12D568AFE; Wed, 24 Nov 2021 07:50:50 +0100 (CET)
Date: Wed, 24 Nov 2021 07:50:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 18/29] fsdax: decouple zeroing from the iomap buffered
 I/O code
Message-ID: <20211124065050.GB7075@lst.de>
References: <20211109083309.584081-1-hch@lst.de>
 <20211109083309.584081-19-hch@lst.de>
 <CAPcyv4hDG9-BQHjuJnQUQLJhq=xmrNi+w-uiu6TnV4Rcf0VDfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4hDG9-BQHjuJnQUQLJhq=xmrNi+w-uiu6TnV4Rcf0VDfQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Mike Snitzer <snitzer@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org,
 linux-xfs <linux-xfs@vger.kernel.org>,
 device-mapper development <dm-devel@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>
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

On Tue, Nov 23, 2021 at 01:46:35PM -0800, Dan Williams wrote:
> > +               const struct iomap_ops *ops)
> > +{
> > +       unsigned int blocksize = i_blocksize(inode);
> > +       unsigned int off = pos & (blocksize - 1);
> > +
> > +       /* Block boundary? Nothing to do */
> > +       if (!off)
> > +               return 0;
> 
> It took me a moment to figure out why this was correct. I see it was
> also copied from iomap_truncate_page(). It makes sense for DAX where
> blocksize >= PAGE_SIZE so it's always the case that the amount of
> capacity to zero relative to a page is from @pos to the end of the
> block. Is there something else that protects the blocksize < PAGE_SIZE
> case outside of DAX?
> 
> Nothing to change for this patch, just a question I had while reviewing.

This is a helper for truncate ->setattr, where everything outside the
block is deallocated.  So zeroing is only needed inside the block.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
