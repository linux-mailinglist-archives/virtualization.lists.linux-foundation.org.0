Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 555F9708F7
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 20:57:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 04A77CC4;
	Mon, 22 Jul 2019 18:57:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A0CD786D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 18:57:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 35CA0102
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 18:57:11 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id u3so26964314vsh.6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 11:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=G3LydhjrGZyGaJaE+altqgbzUT7GXQbjY/6XoX/pvZc=;
	b=hZPHIK8J7egq2lhPACcRmFkutfyO0sHX1Il+ANLs7MCNeFSi6c3V4AsFOy/bc4trVx
	1m3gN3AN9OMzucblcmWxTcTd+5zugW+obpaxRNXjFMuS+ij42d9j5bsvbR5Tl9SSNxug
	Ot1z9NMOWYaiuALgLwQnlw9IRaLXPUdynJh3+WzBoFqh0Be05UYdhSLL8cRJGX9ViXJw
	Pj/B66hH+M0wS9Pz7luZ03S18rhlk1oIzHT6wSCviOJ2D3RJVWge+/fsQ+z5wAC4AO/q
	p1oP46csmj60rdgPBrC6N8+gNMZVe4R1wKItoh9Lz5xc7FyKRYrDN93pPP5c01ZKX1Bm
	RP8w==
X-Gm-Message-State: APjAAAVOuIULT+qtFT89OfcNAhSwa5YKp1PDmgFsiVYGkjebqawcg9yC
	3tNL3cya0qO2IEdk2AVYk7uTnA==
X-Google-Smtp-Source: APXvYqzW0y3QVeCN9/3wXCNVqVYfu/ELakwZssJ444dY3sQr1CJFwY193H4yB3WcP4zsonz0yfKcug==
X-Received: by 2002:a67:8c84:: with SMTP id
	o126mr44506592vsd.122.1563821830405; 
	Mon, 22 Jul 2019 11:57:10 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	l129sm38783525vki.45.2019.07.22.11.57.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 11:57:09 -0700 (PDT)
Date: Mon, 22 Jul 2019 14:57:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v2] dma-mapping: Use dma_get_mask in dma_addressing_limited
Message-ID: <20190722145639-mutt-send-email-mst@kernel.org>
References: <20190722165149.3763-1-eric.auger@redhat.com>
	<77ba1061-08b6-421e-a6dd-d5db9851325b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77ba1061-08b6-421e-a6dd-d5db9851325b@redhat.com>
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

On Mon, Jul 22, 2019 at 06:56:49PM +0200, Auger Eric wrote:
> Hi Christoph,
> 
> On 7/22/19 6:51 PM, Eric Auger wrote:
> > We currently have cases where the dma_addressing_limited() gets
> > called with dma_mask unset. This causes a NULL pointer dereference.
> > 
> > Use dma_get_mask() accessor to prevent the crash.
> > 
> > Fixes: b866455423e0 ("dma-mapping: add a dma_addressing_limited helper")
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> As a follow-up of my last email, here is a patch featuring
> dma_get_mask(). But you don't have the WARN_ON_ONCE anymore, pointing
> out suspect users.

OTOH these users then simply become okay so no need for WARN_ON_ONCE
then :)

> Feel free to pick up your preferred approach
> 
> Thanks
> 
> Eric
> > 
> > ---
> > 
> > v1 -> v2:
> > - was [PATCH 1/2] dma-mapping: Protect dma_addressing_limited
> >   against NULL dma_mask
> > - Use dma_get_mask
> > ---
> >  include/linux/dma-mapping.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> > index e11b115dd0e4..f7d1eea32c78 100644
> > --- a/include/linux/dma-mapping.h
> > +++ b/include/linux/dma-mapping.h
> > @@ -689,8 +689,8 @@ static inline int dma_coerce_mask_and_coherent(struct device *dev, u64 mask)
> >   */
> >  static inline bool dma_addressing_limited(struct device *dev)
> >  {
> > -	return min_not_zero(*dev->dma_mask, dev->bus_dma_mask) <
> > -		dma_get_required_mask(dev);
> > +	return min_not_zero(dma_get_mask(dev), dev->bus_dma_mask) <
> > +			    dma_get_required_mask(dev);
> >  }
> >  
> >  #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
> > 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
