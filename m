Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EA620165610
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 05:08:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9CF73878F1;
	Thu, 20 Feb 2020 04:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1OPaztq8Njk; Thu, 20 Feb 2020 04:08:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 15FB6820E4;
	Thu, 20 Feb 2020 04:08:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BAF6C013E;
	Thu, 20 Feb 2020 04:08:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51E65C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 04:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4C4DD820E4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 04:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5yhlykZSXVF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 04:07:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5420F81F9F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 04:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=DsnBWKGRXR7v7coTpch/Jgp1pyAIAbHmN/qbKeL3Rbc=; b=ht7LhAiC4AlCXwZ5USJKlotrOk
 Zz4mLDzQbSRUL1p6q1pxOQcG25GDfuGvOpseX5AfPYpqd0+A2revWqc/JkMYpWgzgNSvMx3iM0QvP
 qJqLYoKc2deClfTN4oRWTPVT3NfmapvMmz1EwrDZ07ItfEMOWpmkGYHf4lCJQ0yZtxLKITzbpKpnh
 CRwjXjBS472Lc22wAzxOjrd8fEJGezTg7/bF+l6HMzvKjJ1lBtKl87P/Ra362aA9LWylPXy/Mr99P
 TbLIzvWib8FEflj8CVj8taei3+nAVTPYNP1KsSNNwgvCVJY8OjZESjx32rHhgEX06g8EpQaDGLq9E
 O7MR1XfA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4d7w-0001gm-5V; Thu, 20 Feb 2020 04:07:52 +0000
Subject: Re: [PATCH V3 4/5] virtio: introduce a vDPA based transport
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200220035650.7986-1-jasowang@redhat.com>
 <20200220035650.7986-5-jasowang@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2c5a3a84-be56-3003-8d71-d46645664bab@infradead.org>
Date: Wed, 19 Feb 2020 20:07:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220035650.7986-5-jasowang@redhat.com>
Content-Language: en-US
Cc: shahafs@mellanox.com, jiri@mellanox.com, lulu@redhat.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, haotian.wang@sifive.com,
 hch@infradead.org, eperezma@redhat.com, maxime.coquelin@redhat.com,
 jgg@mellanox.com, hanand@xilinx.com, parav@mellanox.com,
 zhihong.wang@intel.com, lingshan.zhu@intel.com, mhabets@solarflare.com,
 rob.miller@broadcom.com
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

On 2/19/20 7:56 PM, Jason Wang wrote:
> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> index 9c4fdb64d9ac..0df3676b0f4f 100644
> --- a/drivers/virtio/Kconfig
> +++ b/drivers/virtio/Kconfig
> @@ -43,6 +43,19 @@ config VIRTIO_PCI_LEGACY
>  
>  	  If unsure, say Y.
>  
> +config VIRTIO_VDPA
> +	tristate "vDPA driver for virtio devices"
> +        select VDPA
> +        select VIRTIO
> +	help
> +	  This driver provides support for virtio based paravirtual
> +	  device driver over vDPA bus. For this to be useful, you need
> +	  an appropriate vDPA device implementation that operates on a
> +          physical device to allow the datapath of virtio to be
> +	  offloaded to hardware.
> +
> +	  If unsure, say M.
> +

Please use tabs consistently for indentation, not spaces,
except in the Kconfig help text, which should be 1 tab + 2 spaces.

>  config VIRTIO_PMEM
>  	tristate "Support for virtio pmem driver"
>  	depends on VIRTIO


-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
