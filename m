Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FFB7DFF82
	for <lists.virtualization@lfdr.de>; Fri,  3 Nov 2023 08:55:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F4B4F105;
	Fri,  3 Nov 2023 07:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F4B4F105
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YvDEM3j/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-l1YBcr90Pr; Fri,  3 Nov 2023 07:55:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EBDC64F0FF;
	Fri,  3 Nov 2023 07:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBDC64F0FF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F789C008C;
	Fri,  3 Nov 2023 07:55:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52309C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Nov 2023 07:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19E2D84FCE
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Nov 2023 07:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19E2D84FCE
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=YvDEM3j/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gwrrmAIaGaME
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Nov 2023 07:55:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFA1A84FC2
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Nov 2023 07:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFA1A84FC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698998129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FOUy5i+ta8kHEotWXp1Hvd/Nqwn03M9SEkKRkyJzmFc=;
 b=YvDEM3j/sxWZKyISeU+01stb+U2w6DEbOpGnEHdP0tBKFpnex4DWF3T3EQPI0H7oaDYxa+
 dZ2sYud1S6YDK54zHo1UBSEVr+9+fP++8zc57AQGWYkF8pFL3gIpWmorI4rpqhlHIDWPRf
 c7HHGZmwj2P2Ycu0d8bGgg0vk8s67R4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-219-k2EqLvLfMKWRusGMt0IEPQ-1; Fri,
 03 Nov 2023 03:55:26 -0400
X-MC-Unique: k2EqLvLfMKWRusGMt0IEPQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B131F1C06EC3;
 Fri,  3 Nov 2023 07:55:25 +0000 (UTC)
Received: from [10.39.208.33] (unknown [10.39.208.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57B2C492BFA;
 Fri,  3 Nov 2023 07:55:21 +0000 (UTC)
Message-ID: <598eb8df-0f5f-4f21-8c34-f54ecbbcaca2@redhat.com>
Date: Fri, 3 Nov 2023 08:55:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] vduse: Add LSM hooks to check Virtio device type
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20231020155819.24000-1-maxime.coquelin@redhat.com>
 <20231020155819.24000-5-maxime.coquelin@redhat.com>
 <c8f189e6-c79b-429a-ab36-2193bb68e3e9@schaufler-ca.com>
 <923f87a1-1871-479e-832e-db67b5ae87fd@redhat.com>
 <64626db9-e37a-4c65-a455-fc3985382216@schaufler-ca.com>
 <7524dee3-7c48-4864-8182-1b166b0f6faa@redhat.com>
 <b307ec62-7cfd-4a58-88ef-ea549c64e75e@schaufler-ca.com>
 <76572500-5f90-46fe-9bf2-b090bf1b616b@redhat.com>
 <20231102145932-mutt-send-email-mst@kernel.org>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
Autocrypt: addr=maxime.coquelin@redhat.com; keydata=
 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
 Mwqu3GQ=
In-Reply-To: <20231102145932-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Cc: xuanzhuo@linux.alibaba.com, paul@paul-moore.com, lulu@redhat.com,
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org, jmorris@namei.org,
 virtualization@lists.linux-foundation.org, xieyongji@bytedance.com,
 linux-security-module@vger.kernel.org,
 Casey Schaufler <casey@schaufler-ca.com>, eparis@parisplace.org,
 david.marchand@redhat.com, stephen.smalley.work@gmail.com, serge@hallyn.com
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



On 11/2/23 19:59, Michael S. Tsirkin wrote:
> On Thu, Nov 02, 2023 at 06:56:59PM +0100, Maxime Coquelin wrote:
>>
>>
>> On 10/24/23 17:30, Casey Schaufler wrote:
>>> On 10/24/2023 2:49 AM, Maxime Coquelin wrote:
>>>>
>>>>
>>>> On 10/23/23 17:13, Casey Schaufler wrote:
>>>>> On 10/23/2023 12:28 AM, Maxime Coquelin wrote:
>>>>>>
>>>>>>
>>>>>> On 10/21/23 00:20, Casey Schaufler wrote:
>>>>>>> On 10/20/2023 8:58 AM, Maxime Coquelin wrote:
>>>>>>>> This patch introduces LSM hooks for devices creation,
>>>>>>>> destruction and opening operations, checking the
>>>>>>>> application is allowed to perform these operations for
>>>>>>>> the Virtio device type.
>>>>>>>
>>>>>>> Why do you think that there needs to be a special LSM check for virtio
>>>>>>> devices? What can't existing device attributes be used?
>>>>>>
>>>>>> Michael asked for a way for SELinux to allow/prevent the creation of
>>>>>> some types of devices [0].
>>>>>>
>>>>>> A device is created using ioctl() on VDUSE control chardev. Its type is
>>>>>> specified via a field in the structure passed in argument.
>>>>>>
>>>>>> I didn't see other way than adding dedicated LSM hooks to achieve this,
>>>>>> but it is possible that their is a better way to do it?
>>>>>
>>>>> At the very least the hook should be made more general, and I'd have to
>>>>> see a proposal before commenting on that. security_dev_destroy(dev)
>>>>> might
>>>>> be a better approach. If there's reason to control destruction of vduse
>>>>> devices it's reasonable to assume that there are other devices with the
>>>>> same or similar properties.
>>>>
>>>> VDUSE is different from other devices as the device is actually
>>>> implemented by the user-space application, so this is very specific in
>>>> my opinion.
>>>
>>> This is hardly unique. If you're implementing the device
>>> in user-space you may well be able to implement the desired
>>> controls there.
>>>
>>>>
>>>>>
>>>>> Since SELinux is your target use case, can you explain why you can't
>>>>> create SELinux policy to enforce the restrictions you're after? I
>>>>> believe
>>>>> (but can be proven wrong, of course) that SELinux has mechanism for
>>>>> dealing
>>>>> with controls on ioctls.
>>>>>
>>>>
>>>> I am not aware of such mechanism to deal with ioctl(), if you have a
>>>> pointer that would be welcome.
>>>
>>> security/selinux/hooks.c
>>
>> We might be able to extend selinux_file_ioctl(), but that will only
>> covers the ioctl for the control file, this patch also adds hook for the
>> device file opening that would need dedicated hook as the device type
>> information is stored in the device's private data.
>>
>> Michael, before going further, I would be interested in your feedback.
>> Was this patch what you had in mind when requesting for a way to
>> allow/deny devices types for a given application?
>>
>> Regards,
>> Maxime
> 
> 
> Yes, this is more or less what I had in mind.

Great.

Do you think we need to cover both ioctl() on the control file and
open() on the device file, or only ioctl() is enough?

If the former, we will need VDUSE-specific hooks. I may be able to
improve my patch to have a single hook instead of 3 by passing the type
of operation as an extra argument (create/destroy/open).

If the latter, we may be able to extend the generic ioctl hook.

Personally, I think it would make sense to also ensure a given
application can only open existing VDUSE devices it supports. For
example, openvswitch should only be allowed to open networking VDUSE
devices.

Thanks,
Maxime

> 
>>>
>>>>
>>>> Thanks,
>>>> Maxime
>>>>
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Maxime
>>>>>>
>>>>>> [0]:
>>>>>> https://lore.kernel.org/all/20230829130430-mutt-send-email-mst@kernel.org/
>>>>>>
>>>>>>
>>>>>
>>>>
>>>
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
