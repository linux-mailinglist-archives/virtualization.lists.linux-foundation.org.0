Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FE3703BA
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 17:27:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B7BF9D90;
	Mon, 22 Jul 2019 15:26:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9E4FFD13;
	Mon, 22 Jul 2019 15:26:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4C0B7102;
	Mon, 22 Jul 2019 15:26:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3C11868B20; Mon, 22 Jul 2019 17:26:38 +0200 (CEST)
Date: Mon, 22 Jul 2019 17:26:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 1/2] dma-mapping: Protect dma_addressing_limited
	against NULL dma_mask
Message-ID: <20190722152637.GA3780@lst.de>
References: <20190722145509.1284-1-eric.auger@redhat.com>
	<20190722145509.1284-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722145509.1284-2-eric.auger@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mst@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, eric.auger.pro@gmail.com,
	robin.murphy@arm.com, hch@lst.de, m.szyprowski@samsung.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

>  static inline bool dma_addressing_limited(struct device *dev)
>  {
> -	return min_not_zero(*dev->dma_mask, dev->bus_dma_mask) <
> -		dma_get_required_mask(dev);
> +	return WARN_ON_ONCE(!dev->dma_mask) ? false :
> +		min_not_zero(*dev->dma_mask, dev->bus_dma_mask) <
> +			dma_get_required_mask(dev);

This should really use a separate if statement, but I can fix that
up when applying it.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
