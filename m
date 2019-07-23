Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BE50B71C15
	for <lists.virtualization@lfdr.de>; Tue, 23 Jul 2019 17:47:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4E78CB7A;
	Tue, 23 Jul 2019 15:47:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 59CD5B50
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 15:47:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DE5208BE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 15:47:34 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id j2so17085782uaq.5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 08:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=EVAD8Vf0X0incVqfNJDqjZVDQjwtcJn0P5gsd+3TH3w=;
	b=TrWUCjtOPukj0nP7mwQe31kNxUID6rlcFbgJMnNlAGWQWTVYyZpABaX73hc8T9trR4
	NO22/UuOo5RAlmN/jHolqIvw8rOrNmexlf1DChHdKjOCKYGfiKGVBwrBVcl6iZG7Exap
	84w4nzVKy2Jbiik9w2DDOtJgXvZO7979p/ujGxwYu388EGcIXY+nxrfaZCC90vB9O2AG
	Va9C0tOiCgHv+9x3Nl+js59kU1GKICSx7RW199CvGs9WL6v1iG65jELdY5ROTuCjkM0F
	nc7KpyGcBQl2ISIlAK7VxoC3o4UndukwXPmGs3Y/HtZLUDpoU116vVcUo01XUUdAoo89
	2OMQ==
X-Gm-Message-State: APjAAAV/fNx2/JpZQhP4BPpdTPDXYoiuHOmp/BHOmQqWDSt9rBUi6Bx8
	ad0r2k+dTSzwQA+yo0pXVbvneg==
X-Google-Smtp-Source: APXvYqzIzHEVdbHcpvt3jUNOAipVxZHK2T6eMul3vNE3BHOosQ4+ZcwjKuMyZs2L9p2YrV6mjmClLw==
X-Received: by 2002:ab0:734f:: with SMTP id k15mr19186395uap.28.1563896853769; 
	Tue, 23 Jul 2019 08:47:33 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	j138sm17625220vka.11.2019.07.23.08.47.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 08:47:32 -0700 (PDT)
Date: Tue, 23 Jul 2019 11:47:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] virtio/virtio_ring: Fix the dma_max_mapping_size call
Message-ID: <20190723114504-mutt-send-email-mst@kernel.org>
References: <20190722145509.1284-1-eric.auger@redhat.com>
	<20190722145509.1284-3-eric.auger@redhat.com>
	<20190722112704-mutt-send-email-mst@kernel.org>
	<20190723153830.GD720@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723153830.GD720@lst.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Eric Auger <eric.auger@redhat.com>,
	iommu@lists.linux-foundation.org, eric.auger.pro@gmail.com,
	robin.murphy@arm.com, m.szyprowski@samsung.com
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

On Tue, Jul 23, 2019 at 05:38:30PM +0200, Christoph Hellwig wrote:
> On Mon, Jul 22, 2019 at 11:33:35AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Jul 22, 2019 at 04:55:09PM +0200, Eric Auger wrote:
> > > Do not call dma_max_mapping_size for devices that have no DMA
> > > mask set, otherwise we can hit a NULL pointer dereference.
> > > 
> > > This occurs when a virtio-blk-pci device is protected with
> > > a virtual IOMMU.
> > > 
> > > Fixes: e6d6dd6c875e ("virtio: Introduce virtio_max_dma_size()")
> > > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > > Suggested-by: Christoph Hellwig <hch@lst.de>
> > 
> > Christoph, I wonder why did you suggest this?
> > The connection between dma_mask and dma_max_mapping_size
> > is far from obvious.  The documentation doesn't exist.
> > Do we really have to teach all users about this hack?
> > Why not just make dma_max_mapping_size DTRT?
> 
> Because we should not call into dma API functions for devices that
> are not DMA capable.

I'd rather call is_device_dma_capable then, better than poking
at DMA internals.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
