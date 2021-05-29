Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC9E39496A
	for <lists.virtualization@lfdr.de>; Sat, 29 May 2021 02:02:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A2F9844D8;
	Sat, 29 May 2021 00:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3oDU77jGi9j9; Sat, 29 May 2021 00:02:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EF4284579;
	Sat, 29 May 2021 00:02:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEECDC0024;
	Sat, 29 May 2021 00:02:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C525AC0001
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 May 2021 00:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA03340E47
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 May 2021 00:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7iCMLy_AU9aN
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 May 2021 00:01:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CFDD404A1
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 May 2021 00:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=wClK8t5OqOKAJXZRdJ7lK3nU0nLrVWRCjDxwfQ1YPMI=; b=oQEOU/XvSEfv8fMGMn0Ibiyl1G
 LKUmNpGddt8Mx4Rzc2n1OXVQygVaS1Hp3LuerB4w21NGojS/f0EQXiAzFBr1Wx0TXBk0i5ANHtKRJ
 tORl/HV+bZzjqJv3n8eqlqX5CJLFkASF/ji4lMdaKwVqP53Tjac61kBHeZKEj+N4Pu23FcC5xOn+V
 VKRsUwZNciWxbginuPe10cDX1Zs6DbxYi+3erBw1ms7nDb0Venf7+yUudFgO3hPOUQaaubHAgAW5O
 dVL+8ZZzNYUOxpoxQryTugtaikRc03ghdTOD+GqHfFjpcWM5edHLX/2Noj7eqktgzaSJcYUghauEZ
 mvXFD1JQ==;
Received: from [2601:1c0:6280:3f0::ce7d]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmmQF-001zoQ-B8; Sat, 29 May 2021 00:01:47 +0000
Subject: Re: [PATCH 03/19] drivers/hv: minimal mshv module (/dev/mshv/)
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1622241819-21155-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1622241819-21155-4-git-send-email-nunodasneves@linux.microsoft.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e161e8cc-4d08-8bfd-ab1e-363ed5a39503@infradead.org>
Date: Fri, 28 May 2021 17:01:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1622241819-21155-4-git-send-email-nunodasneves@linux.microsoft.com>
Content-Language: en-US
Cc: wei.liu@kernel.org, ligrassi@microsoft.com, mikelley@microsoft.com,
 virtualization@lists.linux-foundation.org, viremana@linux.microsoft.com,
 sunilmut@microsoft.com
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

On 5/28/21 3:43 PM, Nuno Das Neves wrote:
> Introduce a barebones module file for the mshv API.
> Introduce CONFIG_HYPERV_ROOT_API for controlling compilation of mshv.
> 
> Co-developed-by: Lillian Grassin-Drake <ligrassi@microsoft.com>
> Signed-off-by: Lillian Grassin-Drake <ligrassi@microsoft.com>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---

Hi,

> diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
> index 66c794d92391..d618b1fab2bb 100644
> --- a/drivers/hv/Kconfig
> +++ b/drivers/hv/Kconfig
> @@ -27,4 +27,22 @@ config HYPERV_BALLOON
>  	help
>  	  Select this option to enable Hyper-V Balloon driver.
>  
> +config HYPERV_ROOT_API
> +	tristate "Microsoft Hypervisor root partition interfaces: /dev/mshv"
> +	depends on HYPERV
> +	help
> +	  Provides access to interfaces for managing guest virtual machines
> +	  running under the Microsoft Hypervisor.
> +
> +	  These interfaces will only work when Linux is running as root
> +	  partition on the Microsoft Hypervisor.
> +
> +	  The interfaces are provided via a device named /dev/mshv.
> +
> +	  To compile this as a module, choose M here.
> +          The module is named mshv.

^^^^^^^^^^^^^

Please follow coding-style for Kconfig files:

(from Documentation/process/coding-style.rst, section 10):

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.

> +
> +	  If unsure, say N.
> +
> +
>  endmenu

thanks.
-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
