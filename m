Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 889993EED14
	for <lists.virtualization@lfdr.de>; Tue, 17 Aug 2021 15:09:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE7B840247;
	Tue, 17 Aug 2021 13:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXmxw47fbg0o; Tue, 17 Aug 2021 13:08:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BFB8340A1C;
	Tue, 17 Aug 2021 13:08:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C075C0022;
	Tue, 17 Aug 2021 13:08:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DC67C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 13:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5550D40482
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 13:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWQoVOZ2VEWY
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 13:08:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9FDC40394
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 13:08:49 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R271e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=7; SR=0; TI=SMTPD_---0UjQ4ccR_1629205715; 
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UjQ4ccR_1629205715) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 17 Aug 2021 21:08:36 +0800
Subject: Re: [Virtio-fs] [PATCH v4 0/8] fuse,virtiofs: support per-file DAX
To: Miklos Szeredi <miklos@szeredi.hu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210817022220.17574-1-jefflexu@linux.alibaba.com>
 <CAJfpeguw1hMOaxpDmjmijhf=-JEW95aEjxfVo_=D_LyWx8LDgw@mail.gmail.com>
 <YRuCHvhICtTzMK04@work-vm>
 <CAJfpegvM+S5Xru3Yfc88C64mecvco=f99y-TajQBDfkLD-S8zQ@mail.gmail.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <0896b1f6-c8c4-6071-c05b-a333c6cccacd@linux.alibaba.com>
Date: Tue, 17 Aug 2021 21:08:35 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJfpegvM+S5Xru3Yfc88C64mecvco=f99y-TajQBDfkLD-S8zQ@mail.gmail.com>
Content-Language: en-US
Cc: virtio-fs-list <virtio-fs@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-fsdevel@vger.kernel.org,
 Vivek Goyal <vgoyal@redhat.com>, virtualization@lists.linux-foundation.org
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



On 8/17/21 6:09 PM, Miklos Szeredi wrote:
> On Tue, 17 Aug 2021 at 11:32, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
>>
>> * Miklos Szeredi (miklos@szeredi.hu) wrote:
>>> On Tue, 17 Aug 2021 at 04:22, Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
>>>>
>>>> This patchset adds support of per-file DAX for virtiofs, which is
>>>> inspired by Ira Weiny's work on ext4[1] and xfs[2].
>>>
>>> Can you please explain the background of this change in detail?
>>>
>>> Why would an admin want to enable DAX for a particular virtiofs file
>>> and not for others?
>>
>> Where we're contending on virtiofs dax cache size it makes a lot of
>> sense; it's quite expensive for us to map something into the cache
>> (especially if we push something else out), so selectively DAXing files
>> that are expected to be hot could help reduce cache churn.
> 
> If this is a performance issue, it should be fixed in a way that
> doesn't require hand tuning like you suggest, I think.
> 
> I'm not sure what the  ext4/xfs case for per-file DAX is.  Maybe that
> can help understand the virtiofs case as well.
> 

Some hints why ext4/xfs support per-file DAX can be found [1] and [2].

"Boaz Harrosh wondered why someone might want to turn DAX off for a
persistent memory device. Hellwig said that the performance "could
suck"; Williams noted that the page cache could be useful for some
applications as well. Jan Kara pointed out that reads from persistent
memory are close to DRAM speed, but that writes are not; the page cache
could be helpful for frequent writes. Applications need to change to
fully take advantage of DAX, Williams said; part of the promise of
adding a flag is that users can do DAX on smaller granularities than a
full filesystem."

In summary, page cache is preferable in some cases, and thus more fine
grained way of DAX control is needed.


As for virtiofs, Dr. David Alan Gilbert has mentioned that various files
may compete for limited DAX window resource.

Besides, supporting DAX for small files can be expensive. Small files
can consume DAX window resource rapidly, and if small files are accessed
only once, the cost of mmap/munmap on host can not be ignored.


[1]
https://lore.kernel.org/lkml/20200428002142.404144-1-ira.weiny@intel.com/
[2] https://lwn.net/Articles/787973/

-- 
Thanks,
Jeffle
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
