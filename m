Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC0C1C0462
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 20:10:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0B87D8884F;
	Thu, 30 Apr 2020 18:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKG4Uekh+tFy; Thu, 30 Apr 2020 18:10:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 418F18884E;
	Thu, 30 Apr 2020 18:10:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C301C016F;
	Thu, 30 Apr 2020 18:10:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F206FC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 18:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E0432834BE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 18:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8aheJ4M9KR2M
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 18:10:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7B72386D88
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 18:09:49 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out01.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
 (envelope-from <ebiederm@xmission.com>)
 id 1jUDd3-0002vZ-L9; Thu, 30 Apr 2020 12:09:45 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in02.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1jUDd2-0000hI-EL; Thu, 30 Apr 2020 12:09:45 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: David Hildenbrand <david@redhat.com>
References: <20200430102908.10107-1-david@redhat.com>
 <20200430102908.10107-3-david@redhat.com>
 <87pnbp2dcz.fsf@x220.int.ebiederm.org>
 <1b49c3be-6e2f-57cb-96f7-f66a8f8a9380@redhat.com>
 <871ro52ary.fsf@x220.int.ebiederm.org>
 <373a6898-4020-4af1-5b3d-f827d705dd77@redhat.com>
Date: Thu, 30 Apr 2020 13:06:26 -0500
In-Reply-To: <373a6898-4020-4af1-5b3d-f827d705dd77@redhat.com> (David
 Hildenbrand's message of "Thu, 30 Apr 2020 18:49:39 +0200")
Message-ID: <875zdg26hp.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1jUDd2-0000hI-EL; ; ; mid=<875zdg26hp.fsf@x220.int.ebiederm.org>;
 ; ; hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/0nSmexEm1WkrDW9iKj+jfV8y2wWo/acY=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;David Hildenbrand <david@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 806 ms - load_scoreonly_sql: 0.09 (0.0%),
 signal_user_changed: 13 (1.6%), b_tie_ro: 11 (1.4%), parse: 1.99
 (0.2%), extract_message_metadata: 23 (2.8%), get_uri_detail_list: 7
 (0.8%), tests_pri_-1000: 19 (2.4%), tests_pri_-950: 1.58 (0.2%),
 tests_pri_-900: 1.29 (0.2%), tests_pri_-90: 310 (38.5%), check_bayes:
 309 (38.3%), b_tokenize: 17 (2.1%), b_tok_get_all: 195 (24.2%),
 b_comp_prob: 6 (0.7%), b_tok_touch_all: 87 (10.8%), b_finish: 0.91
 (0.1%), tests_pri_0: 423 (52.5%), check_dkim_signature: 0.62 (0.1%),
 check_dkim_adsp: 2.2 (0.3%), poll_dns_idle: 0.46 (0.1%), tests_pri_10:
 1.80 (0.2%), tests_pri_500: 6 (0.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2 2/3] mm/memory_hotplug: Introduce MHP_NO_FIRMWARE_MEMMAP
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Cc: virtio-dev@lists.oasis-open.org, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 linux-mm@kvack.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-s390@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

David Hildenbrand <david@redhat.com> writes:

> On 30.04.20 18:33, Eric W. Biederman wrote:
>> David Hildenbrand <david@redhat.com> writes:
>> 
>>> On 30.04.20 17:38, Eric W. Biederman wrote:
>>>> David Hildenbrand <david@redhat.com> writes:
>>>>
>>>>> Some devices/drivers that add memory via add_memory() and friends (e.g.,
>>>>> dax/kmem, but also virtio-mem in the future) don't want to create entries
>>>>> in /sys/firmware/memmap/ - primarily to hinder kexec from adding this
>>>>> memory to the boot memmap of the kexec kernel.
>>>>>
>>>>> In fact, such memory is never exposed via the firmware memmap as System
>>>>> RAM (e.g., e820), so exposing this memory via /sys/firmware/memmap/ is
>>>>> wrong:
>>>>>  "kexec needs the raw firmware-provided memory map to setup the
>>>>>   parameter segment of the kernel that should be booted with
>>>>>   kexec. Also, the raw memory map is useful for debugging. For
>>>>>   that reason, /sys/firmware/memmap is an interface that provides
>>>>>   the raw memory map to userspace." [1]
>>>>>
>>>>> We don't have to worry about firmware_map_remove() on the removal path.
>>>>> If there is no entry, it will simply return with -EINVAL.
>>>>>
>>>>> [1]
>>>>> https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-memmap
>>>>
>>>>
>>>> You know what this justification is rubbish, and I have previously
>>>> explained why it is rubbish.
>>>
>>> Actually, no, I don't think it is rubbish. See patch #3 and the cover
>>> letter why this is the right thing to do *for special memory*, *not
>>> ordinary DIMMs*.
>>>
>>> And to be quite honest, I think your response is a little harsh. I don't
>>> recall you replying to my virtio-mem-related comments.
>>>
>>>>
>>>> Nacked-by: "Eric W. Biederman" <ebiederm@xmission.com>
>>>>
>>>> This needs to be based on weather the added memory is ultimately normal
>>>> ram or is something special.
>>>
>>> Yes, that's what the caller are expected to decide, see patch #3.
>>>
>>> kexec should try to be as closely as possible to a real reboot - IMHO.
>> 
>> That is very fuzzy in terms of hotplug memory.  The kexec'd kernel
>> should see the hotplugged memory assuming it is ordinary memory.
>> 
>> But kexec is not a reboot although it is quite similar.   Kexec is
>> swapping one running kernel and it's state for another kernel without
>> rebooting.
>
> I agree (especially regarding the arm64 DIMM hotplug discussion).
> However, for the two cases
>
> a) dax/kmem
> b) virtio-mem
>
> We really want to let the driver take back control and figure out "what
> to do with the memory".

From reading your v1 cover letter (the description appears missing in
v2) I see what you are talking about with respect to virtio-mem.

So I will count virt-io mem as something different.

>>>> Justifying behavior by documentation that does not consider memory
>>>> hotplug is bad thinking.
>>>
>>> Are you maybe confusing this patch series with the arm64 approach? This
>>> is not about ordinary hotplugged DIMMs.
>> 
>> I think I am.
>> 
>> My challenge is that I don't see anything in the description that says
>> this isn't about ordinary hotplugged DIMMs.  All I saw was hotplug
>> memory.
>
> I'm sorry if that was confusing, I tried to stress that kmem and
> virtio-mem is special in the description.
>
> I squeezed a lot of that information into the cover letter and into
> patch #3.


>> If the class of memory is different then please by all means let's mark
>> it differently in struct resource so everyone knows it is different.
>> But that difference needs to be more than hotplug.
>> 
>> That difference needs to be the hypervisor loaned us memory and might
>> take it back at any time, or this memory is persistent and so it has
>> these different characteristics so don't use it as ordinary ram.
>
> Yes, and I think kmem took an excellent approach of explicitly putting
> that "System RAM" into a resource hierarchy. That "System RAM" won't
> show up as a root node under /proc/iomem (see patch #3), which already
> results in kexec-tools to treat it in a special way. I am thinking about
> doing the same for virtio-mem.

Reading this and your patch cover letters again my concern is that
the justification seems to be letting the tail wag the dog.

You want kexec-tools to behave in a certain way so you are changing the
kernel.

Rather it should be change the kernel to clearly reflect reality and if
you can get away without a change to kexec-tools that is a bonus.

>> That information is also useful to other people looking at the system
>> and seeing what is going on.
>> 
>> Just please don't muddle the concepts, or assume that whatever subset of
>> hotplug memory you are dealing with is the only subset.
>
> I can certainly rephrase the subject/description/comment, stating that
> this is not to be used for ordinary hotplugged DIMMs - only when the
> device driver is under control to decide what to do with that memory -
> especially when kexec'ing.
>
> (previously, I called this flag MHP_DRIVER_MANAGED, but I think
> MHP_NO_FIRMWARE_MEMMAP is clearer, we just need a better description)
>
> Would that make it clearer?

I am not certain, but Andrew Morton deliberately added that
firmware_map_add_hotplug call.  Which means that there is a reason
for putting hotplugged memory in the firmware map.

So the justification needs to take that reason into account.  The
justification can not be it is hotplugged therefore it should not belong
in the firmware memory map.  Unless you can show that
firmware_map_add_hotplug that was actually a bug and should be removed.
But as it has been that way since 2010 that seems like a long shot.

So my question is what is right for the firmware map?

Why does the firmware map support hotplug entries?

Once we have the answers to those questions we can figure out what logic
the special kinds of memory hotplug need.

Ref: d96ae5309165 ("memory-hotplug: create /sys/firmware/memmap entry for new memory")

Eric

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
