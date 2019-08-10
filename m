Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0062E88CD0
	for <lists.virtualization@lfdr.de>; Sat, 10 Aug 2019 20:57:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 151C9B2F;
	Sat, 10 Aug 2019 18:57:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 63820B1F
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 18:57:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CC0967D2
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 18:57:25 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id 201so74169683qkm.9
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 11:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=n6gqfGDHe7+MTEnADmz166g2MOtyyjqswDo8TxgNKgo=;
	b=IFwkiAOBsrbMvaJcnVR9v8q/lWrZ2xdU6atnxHjUL5qX0usqycqvzPcMEK70vNU+Yk
	YYZOpiH/ppB4zb8ctH0tyV3FCbDluzXSGzOo6XDPddF+RgKoRsw7sHdDpmdXypSiWCLb
	K5wmMBKY2oYOTLSJciKOL6UY4v/F1aYK/lzDwu0DibkDOh3b0Jtea2Kz7XkDcVbj4w5w
	VCtjdSQGZEpcU8LKyASN9kAds0gX6ZYV3d/lnRCeugWvolGYS7g3WxQtQ9tSJgnsGVyw
	JoIojsSlmZZF+g7JKrB0kRAAp/yMGXCLJY+jVHakJn5n+0osGdbaSjFEb+xpUExaI3lQ
	0NMw==
X-Gm-Message-State: APjAAAU+hha3P5GtiyP8hhY8rJRBvX8HnaDgJIitFk0pHWZVE1K1wInx
	/IHJs7aV+ROpOhrhQaHymPb2KA==
X-Google-Smtp-Source: APXvYqwuyeU8UtFCpYJUCrWlfgo5mzoYufqwOGAgTcpKSjKBKpcYs8i84bGcIhjBa4714/V3v9R2eQ==
X-Received: by 2002:a05:620a:1f0:: with SMTP id
	x16mr12879248qkn.11.1565463444927; 
	Sat, 10 Aug 2019 11:57:24 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	l3sm100152qkb.67.2019.08.10.11.57.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 10 Aug 2019 11:57:23 -0700 (PDT)
Date: Sat, 10 Aug 2019 14:57:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190810143038-mutt-send-email-mst@kernel.org>
References: <87zhrj8kcp.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zhrj8kcp.fsf@morokweng.localdomain>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexey Kardashevskiy <aik@linux.ibm.com>,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Paul Mackerras <paulus@ozlabs.org>, iommu@lists.linux-foundation.org,
	linuxppc-devel@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	David Gibson <david@gibson.dropbear.id.au>
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

On Tue, Jan 29, 2019 at 03:08:12PM -0200, Thiago Jung Bauermann wrote:
> 
> Hello,
> 
> With Christoph's rework of the DMA API that recently landed, the patch
> below is the only change needed in virtio to make it work in a POWER
> secure guest under the ultravisor.
> 
> The other change we need (making sure the device's dma_map_ops is NULL
> so that the dma-direct/swiotlb code is used) can be made in
> powerpc-specific code.
> 
> Of course, I also have patches (soon to be posted as RFC) which hook up
> <linux/mem_encrypt.h> to the powerpc secure guest support code.
> 
> What do you think?
> 
> >From d0629a36a75c678b4a72b853f8f7f8c17eedd6b3 Mon Sep 17 00:00:00 2001
> From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Date: Thu, 24 Jan 2019 22:08:02 -0200
> Subject: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
> 
> The host can't access the guest memory when it's encrypted, so using
> regular memory pages for the ring isn't an option. Go through the DMA API.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  drivers/virtio/virtio_ring.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index cd7e755484e3..321a27075380 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -259,8 +259,11 @@ static bool vring_use_dma_api(struct virtio_device *vdev)
>  	 * not work without an even larger kludge.  Instead, enable
>  	 * the DMA API if we're a Xen guest, which at least allows
>  	 * all of the sensible Xen configurations to work correctly.
> +	 *
> +	 * Also, if guest memory is encrypted the host can't access
> +	 * it directly. In this case, we'll need to use the DMA API.
>  	 */
> -	if (xen_domain())
> +	if (xen_domain() || sev_active())
>  		return true;
> 
>  	return false;

So I gave this lots of thought, and I'm coming round to
basically accepting something very similar to this patch.

But not exactly like this :).

Let's see what are the requirements.

If

1. We do not trust the device (so we want to use a bounce buffer with it)
2. DMA address is also a physical address of a buffer

then we should use DMA API with virtio.


sev_active() above is one way to put (1).  I can't say I love it but
it's tolerable.


But we also want promise from DMA API about 2.


Without promise 2 we simply can't use DMA API with a legacy device.


Otherwise, on a SEV system with an IOMMU which isn't 1:1
and with a virtio device without ACCESS_PLATFORM, we are trying
to pass a virtual address, and devices without ACCESS_PLATFORM
can only access CPU physical addresses.

So something like:

dma_addr_is_phys_addr?



-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
