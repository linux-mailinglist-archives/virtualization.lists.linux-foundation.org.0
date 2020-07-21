Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A55227A7F
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 10:19:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 956E1889AF;
	Tue, 21 Jul 2020 08:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CshO-OrGip4A; Tue, 21 Jul 2020 08:19:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C9D60889AC;
	Tue, 21 Jul 2020 08:19:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7F28C016F;
	Tue, 21 Jul 2020 08:19:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A436BC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 08:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9ABEF86EBB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 08:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cV69v2YFQf9Z
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 08:19:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CA27F86EB5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595319551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xkmaD14CWjK3N3gJunf7XsZs5bmLEiFw/ANQQtol7cc=;
 b=fiHvxlf8GbbFqpYs0MJOxG/EzzdP1i7dJh8iqDX7dU0/24Sj3FLVJbw2znymHy6m/Pemei
 4I1JrXy8iVt1TB1UEPvMtW8QpCuIOTQM+5cUmsoze9jlQfaNmvM8wPSZJetNEx0Gi2Ku6L
 SB44HOoamguevQyJfPkqHaVsodrJTLA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-mVdPdTY8PJeFJaQZwsllzQ-1; Tue, 21 Jul 2020 04:18:57 -0400
X-MC-Unique: mVdPdTY8PJeFJaQZwsllzQ-1
Received: by mail-wm1-f71.google.com with SMTP id u68so711905wmu.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 01:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xkmaD14CWjK3N3gJunf7XsZs5bmLEiFw/ANQQtol7cc=;
 b=e16ygg22aJU1hnH9dlC1UAsKmyZxaoj4nkQDUDEfVxY4xFeGjozxsW2ljDTkqgFCGL
 q6TAvt0WW0PLvXzuHEkUjt+gBjmg27KLMqC/cg9H+FiXUyt+mxsiCyD/36xc4AbmV4f0
 aUIZF6ePmQwwOs0z0vzj9JfznmeuzI5qhq90UV4S32JHq29OEr42ftYUs+Pb5mfN5cfW
 LYpHxQ+wAk7Qa7HAljEWI2yjSv30jmHpDka9IY1Gmr9tyecx3eE8ZGiBSn6iK4fjRtjV
 Lwxw62pIKHmEkTqdpJu7ETDRIV2B34TpxtSFvcaOLtTkqpVzsJiF8o3d1RNwM7a4wBjL
 Rgug==
X-Gm-Message-State: AOAM530In8+6O02JL2eNNo73xDYcN6B3OQK6Iz9htD/oeY4/FPOg2fNo
 +098nWPWNmxb+TETxsLUKz5h8wisy063kEs4VoJkb7jDJ4MIm2cZquwWUO4DKR9oWtymfCwG7QR
 cjfU4Sta+LZWN1Xi1SHQTAdxui4TMSVWqSPnjbuZ2yw==
X-Received: by 2002:a7b:c8c8:: with SMTP id f8mr3064961wml.142.1595319536581; 
 Tue, 21 Jul 2020 01:18:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu53zATBiX8oH83PTvYrZiOs3LjcaWchQEItZ2BS8OgcP26ZDsNqGDj/whi2FZO5AjbvS6KA==
X-Received: by 2002:a7b:c8c8:: with SMTP id f8mr3064931wml.142.1595319536353; 
 Tue, 21 Jul 2020 01:18:56 -0700 (PDT)
Received: from redhat.com (bzq-79-182-82-99.red.bezeqint.net. [79.182.82.99])
 by smtp.gmail.com with ESMTPSA id
 k14sm35429226wrn.76.2020.07.21.01.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 01:18:55 -0700 (PDT)
Date: Tue, 21 Jul 2020 04:18:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: Re: [PATCH v2] virtio_ring: use alloc_pages_node for NUMA-aware
 allocation
Message-ID: <20200721041550-mutt-send-email-mst@kernel.org>
References: <20200721070013.62894-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20200721070013.62894-1-shile.zhang@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel test robot <lkp@intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 bhelgaas@google.com, Jiang Liu <liuj97@gmail.com>
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

On Tue, Jul 21, 2020 at 03:00:13PM +0800, Shile Zhang wrote:
> Use alloc_pages_node() allocate memory for vring queue with proper
> NUMA affinity.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Jiang Liu <liuj97@gmail.com>
> Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>

Do you observe any performance gains from this patch?

I also wonder why isn't the probe code run on the correct numa node?
That would fix a wide class of issues like this without need to tweak
drivers.

Bjorn, what do you think? Was this considered?

> ---
> Changelog
> v1 -> v2:
> - fixed compile warning reported by LKP.
> ---
>  drivers/virtio/virtio_ring.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 58b96baa8d48..d38fd6872c8c 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -276,9 +276,11 @@ static void *vring_alloc_queue(struct virtio_device *vdev, size_t size,
>  		return dma_alloc_coherent(vdev->dev.parent, size,
>  					  dma_handle, flag);
>  	} else {
> -		void *queue = alloc_pages_exact(PAGE_ALIGN(size), flag);
> -
> -		if (queue) {
> +		void *queue = NULL;
> +		struct page *page = alloc_pages_node(dev_to_node(vdev->dev.parent),
> +						     flag, get_order(size));
> +		if (page) {
> +			queue = page_address(page);
>  			phys_addr_t phys_addr = virt_to_phys(queue);
>  			*dma_handle = (dma_addr_t)phys_addr;
>  
> @@ -308,7 +310,7 @@ static void vring_free_queue(struct virtio_device *vdev, size_t size,
>  	if (vring_use_dma_api(vdev))
>  		dma_free_coherent(vdev->dev.parent, size, queue, dma_handle);
>  	else
> -		free_pages_exact(queue, PAGE_ALIGN(size));
> +		free_pages((unsigned long)queue, get_order(size));
>  }
>  
>  /*
> -- 
> 2.24.0.rc2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
