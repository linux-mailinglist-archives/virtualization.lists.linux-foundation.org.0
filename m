Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BD9175C88
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 15:05:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A50738575B;
	Mon,  2 Mar 2020 14:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9XyTuAnP3qrN; Mon,  2 Mar 2020 14:05:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 78C1785660;
	Mon,  2 Mar 2020 14:05:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FED4C013E;
	Mon,  2 Mar 2020 14:05:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28C53C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 14:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1FCE120486
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 14:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKNx7XIextDh
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 14:05:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 287202014A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 14:05:25 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e10so11300227wrr.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 06:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c0cAfvYrVEVBx2ds1ZgWYcF17eBb1NlP7kXSkGclbIo=;
 b=UTmayGkorzIT7HRf1BFvjPkT33yKm7gVU57w3LP9kLYUKZ2yOPI5/vT+18lGdHyxLm
 bM0mtoPsgO5qWOxMFPaeKsgCoxuXK7rqryfiAEvjGCRWOA9+OVLTPCKruJEL+J4IOjJM
 P9nyBpjKvYNrwtMouWbbm12HfN4djBSE72L2ZZRZISboKRL6NAvj1uJLqtH7lJhR+jXc
 a39bR9pnuSz8MamgT5/j3FVf2yNwiMFVG+7r+qNkqQQYlPg0wHpKRbcNFIIGff0rZ2J6
 hRlQv4Tmsdr5GRAfIrHEoDcarFdVz2tOt5UAYDjAxLk7ZdLWI3JZ2ycdzREcaKefeBQa
 0Klg==
X-Gm-Message-State: APjAAAWB59u/LXBj7GEZZTxb+dlwc1JPk3rUy4hyigtJstXZBQ1Kf2uC
 iR/cyfzmQM8bc7iW5XIbRbY=
X-Google-Smtp-Source: APXvYqx0+M3slxS1twXYHQLKyE1HWK32dT4Uy4lzZdKaDxvmor7yMe0SVC8biQ097XaClUCOR5acbg==
X-Received: by 2002:adf:e808:: with SMTP id o8mr17538359wrm.8.1583157923708;
 Mon, 02 Mar 2020 06:05:23 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id q3sm15291876wmj.38.2020.03.02.06.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 06:05:22 -0800 (PST)
Date: Mon, 2 Mar 2020 15:05:19 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 04/11] mm: Export alloc_contig_range() /
 free_contig_range()
Message-ID: <20200302140519.GN4380@dhcp22.suse.cz>
References: <20200302134941.315212-1-david@redhat.com>
 <20200302134941.315212-5-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302134941.315212-5-david@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>
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

On Mon 02-03-20 14:49:34, David Hildenbrand wrote:
> A virtio-mem device wants to allocate memory from the memory region it
> manages in order to unplug it in the hypervisor - similar to
> a balloon driver. Also, it might want to plug previously unplugged
> (allocated) memory and give it back to Linux. alloc_contig_range() /
> free_contig_range() seem to be the perfect interface for this task.
> 
> In contrast to existing balloon devices, a virtio-mem device operates
> on bigger chunks (e.g., 4MB) and only on physical memory it manages. It
> tracks which chunks (subblocks) are still plugged, so it can go ahead
> and try to alloc_contig_range()+unplug them on unplug request, or
> plug+free_contig_range() unplugged chunks on plug requests.
> 
> A virtio-mem device will use alloc_contig_range() / free_contig_range()
> only on ranges that belong to the same node/zone in at least
> MAX(MAX_ORDER - 1, pageblock_order) order granularity - e.g., 4MB on
> x86-64. The virtio-mem device added that memory, so the memory
> exists and does not contain any holes. virtio-mem will only try to allocate
> on ZONE_NORMAL, never on ZONE_MOVABLE, just like when allocating
> gigantic pages (we don't put unmovable data into the movable zone).

Same feedback as in pxm_to_node export. No objections to exporting the
symbol but it would be better to squash this function into the patch
which uses it. The changelog is highly virtio-mem specific anyway.
Maybe it is just a dejavu but I feel I have already said that but I do
not remember any details.

> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Mel Gorman <mgorman@techsingularity.net>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Cc: Pavel Tatashin <pavel.tatashin@microsoft.com>
> Cc: Alexander Potapenko <glider@google.com>
> Acked-by: Michal Hocko <mhocko@suse.com> # to export contig range allocator API
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/page_alloc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 79e950d76ffc..8d7be3f33e26 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -8597,6 +8597,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
>  				pfn_max_align_up(end), migratetype);
>  	return ret;
>  }
> +EXPORT_SYMBOL(alloc_contig_range);
>  
>  static int __alloc_contig_pages(unsigned long start_pfn,
>  				unsigned long nr_pages, gfp_t gfp_mask)
> @@ -8712,6 +8713,7 @@ void free_contig_range(unsigned long pfn, unsigned int nr_pages)
>  	}
>  	WARN(count != 0, "%d pages are still in use!\n", count);
>  }
> +EXPORT_SYMBOL(free_contig_range);
>  
>  /*
>   * The zone indicated has a new number of managed_pages; batch sizes and percpu
> -- 
> 2.24.1

-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
