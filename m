Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 694E2D90F4
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 14:31:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3A620DA3;
	Wed, 16 Oct 2019 12:31:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D5CA2D9B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 12:31:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 390F070D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 12:31:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5450687638;
	Wed, 16 Oct 2019 12:31:18 +0000 (UTC)
Received: from [10.36.116.19] (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6FA85D9CD;
	Wed, 16 Oct 2019 12:31:15 +0000 (UTC)
Subject: Re: [PATCH RFC v3 4/9] mm: Export alloc_contig_range() /
	free_contig_range()
To: Michal Hocko <mhocko@kernel.org>
References: <20190919142228.5483-1-david@redhat.com>
	<20190919142228.5483-5-david@redhat.com>
	<20191016112051.GW317@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <ef8b47c6-45ad-1b32-c54d-829b44a12131@redhat.com>
Date: Wed, 16 Oct 2019 14:31:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191016112051.GW317@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 16 Oct 2019 12:31:18 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 16.10.19 13:20, Michal Hocko wrote:
> On Thu 19-09-19 16:22:23, David Hildenbrand wrote:
>> A virtio-mem device wants to allocate memory from the memory region it
>> manages in order to unplug it in the hypervisor - similar to
>> a balloon driver. Also, it might want to plug previously unplugged
>> (allocated) memory and give it back to Linux. alloc_contig_range() /
>> free_contig_range() seem to be the perfect interface for this task.
>>
>> In contrast to existing balloon devices, a virtio-mem device operates
>> on bigger chunks (e.g., 4MB) and only on physical memory it manages. It
>> tracks which chunks (subblocks) are still plugged, so it can go ahead
>> and try to alloc_contig_range()+unplug them on unplug request, or
>> plug+free_contig_range() unplugged chunks on plug requests.
>>
>> A virtio-mem device will use alloc_contig_range() / free_contig_range()
>> only on ranges that belong to the same node/zone in at least
>> MAX(MAX_ORDER - 1, pageblock_order) order granularity - e.g., 4MB on
>> x86-64. The virtio-mem device added that memory, so the memory
>> exists and does not contain any holes. virtio-mem will only try to allocate
>> on ZONE_NORMAL, never on ZONE_MOVABLE, just like when allocating
>> gigantic pages (we don't put unmovable data into the movable zone).
> 
> Is there any real reason to export as GPL rather than generic
> EXPORT_SYMBOL? In other words do we need to restrict the usage this
> interface only to GPL modules and why if so. All other allocator APIs
> are EXPORT_SYMBOL so there should better be a good reason for this one
> to differ. I can understand that this one is slightly different by
> requesting a specific range of the memory but it is still under a full
> control of the core MM to say no.

I thought that we might - at least initially - might want to know all 
users. If you prefer, I can drop the GPL.

> 
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Mel Gorman <mgorman@techsingularity.net>
>> Cc: Mike Rapoport <rppt@linux.ibm.com>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>> Cc: Pavel Tatashin <pavel.tatashin@microsoft.com>
>> Cc: Alexander Potapenko <glider@google.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Other than that, I do not think exporting this function is harmful. It
> would be worse to reinvent it and do it wrong.
> 
> I usually prefer to add a caller in the same patch, though, because it
> makes the usage explicit and clear.
> 

It's the next patch in this series (I prefer to split this from the 
actual driver):

https://lkml.org/lkml/2019/9/19/486

> Acked-by: Michal Hocko <mhocko@suse.com> # to export contig range allocator API

Thanks!

-- 

Thanks,

David / dhildenb
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
