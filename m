Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 186BB7CF9C5
	for <lists.virtualization@lfdr.de>; Thu, 19 Oct 2023 14:55:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5025742F0E;
	Thu, 19 Oct 2023 12:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5025742F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alI_Z7_T5PAL; Thu, 19 Oct 2023 12:55:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D5EF742F4A;
	Thu, 19 Oct 2023 12:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5EF742F4A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C79AC0DD3;
	Thu, 19 Oct 2023 12:55:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66A36C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 12:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 415C680E84
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 12:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 415C680E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uf37dRrCARLR
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 12:55:10 +0000 (UTC)
Received: from out30-112.freemail.mail.aliyun.com
 (out30-112.freemail.mail.aliyun.com [115.124.30.112])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A602E80E6D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 12:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A602E80E6D
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VuU4jLr_1697720101; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VuU4jLr_1697720101) by smtp.aliyun-inc.com;
 Thu, 19 Oct 2023 20:55:02 +0800
Message-ID: <1697720095.3742166-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH 2/2] virtio_pci: Switch away from deprecated
 irq_set_affinity_hint
Date: Thu, 19 Oct 2023 20:54:55 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jakub Sitnicki <jakub@cloudflare.com>
References: <20231019101625.412936-1-jakub@cloudflare.com>
 <20231019101625.412936-2-jakub@cloudflare.com>
In-Reply-To: <20231019101625.412936-2-jakub@cloudflare.com>
Cc: kernel-team@cloudflare.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, 19 Oct 2023 12:16:25 +0200, Jakub Sitnicki <jakub@cloudflare.com> wrote:
> Since commit 65c7cdedeb30 ("genirq: Provide new interfaces for affinity
> hints") irq_set_affinity_hint is being phased out.
>
> Switch to new interfaces for setting and applying irq affinity hints.
>
> Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

> ---
>  drivers/virtio/virtio_pci_common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> index 8927bc338f06..9fab99b540f1 100644
> --- a/drivers/virtio/virtio_pci_common.c
> +++ b/drivers/virtio/virtio_pci_common.c
> @@ -242,7 +242,7 @@ void vp_del_vqs(struct virtio_device *vdev)
>  			if (v != VIRTIO_MSI_NO_VECTOR) {
>  				int irq = pci_irq_vector(vp_dev->pci_dev, v);
>
> -				irq_set_affinity_hint(irq, NULL);
> +				irq_update_affinity_hint(irq, NULL);
>  				free_irq(irq, vq);
>  			}
>  		}
> @@ -440,7 +440,7 @@ int vp_set_vq_affinity(struct virtqueue *vq, const struct cpumask *cpu_mask)
>
>  	if (vp_dev->msix_enabled) {
>  		irq = pci_irq_vector(vp_dev->pci_dev, info->msix_vector);
> -		irq_set_affinity_hint(irq, cpu_mask);
> +		irq_set_affinity_and_hint(irq, cpu_mask);
>  	}
>  	return 0;
>  }
> --
> 2.41.0
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
