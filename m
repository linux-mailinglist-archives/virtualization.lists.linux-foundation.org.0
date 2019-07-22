Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 598487063F
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 18:57:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7C027E38;
	Mon, 22 Jul 2019 16:57:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7E79FE22;
	Mon, 22 Jul 2019 16:57:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 37DD9102;
	Mon, 22 Jul 2019 16:56:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C400C3082133;
	Mon, 22 Jul 2019 16:56:55 +0000 (UTC)
Received: from [10.36.116.45] (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B74719D71;
	Mon, 22 Jul 2019 16:56:51 +0000 (UTC)
Subject: Re: [PATCH v2] dma-mapping: Use dma_get_mask in dma_addressing_limited
To: eric.auger.pro@gmail.com, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, mst@redhat.com, jasowang@redhat.com,
	virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20190722165149.3763-1-eric.auger@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <77ba1061-08b6-421e-a6dd-d5db9851325b@redhat.com>
Date: Mon, 22 Jul 2019 18:56:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190722165149.3763-1-eric.auger@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 22 Jul 2019 16:56:55 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

Hi Christoph,

On 7/22/19 6:51 PM, Eric Auger wrote:
> We currently have cases where the dma_addressing_limited() gets
> called with dma_mask unset. This causes a NULL pointer dereference.
> 
> Use dma_get_mask() accessor to prevent the crash.
> 
> Fixes: b866455423e0 ("dma-mapping: add a dma_addressing_limited helper")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

As a follow-up of my last email, here is a patch featuring
dma_get_mask(). But you don't have the WARN_ON_ONCE anymore, pointing
out suspect users.

Feel free to pick up your preferred approach

Thanks

Eric
> 
> ---
> 
> v1 -> v2:
> - was [PATCH 1/2] dma-mapping: Protect dma_addressing_limited
>   against NULL dma_mask
> - Use dma_get_mask
> ---
>  include/linux/dma-mapping.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index e11b115dd0e4..f7d1eea32c78 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -689,8 +689,8 @@ static inline int dma_coerce_mask_and_coherent(struct device *dev, u64 mask)
>   */
>  static inline bool dma_addressing_limited(struct device *dev)
>  {
> -	return min_not_zero(*dev->dma_mask, dev->bus_dma_mask) <
> -		dma_get_required_mask(dev);
> +	return min_not_zero(dma_get_mask(dev), dev->bus_dma_mask) <
> +			    dma_get_required_mask(dev);
>  }
>  
>  #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
