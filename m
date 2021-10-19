Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E43C3433486
	for <lists.virtualization@lfdr.de>; Tue, 19 Oct 2021 13:16:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C36B40765;
	Tue, 19 Oct 2021 11:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMf7FDUwP1T0; Tue, 19 Oct 2021 11:16:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4B35040762;
	Tue, 19 Oct 2021 11:16:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAB08C0022;
	Tue, 19 Oct 2021 11:16:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F54FC000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 11:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C3B1832D4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 11:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IhGW7zFD2KKL
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 11:16:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C90283342
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 11:16:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 790AF6128B;
 Tue, 19 Oct 2021 11:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634642211;
 bh=zowoZA2DNh4UwkN2v6Xd3q8lGJcDY+Iha2h2tBForeA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yj6I2acSnV7xWPZ/fC3LkxRxWyygbqXfz1qRVSydcPPlMI9fO/W8abjJAuGJIjBMz
 wQNHWiV28UR+80KR3//XNGg5nj2AyR8gLF4xr69/BPb+e/JaGrQdtXSVZUFDAzzLbb
 gzgAIWwBgxIPcuP/6xkA5EYLifKBaT/enpUvNGvI=
Date: Tue, 19 Oct 2021 13:16:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <YW6pHkXOPvtidtwS@kroah.com>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
 <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
Cc: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 wsa@kernel.org, kernel@axis.com, linux-i2c@vger.kernel.org
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

On Tue, Oct 19, 2021 at 03:12:03PM +0530, Viresh Kumar wrote:
> On 19-10-21, 11:36, Greg KH wrote:
> > What is the "other side" here?  Is it something that you trust or not?
> 
> Other side can be a remote processor (for remoteproc over virtio or
> something similar), or traditionally it can be host OS or host
> firmware providing virtualisation to a Guest running Linux (this
> driver). Or something else..
> 
> I would incline towards "we trust the other side" here.

That's in contradition with what other people seem to think the virtio
drivers are for, see this crazy thread for details about that:
	https://lore.kernel.org/all/20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com/

You can "trust" the hardware, but also handle things when hardware is
broken, which is most often the case in the real world.

So why is having a timeout a problem here?  If you have an overloaded
system, you want things to time out so that you can start to recover.

> > Usually we trust the hardware, but if you do not trust the hardware,
> > then yes, you need to have a timeout here.
> 
> The other side is the software that has access to the _Real_ hardware,
> and so we should trust it. So we can have a actually have a completion
> without timeout here, interesting.

And if that hardware stops working?  Timeouts are good to have, why not
just bump it up a bit if you are running into it in a real-world
situation?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
