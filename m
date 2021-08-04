Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B83DFB9C
	for <lists.virtualization@lfdr.de>; Wed,  4 Aug 2021 08:52:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 016AB4064C;
	Wed,  4 Aug 2021 06:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yp1eDRgF_OQA; Wed,  4 Aug 2021 06:52:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D42214066B;
	Wed,  4 Aug 2021 06:52:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23894C001F;
	Wed,  4 Aug 2021 06:52:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B6F1C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 06:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4329583C10
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 06:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfOWEMo4OEU1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 06:52:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72FC683C0B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 06:52:01 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R571e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UhwYqW9_1628059917; 
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UhwYqW9_1628059917) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 04 Aug 2021 14:51:58 +0800
Subject: Re: [PATCH v2 0/4] virtiofs,fuse: support per-file DAX
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210716104753.74377-1-jefflexu@linux.alibaba.com>
 <YPXu3BefIi7Ts48I@redhat.com>
 <031efb1d-7c0d-35fb-c147-dcc3b6cac0ef@linux.alibaba.com>
 <YPchgf665bwUMKWU@redhat.com>
 <38e9da34-cc2b-f496-7ebb-18db8da1aa01@linux.alibaba.com>
 <YPgXuacFfJ/JVRjo@redhat.com> <YPgyalU0avl9KI/U@redhat.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <f16e97cd-6e64-2c2c-080d-f70a5bf4a390@linux.alibaba.com>
Date: Wed, 4 Aug 2021 14:51:57 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPgyalU0avl9KI/U@redhat.com>
Content-Language: en-US
Cc: miklos@szeredi.hu, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtualization@lists.linux-foundation.org, joseph.qi@linux.alibaba.com,
 bo.liu@linux.alibaba.com, stefanha@redhat.com, linux-fsdevel@vger.kernel.org
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



On 7/21/21 10:42 PM, Vivek Goyal wrote:
> On Wed, Jul 21, 2021 at 08:48:57AM -0400, Vivek Goyal wrote:
> [..]
>>>> So is "dax=inode" enough for your needs? What's your requirement,
>>>> can you give little bit of more details.
>>>
>>> In our use case, the backend fs is something like SquashFS on host. The
>>> content of the file on host is downloaded *as needed*. When the file is
>>> not completely ready (completely downloaded), the guest will follow the
>>> normal IO routine, i.e., by FUSE_READ/FUSE_WRITE request. While the file
>>> is completely ready, per-file DAX is enabled for this file. IOW the FUSE
>>> server need to dynamically decide if per-file DAX shall be enabled,
>>> depending on if the file is completely downloaded.
>>
>> So you don't want to enable DAX yet because guest might fault on
>> a section of file which has not been downloaded yet?
>>
>> I am wondering if somehow user fault handling can help with this.
>> If we could handle faults for this file in user space, then you
>> should be able to download that particular page[s] and resolve
>> the fault?
> 
> Stefan mentioned that can't we block when fuse mmap request comes
> in and download corresponding section of file. Or do whatever you
> are doing in FUSE_READ. 
> 
> IOW, even if you enable dax in your use case on all files,
> FUSE_SETUPMAPPING request will give you control to make sure 
> file section being mmaped has been downloaded.
> 

Sorry for the late reply. I missed this mail as it is classified into
the mailing list folder.

The idea you mentioned may works. Anyway, the implementation details of
the FUSE server is not strongly binding to the FUSE protocol changes in
kernel. The protocol only requires that FUSE client shall be able to
store FS_DAX_FL attr persistently in *some way*. The changes in kernel
shall be general, no matter whether the FUSE server is FS_DAX_FL attr
based or something else.


-- 
Thanks,
Jeffle
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
