Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E1C3A9B87
	for <lists.virtualization@lfdr.de>; Wed, 16 Jun 2021 15:07:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6418240492;
	Wed, 16 Jun 2021 13:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_DrxjnjBAjb; Wed, 16 Jun 2021 13:07:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 312294047D;
	Wed, 16 Jun 2021 13:07:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B12E2C000B;
	Wed, 16 Jun 2021 13:07:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A07B0C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 13:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83B0583506
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 13:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dBiiLQu-lT5h
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 13:06:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCDBC834D5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 13:06:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A880C61166;
 Wed, 16 Jun 2021 13:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623848817;
 bh=l3BVCUTicXiNitfu26Uk7GtYcqn8uOw7hik+5CCmvhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DKdUNdduS++XEpc7PJqJX2aFVa6EIEVqQeGNKi15vCvZwTMCneifVqOvyMRTNHWWr
 Zf+VxwATaut+GC8lSV94tAx0U8zTg16nkIBd5CNL1HxoUc6e0UvfsdUWy+gLoGQ9y3
 fHcdn/YSuYLHNwJMhO0KjlY62eptk6e5/dQpwcpURcdO84Le0Iwb/hgACEznSGgOuk
 tFl/46MKQEW+L/2II2sRdIMn5cYDscCeG0lOIKuC86bRoSWm88VSxU+EvMxpE99sl5
 N/p8c6niqh8Nk8xF27xToAoWQR/caRJxmIqcYot/NEAb5PTaprAQ5x9+dCrWjzkhDs
 GZSAdbq0/Gg4A==
Date: Wed, 16 Jun 2021 16:06:52 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Subject: Re: [PATCH] vhost: add vhost_test to Kconfig & Makefile
Message-ID: <YMn3bGIhrMEzguP7@unreal>
References: <20210616120734.1050-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616120734.1050-1-caihuoqing@baidu.com>
Cc: virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 mst@redhat.com
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

On Wed, Jun 16, 2021 at 08:07:34PM +0800, Cai Huoqing wrote:
> When running vhost test, make it easier to config
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/vhost/Kconfig  | 12 ++++++++++++
>  drivers/vhost/Makefile |  3 +++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index 587fbae06182..c93c12843a6f 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -61,6 +61,18 @@ config VHOST_VSOCK
>         To compile this driver as a module, choose M here: the module will be called
>         vhost_vsock.
>  
> +config VHOST_TEST
> +       tristate "vhost virtio-test driver"
> +       depends on EVENTFD
> +       select VHOST
> +       default n

You don't need to write explicitly "default n". "No" is already default.

Thanks

> +       help
> +       This kernel module can be loaded in the host kernel to test vhost function
> +       with tools/virtio-test.
> +
> +       To compile this driver as a module, choose M here: the module will be called
> +       vhost_test.
> +
>  config VHOST_VDPA
>         tristate "Vhost driver for vDPA-based backend"
>         depends on EVENTFD
> diff --git a/drivers/vhost/Makefile b/drivers/vhost/Makefile
> index f3e1897cce85..cf31c1f2652d 100644
> --- a/drivers/vhost/Makefile
> +++ b/drivers/vhost/Makefile
> @@ -8,6 +8,9 @@ vhost_scsi-y := scsi.o
>  obj-$(CONFIG_VHOST_VSOCK) += vhost_vsock.o
>  vhost_vsock-y := vsock.o
>  
> +obj-$(CONFIG_VHOST_TEST) += vhost_test.o
> +vhost_test-y := test.o
> +
>  obj-$(CONFIG_VHOST_RING) += vringh.o
>  
>  obj-$(CONFIG_VHOST_VDPA) += vhost_vdpa.o
> -- 
> 2.22.0
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
