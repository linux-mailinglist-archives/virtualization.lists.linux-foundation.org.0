Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0949A3823C2
	for <lists.virtualization@lfdr.de>; Mon, 17 May 2021 07:46:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C97540160;
	Mon, 17 May 2021 05:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id la7v3X1ZZS8M; Mon, 17 May 2021 05:46:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 641B440103;
	Mon, 17 May 2021 05:46:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04F37C0001;
	Mon, 17 May 2021 05:46:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94879C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 May 2021 05:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 739C883B02
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 May 2021 05:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B57PUPOqV3HB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 May 2021 05:46:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8B6B83AD6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 May 2021 05:46:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21CCF6108D;
 Mon, 17 May 2021 05:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621230378;
 bh=UssYIYbkL3qu2UXuoT41PmlhMhpzovvV5hj4VqQqw6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vna6C9/eXr0rr9wnsxamGgP6HY53+rapHkKqAnJK3sSoY631+u0j3cZ/Xjleivf8U
 lDAxln7hHa19MzfzYmHSkNzIK1K5pI/K/AyFyyommMzJ/FNr5UiqNJi1b78GTzBNCc
 OvydG874aqfpppXC7D0nP3i8lBieHyXygMg/IfKE=
Date: Mon, 17 May 2021 07:46:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: Re: [PATCH] treewide: Remove leading spaces in Kconfig files
Message-ID: <YKIDJIfuufBrTQ4f@kroah.com>
References: <20210516132209.59229-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210516132209.59229-1-juergh@canonical.com>
Cc: linux-fbdev@vger.kernel.org, mst@redhat.com, tony@atomide.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 zbr@ioremap.net, lee.jones@linaro.org, daniel.thompson@linaro.org,
 linux-scsi@vger.kernel.org, aaro.koskinen@iki.fi,
 Juerg Haefliger <juergh@canonical.com>, kadlec@netfilter.org,
 lvs-devel@vger.kernel.org, ja@ssi.bg, coreteam@netfilter.org, kuba@kernel.org,
 pablo@netfilter.org, jejb@linux.ibm.com, horms@verge.net.au,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 martin.petersen@oracle.com, jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 fw@strlen.de, linux-kernel@vger.kernel.org, linux@prisktech.co.nz,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, davem@davemloft.net
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

On Sun, May 16, 2021 at 03:22:09PM +0200, Juerg Haefliger wrote:
> There are a few occurences of leading spaces before tabs in a couple of
> Kconfig files. Remove them by running the following command:
> 
>   $ find . -name 'Kconfig*' | xargs sed -r -i 's/^[ ]+\t/\t/'
> 
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>
> ---
>  arch/arm/mach-omap1/Kconfig     | 12 ++++++------
>  arch/arm/mach-vt8500/Kconfig    |  6 +++---
>  arch/arm/mm/Kconfig             | 10 +++++-----
>  drivers/char/hw_random/Kconfig  |  8 ++++----
>  drivers/net/usb/Kconfig         | 10 +++++-----
>  drivers/net/wan/Kconfig         |  4 ++--
>  drivers/scsi/Kconfig            |  2 +-
>  drivers/uio/Kconfig             |  2 +-
>  drivers/video/backlight/Kconfig | 10 +++++-----
>  drivers/virtio/Kconfig          |  2 +-
>  drivers/w1/masters/Kconfig      |  6 +++---
>  fs/proc/Kconfig                 |  4 ++--
>  init/Kconfig                    |  2 +-
>  net/netfilter/Kconfig           |  2 +-
>  net/netfilter/ipvs/Kconfig      |  2 +-
>  15 files changed, 41 insertions(+), 41 deletions(-)

Please break this up into one patch per subsystem and resend to the
proper maintainers that way.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
