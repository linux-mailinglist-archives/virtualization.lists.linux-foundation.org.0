Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 664A2D91B6
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 14:57:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B9EA5E78;
	Wed, 16 Oct 2019 12:57:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AAC9EE1E
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 12:57:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4751E821
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 12:57:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9965C300C72A;
	Wed, 16 Oct 2019 12:57:06 +0000 (UTC)
Received: from [10.36.116.19] (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7887560C4E;
	Wed, 16 Oct 2019 12:57:04 +0000 (UTC)
Subject: Re: [PATCH RFC v3 8/9] mm/memory_hotplug: Introduce
	offline_and_remove_memory()
To: Michal Hocko <mhocko@kernel.org>
References: <20190919142228.5483-1-david@redhat.com>
	<20190919142228.5483-9-david@redhat.com>
	<20191016114708.GY317@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <0568676b-4a22-cd95-1de8-a43022aa6a9f@redhat.com>
Date: Wed, 16 Oct 2019 14:57:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191016114708.GY317@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 16 Oct 2019 12:57:06 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>, Oscar Salvador <osalvador@suse.com>,
	Pavel Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Qian Cai <cai@lca.pw>, Andrew Morton <akpm@linux-foundation.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	Dan Williams <dan.j.williams@intel.com>
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

On 16.10.19 13:47, Michal Hocko wrote:
> On Thu 19-09-19 16:22:27, David Hildenbrand wrote:
>> virtio-mem wants to offline and remove a memory block once it unplugged
>> all subblocks (e.g., using alloc_contig_range()). Let's provide
>> an interface to do that from a driver. virtio-mem already supports to
>> offline partially unplugged memory blocks. Offlining a fully unplugged
>> memory block will not require to migrate any pages. All unplugged
>> subblocks are PageOffline() and have a reference count of 0 - so
>> offlining code will simply skip them.
>>
>> All we need an interface to trigger the "offlining" and the removing in a
>> single operation - to make sure the memory block cannot get onlined by
>> user space again before it gets removed.
>>
>> To keep things simple, allow to only work on a single memory block.
> 
> Without a user it is not really clear why do we need this interface.
> I am also not really sure why do you want/need to control beyond the
> offlining stage. Care to explain some more?
> 

The user is the next (small) patch in this series:

https://lkml.org/lkml/2019/9/19/475

Let's assume virtio-mem added a memory block and that block was onlined 
(e.g. by user space). E.g. 128MB.

On request, virtio-mem used alloc_contig_range() to logically unplug all 
chunks (e.g., 4MB) of that memory block. virtio-mem marked all pages 
PG_offline and dropped the reference count to 0 (to allow the memory 
block to get offlined). Basically no memory of the memory block is still 
in use by the system. So it is very desirable to remove that memory 
block along with the vmemmap and the page tables. This frees up memory.

In order to remove the memory block, it first has to be officially 
offlined (e.g., make the memory block as offline). Then, the memory 
block can get cleanly removed. Otherwise, try_remove_memory() will fail.

To do this, virtio-mem needs an interface to perform both steps (offline 
+ remove).

There is no interface for a driver to offline a memory block. What I 
propose here performs both steps (offline+remove) in a single step, as 
that is really what the driver wants.

-- 

Thanks,

David / dhildenb
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
