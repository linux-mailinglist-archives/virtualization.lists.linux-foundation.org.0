Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B364F3D1DF9
	for <lists.virtualization@lfdr.de>; Thu, 22 Jul 2021 08:06:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D03882C8E;
	Thu, 22 Jul 2021 06:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PPIGo-OS40XW; Thu, 22 Jul 2021 06:06:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E755582C98;
	Thu, 22 Jul 2021 06:06:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 712F5C000E;
	Thu, 22 Jul 2021 06:06:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9DD4C000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jul 2021 06:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA0F682C8E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jul 2021 06:06:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsD1hIlNhaPq
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jul 2021 06:06:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED0D682C7D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jul 2021 06:06:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB3AF6120C;
 Thu, 22 Jul 2021 06:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626934001;
 bh=p/2Uc5VBVsF31pzvmQeIG0ihbNJEza0BqK/3Fxmnvgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RKmYbK8pUIX0h9+BRZAG4KNlffU0luYQLtgeTrDMnOHoi2hw3f007IKGescfM/T12
 3vKvJFOcJYlAW0LZ2OMaysmQ0nnyqSsWT51GEXzmR0kpUK3c2Z7GNpRfHT/p6Gj/ks
 CgMYSUQSeKtpEAV7Q0r4m1voLhLzGWbqL+tls0OM=
Date: Thu, 22 Jul 2021 08:06:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YPkK7RlufYj1b+2f@kroah.com>
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
 <20210722051433.3f2ix75wbi5pphp2@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722051433.3f2ix75wbi5pphp2@vireshk-i7>
Cc: arnd@arndb.de, mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, wsa@kernel.org,
 wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
 stefanha@redhat.com, shuo.a.liu@intel.com, andriy.shevchenko@linux.intel.com,
 conghui.chen@intel.com, yu1.wang@intel.com
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

On Thu, Jul 22, 2021 at 10:44:33AM +0530, Viresh Kumar wrote:
> On 09-07-21, 10:25, Jie Deng wrote:
> > Add an I2C bus driver for virtio para-virtualization.
> > 
> > The controller can be emulated by the backend driver in
> > any device model software by following the virtio protocol.
> > 
> > The device specification can be found on
> > https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
> > 
> > By following the specification, people may implement different
> > backend drivers to emulate different controllers according to
> > their needs.
> > 
> > Co-developed-by: Conghui Chen <conghui.chen@intel.com>
> > Signed-off-by: Conghui Chen <conghui.chen@intel.com>
> > Signed-off-by: Jie Deng <jie.deng@intel.com>
> > ---
> > Changes v13 -> v14
> > 	- Put the headers in virtio_i2c.h in alphabetical order.
> > 	- Dropped I2C_FUNC_SMBUS_QUICK support.
> > 	- Dropped few unnecessary variables and checks.
> > 	- Use "num" everywhere instead of num or nr, to be consistent.
> > 	- Added few comments which make the design more clear. 
> 
> Wolfram,
> 
> Is it still possible to queue this for 5.14 ?

No new features are allowed for 5.14, you know this.  It's but fixes
only now.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
