Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 436AA14E7BB
	for <lists.virtualization@lfdr.de>; Fri, 31 Jan 2020 04:57:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E052820433;
	Fri, 31 Jan 2020 03:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2TSIiDws511N; Fri, 31 Jan 2020 03:57:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 19E0320405;
	Fri, 31 Jan 2020 03:57:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04A34C0171;
	Fri, 31 Jan 2020 03:57:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 230DCC0171
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 03:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1EB47868BD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 03:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzrasUGwgx38
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 03:56:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B6A3D868AB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 03:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5AiRNNR3E4corHChDgT2p0fKB/v898YA69onJ2mDDvw=; b=ZT77gvY6Brb8nwO28+W+PgGME
 1oHALqs7edfA5cAXt2DkOj2ED02hIyZk7cqJZUEQ6g9u6JxtsI2no2cLY87s/Gw8YqdFaGe7neSG3
 TnzE4fI058xHpmkMFgn4T9ST8cE/wBnMz1TXttpMowzC/81zyT7NbUQTDs6rp5VjWDP34tBDwvi0d
 4SaOhBuvujCcPwav2o9u7mZZb9KWuycxO2j08+HV/qBzJPjTSlJgoSlyF8xoM+eO3fEq2SeyS3Wfz
 FvLanvkTO7oNyZKJHaSODqEIHL/RVYgxErYSycYFySL+vareq71eeVKPboLj6qLAvpnhaSsRKFbhj
 Jp6aKukPQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixNQD-0003II-6X; Fri, 31 Jan 2020 03:56:45 +0000
Subject: Re: [PATCH] vhost: introduce vDPA based backend
To: Tiwei Bie <tiwei.bie@intel.com>, mst@redhat.com, jasowang@redhat.com
References: <20200131033651.103534-1-tiwei.bie@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <43aeecb4-4c08-df3d-1c1d-699ec4c494bd@infradead.org>
Date: Thu, 30 Jan 2020 19:56:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131033651.103534-1-tiwei.bie@intel.com>
Content-Language: en-US
Cc: shahafs@mellanox.com, jiri@mellanox.com, lulu@redhat.com,
 kvm@vger.kernel.org, netdev@vger.kernel.org, mhabets@solarflare.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 hch@infradead.org, eperezma@redhat.com, haotian.wang@sifive.com,
 jgg@mellanox.com, hanand@xilinx.com, parav@mellanox.com,
 zhihong.wang@intel.com, maxime.coquelin@redhat.com, lingshan.zhu@intel.com,
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

Hi,

On 1/30/20 7:36 PM, Tiwei Bie wrote:
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index f21c45aa5e07..13e6a94d0243 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -34,6 +34,18 @@ config VHOST_VSOCK
>  	To compile this driver as a module, choose M here: the module will be called
>  	vhost_vsock.
>  
> +config VHOST_VDPA
> +	tristate "Vhost driver for vDPA based backend"
> +	depends on EVENTFD && VDPA
> +	select VHOST
> +	default n
> +	---help---
> +	This kernel module can be loaded in host kernel to accelerate
> +	guest virtio devices with the vDPA based backends.

	                              vDPA-based

> +
> +	To compile this driver as a module, choose M here: the module
> +	will be called vhost_vdpa.
> +

The preferred Kconfig style nowadays is
(a) use "help" instead of "---help---"
(b) indent the help text with one tab + 2 spaces

and don't use "default n" since that is already the default.

>  config VHOST
>  	tristate
>          depends on VHOST_IOTLB

thanks.
-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
