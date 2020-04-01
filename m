Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C48019AF64
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 18:08:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 395DE852DB;
	Wed,  1 Apr 2020 16:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unBEtnBOFc3q; Wed,  1 Apr 2020 16:08:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C0512869E2;
	Wed,  1 Apr 2020 16:08:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C2ABC1AE2;
	Wed,  1 Apr 2020 16:08:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A4E3C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 16:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 585FE854E7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 16:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fH7lsCbLg04E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 16:08:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8923784794
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585757292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hOVDtyF1AE9D3PmM9Cg9VpMJ2l3FcGqxQ8lNxLr5dIs=;
 b=iuDdgL2xit7zWebGuUFkGDfUxrz48YKwRipi3Pr0zEMivtXE+EF7p4Eq8pdkawJs+34Roc
 zsj+088Urgw7IgQkBggGkHn50TWBTquZwIH7pUw5HnkeAKjx8YbC3Z0VWj4USpu+2St9Nc
 TY7IeR8WUAWX5O6G0kaspY6xL81AmRc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-T_sNoc3lN3eJy4YSvr_uUg-1; Wed, 01 Apr 2020 12:08:08 -0400
X-MC-Unique: T_sNoc3lN3eJy4YSvr_uUg-1
Received: by mail-wr1-f72.google.com with SMTP id m15so69472wrb.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Apr 2020 09:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hOVDtyF1AE9D3PmM9Cg9VpMJ2l3FcGqxQ8lNxLr5dIs=;
 b=KSf1cL9G1IJPwAPSanhskUrGkhSflIHZIN4D2QmwZhS84BAHm0VcEyUm65dHDmCGcO
 WyDlqUpilfPaU6bkHAZgtQYLnlt7Y8kkpIzVsydVcEk5Si9FAWgqXfwWSq/i56WiYWTd
 tO042Yb1s94OxrsoskJvoQpCMHVIQ6LsamJGZsKFxEu76jXSbLaEDkoQCbnwSvupdPkq
 ipIxkNEk8tVijPjQTQAIjtR64ipkMpW3UTNBvTWhGEJBtPDjHc/CP35YAnj33HCTY3xg
 VPDWjOYMZF54zb9RPE5RiG4OgY2AJWcfyqr9HtYpXhsgDwhr7QSWRxHUdkA1C3wt8la2
 8Y1A==
X-Gm-Message-State: ANhLgQ3rtSP8oOd9l5zHszvAgVRjgy15vSzyKf3cYSh8dz5AptMXp+SZ
 +InLSeCqLxoKk0ucvoBvBh7VH5k/4Mc8NiXANWiVcNMUZzuY38QY8Nv6k0xssfy4rP2GEm05LnQ
 vmkBURCf2zpI92h36+q/EE7EKmjx9E883haxKz1dozg==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr27653002wrv.95.1585757287415; 
 Wed, 01 Apr 2020 09:08:07 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu/0IpuTVbC9txesB4+4J8VJA6MAuurHQYjHbAmRAHqQl2A8Juskzx4t/Kit00vNhGBgfiZ4Q==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr27652949wrv.95.1585757287093; 
 Wed, 01 Apr 2020 09:08:07 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id n6sm3579451wrp.30.2020.04.01.09.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 09:08:06 -0700 (PDT)
Date: Wed, 1 Apr 2020 12:08:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
Message-ID: <20200401120643-mutt-send-email-mst@kernel.org>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <20200401092004-mutt-send-email-mst@kernel.org>
 <6b4d169a-9962-6014-5423-1507059343e9@redhat.com>
 <20200401100954-mutt-send-email-mst@kernel.org>
 <3dd3b7e7-e3d9-dba4-00fc-868081f95ab7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3dd3b7e7-e3d9-dba4-00fc-868081f95ab7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 parav@mellanox.com, vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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

On Wed, Apr 01, 2020 at 10:29:32PM +0800, Jason Wang wrote:
> >From 9b3a5d23b8bf6b0a11e65e688335d782f8e6aa5c Mon Sep 17 00:00:00 2001
> From: Jason Wang <jasowang@redhat.com>
> Date: Wed, 1 Apr 2020 22:17:27 +0800
> Subject: [PATCH] vhost: let CONFIG_VHOST to be selected by drivers
> 
> The defconfig on some archs enable vhost_net or vhost_vsock by
> default. So instead of adding CONFIG_VHOST=m to all of those files,
> simply letting CONFIG_VHOST to be selected by all of the vhost
> drivers. This fixes the build on the archs with CONFIG_VHOST_NET=m in
> their defconfig.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/vhost/Kconfig | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index 2523a1d4290a..362b832f5338 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -11,19 +11,23 @@ config VHOST_RING
>  	  This option is selected by any driver which needs to access
>  	  the host side of a virtio ring.
>  
> -menuconfig VHOST
> -	tristate "Host kernel accelerator for virtio (VHOST)"
> -	depends on EVENTFD
> +config VHOST
> +	tristate
>  	select VHOST_IOTLB
>  	help
>  	  This option is selected by any driver which needs to access
>  	  the core of vhost.
>  
> -if VHOST
> +menuconfig VHOST_MENU
> +	bool "VHOST drivers"
> +	default y
> +
> +if VHOST_MENU
>  
>  config VHOST_NET
>  	tristate "Host kernel accelerator for virtio net"
>  	depends on NET && EVENTFD && (TUN || !TUN) && (TAP || !TAP)
> +	select VHOST
>  	---help---
>  	  This kernel module can be loaded in host kernel to accelerate
>  	  guest networking with virtio_net. Not to be confused with virtio_net
> @@ -35,6 +39,7 @@ config VHOST_NET
>  config VHOST_SCSI
>  	tristate "VHOST_SCSI TCM fabric driver"
>  	depends on TARGET_CORE && EVENTFD
> +	select VHOST
>  	default n
>  	---help---
>  	Say M here to enable the vhost_scsi TCM fabric module
> @@ -43,6 +48,7 @@ config VHOST_SCSI
>  config VHOST_VSOCK
>  	tristate "vhost virtio-vsock driver"
>  	depends on VSOCKETS && EVENTFD
> +	select VHOST
>  	select VIRTIO_VSOCKETS_COMMON
>  	default n
>  	---help---
> @@ -56,6 +62,7 @@ config VHOST_VSOCK
>  config VHOST_VDPA
>  	tristate "Vhost driver for vDPA-based backend"
>  	depends on EVENTFD
> +	select VHOST
>  	select VDPA
>  	help
>  	  This kernel module can be loaded in host kernel to accelerate

OK so I squashed this into the original buggy patch.
Could you please play with vhost branch of my tree on various
arches? If it looks ok to you let me know I'll push
this to next.


-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
