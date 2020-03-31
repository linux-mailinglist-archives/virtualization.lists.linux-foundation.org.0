Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 96241199FD8
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 22:15:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2E1E387EB5;
	Tue, 31 Mar 2020 20:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rANEajnBZ347; Tue, 31 Mar 2020 20:15:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 63CF587EB0;
	Tue, 31 Mar 2020 20:15:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4260BC07FF;
	Tue, 31 Mar 2020 20:15:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E02CC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 20:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 64EE62535C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 20:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDs6BPN5Lw+Z
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 20:15:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 522D121FA8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 20:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=YNxUumd62CdDUyZgJxr+W4r4Uf2toNQYfW9j9GWEFxc=; b=ERSHpwaLLKeBcZ17mwpqlvkeA2
 oEbEIEhDhmdURuc4JHd1tqx0G6rv2sg9zEF81GRIeN7k2ZfC40iHm/HiwTH8R3ov65HHSQ39VeiHi
 8JkS4PiO9XsTGLLoHtPHzj3ixuWkXeiquo6p7iTNUYBEmddsQD0ctVxL8mbdPswowl7Ww+svmrMuS
 +DWYjYv1AfAx4XDoN0x7Vej3x9LGUFRGjksg4dg370axnLCBuipsukvCSR7ASgyItL2KMBrA3EYzu
 fOA+rqbJAAi0zPpVPd6qLabsWHOjOlFX8WhsNvztTkZmpquOQ1G30DhXP/OfyOdEmt5ohh3SK5WdY
 ytlrG1dw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJNIU-00058J-69; Tue, 31 Mar 2020 20:15:42 +0000
Subject: Re: [PATCH] vdpa: move to drivers/vdpa
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200331191825.249436-1-mst@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4b7c3c44-4834-85e2-91c0-0dbb3aa02a80@infradead.org>
Date: Tue, 31 Mar 2020 13:15:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331191825.249436-1-mst@redhat.com>
Content-Language: en-US
Cc: virtualization@lists.linux-foundation.org
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

On 3/31/20 12:19 PM, Michael S. Tsirkin wrote:
> We have both vhost and virtio drivers that depend on vdpa.
> It's easier to locate it at a top level directory otherwise
> we run into issues e.g. if vhost is built-in but virtio
> is modular.  Let's just move it up a level.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Randy I'd say the issue you are reporting (vhost=y, virtio=m)
> is esoteric enough not to require a rebase for this.
> So I'd just apply this on top.
> Do you agree?

Sure, looks fine from just reading it.
I haven't had a chance to test it yet.

Thanks.

>  MAINTAINERS                                   | 1 +
>  drivers/Kconfig                               | 2 ++
>  drivers/Makefile                              | 1 +
>  drivers/{virtio => }/vdpa/Kconfig             | 0
>  drivers/{virtio => }/vdpa/Makefile            | 0
>  drivers/{virtio => }/vdpa/ifcvf/Makefile      | 0
>  drivers/{virtio => }/vdpa/ifcvf/ifcvf_base.c  | 0
>  drivers/{virtio => }/vdpa/ifcvf/ifcvf_base.h  | 0
>  drivers/{virtio => }/vdpa/ifcvf/ifcvf_main.c  | 0
>  drivers/{virtio => }/vdpa/vdpa.c              | 0
>  drivers/{virtio => }/vdpa/vdpa_sim/Makefile   | 0
>  drivers/{virtio => }/vdpa/vdpa_sim/vdpa_sim.c | 0
>  drivers/virtio/Kconfig                        | 2 --
>  13 files changed, 4 insertions(+), 2 deletions(-)
>  rename drivers/{virtio => }/vdpa/Kconfig (100%)
>  rename drivers/{virtio => }/vdpa/Makefile (100%)
>  rename drivers/{virtio => }/vdpa/ifcvf/Makefile (100%)
>  rename drivers/{virtio => }/vdpa/ifcvf/ifcvf_base.c (100%)
>  rename drivers/{virtio => }/vdpa/ifcvf/ifcvf_base.h (100%)
>  rename drivers/{virtio => }/vdpa/ifcvf/ifcvf_main.c (100%)
>  rename drivers/{virtio => }/vdpa/vdpa.c (100%)
>  rename drivers/{virtio => }/vdpa/vdpa_sim/Makefile (100%)
>  rename drivers/{virtio => }/vdpa/vdpa_sim/vdpa_sim.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 70c47bc55343..7cfa55c765fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17695,6 +17695,7 @@ L:	virtualization@lists.linux-foundation.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/virtio/
>  F:	drivers/virtio/
> +F:	drivers/vdpa/
>  F:	tools/virtio/
>  F:	drivers/net/virtio_net.c
>  F:	drivers/block/virtio_blk.c
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 7a6d8b2b68b4..ac23d520e916 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -138,6 +138,8 @@ source "drivers/virt/Kconfig"
>  
>  source "drivers/virtio/Kconfig"
>  
> +source "drivers/vdpa/Kconfig"
> +
>  source "drivers/vhost/Kconfig"
>  
>  source "drivers/hv/Kconfig"
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 31cf17dee252..21688f3b1588 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -42,6 +42,7 @@ obj-$(CONFIG_DMADEVICES)	+= dma/
>  obj-y				+= soc/
>  
>  obj-$(CONFIG_VIRTIO)		+= virtio/
> +obj-$(CONFIG_VDPA)		+= vdpa/
>  obj-$(CONFIG_XEN)		+= xen/
>  
>  # regulators early, since some subsystems rely on them to initialize
> diff --git a/drivers/virtio/vdpa/Kconfig b/drivers/vdpa/Kconfig
> similarity index 100%
> rename from drivers/virtio/vdpa/Kconfig
> rename to drivers/vdpa/Kconfig
> diff --git a/drivers/virtio/vdpa/Makefile b/drivers/vdpa/Makefile
> similarity index 100%
> rename from drivers/virtio/vdpa/Makefile
> rename to drivers/vdpa/Makefile
> diff --git a/drivers/virtio/vdpa/ifcvf/Makefile b/drivers/vdpa/ifcvf/Makefile
> similarity index 100%
> rename from drivers/virtio/vdpa/ifcvf/Makefile
> rename to drivers/vdpa/ifcvf/Makefile
> diff --git a/drivers/virtio/vdpa/ifcvf/ifcvf_base.c b/drivers/vdpa/ifcvf/ifcvf_base.c
> similarity index 100%
> rename from drivers/virtio/vdpa/ifcvf/ifcvf_base.c
> rename to drivers/vdpa/ifcvf/ifcvf_base.c
> diff --git a/drivers/virtio/vdpa/ifcvf/ifcvf_base.h b/drivers/vdpa/ifcvf/ifcvf_base.h
> similarity index 100%
> rename from drivers/virtio/vdpa/ifcvf/ifcvf_base.h
> rename to drivers/vdpa/ifcvf/ifcvf_base.h
> diff --git a/drivers/virtio/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
> similarity index 100%
> rename from drivers/virtio/vdpa/ifcvf/ifcvf_main.c
> rename to drivers/vdpa/ifcvf/ifcvf_main.c
> diff --git a/drivers/virtio/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
> similarity index 100%
> rename from drivers/virtio/vdpa/vdpa.c
> rename to drivers/vdpa/vdpa.c
> diff --git a/drivers/virtio/vdpa/vdpa_sim/Makefile b/drivers/vdpa/vdpa_sim/Makefile
> similarity index 100%
> rename from drivers/virtio/vdpa/vdpa_sim/Makefile
> rename to drivers/vdpa/vdpa_sim/Makefile
> diff --git a/drivers/virtio/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> similarity index 100%
> rename from drivers/virtio/vdpa/vdpa_sim/vdpa_sim.c
> rename to drivers/vdpa/vdpa_sim/vdpa_sim.c
> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> index 99e424570644..2aadf398d8cc 100644
> --- a/drivers/virtio/Kconfig
> +++ b/drivers/virtio/Kconfig
> @@ -109,5 +109,3 @@ config VIRTIO_MMIO_CMDLINE_DEVICES
>  	 If unsure, say 'N'.
>  
>  endif # VIRTIO_MENU
> -
> -source "drivers/virtio/vdpa/Kconfig"
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
