Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 211E3403720
	for <lists.virtualization@lfdr.de>; Wed,  8 Sep 2021 11:42:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DB59401AF;
	Wed,  8 Sep 2021 09:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RfDpQJHG_YUo; Wed,  8 Sep 2021 09:42:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 189D840177;
	Wed,  8 Sep 2021 09:42:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 838D9C001D;
	Wed,  8 Sep 2021 09:42:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41BEEC000D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Sep 2021 09:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36B9482CFA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Sep 2021 09:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mRgKwELrCyHf
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Sep 2021 09:42:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A11082CE4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Sep 2021 09:42:02 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UngJFte_1631094117; 
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UngJFte_1631094117) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 08 Sep 2021 17:41:58 +0800
Subject: Re: [PATCH 1/2] fuse: disable atomic_o_trunc if no_open is enabled
To: Miklos Szeredi <miklos@szeredi.hu>
References: <20210812054618.26057-1-jefflexu@linux.alibaba.com>
 <20210812054618.26057-2-jefflexu@linux.alibaba.com>
 <CAJfpegs3QGVNa4CXt0Hayr=G50cQb1TWowRDuVf0pZv6FYV3kw@mail.gmail.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <3afa0ef8-8f69-c34a-9302-c1ea927668f6@linux.alibaba.com>
Date: Wed, 8 Sep 2021 17:41:57 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAJfpegs3QGVNa4CXt0Hayr=G50cQb1TWowRDuVf0pZv6FYV3kw@mail.gmail.com>
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



On 9/7/21 4:34 PM, Miklos Szeredi wrote:
> On Thu, 12 Aug 2021 at 07:46, Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
>>
>> From: Liu Bo <bo.liu@linux.alibaba.com>
>>
>> When 'no_open' is used by virtiofsd, guest kernel won't send OPEN request
>> any more.  However, with atomic_o_trunc, SETATTR request is also omitted in
>> OPEN(O_TRUNC) so that the backend file is not truncated.  With a following
>> GETATTR, inode size on guest side is updated to be same with that on host
>> side, the end result is that O_TRUNC semantic is broken.
>>
>> This disables atomic_o_trunc as well if with no_open.
> 
> I don't quite get it why one would want to enable atomic_o_trunc with
> no_open in the first place?

Oops..We didn't realize that it could also be worked around by fuse
daemon side. Please ignore this.

-- 
Thanks,
Jeffle
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
