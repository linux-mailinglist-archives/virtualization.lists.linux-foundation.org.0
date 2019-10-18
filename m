Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C43CDC040
	for <lists.virtualization@lfdr.de>; Fri, 18 Oct 2019 10:50:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 06C6C1007;
	Fri, 18 Oct 2019 08:50:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BCDB9FF7
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 08:50:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 163307DB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 08:50:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3CE38A1C95;
	Fri, 18 Oct 2019 08:50:39 +0000 (UTC)
Received: from [10.36.118.57] (unknown [10.36.118.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2F1819C77;
	Fri, 18 Oct 2019 08:50:25 +0000 (UTC)
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <83d0a961-952d-21e4-74df-267912b7b6fa@redhat.com>
Date: Fri, 18 Oct 2019 10:50:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191018081524.GD5017@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Fri, 18 Oct 2019 08:50:40 +0000 (UTC)
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

On 18.10.19 10:15, Michal Hocko wrote:
> On Wed 16-10-19 16:14:52, David Hildenbrand wrote:
>> On 16.10.19 16:03, Michal Hocko wrote:
> [...]
>>> But why cannot you keep the reference count at 1 (do get_page when
>>> offlining the page)? In other words as long as the driver knows the page
>>> has been returned to the host then it has ref count at 1. Once the page
>>> is returned to the guest for whatever reason it can free it to the
>>> system by clearing the offline state and put_page.
>>
>> I think I explained how the reference count of 1 is problematic when wanting
>> to offline the memory. After all that's the problem I try to solve: Keep
>> PG_offline set until the memory is offline and make sure nobody will touch
>> the page.
> 
> Please bear with me but I still believe that elevated reference count
> has some merits. I do understand that you maintain your metadata to
> recognize that the memory handed over to the hypervisor will not
> magically appear after onlining. But I believe that you can achieve
> the same with an elevated reference count and have a more robust design
> as well.

Thanks for thinking about this. I still believe it is problematic. And I 
don't like releasing "pages that should not be used" to the buddy. It 
comes with some problems if offlining fails (see below).

> 
> Let's say that you still keep a reference to your offlined pages and
> mark them offlined. That should make sure that no consumer of the
> pfn_to_online_page will touch the page's content nor the state. Now

pfn_to_online_page() does not check against PG_offline. (which is 
correct IMHO. As documented, PG_offline means "logically offline".

The memmap is valid, however the page content should not be accessed. 
(PG_logically_offline would have been ugly ;) ).

But that shouldn't be an issue right now.

> admin might want to offline/hotremove the whole memory block via sysfs.

The admin can only trigger offlining via sysfs. Hotremove is under 
control of the driver. (removing the whole memory block)

And with the current virtio-mem prototype, this works like a charm.

> An elevated reference count would prevent offlining to finish. And I
> believe this is a good thing because the owner of the offline page might
> still need to do something to "untrack" that page. We have an interface

And here is the thing: The owner of the page does not have to do 
anything to untrack the page. I mean that's what a reference count of 
zero actually means - no direct reference.

I could emphasize how this is to be used in the documentation:

PageOffline() pages that have a reference count of 0 will be treated
like free pages when offlining pages, allowing the containing memory
block to get offlined. In case a driver wants to revive such a page, it 
has to synchronize against memory onlining/offlining (e.g., using memory 
notifiers) while incrementing the reference count. Also, a driver that 
relies in this feature is aware that re-onlining the memory will require 
to re-set the pages PageOffline() - e.g., via the online_page_callback_t.


> for that - MEM_GOING_OFFLINE notification. This sounds like a good place
> for the driver to decide whether it is safe to let the page go or not.

As I explained, this is too late and fragile. I post again what I posted 
before with some further explanations

__offline_pages() works like this:

1) start_isolate_page_range()
-> offline pages with a reference count of one will be detected as
unmovable -> offlining aborted. (see below on the memory isolation notifier)

2) memory_notify(MEM_GOING_OFFLINE, &arg);
-> Here, we could release all pages to the buddy, clearing PG_offline
-> PF_offline must not be cleared so dumping tools will not touch
    these pages. There is a time where pages are !PageBuddy() and
    !PageOffline().

3) scan_movable_pages() ...

4a) Memory offlining succeeded: memory_notify(MEM_OFFLINE, &arg);

Perfect, it worked. Sections are offline.

4b) Memory offlining failed

     undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
     memory_notify(MEM_CANCEL_OFFLINE, &arg);

-> Offlining failed for whatever reason. Once we reach the notifier, the
    pages are already back in use by the buddy.
-> Pages are in the buddy, they are no longer under control of the
    driver.


To summarize the important parts

1. PG_offline has to remain set until the section is offline.

2. When we reach MEM_GOING_OFFLINE, it is too late. The pages were 
already detected as unmovable.

3. When we release pages that are supposed to be PG_offline to the buddy 
and offlining fails, we are in big trouble.


> If you can let the page go then just drop the reference count. The page
> is isolated already by that time. If you cannot let it go for whatever
> reason you can fail the offlining.

We do have one hack in current MM code, which is the memory isolation 
notifier only used by CMM on PPC. It allows to "cheat" 
has_unmovable_pages() to skip over unmovable pages. But quite frankly, I 
rather want to get rid of that crap (something I am working on right 
now) than introduce new users. This stuff is racy as hell and for CMM, 
if memory offlining fails, the ballooned pages are suddenly part of the 
buddy. Fragile.

> 
> An advantage is that the driver has the full control over offlining and
> also you do not really have to track a new online request to do the
> right thing.

The driver still has to synchronize against onlining/offlining requests 
and track the state of the memory blocks.

Simple example: virtio-mem wants to try yo unplug a 4MB chunk. If the 
memory block is online, it has to use alloc contig_range(). If the 
memory block is offline (e.g., user space has not onlined it yet), it is 
sufficient to update metadata. It has to be aware of the state of the 
memory blocks and synchronize against onlining/offlining.

> 
> Or do I still see it too simplistically and the notifier is not a good
> place to handle the reference count?

Yes :) I could hack something via the memory isolation notifier (which 
is ugly) and MEM_GOING_OFFLINE. But if offlining fails, the pages are in 
the buddy and the driver lost control (which is one issue with PPC CMA 
implementation right now).

Again, I think routing pages via the buddy is the problematic part. (if 
offlining fails, but also the period where the pages are neither 
PageBuddy() nor PageOffline()))


-- 

Thanks,

David / dhildenb
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
