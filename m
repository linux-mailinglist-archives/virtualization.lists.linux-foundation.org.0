Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC8BE1746
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 12:04:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C0E08EB6;
	Wed, 23 Oct 2019 10:04:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 06666EB6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 10:04:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 4F3C787B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 10:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571825045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=W6lSdzoaa0n+6w843OleSIn3qypoeQbbwBSChxn+qqI=;
	b=HNZrwzbnStY2k1xoVaT4pEx8pKot84a9PaHu+jqi4z+OdtZl4z1ZmxxBRx/xlYFrwZk3vR
	csYNXZM7AzuniBo6KJaxk9nme4PtdeCNash5nml3CN7Sci0Nks7Pq4Zw8qYIgi56xN8CsL
	S1jv127mdlGdk3llXP9B60Zf1bOrXho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-103-3kLTzBU8Pru_Lon8ETvXGg-1; Wed, 23 Oct 2019 06:04:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31F2A1800D6B;
	Wed, 23 Oct 2019 10:03:58 +0000 (UTC)
Received: from [10.36.117.79] (ovpn-117-79.ams2.redhat.com [10.36.117.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4AB205C1B2;
	Wed, 23 Oct 2019 10:03:51 +0000 (UTC)
Subject: Re: [PATCH RFC v3 6/9] mm: Allow to offline PageOffline() pages with
	a reference count of 0
To: Michal Hocko <mhocko@kernel.org>
References: <20191016114321.GX317@dhcp22.suse.cz>
	<36fef317-78e3-0500-43ba-f537f9a6fea4@redhat.com>
	<20191016140350.GD317@dhcp22.suse.cz>
	<7c7bef01-f904-904a-b0a7-f7b514b8bda8@redhat.com>
	<20191018081524.GD5017@dhcp22.suse.cz>
	<83d0a961-952d-21e4-74df-267912b7b6fa@redhat.com>
	<20191018111843.GH5017@dhcp22.suse.cz>
	<709d39aa-a7ba-97aa-e66b-e2fec2fdf3c4@redhat.com>
	<20191022122326.GL9379@dhcp22.suse.cz>
	<b4be42a4-cbfc-8706-cc94-26211ddcbe4a@redhat.com>
	<20191023094345.GL754@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <ad2aef12-61ac-f019-90d1-59637255f9e3@redhat.com>
Date: Wed, 23 Oct 2019 12:03:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023094345.GL754@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 3kLTzBU8Pru_Lon8ETvXGg-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
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

On 23.10.19 11:43, Michal Hocko wrote:
> On Tue 22-10-19 16:02:09, David Hildenbrand wrote:
> [...]
>>>>> MEM_CANCEL_OFFLINE could gain the reference back to balance the
>>>>> MEM_GOING_OFFLINE step.
>>>>
>>>> The pages are already unisolated and could be used by the buddy. But again,
>>>> I think you have an idea that tries to avoid putting pages to the buddy.
>>>
>>> Yeah, set_page_count(page, 0) if you do not want to release that page
>>> from the notifier context to reflect that the page is ok to be offlined
>>> with the rest.
>>>    
>>
>> I neither see how you deal with __test_page_isolated_in_pageblock() nor with
>> __offline_isolated_pages(). Sorry, but what I read is incomplete and you
>> probably have a full proposal in your head. Please read below how I think
>> you want to solve it.
> 
> Yeah, sorry that I am throwing incomplete ideas at you. I am just trying
> to really nail down how to deal with reference counting here because it
> is an important aspect.

I think we collected all the missing pieces now :) Thanks!

[...]

>>
>> I was reading
>>
>> include/linux/mm_types.h:
>>
>> "If you want to use the refcount field, it must be used in such a way
>>   that other CPUs temporarily incrementing and then decrementing the
>>   refcount does not cause problems"
>>
>> And that made me think "anybody can go ahead and try get_page_unless_zero()".
>>
>> If I am missing something here and this can indeed not happen (e.g.,
>> because PageOffline() pages are never mapped to user space), then I'll
>> happily remove this code.
> 
> The point is that if the owner of the page is holding the only reference
> to the page then it is clear that nothing like that's happened.

Right, and I think the race I described won't happen in practice. Nobody 
should be trying to do a get_page_unless_zero() on random pages that are 
not even mapped to user space. I was (as so often) very careful :)

>> Let's recap what I suggest:
>>
>> "PageOffline() pages that have a reference count of 0 will be treated
>>   like free pages when offlining pages, allowing the containing memory
>>   block to get offlined. In case a driver wants to revive such a page, it
>>   has to synchronize against memory onlining/offlining (e.g., using memory
>>   notifiers) while incrementing the reference count. Also, a driver that
>>   relies in this feature is aware that re-onlining the memory will require
>>   to re-set the pages PageOffline() - e.g., via the online_page_callback_t."
> 
> OK
> 
> [...]
>> d) __put_page() is modified to not return pages to the buddy in any
>>     case as a safety net. We might be able to get rid of that.
> 
> I do not like exactly this part

Yeah, and I think I can drop it from this patch.

>   
>> What I think you suggest:
>>
>> a) has_unmovable_pages() skips over all PageOffline() pages.
>>     This results in a lot of false negatives when trying to offline. Might be ok.
>>
>> b) The driver decrements the reference count of the PageOffline pages
>>     in MEM_GOING_OFFLINE.
> 
> Well, driver should make the page unreferenced or fail. What is done
> really depends on the specific driver
> 
>> c) The driver increments the reference count of the PageOffline pages
>>     in MEM_CANCEL_OFFLINE. One issue might be that the pages are no longer
>>     isolated once we get that call. Might be ok.
> 
> Only previous PageBuddy pages are returned to the allocator IIRC. Mostly
> because of MovablePage()
> 
>> d) How to make __test_page_isolated_in_pageblock() succeed?
>>     Like I propose in this patch (PageOffline() + refcount == 0)?
> 
> Yep
> 
>> e) How to make __offline_isolated_pages() succeed?
>>     Like I propose in this patch (PageOffline() + refcount == 0)?
> 
> Simply skip over PageOffline pages. Reference count should never be != 0
> at this stage.

Right, that should be guaranteed by d). (as long as people play by the 
rules) Same applies to my current patch.

>   
>> In summary, is what you suggest simply delaying setting the reference count to 0
>> in MEM_GOING_OFFLINE instead of right away when the driver unpluggs the pages?
> 
> Yes
> 
>> What's the big benefit you see and I fail to see?
> 
> Aparat from no hooks into __put_page it is also an explicit control over
> the page via reference counting. Do you see any downsides?

The only downside I see is that we get more false negatives on 
has_unmovable_pages(), eventually resulting in the offlining stage after 
isolation to loop forever (as some PageOffline() pages are not movable 
(especially, XEN balloon, HyperV balloon), there won't be progress).

I somewhat don't like forcing everybody that uses PageOffline() 
(especially all users of balloon compaction) to implement memory 
notifiers just to avoid that. Maybe, we even want to use PageOffline() 
in the future in the core (e.g., for memory holes instead of PG_reserved 
or similar).

Thanks!

-- 

Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
