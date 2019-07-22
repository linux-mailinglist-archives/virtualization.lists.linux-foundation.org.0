Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE0C708D6
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 20:45:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4C074E57;
	Mon, 22 Jul 2019 18:45:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C1EE8E43
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 18:45:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5467C7C3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 18:45:26 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id m8so27025417vsj.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 11:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=0oC255nlMTJCbfZqi2fsaWmaMOyLtXK3narxYZHsJ+g=;
	b=USiEk5nl1uYyyDo8Ed9DSSZmBI8eHINlgtlpB+JOrdc+Lvk4nEmMxTVssSjb+1TEeQ
	cKOqi7539flNWssvzKAsSaKtDHgG7u/9eDDY91rXWdq3X2egaIx8sZUKtRCQkFYM6NkE
	9PHa2mkkeCa8d7VC7AfoXTKsbkdPFGhyEcD29VbwQHDOhsN1MdgoCmlS+LE0rHmEiyF6
	VSIqvfv9TPpu2bIupcD9/kZRDgJK147A67cnfMfBNnAv1QDob6unrHU6zfqPWl8BNWhs
	qAp9iTwcXhyqTk4Y7JzreR63cbpqpTcA0vhKazKbeybV6kF3T2KxgGJOgHLf9iak6EAR
	wS8w==
X-Gm-Message-State: APjAAAXzxEIaowA21fRJZyPEJErNEXXpztbgpv0xXLTf9sbmFoI0ojRc
	a/qXyg9fxPeXqh/a5dFudxRWQA==
X-Google-Smtp-Source: APXvYqy1dMOsoJwK19xN4gvienu0+UYNi8SU4/cq7VQCMGv+XWMnqskbibzUi+xg/xwOJYk7B7n4Xw==
X-Received: by 2002:a67:7a11:: with SMTP id v17mr45678796vsc.114.1563821125566;
	Mon, 22 Jul 2019 11:45:25 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	u8sm15327600vke.34.2019.07.22.11.45.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 11:45:24 -0700 (PDT)
Date: Mon, 22 Jul 2019 14:45:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2] dma-mapping: Use dma_get_mask in dma_addressing_limited
Message-ID: <20190722143724-mutt-send-email-mst@kernel.org>
References: <20190722165149.3763-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722165149.3763-1-eric.auger@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
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

On Mon, Jul 22, 2019 at 06:51:49PM +0200, Eric Auger wrote:
> We currently have cases where the dma_addressing_limited() gets
> called with dma_mask unset. This causes a NULL pointer dereference.
> 
> Use dma_get_mask() accessor to prevent the crash.
> 
> Fixes: b866455423e0 ("dma-mapping: add a dma_addressing_limited helper")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

If possible I really prefer this approach: avoids changing all callers
and uses documented interfaces.

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
> -- 
> 2.20.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
