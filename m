Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3842B2405
	for <lists.virtualization@lfdr.de>; Fri, 13 Nov 2020 19:49:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 628BB875EA;
	Fri, 13 Nov 2020 18:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfevIIa8A7ED; Fri, 13 Nov 2020 18:49:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DF72A875FF;
	Fri, 13 Nov 2020 18:49:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7F6AC0800;
	Fri, 13 Nov 2020 18:49:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A11DFC0800
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 18:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8C758875EA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 18:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dE5lJwRXpjU8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 18:49:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 60A5B875E7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 18:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=zlmAODAdEVo5z5IEtpT54+dtERCJ2wuOwk2yef+rXKs=; b=jgYj4NINmhpBdN0qFRcvhqCIzX
 MjAoo9aZfOK7jIEmQXQjZogENH2Ew8RoEsF7prsrH5Nl6yM69Z+5ztESNSM337fn/KcF7krpKB+1C
 wpPx2JFdmYkuSLtmRbSvV0bO+oPPkCe7Ul7Ht2a33Gl2JOYOqYNkGNJHSUXjML/HS68ReAOJ7yZSU
 FSQRfck5NLt1VCylmchdkjedX8+kYaOxUgPeuLeKyUKZPUNwMPeY82ajsVFaXOQCAf5zyveEmllpg
 BRKmgojF1FJB5D4Wcj5v9udkDhpTPs6wHgWI9JrayZLLiqQ5eF6yeXALVSavvGF6UEd1paiN+0biu
 1sEBTpGQ==;
Received: from [2601:1c0:6280:3f0::662d]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kde8H-0004Nc-RY; Fri, 13 Nov 2020 18:49:14 +0000
Subject: Re: [PATCH] vdpasim: fix "mac_pton" undefined error
To: Laurent Vivier <lvivier@redhat.com>, linux-kernel@vger.kernel.org
References: <20201113155706.599434-1-lvivier@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fdab06b3-039b-df4b-243e-9cb0e940cc15@infradead.org>
Date: Fri, 13 Nov 2020 10:49:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201113155706.599434-1-lvivier@redhat.com>
Content-Language: en-US
Cc: virtualization@lists.linux-foundation.org,
 kernel test robot <lkp@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
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

On 11/13/20 7:57 AM, Laurent Vivier wrote:
>    ERROR: modpost: "mac_pton" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> 
> mac_pton() is defined in lib/net_utils.c and is not built if NET is not set.
> 
> Select GENERIC_NET_UTILS as vdpasim doesn't depend on NET.
> 
> Reported-by: kernel test robot <lkp@intel.com>

On Nov. 2, 2020:

Reported-by: Randy Dunlap <rdunlap@infradead.org>

https://lore.kernel.org/lkml/d3d50a94-cdc5-572b-e9ca-3ee5638d21ee@infradead.org/


> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  drivers/vdpa/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
> index d7d32b656102..358f6048dd3c 100644
> --- a/drivers/vdpa/Kconfig
> +++ b/drivers/vdpa/Kconfig
> @@ -13,6 +13,7 @@ config VDPA_SIM
>  	depends on RUNTIME_TESTING_MENU && HAS_DMA
>  	select DMA_OPS
>  	select VHOST_RING
> +	select GENERIC_NET_UTILS
>  	default n
>  	help
>  	  vDPA networking device simulator which loop TX traffic back
> 

Thanks for the patch.

-- 
~Randy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
