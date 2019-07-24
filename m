Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BFF74145
	for <lists.virtualization@lfdr.de>; Thu, 25 Jul 2019 00:11:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3CB9515A8;
	Wed, 24 Jul 2019 22:11:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 706CA157E
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 22:11:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 437D18A3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 22:11:00 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l9so47097231qtu.6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 15:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=ZiT1oQ3le6gupTI0pwbmKNqZ9qeZj4CLKlZRplQnTAY=;
	b=jveDjIQy3HDtnVk8GM6SmaarxWBpeq1Ok/BGMic6jGD73L9xwaGKCdkgU1rxmLl00n
	y3yVKCaRbPI7kRtBIFlWrUnpN63S6mZd6g6jc5XZTHQVO4XvChjRyvqh6g4B/f3zY/h+
	c29evRPUpQ5TTDv3fGBjoOEU9Ditmi2qdsFSBenLDb5HD+FoJqqnNkVmqPWD1r8UGuEH
	pxJxabTsm0Cfs22/fDtDxXtaFssOwZNFpe9W9s9w3fpBwvNYPIrojCxbTaHwIOUNXsvX
	g14a/ZrG+YwMqhyCjPh3CiicpU20TPd7asYmfmIlXp+kRaFjH9Y9LGt+SI2y6Oqa3iWa
	vg+g==
X-Gm-Message-State: APjAAAWvYTKbdFKBjRroNdLP85JSmNxAs3K6jusHwSwmkImxX3ZEGRrL
	BZRWGF3mEiIyi/yyM7oTVVTVBw==
X-Google-Smtp-Source: APXvYqwsl34mAeI1ycJq/WD6DI4M1e7pIzRNfVQKDNOWFybfH6EBHoRGki9/ggsy5dsu/ZaP8T89Pw==
X-Received: by 2002:ac8:3014:: with SMTP id f20mr59384146qte.69.1564006259498; 
	Wed, 24 Jul 2019 15:10:59 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	g54sm28199760qtc.61.2019.07.24.15.10.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 15:10:58 -0700 (PDT)
Date: Wed, 24 Jul 2019 18:10:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] virtio/virtio_ring: Fix the dma_max_mapping_size call
Message-ID: <20190723114750-mutt-send-email-mst@kernel.org>
References: <20190722145509.1284-1-eric.auger@redhat.com>
	<20190722145509.1284-3-eric.auger@redhat.com>
	<e4a288f2-a93a-5ce4-32da-f5434302551f@arm.com>
	<20190723153851.GE720@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723153851.GE720@lst.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Eric Auger <eric.auger@redhat.com>,
	iommu@lists.linux-foundation.org, eric.auger.pro@gmail.com,
	Robin Murphy <robin.murphy@arm.com>, m.szyprowski@samsung.com
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

On Tue, Jul 23, 2019 at 05:38:51PM +0200, Christoph Hellwig wrote:
> On Mon, Jul 22, 2019 at 04:36:09PM +0100, Robin Murphy wrote:
> >> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> >> index c8be1c4f5b55..37c143971211 100644
> >> --- a/drivers/virtio/virtio_ring.c
> >> +++ b/drivers/virtio/virtio_ring.c
> >> @@ -262,7 +262,7 @@ size_t virtio_max_dma_size(struct virtio_device *vdev)
> >>   {
> >>   	size_t max_segment_size = SIZE_MAX;
> >>   -	if (vring_use_dma_api(vdev))
> >> +	if (vring_use_dma_api(vdev) && vdev->dev.dma_mask)
> >
> > Hmm, might it make sense to roll that check up into vring_use_dma_api() 
> > itself? After all, if the device has no mask then it's likely that other 
> > DMA API ops wouldn't really work as expected either.
> 
> Makes sense to me.

Christoph - would a documented API wrapping dma_mask make sense?
With the documentation explaining how users must
desist from using DMA APIs if that returns false ...


-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
