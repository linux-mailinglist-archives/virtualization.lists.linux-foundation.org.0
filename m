Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 72737D92C8
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 15:45:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EE10DE91;
	Wed, 16 Oct 2019 13:45:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2C630DC2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 13:45:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B3EF3821
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 13:45:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6ABA210CC212;
	Wed, 16 Oct 2019 13:45:14 +0000 (UTC)
Received: from [10.36.116.19] (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 602B61001B20;
	Wed, 16 Oct 2019 13:45:07 +0000 (UTC)
Subject: Re: [PATCH RFC v3 6/9] mm: Allow to offline PageOffline() pages with
	a reference count of 0
To: Michal Hocko <mhocko@kernel.org>
References: <20190919142228.5483-1-david@redhat.com>
	<20190919142228.5483-7-david@redhat.com>
	<20191016114321.GX317@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <36fef317-78e3-0500-43ba-f537f9a6fea4@redhat.com>
Date: Wed, 16 Oct 2019 15:45:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191016114321.GX317@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.65]);
	Wed, 16 Oct 2019 13:45:15 +0000 (UTC)
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

On 16.10.19 13:43, Michal Hocko wrote:
> On Thu 19-09-19 16:22:25, David Hildenbrand wrote:
>> virtio-mem wants to allow to offline memory blocks of which some parts
>> were unplugged, especially, to later offline and remove completely
>> unplugged memory blocks. The important part is that PageOffline() has
>> to remain set until the section is offline, so these pages will never
>> get accessed (e.g., when dumping). The pages should not be handed
>> back to the buddy (which would require clearing PageOffline() and
>> result in issues if offlining fails and the pages are suddenly in the
>> buddy).
>>
>> Let's use "PageOffline() + reference count = 0" as a sign to
>> memory offlining code that these pages can simply be skipped when
>> offlining, similar to free or HWPoison pages.
>>
>> Pass flags to test_pages_isolated(), similar as already done for
>> has_unmovable_pages(). Use a new flag to indicate the
>> requirement of memory offlining to skip over these special pages.
>>
>> In has_unmovable_pages(), make sure the pages won't be detected as
>> movable. This is not strictly necessary, however makes e.g.,
>> alloc_contig_range() stop early, trying to isolate such page blocks -
>> compared to failing later when testing if all pages were isolated.
>>
>> Also, make sure that when a reference to a PageOffline() page is
>> dropped, that the page will not be returned to the buddy.
>>
>> memory devices (like virtio-mem) that want to make use of this
>> functionality have to make sure to synchronize against memory offlining,
>> using the memory hotplug notifier.
>>
>> Alternative: Allow to offline with a reference count of 1
>> and use some other sign in the struct page that offlining is permitted.
> 
> Few questions. I do not see onlining code to take care of this special
> case. What should happen when offline && online?
> Should we allow to try_remove_memory to succeed with these pages?
> Do we really have hook into __put_page? Why do we even care about the
> reference count of those pages?

Oh, I forgot to answer this questions. The __put_page() change is 
necessary for the following race I identified:

Page has a refcount of 1 (e.g., allocated by virtio-mem using 
alloc_contig_range()).

a) kernel: get_page_unless_zero(page): refcount = 2
b) virtio-mem: set page PG_offline, reduce refcount): refocunt = 1
c) kernel: put_page(page): refcount = 0

The page would suddenly be given to the buddy. which is bad.

-- 

Thanks,

David / dhildenb
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
