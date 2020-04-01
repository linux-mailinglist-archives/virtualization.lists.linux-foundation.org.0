Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0592A19ACB0
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 15:23:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9124686833;
	Wed,  1 Apr 2020 13:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cguVBV0lo0BH; Wed,  1 Apr 2020 13:23:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB85F8682F;
	Wed,  1 Apr 2020 13:23:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DC72C089F;
	Wed,  1 Apr 2020 13:23:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EE27C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 13:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 02A1C86D2B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 13:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Djt6RagdQ6Ts
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 13:23:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1AF8886A6F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585747388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hi0o+VWe9/l5oID1pIBS8BAdOnRzvBXeS2Ff7vUWBLM=;
 b=YsbH370jYOzsyC2MnNOdkvit3PivM5xWnwJI+M8o56YLX+r1qzvaZ6eNcstKsyz+nYJkVx
 5U5PozrbzaJLT40xzf4S1n6D2u5NIQTD89AzdDdl6y6+a38JiPeNAXK/ArSDkiQg5LCXxc
 UjmxGpxmMNL9iNJTI6MKU6T+HlEx5hI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118--eHX08BvMr-nGtPa8Pv0MA-1; Wed, 01 Apr 2020 09:23:03 -0400
X-MC-Unique: -eHX08BvMr-nGtPa8Pv0MA-1
Received: by mail-wr1-f69.google.com with SMTP id h95so9335600wrh.11
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Apr 2020 06:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hi0o+VWe9/l5oID1pIBS8BAdOnRzvBXeS2Ff7vUWBLM=;
 b=BxcVLD44U9jAK/FKbC0R9dvTz8CcOlo+15/aKJbmQhc7LW/MYL5JB0LFpedG4BgkrI
 2l/m8CeYyRzb1EBioR1yiOS2mk945a6rv7fW1dkuz/sahZW2O/zOyo9e0+kb992bIece
 83+R7vJkhj5W8W4plibtdT/0F1Nwcq0Amm0m/jaMBD34g8lfW/6scmlO2q5iAVBMcyT/
 +N1eKyIxWO9+hyVy4gkzZBHDocj/lIzrnykvlaBdO5aEuAvlEKH34wZ52zeXHaOEyfTn
 y0nPEhj/3BUCmmrLHoNEHmeOCjSuixPISwUODbpXIq/Y1Hq0rSEUYl/jpfvPIB1v7VXb
 +xyg==
X-Gm-Message-State: AGi0Pub3uxWun40wr3xSxkc2mdGfozTFahAcMgHAKiYMuSv7ya499xJc
 io+Pm14sBngat4RHCjL5MMFiO+PHz2e0tLrXjm8Yj5sKVdK4w5740VIYhzOfHFNQO/UkVYAk2nL
 oX6mbWHiOsMpn4vCqrr4B36aVj946/jAfB9Wf1yeJ/w==
X-Received: by 2002:a05:600c:2251:: with SMTP id
 a17mr4325114wmm.106.1585747382388; 
 Wed, 01 Apr 2020 06:23:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypJhB75sCXbwWEjkpMwVSQLEx4YoDlWEazTbH9fpWHve3UfYWpZM6zzG2sMK7lf6Dc3p4IaHJg==
X-Received: by 2002:a05:600c:2251:: with SMTP id
 a17mr4325075wmm.106.1585747382089; 
 Wed, 01 Apr 2020 06:23:02 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id c85sm2625867wmd.48.2020.04.01.06.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 06:22:58 -0700 (PDT)
Date: Wed, 1 Apr 2020 09:22:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
Message-ID: <20200401092004-mutt-send-email-mst@kernel.org>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200326140125.19794-2-jasowang@redhat.com>
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

On Thu, Mar 26, 2020 at 10:01:17PM +0800, Jason Wang wrote:
> Currently, CONFIG_VHOST depends on CONFIG_VIRTUALIZATION. But vhost is
> not necessarily for VM since it's a generic userspace and kernel
> communication protocol. Such dependency may prevent archs without
> virtualization support from using vhost.
> 
> To solve this, a dedicated vhost menu is created under drivers so
> CONIFG_VHOST can be decoupled out of CONFIG_VIRTUALIZATION.
> 
> While at it, also squash Kconfig.vringh into vhost Kconfig file. This
> avoids the trick of conditional inclusion from VOP or CAIF. Then it
> will be easier to introduce new vringh users and common dependency for
> both vringh and vhost.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Is this just so we can drop the dependency on CONFIG_VIRTUALIZATION?
If yes what happens if we drop this patch?
Given the impact it had I'd like to defer it till next release if
possible.


> ---
>  arch/arm/kvm/Kconfig         |  2 --
>  arch/arm64/kvm/Kconfig       |  2 --
>  arch/mips/kvm/Kconfig        |  2 --
>  arch/powerpc/kvm/Kconfig     |  2 --
>  arch/s390/kvm/Kconfig        |  4 ----
>  arch/x86/kvm/Kconfig         |  4 ----
>  drivers/Kconfig              |  2 ++
>  drivers/misc/mic/Kconfig     |  4 ----
>  drivers/net/caif/Kconfig     |  4 ----
>  drivers/vhost/Kconfig        | 23 ++++++++++++++---------
>  drivers/vhost/Kconfig.vringh |  6 ------
>  11 files changed, 16 insertions(+), 39 deletions(-)
>  delete mode 100644 drivers/vhost/Kconfig.vringh
> 
> diff --git a/arch/arm/kvm/Kconfig b/arch/arm/kvm/Kconfig
> index f591026347a5..be97393761bf 100644
> --- a/arch/arm/kvm/Kconfig
> +++ b/arch/arm/kvm/Kconfig
> @@ -54,6 +54,4 @@ config KVM_ARM_HOST
>  	---help---
>  	  Provides host support for ARM processors.
>  
> -source "drivers/vhost/Kconfig"
> -
>  endif # VIRTUALIZATION
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index a475c68cbfec..449386d76441 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -64,6 +64,4 @@ config KVM_ARM_PMU
>  config KVM_INDIRECT_VECTORS
>         def_bool KVM && (HARDEN_BRANCH_PREDICTOR || HARDEN_EL2_VECTORS)
>  
> -source "drivers/vhost/Kconfig"
> -
>  endif # VIRTUALIZATION
> diff --git a/arch/mips/kvm/Kconfig b/arch/mips/kvm/Kconfig
> index eac25aef21e0..b91d145aa2d5 100644
> --- a/arch/mips/kvm/Kconfig
> +++ b/arch/mips/kvm/Kconfig
> @@ -72,6 +72,4 @@ config KVM_MIPS_DEBUG_COP0_COUNTERS
>  
>  	  If unsure, say N.
>  
> -source "drivers/vhost/Kconfig"
> -
>  endif # VIRTUALIZATION
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index 711fca9bc6f0..12885eda324e 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -204,6 +204,4 @@ config KVM_XIVE
>  	default y
>  	depends on KVM_XICS && PPC_XIVE_NATIVE && KVM_BOOK3S_HV_POSSIBLE
>  
> -source "drivers/vhost/Kconfig"
> -
>  endif # VIRTUALIZATION
> diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
> index d3db3d7ed077..def3b60f1fe8 100644
> --- a/arch/s390/kvm/Kconfig
> +++ b/arch/s390/kvm/Kconfig
> @@ -55,8 +55,4 @@ config KVM_S390_UCONTROL
>  
>  	  If unsure, say N.
>  
> -# OK, it's a little counter-intuitive to do this, but it puts it neatly under
> -# the virtualization menu.
> -source "drivers/vhost/Kconfig"
> -
>  endif # VIRTUALIZATION
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 991019d5eee1..0dfe70e17af9 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -94,8 +94,4 @@ config KVM_MMU_AUDIT
>  	 This option adds a R/W kVM module parameter 'mmu_audit', which allows
>  	 auditing of KVM MMU events at runtime.
>  
> -# OK, it's a little counter-intuitive to do this, but it puts it neatly under
> -# the virtualization menu.
> -source "drivers/vhost/Kconfig"
> -
>  endif # VIRTUALIZATION
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 8befa53f43be..7a6d8b2b68b4 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -138,6 +138,8 @@ source "drivers/virt/Kconfig"
>  
>  source "drivers/virtio/Kconfig"
>  
> +source "drivers/vhost/Kconfig"
> +
>  source "drivers/hv/Kconfig"
>  
>  source "drivers/xen/Kconfig"
> diff --git a/drivers/misc/mic/Kconfig b/drivers/misc/mic/Kconfig
> index b6841ba6d922..8f201d019f5a 100644
> --- a/drivers/misc/mic/Kconfig
> +++ b/drivers/misc/mic/Kconfig
> @@ -133,8 +133,4 @@ config VOP
>  	  OS and tools for MIC to use with this driver are available from
>  	  <http://software.intel.com/en-us/mic-developer>.
>  
> -if VOP
> -source "drivers/vhost/Kconfig.vringh"
> -endif
> -
>  endmenu
> diff --git a/drivers/net/caif/Kconfig b/drivers/net/caif/Kconfig
> index e74e2bb61236..9db0570c5beb 100644
> --- a/drivers/net/caif/Kconfig
> +++ b/drivers/net/caif/Kconfig
> @@ -58,8 +58,4 @@ config CAIF_VIRTIO
>  	---help---
>  	  The CAIF driver for CAIF over Virtio.
>  
> -if CAIF_VIRTIO
> -source "drivers/vhost/Kconfig.vringh"
> -endif
> -
>  endif # CAIF_DRIVERS
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index 3d03ccbd1adc..4aef10a54cd1 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -1,8 +1,20 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +config VHOST_RING
> +	tristate
> +	help
> +	  This option is selected by any driver which needs to access
> +	  the host side of a virtio ring.
> +
> +menuconfig VHOST
> +	tristate "Host kernel accelerator for virtio (VHOST)"
> +	help
> +	  This option is selected by any driver which needs to access
> +	  the core of vhost.
> +if VHOST
> +

The description here is wrong, isn't it?
VHOST and VHOST_RING are no longer selected, right?


>  config VHOST_NET
>  	tristate "Host kernel accelerator for virtio net"
>  	depends on NET && EVENTFD && (TUN || !TUN) && (TAP || !TAP)
> -	select VHOST
>  	---help---
>  	  This kernel module can be loaded in host kernel to accelerate
>  	  guest networking with virtio_net. Not to be confused with virtio_net
> @@ -14,7 +26,6 @@ config VHOST_NET
>  config VHOST_SCSI
>  	tristate "VHOST_SCSI TCM fabric driver"
>  	depends on TARGET_CORE && EVENTFD
> -	select VHOST
>  	default n
>  	---help---
>  	Say M here to enable the vhost_scsi TCM fabric module
> @@ -24,7 +35,6 @@ config VHOST_VSOCK
>  	tristate "vhost virtio-vsock driver"
>  	depends on VSOCKETS && EVENTFD
>  	select VIRTIO_VSOCKETS_COMMON
> -	select VHOST
>  	default n
>  	---help---
>  	This kernel module can be loaded in the host kernel to provide AF_VSOCK
> @@ -34,12 +44,6 @@ config VHOST_VSOCK
>  	To compile this driver as a module, choose M here: the module will be called
>  	vhost_vsock.
>  
> -config VHOST
> -	tristate
> -	---help---
> -	  This option is selected by any driver which needs to access
> -	  the core of vhost.
> -
>  config VHOST_CROSS_ENDIAN_LEGACY
>  	bool "Cross-endian support for vhost"
>  	default n
> @@ -54,3 +58,4 @@ config VHOST_CROSS_ENDIAN_LEGACY
>  	  adds some overhead, it is disabled by default.
>  
>  	  If unsure, say "N".
> +endif
> diff --git a/drivers/vhost/Kconfig.vringh b/drivers/vhost/Kconfig.vringh
> deleted file mode 100644
> index c1fe36a9b8d4..000000000000
> --- a/drivers/vhost/Kconfig.vringh
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -config VHOST_RING
> -	tristate
> -	---help---
> -	  This option is selected by any driver which needs to access
> -	  the host side of a virtio ring.
> -- 
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
