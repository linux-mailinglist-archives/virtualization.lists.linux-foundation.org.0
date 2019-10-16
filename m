Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AD4D8F45
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 13:21:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 989E7CCB;
	Wed, 16 Oct 2019 11:20:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 88C21CC4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 11:20:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B655770D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 11:20:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id BF6F0B304;
	Wed, 16 Oct 2019 11:20:52 +0000 (UTC)
Date: Wed, 16 Oct 2019 13:20:51 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v3 4/9] mm: Export alloc_contig_range() /
	free_contig_range()
Message-ID: <20191016112051.GW317@dhcp22.suse.cz>
References: <20190919142228.5483-1-david@redhat.com>
	<20190919142228.5483-5-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919142228.5483-5-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>,
	Pavel Tatashin <pavel.tatashin@microsoft.com>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Thu 19-09-19 16:22:23, David Hildenbrand wrote:
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

Is there any real reason to export as GPL rather than generic
EXPORT_SYMBOL? In other words do we need to restrict the usage this
interface only to GPL modules and why if so. All other allocator APIs
are EXPORT_SYMBOL so there should better be a good reason for this one
to differ. I can understand that this one is slightly different by
requesting a specific range of the memory but it is still under a full
control of the core MM to say no.

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
> Signed-off-by: David Hildenbrand <david@redhat.com>

Other than that, I do not think exporting this function is harmful. It
would be worse to reinvent it and do it wrong.

I usually prefer to add a caller in the same patch, though, because it
makes the usage explicit and clear.

Acked-by: Michal Hocko <mhocko@suse.com> # to export contig range allocator API

> ---
>  mm/page_alloc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 3334a769eb91..d5d7944954b3 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -8469,6 +8469,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
>  				pfn_max_align_up(end), migratetype);
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(alloc_contig_range);
>  #endif /* CONFIG_CONTIG_ALLOC */
>  
>  void free_contig_range(unsigned long pfn, unsigned int nr_pages)
> @@ -8483,6 +8484,7 @@ void free_contig_range(unsigned long pfn, unsigned int nr_pages)
>  	}
>  	WARN(count != 0, "%d pages are still in use!\n", count);
>  }
> +EXPORT_SYMBOL_GPL(free_contig_range);
>  
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  /*
> -- 
> 2.21.0

-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
