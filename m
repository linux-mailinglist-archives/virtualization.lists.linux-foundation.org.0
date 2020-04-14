Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB01A8514
	for <lists.virtualization@lfdr.de>; Tue, 14 Apr 2020 18:34:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7832B87E13;
	Tue, 14 Apr 2020 16:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjx+V9FA1tAs; Tue, 14 Apr 2020 16:34:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AD2AD87D8E;
	Tue, 14 Apr 2020 16:34:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96A74C0172;
	Tue, 14 Apr 2020 16:34:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79600C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 676BE87DAA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id feBUjSEmUdWo
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:34:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E540987D8E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586882076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mxMk4OjYqz6WaLMP6SDDXA6S1CwQy1WHx7MZAFhC3P4=;
 b=UQXesxwNuQ0wFGXxSVDQHwtjUjmgD9dSkh1rbYgo1NvcJg6Pn5z732ZSaZpPLabxC1O6U6
 u3w12TrY+nnVVs45cxSEmd7vPQZXX5a2oqKTxmiF0uYi/dgSakPyaT0NFrBQrRBhFUjj1G
 Gc67/B2jW2wKo1Up3yczfiE7ei8/xLQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-__mNEakmMeWZymwhstl2jA-1; Tue, 14 Apr 2020 12:34:35 -0400
X-MC-Unique: __mNEakmMeWZymwhstl2jA-1
Received: by mail-qk1-f199.google.com with SMTP id b6so924341qkj.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 09:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mxMk4OjYqz6WaLMP6SDDXA6S1CwQy1WHx7MZAFhC3P4=;
 b=R0Gw4YYwZv7zNUMzVGO7Y4GUtAd+rXzCT55CU02koIeHpSa+uJOMBlzV/4NkR5uBJt
 AIej+O6IS/m3aeDc1YMPJt05/RGhTMCQ/g3uCwdLOiKEyPBd1c3cUlakzfFiyxGOIr+X
 oDAGpM1HZToEOKc7KS0n2OO/h4bpVxen22rJE02NB/SxGnQWW/h08m1Efx9UWquEWjL7
 pFzVT6YjEpVY4tNJ4F2vL60NH7lUTll+VowZBDIdm1Oz4Hy/+b/23nGsgjrsELwPMqPn
 5iZyC9RULMZO4sNK7mHoECqgDbIQy2VYfz0jGtz4rlyuPmlNzABhPNAVrgUMBaOXLap+
 gnGA==
X-Gm-Message-State: AGi0PuYw1NuL75+mS7sdDnlUkjZHZcpCTU0ZLkUZYT30coN/BIGw407+
 lgCXqpk/8LQxA3FWwbiFB+Zbh9CjGYjW9PcBViuxL5ZPKgI3DyRbXhqYNEN1zX4d2y0Kd5K34Hz
 AxzCtw9lHEqA3++go6ihlZSN71xK5ZEJBwVHxMDOfcA==
X-Received: by 2002:a37:4852:: with SMTP id v79mr21337207qka.459.1586882074313; 
 Tue, 14 Apr 2020 09:34:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypIxDlWSPYHz24Em/CyqTvLeDJZn3kuTqc3zQvK9MuWirtAiyJlkACPViYqM2NQN7iOQBdFYOg==
X-Received: by 2002:a37:4852:: with SMTP id v79mr21337161qka.459.1586882073931; 
 Tue, 14 Apr 2020 09:34:33 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id y9sm10550413qkb.41.2020.04.14.09.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 09:34:32 -0700 (PDT)
Date: Tue, 14 Apr 2020 12:34:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 05/10] mm: Allow to offline unmovable PageOffline()
 pages via MEM_GOING_OFFLINE
Message-ID: <20200414123334-mutt-send-email-mst@kernel.org>
References: <20200311171422.10484-1-david@redhat.com>
 <20200311171422.10484-6-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200311171422.10484-6-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 Pingfan Liu <kernelfans@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtio-dev@lists.oasis-open.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Qian Cai <cai@lca.pw>,
 Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>
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

On Wed, Mar 11, 2020 at 06:14:17PM +0100, David Hildenbrand wrote:
> virtio-mem wants to allow to offline memory blocks of which some parts
> were unplugged (allocated via alloc_contig_range()), especially, to later
> offline and remove completely unplugged memory blocks. The important part
> is that PageOffline() has to remain set until the section is offline, so
> these pages will never get accessed (e.g., when dumping). The pages should
> not be handed back to the buddy (which would require clearing PageOffline()
> and result in issues if offlining fails and the pages are suddenly in the
> buddy).
> 
> Let's allow to do that by allowing to isolate any PageOffline() page
> when offlining. This way, we can reach the memory hotplug notifier
> MEM_GOING_OFFLINE, where the driver can signal that he is fine with
> offlining this page by dropping its reference count. PageOffline() pages
> with a reference count of 0 can then be skipped when offlining the
> pages (like if they were free, however they are not in the buddy).
> 
> Anybody who uses PageOffline() pages and does not agree to offline them
> (e.g., Hyper-V balloon, XEN balloon, VMWare balloon for 2MB pages) will not
> decrement the reference count and make offlining fail when trying to
> migrate such an unmovable page. So there should be no observable change.
> Same applies to balloon compaction users (movable PageOffline() pages), the
> pages will simply be migrated.
> 
> Note 1: If offlining fails, a driver has to increment the reference
> 	count again in MEM_CANCEL_OFFLINE.
> 
> Note 2: A driver that makes use of this has to be aware that re-onlining
> 	the memory block has to be handled by hooking into onlining code
> 	(online_page_callback_t), resetting the page PageOffline() and
> 	not giving them to the buddy.
> 
> Reviewed-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: Pavel Tatashin <pavel.tatashin@microsoft.com>
> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Anthony Yznaga <anthony.yznaga@oracle.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Mel Gorman <mgorman@techsingularity.net>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Qian Cai <cai@lca.pw>
> Cc: Pingfan Liu <kernelfans@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Andrew, could you please ack merging this through the vhost tree
together with the rest of the patches?



> ---
>  include/linux/page-flags.h | 10 +++++++++
>  mm/memory_hotplug.c        | 44 +++++++++++++++++++++++++++++---------
>  mm/page_alloc.c            | 24 +++++++++++++++++++++
>  mm/page_isolation.c        |  9 ++++++++
>  4 files changed, 77 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 49c2697046b9..fd6d4670ccc3 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -772,6 +772,16 @@ PAGE_TYPE_OPS(Buddy, buddy)
>   * not onlined when onlining the section).
>   * The content of these pages is effectively stale. Such pages should not
>   * be touched (read/write/dump/save) except by their owner.
> + *
> + * If a driver wants to allow to offline unmovable PageOffline() pages without
> + * putting them back to the buddy, it can do so via the memory notifier by
> + * decrementing the reference count in MEM_GOING_OFFLINE and incrementing the
> + * reference count in MEM_CANCEL_OFFLINE. When offlining, the PageOffline()
> + * pages (now with a reference count of zero) are treated like free pages,
> + * allowing the containing memory block to get offlined. A driver that
> + * relies on this feature is aware that re-onlining the memory block will
> + * require to re-set the pages PageOffline() and not giving them to the
> + * buddy via online_page_callback_t.
>   */
>  PAGE_TYPE_OPS(Offline, offline)
>  
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 1a00b5a37ef6..ab1c31e67fd1 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1221,11 +1221,17 @@ struct zone *test_pages_in_a_zone(unsigned long start_pfn,
>  
>  /*
>   * Scan pfn range [start,end) to find movable/migratable pages (LRU pages,
> - * non-lru movable pages and hugepages). We scan pfn because it's much
> - * easier than scanning over linked list. This function returns the pfn
> - * of the first found movable page if it's found, otherwise 0.
> + * non-lru movable pages and hugepages). Will skip over most unmovable
> + * pages (esp., pages that can be skipped when offlining), but bail out on
> + * definitely unmovable pages.
> + *
> + * Returns:
> + *	0 in case a movable page is found and movable_pfn was updated.
> + *	-ENOENT in case no movable page was found.
> + *	-EBUSY in case a definitely unmovable page was found.
>   */
> -static unsigned long scan_movable_pages(unsigned long start, unsigned long end)
> +static int scan_movable_pages(unsigned long start, unsigned long end,
> +			      unsigned long *movable_pfn)
>  {
>  	unsigned long pfn;
>  
> @@ -1237,18 +1243,30 @@ static unsigned long scan_movable_pages(unsigned long start, unsigned long end)
>  			continue;
>  		page = pfn_to_page(pfn);
>  		if (PageLRU(page))
> -			return pfn;
> +			goto found;
>  		if (__PageMovable(page))
> -			return pfn;
> +			goto found;
> +
> +		/*
> +		 * PageOffline() pages that are not marked __PageMovable() and
> +		 * have a reference count > 0 (after MEM_GOING_OFFLINE) are
> +		 * definitely unmovable. If their reference count would be 0,
> +		 * they could at least be skipped when offlining memory.
> +		 */
> +		if (PageOffline(page) && page_count(page))
> +			return -EBUSY;
>  
>  		if (!PageHuge(page))
>  			continue;
>  		head = compound_head(page);
>  		if (page_huge_active(head))
> -			return pfn;
> +			goto found;
>  		skip = compound_nr(head) - (page - head);
>  		pfn += skip - 1;
>  	}
> +	return -ENOENT;
> +found:
> +	*movable_pfn = pfn;
>  	return 0;
>  }
>  
> @@ -1515,7 +1533,8 @@ static int __ref __offline_pages(unsigned long start_pfn,
>  	}
>  
>  	do {
> -		for (pfn = start_pfn; pfn;) {
> +		pfn = start_pfn;
> +		do {
>  			if (signal_pending(current)) {
>  				ret = -EINTR;
>  				reason = "signal backoff";
> @@ -1525,14 +1544,19 @@ static int __ref __offline_pages(unsigned long start_pfn,
>  			cond_resched();
>  			lru_add_drain_all();
>  
> -			pfn = scan_movable_pages(pfn, end_pfn);
> -			if (pfn) {
> +			ret = scan_movable_pages(pfn, end_pfn, &pfn);
> +			if (!ret) {
>  				/*
>  				 * TODO: fatal migration failures should bail
>  				 * out
>  				 */
>  				do_migrate_range(pfn, end_pfn);
>  			}
> +		} while (!ret);
> +
> +		if (ret != -ENOENT) {
> +			reason = "unmovable page";
> +			goto failed_removal_isolated;
>  		}
>  
>  		/*
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 8d7be3f33e26..baa60222215f 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -8366,6 +8366,19 @@ struct page *has_unmovable_pages(struct zone *zone, struct page *page,
>  		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
>  			continue;
>  
> +		/*
> +		 * We treat all PageOffline() pages as movable when offlining
> +		 * to give drivers a chance to decrement their reference count
> +		 * in MEM_GOING_OFFLINE in order to indicate that these pages
> +		 * can be offlined as there are no direct references anymore.
> +		 * For actually unmovable PageOffline() where the driver does
> +		 * not support this, we will fail later when trying to actually
> +		 * move these pages that still have a reference count > 0.
> +		 * (false negatives in this function only)
> +		 */
> +		if ((flags & MEMORY_OFFLINE) && PageOffline(page))
> +			continue;
> +
>  		if (__PageMovable(page) || PageLRU(page))
>  			continue;
>  
> @@ -8786,6 +8799,17 @@ __offline_isolated_pages(unsigned long start_pfn, unsigned long end_pfn)
>  			offlined_pages++;
>  			continue;
>  		}
> +		/*
> +		 * At this point all remaining PageOffline() pages have a
> +		 * reference count of 0 and can simply be skipped.
> +		 */
> +		if (PageOffline(page)) {
> +			BUG_ON(page_count(page));
> +			BUG_ON(PageBuddy(page));
> +			pfn++;
> +			offlined_pages++;
> +			continue;
> +		}
>  
>  		BUG_ON(page_count(page));
>  		BUG_ON(!PageBuddy(page));
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index 2c11a38d6e87..f6d07c5f0d34 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -151,6 +151,7 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
>   *			a bit mask)
>   *			MEMORY_OFFLINE - isolate to offline (!allocate) memory
>   *					 e.g., skip over PageHWPoison() pages
> + *					 and PageOffline() pages.
>   *			REPORT_FAILURE - report details about the failure to
>   *			isolate the range
>   *
> @@ -259,6 +260,14 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
>  		else if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
>  			/* A HWPoisoned page cannot be also PageBuddy */
>  			pfn++;
> +		else if ((flags & MEMORY_OFFLINE) && PageOffline(page) &&
> +			 !page_count(page))
> +			/*
> +			 * The responsible driver agreed to skip PageOffline()
> +			 * pages when offlining memory by dropping its
> +			 * reference in MEM_GOING_OFFLINE.
> +			 */
> +			pfn++;
>  		else
>  			break;
>  	}
> -- 
> 2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
