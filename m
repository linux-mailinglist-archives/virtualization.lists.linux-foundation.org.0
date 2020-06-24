Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC6206FB0
	for <lists.virtualization@lfdr.de>; Wed, 24 Jun 2020 11:07:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DE4A287514;
	Wed, 24 Jun 2020 09:07:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_gwZpZzR6qu; Wed, 24 Jun 2020 09:07:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EAAD18744A;
	Wed, 24 Jun 2020 09:07:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D29BAC016F;
	Wed, 24 Jun 2020 09:07:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 261A9C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 09:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 22FBC88721
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 09:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RlNW-oJku0RF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 09:06:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C5214886E5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 09:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592989618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BWweQzpvz5qRvsYocQLFZ/CEELAJfUtNzgc7NW2oHMc=;
 b=C6xlRB+6BASgheWItYLiiYF5ofIYqryu5ujzHxShqjhq1ZZPLJRVgYygYs9Ah6mCgM+20E
 37IYLdRCWCWsvuxahKNa82vSJVGYi5zU1DTF1JNmur5TdmPtqW1MtkYZgzNQck8pfqUoSw
 ygtwWnpX+rGODpxkR2l+EClCQ1bFFqI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-d7TgPtCZPn6O11N_4AKaEQ-1; Wed, 24 Jun 2020 05:06:54 -0400
X-MC-Unique: d7TgPtCZPn6O11N_4AKaEQ-1
Received: by mail-wr1-f71.google.com with SMTP id g14so2281768wrp.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 02:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BWweQzpvz5qRvsYocQLFZ/CEELAJfUtNzgc7NW2oHMc=;
 b=hLb63bDPeOtrF4wYOnpFtIcAZMZh8SHFzUov7t3pHzaPxVNQ0Ef3U4MRQK2pEh5e2J
 jY3vIWZVOzwW3dY6wCsACr4uWoAEnM0SUmfbOZ3SCaXl9HYoxvglQKyKeBLomZE5IEPX
 tTcbyTk3XgUsBtrRJLBQzD0HtanFqS575Jq0vtH5YOFxMKGmeyBjCh/jF8kQJqtoysH4
 dpjWqx2sIp5QpM0HDPpYExKC4nGbTsLrDWip5O7mBm1aQ9VLJQoetD0VmLCRIu6lYEbn
 Sv8VXCgCa375S6cFQy1EydRF+2MN25Gile4innoL96s+ti3A2neO3CWl/RUIRdYxBKGE
 w12A==
X-Gm-Message-State: AOAM530451gzU6aQwRRgkhM6xfwlNDP1uu6UIFKhf+/j9K/USxaFBSmq
 KqxRfOExf3iDgIbLPGb2GJzhTHS1FV9P8+88xPOWO+7GyKeQtni/kwbZXPs9OKN9zkU5AmDlTg6
 HOEPH1JC9DQMLgPBgDcgZADVj1oZ3uuSbU6wHnstMgA==
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr276003wmk.170.1592989612933; 
 Wed, 24 Jun 2020 02:06:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCjnIRq0GLGlJ0yYJ0oEVhHQJi+H1TnyLeWn06GTYZrPy1eSbfHNnWW2xTl+/KbPsMMBv1Rw==
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr275986wmk.170.1592989612754; 
 Wed, 24 Jun 2020 02:06:52 -0700 (PDT)
Received: from redhat.com ([82.166.20.53])
 by smtp.gmail.com with ESMTPSA id n189sm7181712wmb.43.2020.06.24.02.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 02:06:51 -0700 (PDT)
Date: Wed, 24 Jun 2020 05:06:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200624050355-mutt-send-email-mst@kernel.org>
References: <20200624091732.23944-1-peng.fan@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20200624091732.23944-1-peng.fan@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: jgross@suse.com, sstabellini@kernel.org, konrad.wilk@oracle.com,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
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

On Wed, Jun 24, 2020 at 05:17:32PM +0800, Peng Fan wrote:
> Export xen_swiotlb for all platforms using xen swiotlb
> 
> Use xen_swiotlb to determine when vring should use dma APIs to map the
> ring: when xen_swiotlb is enabled the dma API is required. When it is
> disabled, it is not required.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Isn't there some way to use VIRTIO_F_IOMMU_PLATFORM for this?
Xen was there first, but everyone else is using that now.


> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index a2de775801af..768afd79f67a 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -252,7 +252,7 @@ static bool vring_use_dma_api(struct virtio_device *vdev)
>  	 * the DMA API if we're a Xen guest, which at least allows
>  	 * all of the sensible Xen configurations to work correctly.
>  	 */
> -	if (xen_domain())
> +	if (xen_vring_use_dma())
>  		return true;
>  
>  	return false;


The comment above this should probably be fixed.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
