Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 756023CB05A
	for <lists.virtualization@lfdr.de>; Fri, 16 Jul 2021 03:18:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 043ED60B2B;
	Fri, 16 Jul 2021 01:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SnkSHiZFVIpV; Fri, 16 Jul 2021 01:18:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CF82160BE1;
	Fri, 16 Jul 2021 01:18:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5904BC001F;
	Fri, 16 Jul 2021 01:18:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E83BC000E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 01:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27B4960BA6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 01:18:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ieh91jzg0Zwn
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 01:18:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 835D060B2B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 01:18:37 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=6; SR=0; TI=SMTPD_---0UfvfgsD_1626398314; 
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UfvfgsD_1626398314) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 16 Jul 2021 09:18:35 +0800
Subject: Re: [RFC PATCH 3/3] fuse: add per-file DAX flag
To: Vivek Goyal <vgoyal@redhat.com>, Liu Bo <bo.liu@linux.alibaba.com>
References: <20210715093031.55667-1-jefflexu@linux.alibaba.com>
 <20210715093031.55667-4-jefflexu@linux.alibaba.com>
 <20210716004028.GA30967@rsjd01523.et2sqa> <YPDX9S3/TD3CL0CZ@redhat.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <6d956097-47c1-5193-bbaa-faf14f0989ef@linux.alibaba.com>
Date: Fri, 16 Jul 2021 09:18:34 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPDX9S3/TD3CL0CZ@redhat.com>
Content-Language: en-US
Cc: linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 stefanha@redhat.com, miklos@szeredi.hu
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



On 7/16/21 8:51 AM, Vivek Goyal wrote:
> On Fri, Jul 16, 2021 at 08:40:29AM +0800, Liu Bo wrote:
>> On Thu, Jul 15, 2021 at 05:30:31PM +0800, Jeffle Xu wrote:
>>> Add one flag for fuse_attr.flags indicating if DAX shall be enabled for
>>> this file.
>>>
>>> When the per-file DAX flag changes for an *opened* file, the state of
>>> the file won't be updated until this file is closed and reopened later.
>>>
>>> Currently it is not implemented yet to change per-file DAX flag inside
>>> guest kernel, e.g., by chattr(1).
>>
>> Thanks for the patch, it looks good to me.
>>
>> I think it's a good starting point, what I'd like to discuss here is
>> whether we're going to let chattr to toggle the dax flag.
> 
> I have the same question. Why not take chattr approach as taken
> by ext4/xfs as well.
> 
> Vivek

Thanks.

We can implement the chattr approach as ext4/xfs do, if we have this use
scenario. It's an RFC patch, and I want to collect more feedback as soon
as possible.

-- 
Thanks,
Jeffle
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
