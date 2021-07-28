Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 838C73D9034
	for <lists.virtualization@lfdr.de>; Wed, 28 Jul 2021 16:16:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D4C340112;
	Wed, 28 Jul 2021 14:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kkrnHp-Zxq_2; Wed, 28 Jul 2021 14:16:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D5FC74015E;
	Wed, 28 Jul 2021 14:16:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6297AC000E;
	Wed, 28 Jul 2021 14:16:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3654C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 14:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE991835E4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 14:16:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Quar6hhj1b4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 14:16:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D2CF83300
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 14:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627481798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SBTvI7AyrQyvAwreHvMDRlU4GfJOEkkwow/YW2lcebI=;
 b=FDhT6iL/8fq31uDbFq2XHDFc5NBSBuBCoBoCrItaY5+mesKmybRN5+tQW4oIqPwxGzsaXv
 /8cam+4hWc4blGBLLHzDtyby1FJxEy+tDfTSKNLL1cCMG+xSjhebGgawrttHp+8iOm1h+8
 kyTQT9YXKfkwfuAUSHFYBXI5gVALI3I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-Az2iMlCLNh2ASyzv5DS6ZQ-1; Wed, 28 Jul 2021 10:16:33 -0400
X-MC-Unique: Az2iMlCLNh2ASyzv5DS6ZQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f142-20020a1c1f940000b029025093cddc1eso1459735wmf.3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 07:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SBTvI7AyrQyvAwreHvMDRlU4GfJOEkkwow/YW2lcebI=;
 b=Q+rEht8OSsVVzVgC5Dt1MyltbznuMaykPq5qPHG+uhl5DkfdIQ25j0P91NVusf1OkI
 dSuKgjWGKnTBYdanl7rEkivgt2epwzdM2Cne3LZ93dNNCkO4I+dAdLB3Q03JXWhxNsYZ
 /+/n2lblOVJAqG7x4yGdgG6txY7Vjop7PcdgnVJd3MPdatY4jaUNzKWN1IMvIugk0JFI
 08ic6/jcL8TOnpIlvKp7YN3D0ZGgI8xgr8rH8Y/u9YOl8Wes5qzzNAcQSZhaUaay/Q2r
 gyzC/oPkX4AIZHJ5Rgw6faBJfNP6aKI8TF34EkfmdnYy84tAF4xjKWknIbKNZsscKjW9
 aqug==
X-Gm-Message-State: AOAM531bTb+B/Gsy5cJ17jzAOx99cR2qPxAY3MCLzQ0qXOihpC326VmT
 j2T6DW8+I2g54vtJtr9k9Cm0UBQ5VPo7HrAc4/QXA5oq69wQS/ueAQGHmqEmu2ILRTpYeuJ99KV
 lK6m9RbvO1gH6urU4PnPquM4oJhbQ0eV3B4J/BrKy2w==
X-Received: by 2002:a5d:4751:: with SMTP id o17mr23882211wrs.252.1627481792307; 
 Wed, 28 Jul 2021 07:16:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp/VmSZ6MuqzGZoTa2wRKFNJXZiRxCOsLy7Zc304MtYust9qBmcciWmXmZwOF3zqp8wUvvWw==
X-Received: by 2002:a5d:4751:: with SMTP id o17mr23882179wrs.252.1627481792086; 
 Wed, 28 Jul 2021 07:16:32 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id f194sm6232701wmf.23.2021.07.28.07.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 07:16:31 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210723125210.29987-1-david@redhat.com>
 <20210723125210.29987-4-david@redhat.com> <YQFeJ1P9wQvlqAz7@kroah.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 3/9] drivers/base/memory: introduce "memory groups" to
 logically group memory blocks
Message-ID: <2eaa8ac5-9eaf-bd2a-ace6-3f1ac38c85ff@redhat.com>
Date: Wed, 28 Jul 2021 16:16:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQFeJ1P9wQvlqAz7@kroah.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Hui Zhu <teawater@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Marek Kedzierski <mkedzier@redhat.com>, Mike Rapoport <rppt@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi Greg,

>>   
>>   static void unregister_memory(struct memory_block *memory)
>> @@ -681,6 +692,11 @@ static void unregister_memory(struct memory_block *memory)
>>   
>>   	WARN_ON(xa_erase(&memory_blocks, memory->dev.id) == NULL);
>>   
>> +	if (memory->group) {
>> +		refcount_dec(&memory->group->refcount);
>> +		memory->group = NULL;
> 
> Who freed the memory for the group?

try_remove_memory() will end up calling 
remove_memory_block_devices()->unregister_memory().

try_remove_memory() will get called by drivers that added memory 
previously and registered the memory groups.

>> +static int register_memory_group(struct memory_group group)
>> +{
>> +	struct memory_group *new_group;
>> +	uint32_t mgid;
>> +	int ret;
>> +
>> +	if (!node_possible(group.nid))
>> +		return -EINVAL;
>> +
>> +	new_group = kzalloc(sizeof(group), GFP_KERNEL);
>> +	if (!new_group)
>> +		return -ENOMEM;
>> +	*new_group = group;
> 
> You burried a memcpy here, why?  Please be explicit as this is now a
> dynamic structure.

To make the two callers directly below nicer. This is a pure helper for 
initialization. Suggestions welcome.

> 
>> +	refcount_set(&new_group->refcount, 1);
> 
> Why not just use a kref?  You seem to be treating it as a kref would
> work, right?

I shall have a look, thanks!

> 
>> +
>> +	ret = xa_alloc(&memory_groups, &mgid, new_group, xa_limit_31b,
>> +		       GFP_KERNEL);
>> +	if (ret)
>> +		kfree(new_group);
>> +	return ret ? ret : mgid;
> 
> I hate ?: please spell this out:
> 	if (ret)
> 		return ret;
> 	return mgid;

I can avoid it in this case, but it feels kind of wrong to stick to the 
personal preference of individuals if it's getting used all over the 
code base and there is no clear coding style recommendation.

> 
> There, more obvious and you can read it in 10 years when you have to go
> fix it up...
> 

Fair enough.

> 
> 
>> +}
>> +
>> +int register_static_memory_group(int nid, unsigned long max_pages)
>> +{
>> +	struct memory_group group = {
>> +		.nid = nid,
>> +		.s = {
>> +			.max_pages = max_pages,
>> +		},
>> +	};
>> +
>> +	if (!max_pages)
>> +		return -EINVAL;
>> +	return register_memory_group(group);
>> +}
>> +EXPORT_SYMBOL_GPL(register_static_memory_group);
> 
> Let's make our global namespace a bit nicer:
> 	memory_group_register_static()
> 	memory_group_register_dynamic()
> 
> and so on.  Use prefixes please, not suffixes.

Sure, no strong opinion, can do.

> 
> 
>> +
>> +int register_dynamic_memory_group(int nid, unsigned long unit_pages)
>> +{
>> +	struct memory_group group = {
>> +		.nid = nid,
>> +		.is_dynamic = true,
>> +		.d = {
>> +			.unit_pages = unit_pages,
>> +		},
>> +	};
>> +
>> +	if (!unit_pages || !is_power_of_2(unit_pages) ||
>> +	    unit_pages < PHYS_PFN(memory_block_size_bytes()))
>> +		return -EINVAL;
>> +	return register_memory_group(group);
>> +}
>> +EXPORT_SYMBOL_GPL(register_dynamic_memory_group);
>> +
>> +int unregister_memory_group(int mgid)
>> +{
>> +	struct memory_group *group;
>> +
>> +	if (mgid < 0)
>> +		return -EINVAL;
>> +
>> +	group = xa_load(&memory_groups, mgid);
>> +	if (!group || refcount_read(&group->refcount) > 1)
>> +		return -EINVAL;
>> +
>> +	xa_erase(&memory_groups, mgid);
>> +	kfree(group);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(unregister_memory_group);
> 
> memory_group_unregister()

Sure.

> 
> 
>> +
>> +struct memory_group *get_memory_group(int mgid)
>> +{
>> +	return xa_load(&memory_groups, mgid);
>> +}
> 
> Global function?

Called from mm/memory_hotplug.c:add_memory_resource(). Note that we do 
not want to export that function to random modules.

Any suggestion?

> 
> 
>> diff --git a/include/linux/memory.h b/include/linux/memory.h
>> index 97e92e8b556a..6e20a6174fe5 100644
>> --- a/include/linux/memory.h
>> +++ b/include/linux/memory.h
>> @@ -23,6 +23,42 @@
>>   
>>   #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
>>   
>> +struct memory_group {
>> +	/* Nid the whole group belongs to. */
>> +	int nid;
> 
> What is a "nid"?

"Node id". Will clarify.

> 
>> +	/* References from memory blocks + 1. */
> 
> Blank line above this?

Sure.

> 
> And put the structure comments in proper kernel doc so that others can
> read them and we can verify it is correct over time.

Can do.

> 
>> +	refcount_t refcount;
>> +	/*
>> +	 * Memory group type: static vs. dynamic.
>> +	 *
>> +	 * Static: All memory in the group belongs to a single unit, such as,
>> +	 * a DIMM. All memory belonging to the group will be added in
>> +	 * one go and removed in one go -- it's static.
>> +	 *
>> +	 * Dynamic: Memory within the group is added/removed dynamically in
>> +	 * units of the specified granularity of at least one memory block.
>> +	 */
>> +	bool is_dynamic;
>> +
>> +	union {
>> +		struct {
>> +			/*
>> +			 * Maximum number of pages we'll have in this static
>> +			 * memory group.
>> +			 */
>> +			unsigned long max_pages;
>> +		} s;
>> +		struct {
>> +			/*
>> +			 * Unit in pages in which memory is added/removed in
>> +			 * this dynamic memory group. This granularity defines
>> +			 * the alignment of a unit in physical address space.
>> +			 */
>> +			unsigned long unit_pages;
>> +		} d;
> 
> so is_dynamic determines which to use here?  Please be explicit.

Sure, can make that more explicit.

Thanks for the feedback!


-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
