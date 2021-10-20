Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 313AF4344B9
	for <lists.virtualization@lfdr.de>; Wed, 20 Oct 2021 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A90640264;
	Wed, 20 Oct 2021 05:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mFq6pwf4Rgb; Wed, 20 Oct 2021 05:36:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 51E74401EE;
	Wed, 20 Oct 2021 05:36:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4BF0C000D;
	Wed, 20 Oct 2021 05:36:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DDB0C000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 05:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB8F140630
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 05:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOFqb4syvVko
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 05:36:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 681EC40621
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 05:36:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF9B2610F8;
 Wed, 20 Oct 2021 05:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634708187;
 bh=6fVHD7xrVJvgYXLp6J/4BH55nxeDujiQGTN1Ry4XUDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ePzr6Al1vjz8thy9piKGPcI0KFuG/z8LdqYEC0ObXBBzvm9aenbRTkV+RYzrN9WSA
 Nt5PsSeC9vcKCXMqKiJXgNgoIL6YusGRjaQSf4gwkKOrNsbcvBl+T8/HWRwV5qv4Nj
 d5X0GUHgdSRnz6cqz5AVXRLS2IVWMPXToqonmR9I=
Date: Wed, 20 Oct 2021 07:36:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jie Deng <jie.deng@intel.com>
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <YW+q1yQ8MuhHINAs@kroah.com>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
 <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
 <YW6pHkXOPvtidtwS@kroah.com>
 <20211019143748.wrpqopj2hmpvblh4@vireshk-i7>
 <YW8LFTcBuN1bB3PD@ninjato>
 <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Wolfram Sang <wsa@kernel.org>,
 kernel@axis.com, linux-i2c@vger.kernel.org
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

On Wed, Oct 20, 2021 at 12:20:13PM +0800, Jie Deng wrote:
> 
> On 2021/10/20 2:14, Wolfram Sang wrote:
> > > I think it is set to HZ currently, though I haven't tried big
> > > transfers but I still get into some issues with Qemu based stuff.
> > > Maybe we can bump it up to few seconds :)
> > If you use adapter->timeout, this can even be set at runtime using a
> > ioctl. So, it can adapt to use cases. Of course, the driver should
> > initialize it to a sane default if the automatic default (HZ) is not
> > suitable.
> 
> 
> I think a big value may solve most cases. but the driver never know how big
> is enough by static configuration.
> 
> Can we make this value to be configurable, just let the other side provide
> this value ?

If an ioctl can change it, that would mean it is configurable, right?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
