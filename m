Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 488081402CC
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 05:10:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BB1DE20495;
	Fri, 17 Jan 2020 04:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V44rLDSqlgbQ; Fri, 17 Jan 2020 04:10:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E77A520530;
	Fri, 17 Jan 2020 04:10:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB919C077D;
	Fri, 17 Jan 2020 04:10:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AEDDC077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 04:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4C69482358
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 04:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1hht8mAzmPuM
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 04:10:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A0E6282346
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 04:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KM4jBWrreX7YdYs9/PMtNlfIXwcq6JEXQmTdCdMcdKE=; b=NfiCKMOXXLzXSiHqQtYL6XeHm
 6mo8pYpAJf3rdBor+acqnZjJX7Zr9BNldK4zJA0RqojzhLXBmPGZ0wGxSrNYlKFsPXJ0wKpTlYhIY
 xr1rbvYE9DhOL46mm+cT+8PF1z/3yRVwZ8v2MYM5QSMg0Y8eJzoYuJ36bvARy6O7cKMjTA6KjBGj5
 F/I8Vgc7UDGE7ltMtAPPHSc30BBOPZEyuoj7msXd5G2vOEjIKAhHLzmBTjkmaz1Stt22kRPRbrboD
 6N3hppDqwXRgqrX4ivw5L1bYyambOTJN1BIrtb52/j/bvAuVka7nV/b6dFwDdIxJ5R4gmY2TYr+CO
 WWVt7vZOg==;
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isIxW-0005LR-JB; Fri, 17 Jan 2020 04:10:10 +0000
Subject: Re: [PATCH 4/5] virtio: introduce a vDPA based transport
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-5-jasowang@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e71bdbfe-559c-e881-26d4-03080cee42ed@infradead.org>
Date: Thu, 16 Jan 2020 20:10:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200116124231.20253-5-jasowang@redhat.com>
Content-Language: en-US
Cc: shahafs@mellanox.com, jakub.kicinski@netronome.com, lulu@redhat.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, haotian.wang@sifive.com,
 hch@infradead.org, eperezma@redhat.com, maxime.coquelin@redhat.com,
 jgg@mellanox.com, hanand@xilinx.com, parav@mellanox.com,
 zhihong.wang@intel.com, lingshan.zhu@intel.com, jiri@mellanox.com,
 mhabets@solarflare.com, rob.miller@broadcom.com
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

Hi,

On 1/16/20 4:42 AM, Jason Wang wrote:
> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> index 9c4fdb64d9ac..b4276999d17d 100644
> --- a/drivers/virtio/Kconfig
> +++ b/drivers/virtio/Kconfig
> @@ -43,6 +43,19 @@ config VIRTIO_PCI_LEGACY
>  
>  	  If unsure, say Y.
>  
> +config VIRTIO_VDPA
> +	tristate "vDPA driver for virtio devices"
> +	depends on VDPA && VIRTIO
> +	default n
> +	help
> +	  This driver provides support for virtio based paravirtual

	                                   virtio-based

> +	  device driver over vDPA bus. For this to be useful, you need
> +	  an appropriate vDPA device implementation that operates on a
> +          physical device to allow the datapath of virtio to be

use tab + 2 spaces above for indentation, not lots of spaces.

> +	  offloaded to hardware.
> +
> +	  If unsure, say M.
> +
>  config VIRTIO_PMEM
>  	tristate "Support for virtio pmem driver"
>  	depends on VIRTIO


-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
