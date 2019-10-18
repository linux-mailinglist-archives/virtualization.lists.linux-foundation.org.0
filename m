Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E33DC509
	for <lists.virtualization@lfdr.de>; Fri, 18 Oct 2019 14:35:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F238FD90;
	Fri, 18 Oct 2019 12:35:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3AAD8B50
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 12:35:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3A53170D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 12:35:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D231A10F0C;
	Fri, 18 Oct 2019 12:35:14 +0000 (UTC)
Received: from [10.36.118.23] (unknown [10.36.118.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB6255C21E;
	Fri, 18 Oct 2019 12:35:07 +0000 (UTC)
Subject: Re: [PATCH RFC v3 6/9] mm: Allow to offline PageOffline() pages with
	a reference count of 0
To: Michal Hocko <mhocko@kernel.org>
References: <20190919142228.5483-1-david@redhat.com>
	<20190919142228.5483-7-david@redhat.com>
	<20191016114321.GX317@dhcp22.suse.cz>
	<36fef317-78e3-0500-43ba-f537f9a6fea4@redhat.com>
	<20191016140350.GD317@dhcp22.suse.cz>
	<7c7bef01-f904-904a-b0a7-f7b514b8bda8@redhat.com>
	<20191018081524.GD5017@dhcp22.suse.cz>
	<83d0a961-952d-21e4-74df-267912b7b6fa@redhat.com>
	<20191018111843.GH5017@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <709d39aa-a7ba-97aa-e66b-e2fec2fdf3c4@redhat.com>
Date: Fri, 18 Oct 2019 14:35:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191018111843.GH5017@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 18 Oct 2019 12:35:15 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Pingfan Liu <kernelfans@gmail.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Alexander Potapenko <glider@google.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Andrea Arcangeli <aarcange@redhat.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, Yu Zhao <yuzhao@google.com>,
	Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Pavel Tatashin <pavel.tatashin@microsoft.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mike Rapoport <rppt@linux.vnet.ibm.com>, Qian Cai <cai@lca.pw>,
	Andrey Ryabinin <aryabinin@virtuozzo.com>,
	Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
	Yang Shi <yang.shi@linux.alibaba.com>,
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@techsingularity.net>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 18.10.19 13:20, Michal Hocko wrote:
> On Fri 18-10-19 10:50:24, David Hildenbrand wrote:
>> On 18.10.19 10:15, Michal Hocko wrote:
>>> On Wed 16-10-19 16:14:52, David Hildenbrand wrote:
>>>> On 16.10.19 16:03, Michal Hocko wrote:
>>> [...]
>>>>> But why cannot you keep the reference count at 1 (do get_page when
>>>>> offlining the page)? In other words as long as the driver knows the page
>>>>> has been returned to the host then it has ref count at 1. Once the page
>>>>> is returned to the guest for whatever reason it can free it to the
>>>>> system by clearing the offline state and put_page.
>>>>
>>>> I think I explained how the reference count of 1 is problematic when wanting
>>>> to offline the memory. After all that's the problem I try to solve: Keep
>>>> PG_offline set until the memory is offline and make sure nobody will touch
>>>> the page.
>>>
>>> Please bear with me but I still believe that elevated reference count
>>> has some merits. I do understand that you maintain your metadata to
>>> recognize that the memory handed over to the hypervisor will not
>>> magically appear after onlining. But I believe that you can achieve
>>> the same with an elevated reference count and have a more robust design
>>> as well.
>>
>> Thanks for thinking about this. I still believe it is problematic. And I
>> don't like releasing "pages that should not be used" to the buddy. It comes
>> with some problems if offlining fails (see below).
> 
> Sure I will not be pushing if that turns out to be unfeasible. But I
> would like to explore that path before giving up on it.

Sure, I appreciate that. I wrapped my head around a lot of these things 
for a long time and came to the conclusion that it is complicated :)

[read below, I think it makes sense if you can summarize the idea you 
have that avoids releasing pages to the buddy - similar to this approach]

>   
> [...]
>>> An elevated reference count would prevent offlining to finish. And I
>>> believe this is a good thing because the owner of the offline page might
>>> still need to do something to "untrack" that page. We have an interface
>>
>> And here is the thing: The owner of the page does not have to do anything to
>> untrack the page. I mean that's what a reference count of zero actually
>> means - no direct reference.
> 
> Will this be the case for other potential users of the similar/same
> mechanism? I thought that this would become a more spread mechanism.

Anybody who wants to use that mechanism has to respect these rules. I am 
going to document that. It does not make sense for all balloon drivers 
that can simply implement page compaction. E.g., PPC CMM, it makes much 
more sense to switch to balloon compaction instead (because that's what 
it really is, a balloon driver).

I could imagine that HyperV might want to use that in the future. And it 
should be possible to make them play with the rules. They already use 
memory notifiers and online_page_callback_t.

> 
>>> for that - MEM_GOING_OFFLINE notification. This sounds like a good place
>>> for the driver to decide whether it is safe to let the page go or not.
>>
>> As I explained, this is too late and fragile. I post again what I posted
>> before with some further explanations
>>
>> __offline_pages() works like this:
>>
>> 1) start_isolate_page_range()
>> -> offline pages with a reference count of one will be detected as
>> unmovable -> offlining aborted. (see below on the memory isolation notifier)
> 
> I am assuming that has_unmovable_pages would skip over those pages. Your
> patch already does that, no?

Yes, this works IFF the reference count is 0 (IOW, this patch). Not with 
a reference count of 1 (unless the pages are movable, like with balloon 
compaction).

Please note that we have other users that use PG_offline + refcount >= 1 
(HyperV balloon, XEN). We should not affect these users (IOW, 
has_unmovable_pages() has to stop right there if we see one of these pages).

> 
>> 2) memory_notify(MEM_GOING_OFFLINE, &arg);
>> -> Here, we could release all pages to the buddy, clearing PG_offline
>> -> PF_offline must not be cleared so dumping tools will not touch
>>     these pages. There is a time where pages are !PageBuddy() and
>>     !PageOffline().
> 
> Well, this is fully under control of the driver, no? Reference count
> shouldn't play any role here AFAIU.

Yes, this is more a PG_offline issue. The reference count is an issue of 
reaching this call :) If we want to go via the buddy:

1. Clear PG_offline
2. Free page (gets set PG_buddy)

Between 1 and 2, a dumping tool could not exclude these pages and 
therefore try to read from these pages. That is an issue IFF we want to 
return the pages back to the buddy instead of doing what I propose here.

>   
>> 3) scan_movable_pages() ...

Please note that when we don't put the pages back to the buddy and don't 
implement something like I have in this patch, we'll loop/fail here. 
Especially if we have pages with PG_offline + refcount >= 1 .

>>
>> 4a) Memory offlining succeeded: memory_notify(MEM_OFFLINE, &arg);
>>
>> Perfect, it worked. Sections are offline.
>>
>> 4b) Memory offlining failed
>>
>>      undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
>>      memory_notify(MEM_CANCEL_OFFLINE, &arg);
> 
> Doesn't this return pages back to buddy only when they were marked Buddy
> already?

Yes, but I think you asked for evaluating what it would take to make the 
reference count stay at 1 and return the pages to the buddy. I tried to 
explain the pitfalls of that approach here :)

Can you clarify what exactly you have in mind right now? (how to make 
isolation work, how to make offlining work without putting pages back to 
the buddy, etc .). I have the feeling I am missing the one part that 
does not put the pages back to the buddy.

> 
> MEM_CANCEL_OFFLINE could gain the reference back to balance the
> MEM_GOING_OFFLINE step.

The pages are already unisolated and could be used by the buddy. But 
again, I think you have an idea that tries to avoid putting pages to the 
buddy.

> 
> One think that I would like to clarify because my previous email could
> be misleading a bit. You do not really have to drop the reference by
> releasing the page to the allocator (via put_page). You can also set
> the reference count to 0 explicitly. The driver is in control of the
> page, right?  And that is the whole point I wanted to make. There is an

This is what virtio-mem does whenever it allocates a range using 
alloc_contig_range(). It uses page_ref_dec() instead of put_page()

/*
  * Set a range of pages PG_offline and drop the reference. The dropped
  * reference (0) and the flag allows isolation code to isolate thisrange
  * and offline code to offline it.
  */
static void virtio_mem_set_fake_offline(unsigned long pfn,
                                         unsigned int nr_pages)
{
        for (; nr_pages--; pfn++) {
                __SetPageOffline(pfn_to_page(pfn));
                page_ref_dec(pfn_to_page(pfn));
        }
}

The put_page() change is really only needed to avoid the mentioned race 
if somebody succeeds with a get_page_unless_zero(page) followed by a 
put_page() (bewlow).


> explicit control via the reference count which is the standard way to
> control the struct page life cycle.
> 
> Anyway hooking into __put_page (which tends to be a hot path with
> something that is barely used on most systems) doesn't sound nice to me.
> This is the whole point which made me think about the whole reference
> count approach in the first place.

Again, the race I think that is possible

somebody: get_page_unless_zero(page)
virtio_mem: page_ref_dec(pfn_to_page(pfn)
somebody: put_page() -> straight to the buddy

I am not yet sure if this will really be a performance issue in 
put_page(). The branch predictor should do an excellent job here. 
(especially on systems without users)

> 
> I do realize that the reference count doesn't solve the problem with
> onlining. Drivers still have to special case the onlining and that is
> something I really dislike but I do not have a good answer for.

Yeah, especially due to HWPoison, this is to be solved differently. The 
PG_offline part might not be nice, but certainly easier to handle 
(online_page_callback_t).

> 
>>> If you can let the page go then just drop the reference count. The page
>>> is isolated already by that time. If you cannot let it go for whatever
>>> reason you can fail the offlining.
>>
>> We do have one hack in current MM code, which is the memory isolation
>> notifier only used by CMM on PPC. It allows to "cheat" has_unmovable_pages()
>> to skip over unmovable pages. But quite frankly, I rather want to get rid of
>> that crap (something I am working on right now) than introduce new users.
>> This stuff is racy as hell and for CMM, if memory offlining fails, the
>> ballooned pages are suddenly part of the buddy. Fragile.
> 
> Could you be more specific please?

Let's take a look at how arch/powerpc/platforms/pseries/cmm.c handles it:

cmm_memory_isolate_cb() -> cmm_count_pages(arg):
- Memory Isolation notifier callback
- Count how many pages in the range to be isolated are in the ballooon
- This makes has_unmovable_pages() succeed. Pages can be isolated.

cmm_memory_cb -> cmm_mem_going_offline(arg):
- Memory notifier (online/offline)
- Release all pages in the range to the buddy

If offlining fails, the pages are now in the buddy, no longer in the 
balloon. MEM_CANCEL_ONLINE is too late, because the range is already 
unisolated again and the pages might be in use.

For CMM it might not be that bad, because it can actually "reloan" any 
pages. In contrast, virtio-mem cannot simply go ahead and reuse random 
memory in unplugged. Any access to these pages would be evil. Giving 
them back to the buddy is dangerous.

> 
>>> An advantage is that the driver has the full control over offlining and
>>> also you do not really have to track a new online request to do the
>>> right thing.
>>
>> The driver still has to synchronize against onlining/offlining requests and
>> track the state of the memory blocks.
>>
>> Simple example: virtio-mem wants to try yo unplug a 4MB chunk. If the memory
>> block is online, it has to use alloc contig_range(). If the memory block is
>> offline (e.g., user space has not onlined it yet), it is sufficient to
>> update metadata. It has to be aware of the state of the memory blocks and
>> synchronize against onlining/offlining.
> 
> Hmm, so the driver might offline a part of the memory which never got
> onlined? Is there really a sensible usecases for that?

Yes there is in general a demand for unplugging offline memory. E.g., 
some configurable mode in the future could be that virtio-mem only 
unplugs offline memory, because this way user space can control which 
memory will actually get unplugged (compared to virtio-mem going ahead 
and trying to find online chunks to unplug).

Also, virtio-mem will be very careful with ZONE_MOVABLE memory. 
ZONE_MOVABLE memory first has to be offlined by user space before 
virtio-mem will go ahead and unplug parts (of the now offline memory). 
The reason is that I don't want unmovable pages (IOW via 
alloc_contig_range()) to end up in ZONE_MOVABLE - similar to gigantic 
pages. But that's yet another discussion :)

Thanks Michal!

-- 

Thanks,

David / dhildenb
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
