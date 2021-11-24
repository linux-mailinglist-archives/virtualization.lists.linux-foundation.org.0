Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB9545B469
	for <lists.virtualization@lfdr.de>; Wed, 24 Nov 2021 07:39:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA9680CD4;
	Wed, 24 Nov 2021 06:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RflhN1mwut65; Wed, 24 Nov 2021 06:39:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6578480CD8;
	Wed, 24 Nov 2021 06:39:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6DFBC0036;
	Wed, 24 Nov 2021 06:39:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 570ABC0012
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 06:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AF0940126
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 06:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eh2MX6xZYAuC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 06:39:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 792E340003
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 06:39:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D92CF68AFE; Wed, 24 Nov 2021 07:39:34 +0100 (CET)
Date: Wed, 24 Nov 2021 07:39:34 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [PATCH 14/29] fsdax: simplify the pgoff calculation
Message-ID: <20211124063934.GC6889@lst.de>
References: <20211109083309.584081-1-hch@lst.de>
 <20211109083309.584081-15-hch@lst.de> <20211123223642.GI266024@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211123223642.GI266024@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 linux-s390@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-ext4@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>
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

On Tue, Nov 23, 2021 at 02:36:42PM -0800, Darrick J. Wong wrote:
> > -	phys_addr_t phys_off = (start_sect + sector) * 512;
> > -
> > -	if (pgoff)
> > -		*pgoff = PHYS_PFN(phys_off);
> > -	if (phys_off % PAGE_SIZE || size % PAGE_SIZE)
> 
> AFAICT, we're relying on fs_dax_get_by_bdev to have validated this
> previously, which is why the error return stuff goes away?

Exactly.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
