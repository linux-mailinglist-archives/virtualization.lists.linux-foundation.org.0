Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A89388368
	for <lists.virtualization@lfdr.de>; Wed, 19 May 2021 02:04:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B74240640;
	Wed, 19 May 2021 00:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eW5jKlrj-NyM; Wed, 19 May 2021 00:04:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4E26405F9;
	Wed, 19 May 2021 00:04:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CF87C001C;
	Wed, 19 May 2021 00:04:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A246C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 00:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F019405DF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 00:04:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4HuBFvFdxcZs
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 00:04:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5239405D5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 00:04:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B5096135D;
 Wed, 19 May 2021 00:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621382686;
 bh=fDRMp6la+ZcO5o042pAO9F4TsB3TBtyXZEm5oCc5P38=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bvqEZnImrNrt7AR9pV3HbJHdRQsLGs6+rH6LJTWkf5DaLd0DaX1l5uEZJPHve1jc1
 1h8wF5O5OgHG4WZpNi+41Tg5skdzyFIBm6xoYHfbYtRc1RZih+WCgWlc6AiGQI9oQT
 KqR4ihgH/nGqbSM0IFGIvrEJGBfZrnckNX6I5BVKx3371+I4iK7pozq8Sd3OLTi8Gk
 gzye1FR3mDmlQcV2UTRPMHWaGhT07WNwNv9MbN9b/FG5YxmHS2hwWBOg/7+Z628p3e
 GtIORMGaG9WQRiGHDq8PQFHM65YTNf3gau6fAJtO86/3leP/YEq9baAH9ibdj+fbm+
 dD5GIv4WQqt2g==
Date: Tue, 18 May 2021 20:04:45 -0400
From: Sasha Levin <sashal@kernel.org>
To: Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH 5.4 042/111] virtio_net: Do not pull payload in skb->head
Message-ID: <YKRWHYiN1zXWHrfj@sashalap>
References: <20210412084004.200986670@linuxfoundation.org>
 <20210412084005.653952525@linuxfoundation.org>
 <20210412051230-mutt-send-email-mst@kernel.org>
 <CANn89iJ+5qFw+sPmxBqzxd6rp=3fnc8xkbup7SWWa_LxyhUUrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89iJ+5qFw+sPmxBqzxd6rp=3fnc8xkbup7SWWa_LxyhUUrg@mail.gmail.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>
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

On Tue, May 18, 2021 at 09:35:26PM +0200, Eric Dumazet wrote:
>On Mon, Apr 12, 2021 at 11:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>> Note that an issue related to this patch was recently reported.
>> It's quite possible that the root cause is a bug elsewhere
>> in the kernel, but it probably makes sense to defer the backport
>> until we know more ...
>
>I think the patch should be backported now, all issues have been sorted out ?

This is just 38ec4944b593 ("gro: ensure frag0 meets IP header
alignment"), right? I can queue both for the next round of releases.

-- 
Thanks,
Sasha
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
