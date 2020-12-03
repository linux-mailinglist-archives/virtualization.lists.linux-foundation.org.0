Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECFC2CDC50
	for <lists.virtualization@lfdr.de>; Thu,  3 Dec 2020 18:26:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7F2C887CC4;
	Thu,  3 Dec 2020 17:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXzSNMmunAia; Thu,  3 Dec 2020 17:26:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B6C7187CD2;
	Thu,  3 Dec 2020 17:26:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9571CC0FA7;
	Thu,  3 Dec 2020 17:26:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B8F8C0FA7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 115E587366
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mx5vnD8zp9jk
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:26:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CFA26870A4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=1ys3tD29yyXiFC0wdrbI9llPCLLvllG6Avtg8Riop2w=; b=Ktj16xIdTj3m+YMFkFDzvgkkc/
 BWsyux4yLGkgmExSv1HICil5cSWVbbPvIpJVFtlZftQBQGAne4ys3cbQ6QBTTmNfDMX7VRf0Ah5n9
 kTOs7rzItjdLzvl+sTP7n96dfUg10qQ8AG7WjHPjs0dU7z7kMArROSJmugAJ35vkE3izte/rz343g
 n0Z6YlZqOrchcI5LtdioiEZvrtIBvCs36g+qFUbzE4qlh9YHRgAWWgqor467dCPM1d2OnEXATMXnD
 UanaImtP8rYDQvmiPS78bVHf7xWNPJShHMCyZ8qXmt+WFQuZjNSp0i+wF7nnEPrDd8pg2L2hZ6XLR
 HoBL5ooA==;
Received: from [2601:1c0:6280:3f0::1494]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kksMh-00057z-0N; Thu, 03 Dec 2020 17:25:59 +0000
Subject: Re: [PATCH v3 19/19] vdpa: split vdpasim to core and net modules
To: Stefano Garzarella <sgarzare@redhat.com>,
 virtualization@lists.linux-foundation.org
References: <20201203170511.216407-1-sgarzare@redhat.com>
 <20201203170511.216407-20-sgarzare@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <920c4975-a3ae-b7f9-ac89-6444ca2e4c45@infradead.org>
Date: Thu, 3 Dec 2020 09:25:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203170511.216407-20-sgarzare@redhat.com>
Content-Language: en-US
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Shahaf Shuler <shahafs@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <elic@nvidia.com>, Oren Duer <oren@nvidia.com>
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

On 12/3/20 9:05 AM, Stefano Garzarella wrote:
> diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
> index 2c892e890b9e..b0f91ad8eb47 100644
> --- a/drivers/vdpa/Kconfig
> +++ b/drivers/vdpa/Kconfig
> @@ -9,15 +9,20 @@ menuconfig VDPA
>  if VDPA
>  
>  config VDPA_SIM
> -	tristate "vDPA device simulator"
> +	tristate "vDPA device simulator core"
>  	depends on RUNTIME_TESTING_MENU && HAS_DMA
>  	select DMA_OPS
>  	select VHOST_RING
> +	help
> +	  Enable this module to support vDPA device simulators. These devices
> +	  are used for testing, prototyping and development of vDPA.
> +
> +config VDPA_SIM_NET
> +	tristate "vDPA simulator for networking device"
> +	depends on VDPA_SIM
>  	select GENERIC_NET_UTILS
>  	help
> -	  vDPA networking device simulator which loop TX traffic back
> -	  to RX. This device is used for testing, prototyping and
> -	  development of vDPA.
> +	  vDPA networking device simulator which loop TX traffic back to RX.

	                                         loops


thanks.
-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
