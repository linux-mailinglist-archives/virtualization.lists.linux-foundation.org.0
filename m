Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BBB2E9E2F
	for <lists.virtualization@lfdr.de>; Mon,  4 Jan 2021 20:30:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA55586216;
	Mon,  4 Jan 2021 19:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgwyIEo4kdDa; Mon,  4 Jan 2021 19:30:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DDEF86200;
	Mon,  4 Jan 2021 19:30:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41841C1E6F;
	Mon,  4 Jan 2021 19:30:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A787C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 19:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2A396203BD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 19:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKk43YPpMNOb
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 19:30:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 0E10A2038B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 19:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zMXccjfJXXeI6J1+siSWp8Bb0qMGr1Kxn66MZNWNsTw=; b=augF5D93uBWLlS3NI9UgDss8h9
 kqmWUV9D9XMholR3eIMvCZrMLOuMxxXRzW4NjSpzyzBmdEORkHCbAeKpMOzQkigj/FfwalvxKcn53
 Eq8aOSU5LAWBi6p8+bv1FsL2D31WYPgEtlgjFLGs31HAg9AaVq1i3HzguvYhYAB7DftESl7G1/MjW
 JRwT9EOwIKw6xCaTOmFhDuha2A39Tcg3KROlIKi7AfzbR+qrFsWoVSmuBsk2UIDBdwgsup8n6+lnQ
 FIA0QwrDv+Y2FDPq+iFIqvvPoCc94IhUeJHyU+cwrKfoEIJwmBavUcm42KMYVV8/rWQch26vuqctf
 PbYfT7Pg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kwVWD-000T52-Vz; Mon, 04 Jan 2021 19:28:03 +0000
Date: Mon, 4 Jan 2021 19:27:53 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [RFC v2 PATCH 4/4] mm: pre zero out free pages to speed up page
 allocation for __GFP_ZERO
Message-ID: <20210104192753.GD22407@casper.infradead.org>
References: <20201221163024.GA22532@open-light-1.localdomain>
 <0e8b6a2f-527d-7c77-efcf-04f21ef2a77c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e8b6a2f-527d-7c77-efcf-04f21ef2a77c@intel.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, Michal Hocko <mhocko@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Liang Li <liliangleo@didiglobal.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>
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

On Mon, Jan 04, 2021 at 11:19:13AM -0800, Dave Hansen wrote:
> On 12/21/20 8:30 AM, Liang Li wrote:
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -137,6 +137,9 @@ enum pageflags {
> >  #endif
> >  #ifdef CONFIG_64BIT
> >  	PG_arch_2,
> > +#endif
> > +#ifdef CONFIG_PREZERO_PAGE
> > +	PG_zero,
> >  #endif
> >  	__NR_PAGEFLAGS,
> 
> I don't think this is worth a generic page->flags bit.
> 
> There's a ton of space in 'struct page' for pages that are in the
> allocator.  Can't we use some of that space?

I was going to object to that too, but I think the entire approach is
flawed and needs to be thrown out.  It just nukes the caches in extremely
subtle and hard to measure ways, lowering overall system performance.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
