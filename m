Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BF61BE2D2
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 17:34:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F57686AC9;
	Wed, 29 Apr 2020 15:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69IAeU6jq5yG; Wed, 29 Apr 2020 15:34:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 764E585413;
	Wed, 29 Apr 2020 15:34:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AEE6C0172;
	Wed, 29 Apr 2020 15:34:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4AB6C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 15:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AD13D85361
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 15:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Og3YGQhrE6Si
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 15:34:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A09F184B60
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588174439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KKID24VeS04+SIozIuc8RuLZZFKJ5rduUKOoVcekO0A=;
 b=DTfHQiWKRtAyE2lEbFaH9KNJI8+pp0mk3IxAYfEd4GBccOey0ttX3dmGPX8qovLK4F6thr
 WInLciA3zAPOq0PVyoiRsS4wSkuw1uy1r+EMOhupevSmJRJ3vXhWFPr6y6/UbXAymtzI+m
 O7Koyy2uRhx4BSrpunK6FkRn+Ryng9U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-WyoI0qSiPEO3Izhquaiuqw-1; Wed, 29 Apr 2020 11:33:57 -0400
X-MC-Unique: WyoI0qSiPEO3Izhquaiuqw-1
Received: by mail-wm1-f72.google.com with SMTP id t62so1384395wma.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 08:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KKID24VeS04+SIozIuc8RuLZZFKJ5rduUKOoVcekO0A=;
 b=Ch7Z4pJmU4OC0VH290LqQg3MNSbdP3lgjESRYP6xQFBD+vQbuKelNgrmpqSwbhETFF
 8F5hSZRof1AE9rYrIPvVuO5a5FNH0Uw5/thmliDodcqpXeMfjG38c9jFrmvWZ7/vTxBF
 WBI5ZJNtVT7R40FyFQ/4rdMLo+EF6UpM/V0SlsdKsGiyme2UOjwN7lFILdfdrmyyR+h3
 zEMozEvZxz/nmg4zR4uDVLy0RB3M4pgMYsvo/l2W28mDDmjLnyvLu3bwHWymLK2lNxId
 oyFNrc0qohrHmPjt0Om6uqoXY3vLF1Ifushr+h9cg0vvKu/++tUolgX0EoGtL9d+eMzl
 W3JQ==
X-Gm-Message-State: AGi0PuZSka2gWwlvYruncCisPlNx6gX6Mbx501zCzb+TNKP2XKx1KKyB
 0CseNo/aoxltEvJF6B4+2ccWm4X/5qPjtTX16xNEEP4sbFmWM2vlaFlhRhYdrwMzqCCVIJZBoIg
 AUo2N6miz8ajU0AHCUzfHYoQMZZRMaqIIlVgGetuy8A==
X-Received: by 2002:adf:fecd:: with SMTP id q13mr42286153wrs.12.1588174435306; 
 Wed, 29 Apr 2020 08:33:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypJv7rM5XZdPpYa0XbuMbltzbpsnlCYEladdinC4riKF/z7q+xHJZ0Lq2AB1h1HtNI76PDhJ5w==
X-Received: by 2002:adf:fecd:: with SMTP id q13mr42286134wrs.12.1588174435068; 
 Wed, 29 Apr 2020 08:33:55 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 u7sm8832675wmg.41.2020.04.29.08.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 08:33:54 -0700 (PDT)
Date: Wed, 29 Apr 2020 11:33:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] vhost: fix default for vhost_iotlb
Message-ID: <20200429113232-mutt-send-email-mst@kernel.org>
References: <20200429142317.1847441-1-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20200429142317.1847441-1-arnd@arndb.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Tiwei Bie <tiwei.bie@intel.com>, kvm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Wed, Apr 29, 2020 at 04:23:04PM +0200, Arnd Bergmann wrote:
> During randconfig build testing, I ran into a configuration that has
> CONFIG_VHOST=m, CONFIG_VHOST_IOTLB=m and CONFIG_VHOST_RING=y, which
> makes the iotlb implementation left out from vhost_ring, and in turn
> leads to a link failure of the vdpa_sim module:
> 
> ERROR: modpost: "vringh_set_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> ERROR: modpost: "vringh_init_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> ERROR: modpost: "vringh_iov_push_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> ERROR: modpost: "vringh_iov_pull_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> ERROR: modpost: "vringh_complete_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> ERROR: modpost: "vringh_getdesc_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> 
> Work around it by setting the default for VHOST_IOTLB to avoid this
> configuration.
> 
> Fixes: e6faeaa12841 ("vhost: drop vring dependency on iotlb")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I fixed this a while ago locally but never got around to sending the
> fix. If the problem has been addressed differently in the meantime,
> please ignore this one.


So I ended up not sending e6faeaa12841 upstream because of this problem.
But hey, that's a nice idea!
I'll queue something like this for the next release.

> ---
>  drivers/vhost/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index 2c75d164b827..ee5f85761024 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config VHOST_IOTLB
>  	tristate
> +	default y if VHOST=m && VHOST_RING=y
>  	help
>  	  Generic IOTLB implementation for vhost and vringh.
>  	  This option is selected by any driver which needs to support
> -- 
> 2.26.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
