Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6C62CF2C2
	for <lists.virtualization@lfdr.de>; Fri,  4 Dec 2020 18:10:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1A5F1204C8;
	Fri,  4 Dec 2020 17:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jESzU9aDlqS; Fri,  4 Dec 2020 17:10:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0EE8F2000E;
	Fri,  4 Dec 2020 17:10:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCE7CC013B;
	Fri,  4 Dec 2020 17:10:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2EDFC013B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 17:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DE3C587D2E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 17:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fiWa+f73NV3i
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 17:10:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7F0E587D2A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 17:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=cevqeBvMiK1z4pR0QIc66JaWhXtth1Jyew3Q6xO1dss=; b=t28OvJoUPcHexu3oIKlK0Smmqn
 7TPhZg00E+sZks4pGWVh4Ghw4W2pbTDqjrv8XpZ2fHWj0+Xi5o4hRKp8OyfxNRJD8aTZgEsC38FVl
 q3QD6k1mL1vVz2abqJ45Raf/JzDzvDG70M2/16DZCXy/rEnn0HHwKFGJwcbLGZrN0gQUquA6CrOtJ
 NlIK4iqKo8XZu48rkDq53S+ky5DTtbhmra6Ssft55kD5FPw1r9YomudWY8idHgdbg+PD339YWFfr3
 b1qGfvSVg5fVKHjkbFG29TGUfarivyO4c2q2hwt0nMqeyV68Y/bLeYZ2BXWmXOe0oqBYHX9S1qTBt
 sVu4e/zw==;
Received: from [2601:1c0:6280:3f0::1494]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klEbT-00032n-Mj; Fri, 04 Dec 2020 17:10:44 +0000
Subject: Re: [PATCH V2 16/19] virtio-pci: introduce modern device module
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20201204040353.21679-1-jasowang@redhat.com>
 <20201204040353.21679-17-jasowang@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a325b57b-817f-b96e-76fc-dba4415fe6b0@infradead.org>
Date: Fri, 4 Dec 2020 09:10:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201204040353.21679-17-jasowang@redhat.com>
Content-Language: en-US
Cc: shahafs@mellanox.com
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

Hi Jason--

On 12/3/20 8:03 PM, Jason Wang wrote:
> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> index 7b41130d3f35..d1a6bd2a975f 100644
> --- a/drivers/virtio/Kconfig
> +++ b/drivers/virtio/Kconfig
> @@ -12,6 +12,14 @@ config ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
>  	  This option is selected if the architecture may need to enforce
>  	  VIRTIO_F_ACCESS_PLATFORM
>  
> +config VIRTIO_PCI_MODERN
> +	tristate "Modern Virtio PCI Device"
> +	depends on PCI
> +	help
> +	  Modern PCI device implementation. This module implement the

	                                                implements

> +	  basic probe and control for devices which is based on modern

	                                            are

> +	  PCI device with possible vendor specific extensions.

	      devices
> +


cheers.
-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
