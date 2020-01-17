Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF81402D9
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 05:14:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DAC6921FA8;
	Fri, 17 Jan 2020 04:14:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lliyz-8gQSUd; Fri, 17 Jan 2020 04:14:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EB3862155B;
	Fri, 17 Jan 2020 04:14:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D56BCC077D;
	Fri, 17 Jan 2020 04:14:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45F1CC077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 04:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2CD9487F79
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 04:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elqVQ-1gcYS9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 04:14:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AC6F687F78
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 04:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GbWbSeaybdoD6jMMHq94tdh3eoDc9qPiy0Usy1cnMeA=; b=nYT6G65EldAx9gyrVCxRahKsW
 mDsaSrnZ+OxrGiew439TJ+Zbcd6J76dXkvaCoES5UNtweoeev2O3AIe1ktz1suXZQUNoiS1bYYeo5
 w05O2Eod2QwlI64dK8ZQeOp2IeCkBbZM5MvyJ6gI4hDMTo2kNrfzKefTbuK7vCDcT+R+cCfCzPLw1
 D1uH9TvlTltAYgaOdflUPs2yTDp1BdQCpIsrs4JxWiDR3FiCAKMf6XYGgLsHIvt7P+oxxk+kKfbSC
 YEwSP4ummhQbZ+6KWFHbB1nvH3HNyqgEFlvhoKxaTPF+YccZ+y3amei/RrlJ90+irMTS/YrSOv1ug
 tFeoVn6wg==;
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isJ1n-00074I-PU; Fri, 17 Jan 2020 04:14:35 +0000
Subject: Re: [PATCH 1/5] vhost: factor out IOTLB
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-2-jasowang@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4a577560-d42a-eed2-97a0-42d2f91495e2@infradead.org>
Date: Thu, 16 Jan 2020 20:14:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200116124231.20253-2-jasowang@redhat.com>
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

On 1/16/20 4:42 AM, Jason Wang wrote:
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index 3d03ccbd1adc..f21c45aa5e07 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -36,6 +36,7 @@ config VHOST_VSOCK
>  
>  config VHOST
>  	tristate
> +        depends on VHOST_IOTLB
>  	---help---
>  	  This option is selected by any driver which needs to access
>  	  the core of vhost.
> @@ -54,3 +55,9 @@ config VHOST_CROSS_ENDIAN_LEGACY
>  	  adds some overhead, it is disabled by default.
>  
>  	  If unsure, say "N".
> +
> +config VHOST_IOTLB
> +	tristate
> +        default m
> +        help
> +          Generic IOTLB implementation for vhost and vringh.

Use tab + 2 spaces for Kconfig indentation.

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
