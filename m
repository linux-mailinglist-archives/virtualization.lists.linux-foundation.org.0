Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D63EF8CB
	for <lists.virtualization@lfdr.de>; Wed, 18 Aug 2021 05:40:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4112680D1D;
	Wed, 18 Aug 2021 03:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKg_ryTr20qf; Wed, 18 Aug 2021 03:40:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 10A1C80D4D;
	Wed, 18 Aug 2021 03:40:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96F8BC000E;
	Wed, 18 Aug 2021 03:40:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFA64C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 03:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CA57402EA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 03:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXtr9mqYlYsX
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 03:39:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BC5040276
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 03:39:57 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R951e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0Ujd4Stm_1629257994; 
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0Ujd4Stm_1629257994) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 18 Aug 2021 11:39:55 +0800
Subject: Re: [PATCH v4 0/8] fuse,virtiofs: support per-file DAX
To: Miklos Szeredi <miklos@szeredi.hu>
References: <20210817022220.17574-1-jefflexu@linux.alibaba.com>
 <CAJfpeguw1hMOaxpDmjmijhf=-JEW95aEjxfVo_=D_LyWx8LDgw@mail.gmail.com>
 <YRut5sioYfc2M1p7@redhat.com>
 <6043c0b8-0ff1-2e11-0dd0-e23f9ff6b952@linux.alibaba.com>
 <CAJfpegv01k5hEyJ3LPDWJoqB+vL8hwTan9dLu1pkkD0xoRuFzw@mail.gmail.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <1100b711-012d-d68b-7078-20eea6fa4bab@linux.alibaba.com>
Date: Wed, 18 Aug 2021 11:39:54 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJfpegv01k5hEyJ3LPDWJoqB+vL8hwTan9dLu1pkkD0xoRuFzw@mail.gmail.com>
Content-Language: en-US
Cc: virtualization@lists.linux-foundation.org,
 virtio-fs-list <virtio-fs@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Liu Bo <bo.liu@linux.alibaba.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org, Vivek Goyal <vgoyal@redhat.com>
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



On 8/17/21 10:08 PM, Miklos Szeredi wrote:
> On Tue, 17 Aug 2021 at 15:22, JeffleXu <jefflexu@linux.alibaba.com> wrote:
>>
>>
>>
>> On 8/17/21 8:39 PM, Vivek Goyal wrote:
>>> On Tue, Aug 17, 2021 at 10:06:53AM +0200, Miklos Szeredi wrote:
>>>> On Tue, 17 Aug 2021 at 04:22, Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
>>>>>
>>>>> This patchset adds support of per-file DAX for virtiofs, which is
>>>>> inspired by Ira Weiny's work on ext4[1] and xfs[2].
>>>>
>>>> Can you please explain the background of this change in detail?
>>>>
>>>> Why would an admin want to enable DAX for a particular virtiofs file
>>>> and not for others?
>>>
>>> Initially I thought that they needed it because they are downloading
>>> files on the fly from server. So they don't want to enable dax on the file
>>> till file is completely downloaded.
>>
>> Right, it's our initial requirement.
>>
>>
>>> But later I realized that they should
>>> be able to block in FUSE_SETUPMAPPING call and make sure associated
>>> file section has been downloaded before returning and solve the problem.
>>> So that can't be the primary reason.
>>
>> Saying we want to access 4KB of one file inside guest, if it goes
>> through FUSE request routine, then the fuse daemon only need to download
>> this 4KB from remote server. But if it goes through DAX, then the fuse
>> daemon need to download the whole DAX window (e.g., 2MB) from remote
>> server, so called amplification. Maybe we could decrease the DAX window
>> size, but it's a trade off.
> 
> That could be achieved with a plain fuse filesystem on the host (which
> will get 4k READ requests for accesses to mapped area inside guest).
> Since this can be done selectively for files which are not yet
> downloaded, the extra layer wouldn't be a performance problem.

I'm not sure if I fully understand your idea. Then in this case, host
daemon only prepares 4KB while guest thinks that the whole DAX window
(e.g., 2MB) has been fully mapped. Then when guest really accesses the
remained part (2MB - 4KB), page fault is triggered, and now host daemon
is responsible for downloading the remained part?

> 
> Is there a reason why that wouldn't work?
> 
> Thanks,
> Miklos
> 

-- 
Thanks,
Jeffle
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
