Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A2C5442EB
	for <lists.virtualization@lfdr.de>; Thu,  9 Jun 2022 07:09:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2B6941B95;
	Thu,  9 Jun 2022 05:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0F-DMRVXZ4p; Thu,  9 Jun 2022 05:08:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 78A8941B72;
	Thu,  9 Jun 2022 05:08:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2FC0C0081;
	Thu,  9 Jun 2022 05:08:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7AE2C002D;
 Thu,  9 Jun 2022 05:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D39B541B95;
 Thu,  9 Jun 2022 05:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Umxccx4P-mdV; Thu,  9 Jun 2022 05:08:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A2F041B72;
 Thu,  9 Jun 2022 05:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1370MvjFrg636nlGFXu8CpOfBg8+mRgqzhQ7YScZLE8=; b=z4YKvf9NkWQn8P4v8bwSUJFMzO
 wFYfxYFg0PkZgnD659U4rh7iitXqzKlNSVwWTA1C2nrNn5h07lgmlJhc0ReHis19xaonefaZB6sxZ
 +V+P9DVDmD/46UTQmN/JjdZTZZAQC5fMv8RMAMMUgf2fXLubCn2cMrYDqfdfylD9qDdZdNi8P/Svh
 J+9KZ2qoXLt20f3lL7nsIP15svEtGRlcPZ9rH5GjuL/37Zo1WS6wUeHHKMNr3CNoOja+2Q00FXJVs
 gHmBMVQKXvRtoRkoEQ8E3W/0xik7QAo//cz+ATtxhmw/3yPF5rc4z1d9FC8BroUGeyAeuXFwnjhyj
 BRV2y6Ug==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nzAPe-00Gnin-I4; Thu, 09 Jun 2022 05:08:54 +0000
Date: Wed, 8 Jun 2022 22:08:54 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH RFC v1 3/7] swiotlb-xen: support highmem for xen specific
 code
Message-ID: <YqGAZoG6/pVX9NqN@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-4-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609005553.30954-4-dongli.zhang@oracle.com>
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

On Wed, Jun 08, 2022 at 05:55:49PM -0700, Dongli Zhang wrote:
> @@ -109,19 +110,25 @@ int xen_swiotlb_fixup(void *buf, unsigned long nslabs, bool high)
>  	int rc;
>  	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
>  	unsigned int i, dma_bits = order + PAGE_SHIFT;
> +	unsigned int max_dma_bits = MAX_DMA32_BITS;
>  	dma_addr_t dma_handle;
>  	phys_addr_t p = virt_to_phys(buf);
>  
>  	BUILD_BUG_ON(IO_TLB_SEGSIZE & (IO_TLB_SEGSIZE - 1));
>  	BUG_ON(nslabs % IO_TLB_SEGSIZE);
>  
> +	if (high) {
> +		dma_bits = MAX_DMA64_BITS;
> +		max_dma_bits = MAX_DMA64_BITS;
> +	}
> +

I think you really want to pass the addressing bits or mask to the
remap callback and not do magic with a 'high' flag here.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
