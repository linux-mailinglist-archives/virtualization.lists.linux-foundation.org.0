Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDD15442E3
	for <lists.virtualization@lfdr.de>; Thu,  9 Jun 2022 07:07:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D787840BDC;
	Thu,  9 Jun 2022 05:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iefm1J3C1a0n; Thu,  9 Jun 2022 05:07:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2364040BE6;
	Thu,  9 Jun 2022 05:07:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2888EC0084;
	Thu,  9 Jun 2022 05:07:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04313C002D;
 Thu,  9 Jun 2022 05:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D902941C23;
 Thu,  9 Jun 2022 05:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WhuQW2x2gp0N; Thu,  9 Jun 2022 05:07:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2673441C0B;
 Thu,  9 Jun 2022 05:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TvPXHMQO6PU//nHDA0WgcCETKSRRfJH2DEgRCxwDbVs=; b=kYmHjR7gMPF1i+IrBOvuM8YJYv
 JS56zj46eCdXv6HizKLwWK6BBJX65b+pjfOUjohLpFK2UZWT0nc39riUnjJa9KdbSNswiMY1Wf8pW
 BeK204Hw7PCKtQiDfxkbHFRDDBh4d7SeK4+7H/ecJcy6NPU9wTuqwFvK+vowvACpLgMReGOnkxRTZ
 5cCR0G2QrtAuXf7Msmn6xuLzKhR7rk7bI0LOAHyZBtYiAE/U219aV9w9pAMoHOBXScvVJzJ1ITweb
 q41BtyqfX5T02Awsmk9AVmPe1SxBXJvV+k6GtG4ovM5N310b1iJCPRLX5pcqbpP2HDax2X2Zm/YmJ
 KajG5p+w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nzANu-00GnN3-B4; Thu, 09 Jun 2022 05:07:06 +0000
Date: Wed, 8 Jun 2022 22:07:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH RFC v1 6/7] virtio: use io_tlb_high_mem if it is active
Message-ID: <YqF/+tqMA7GtjfAY@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-7-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609005553.30954-7-dongli.zhang@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: jgross@suse.com, dave.hansen@linux.intel.com, mst@redhat.com,
 konrad.wilk@oracle.com, mpe@ellerman.id.au, x86@kernel.org, joe.jin@oracle.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 hch@infradead.org, iommu@lists.linux-foundation.org, mingo@redhat.com,
 bp@alien8.de, sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com
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

On Wed, Jun 08, 2022 at 05:55:52PM -0700, Dongli Zhang wrote:
>  /* Unique numbering for virtio devices. */
> @@ -241,6 +243,12 @@ static int virtio_dev_probe(struct device *_d)
>  	u64 device_features;
>  	u64 driver_features;
>  	u64 driver_features_legacy;
> +	struct device *parent = dev->dev.parent;
> +	u64 dma_mask = min_not_zero(*parent->dma_mask,
> +				    parent->bus_dma_limit);
> +
> +	if (dma_mask == DMA_BIT_MASK(64))
> +		swiotlb_use_high(parent);

The driver already very clearly communicated its addressing
requirements.  The underlying swiotlb code needs to transparently
pick the right pool.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
