Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4454637145D
	for <lists.virtualization@lfdr.de>; Mon,  3 May 2021 13:36:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3E3483F54;
	Mon,  3 May 2021 11:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZkWFNeuCQ14; Mon,  3 May 2021 11:35:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E43883F80;
	Mon,  3 May 2021 11:35:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D42C1C0001;
	Mon,  3 May 2021 11:35:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83BABC0001
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 11:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7071660B0E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 11:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2SM_xW1kxodh
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 11:35:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52C2360B05
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 11:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620041755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqkM0iWGl6jrVU5KuvimVV9SZx4Jlvp1gEzxVMJa670=;
 b=T3cwsqLwEGkoUeYp+/qf8hQL7TEtImFY8q+va+bG65zftj65npvml9gsAp+H5enESMnc+O
 sFJy9nOQhChViq3pa2YEGXyhSYRV7TVMUQ/iFNzchWWgdM7XjDfUezIaGO2wDrLj/foSQ4
 xl3G2n4IgGIh2cZ0tqYQsbRPRxHFlIg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-le8ukgI7Obyu_JdZ7AeWqw-1; Mon, 03 May 2021 07:35:52 -0400
X-MC-Unique: le8ukgI7Obyu_JdZ7AeWqw-1
Received: by mail-wr1-f72.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso3766267wre.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 May 2021 04:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WqkM0iWGl6jrVU5KuvimVV9SZx4Jlvp1gEzxVMJa670=;
 b=Y08eO62EIoCUfm/qABgnuXKyCYkvabAUiecKxS0bhVDkJDgbEsbinYsLTlbPQflERD
 9znbDyEzMaD1IYHriVfS6+8c80S5A9STPmh9V9Z+S9Ik9lkNMES31Fgs5YEp0gwxYOME
 3YDRoUvT/2iIKmWvTxC6BPsnhhcMibE6nzSKcPHW/mNtnbYku76ZAMnL6O2FtNaxTpDu
 LqphSyBq8EcC1sVdomr4qoc2LxLbBN1HKYrCn0RRZ9oq5k7+fdiaw70IQqcTpMNvJr2R
 gB2Qx2JC2e9HNhUKKYFtTsuJT935D8a+IQ5mJWkioT8UwOIMs4TPuEFHIAIL7VoDv0N4
 FPdw==
X-Gm-Message-State: AOAM5325Wj/8+XzYFz2k9+75BVYZLLzFggXni3gMh964WwXs8Bp1agmL
 D7fJxQkmXLLzhwKc7IiVEB6O1VTzuBP57xkDiAI/tcz6+6bt76Py8ApTi4RUpPziCRLI9q4ySg0
 TitoZ02UrLmemmz/FmHHNDDwIJ7HVJ5JkfiDQcBbS8g==
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr31118922wmh.174.1620041751215; 
 Mon, 03 May 2021 04:35:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3tS70mbovvf2isVdRqtaSYaIPZB8VFAoB+G6yadE6t3QI++fiJfnblhR/UYdS8ZB2jp2nag==
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr31118895wmh.174.1620041750887; 
 Mon, 03 May 2021 04:35:50 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c649f.dip0.t-ipconnect.de. [91.12.100.159])
 by smtp.gmail.com with ESMTPSA id l12sm11919551wrm.76.2021.05.03.04.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 04:35:50 -0700 (PDT)
Subject: Re: [PATCH v1 7/7] fs/proc/kcore: use page_offline_(freeze|unfreeze)
To: Mike Rapoport <rppt@kernel.org>
References: <20210429122519.15183-1-david@redhat.com>
 <20210429122519.15183-8-david@redhat.com> <YI5H4yV/c6ReuIDt@kernel.org>
 <5a5a7552-4f0a-75bc-582f-73d24afcf57b@redhat.com>
 <YI/CWg6PrMxcCT2D@kernel.org>
 <2f66cbfc-aa29-b3ef-4c6a-0da8b29b56f6@redhat.com>
 <YI/fl9VHvjYJdwKF@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e49556fb-d01b-87f5-f09f-539b7d78abbb@redhat.com>
Date: Mon, 3 May 2021 13:35:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YI/fl9VHvjYJdwKF@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Aili Yao <yaoaili@kingsoft.com>, Michal Hocko <mhocko@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Wei Liu <wei.liu@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Steven Price <steven.price@arm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Jiri Bohac <jbohac@suse.cz>, Haiyang Zhang <haiyangz@microsoft.com>,
 Oscar Salvador <osalvador@suse.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
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

On 03.05.21 13:33, Mike Rapoport wrote:
> On Mon, May 03, 2021 at 12:13:45PM +0200, David Hildenbrand wrote:
>> On 03.05.21 11:28, Mike Rapoport wrote:
>>> On Mon, May 03, 2021 at 10:28:36AM +0200, David Hildenbrand wrote:
>>>> On 02.05.21 08:34, Mike Rapoport wrote:
>>>>> On Thu, Apr 29, 2021 at 02:25:19PM +0200, David Hildenbrand wrote:
>>>>>> Let's properly synchronize with drivers that set PageOffline(). Unfreeze
>>>>>> every now and then, so drivers that want to set PageOffline() can make
>>>>>> progress.
>>>>>>
>>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>>> ---
>>>>>>     fs/proc/kcore.c | 15 +++++++++++++++
>>>>>>     1 file changed, 15 insertions(+)
>>>>>>
>>>>>> diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
>>>>>> index 92ff1e4436cb..3d7531f47389 100644
>>>>>> --- a/fs/proc/kcore.c
>>>>>> +++ b/fs/proc/kcore.c
>>>>>> @@ -311,6 +311,7 @@ static void append_kcore_note(char *notes, size_t *i, const char *name,
>>>>>>     static ssize_t
>>>>>>     read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t *fpos)
>>>>>>     {
>>>>>> +	size_t page_offline_frozen = 0;
>>>>>>     	char *buf = file->private_data;
>>>>>>     	size_t phdrs_offset, notes_offset, data_offset;
>>>>>>     	size_t phdrs_len, notes_len;
>>>>>> @@ -509,6 +510,18 @@ read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t *fpos)
>>>>>>     			pfn = __pa(start) >> PAGE_SHIFT;
>>>>>>     			page = pfn_to_online_page(pfn);
>>>>>
>>>>> Can't this race with page offlining for the first time we get here?
>>>>
>>>>
>>>> To clarify, we have three types of offline pages in the kernel ...
>>>>
>>>> a) Pages part of an offline memory section; the memap is stale and not
>>>> trustworthy. pfn_to_online_page() checks that. We *can* protect against
>>>> memory offlining using get_online_mems()/put_online_mems(), but usually
>>>> avoid doing so as the race window is very small (and a problem all over the
>>>> kernel we basically never hit) and locking is rather expensive. In the
>>>> future, we might switch to rcu to handle that more efficiently and avoiding
>>>> these possible races.
>>>>
>>>> b) PageOffline(): logically offline pages contained in an online memory
>>>> section with a sane memmap. virtio-mem calls these pages "fake offline";
>>>> something like a "temporary" memory hole. The new mechanism I propose will
>>>> be used to handle synchronization as races can be more severe, e.g., when
>>>> reading actual page content here.
>>>>
>>>> c) Soft offline pages: hwpoisoned pages that are not actually harmful yet,
>>>> but could become harmful in the future. So we better try to remove the page
>>>> from the page allcoator and try to migrate away existing users.
>>>>
>>>>
>>>> So page_offline_* handle "b) PageOffline()" only. There is a tiny race
>>>> between pfn_to_online_page(pfn) and looking at the memmap as we have in many
>>>> cases already throughout the kernel, to be tackled in the future.
>>>
>>> Right, but here you anyway add locking, so why exclude the first iteration?
>>
>> What we're protecting is PageOffline() below. If I didn't mess up, we should
>> always be calling page_offline_freeze() before calling PageOffline(). Or am
>> I missing something?
>   
> Somehow I was under impression we are protecting both pfn_to_online_page()
> and PageOffline().
>   
>>> BTW, did you consider something like
>>
>> Yes, I played with something like that. We'd have to handle the first
>> page_offline_freeze() freeze differently, though, and that's where things
>> got a bit ugly in my attempts.
>>
>>>
>>> 	if (page_offline_frozen++ % MAX_ORDER_NR_PAGES == 0) {
>>> 		page_offline_unfreeze();
>>> 		cond_resched();
>>> 		page_offline_freeze();
>>> 	}
>>>
>>> We don't seem to care about page_offline_frozen overflows here, do we?
>>
>> No, the buffer size is also size_t and gets incremented on a per-byte basis.
>> The variant I have right now looked the cleanest to me. Happy to hear
>> simpler alternatives.
> 
> Well, locking for the first time before the while() loop and doing
> resched-relock outside switch() would be definitely nicer, and it makes the
> last unlock unconditional.
> 
> The cost of prevention of memory offline during reads of !KCORE_RAM parts
> does not seem that significant to me, but I may be missing something.

Also true, I'll have a look if I can just simplify that.

-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
