Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A892166913
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 21:55:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8B63D87DAA;
	Thu, 20 Feb 2020 20:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iO71deIsS5U; Thu, 20 Feb 2020 20:55:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A7EA887DAF;
	Thu, 20 Feb 2020 20:55:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7264DC013E;
	Thu, 20 Feb 2020 20:55:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE7B3C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A814486403
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 20:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_enpVBewZfT
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 20:55:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6A51E86055
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 20:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582232125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n59pKOcdTZlkr3iRkuuDYSYR3kx21EL+m/7qJp3dlcc=;
 b=OxDQkgG+l3mkTGVsRSInXXmLoxDkX4gJGZA6PxrRHPU3tCQlKxgd43v1HAFknkL2i2iqNa
 23KodkJ7RyQk/uXhlIIExzkPVS5O2oGGsKe8HwZObi7nVhfPlMDOqlJWB2Gie5Prpdsuj4
 ZaQdyYZq5YcuYmeCzikSXC1nGtF52tg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-_2b2aHf6OiWoHQ0HocQZ-w-1; Thu, 20 Feb 2020 15:55:22 -0500
Received: by mail-qt1-f197.google.com with SMTP id o24so9919qtr.17
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 12:55:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n59pKOcdTZlkr3iRkuuDYSYR3kx21EL+m/7qJp3dlcc=;
 b=m2XDXBdsSHSystqy2eXflkAe9ikt2j3OvfIyMpJ03pIbOqyfaFd6BbX+5kDy9DZmMV
 VSPYZC2WKQfB506HYj1y7nhe+SKiWwDlYW2w11/f+YrwIzlKkbv/Zpnl06cUZoMtlDxk
 aw4/7LLkBzDavaS82f4SjGgu0a3wEQPLbKVwiki+PCmRaKczcJd1lMwuGqBtk5yh2NlQ
 TN2WXjnR8UjOrbHyR4Yn55aOWfyEq7xYKRNdD12n0g3+/gVZgVz/4bq+MUlL1EEXab3A
 o6bJgvuv/KK4Lfu3//7KlymFJOZeSsA0Yv1XcMOnbhUIa4eh1OpNQj+oqtiHI/xr7ZVd
 nxCQ==
X-Gm-Message-State: APjAAAVN4JAl4443g21FUGrYe8bQ9i5dVjgqnDIOUiBKEkzSuVdj/yB0
 EnCb3w2mvaUwxOkuMAuhrivgPtf4vmuBsZQpPCzKu3GTMDE7fDnUvzshpki582oPgRNjmUrNIf+
 qqsY5E/Te+WZnnkaWCtml8OwODtqzm7m0gEyYHEiQaw==
X-Received: by 2002:a0c:b920:: with SMTP id u32mr26145213qvf.173.1582232121721; 
 Thu, 20 Feb 2020 12:55:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyYbEyWlyA1CtyLkpPuUF6uywJfTlRwR2s/p8kqFjjrgLX6Ni1df+OO/USj4ggxNDPJ4/sgrw==
X-Received: by 2002:a0c:b920:: with SMTP id u32mr26145171qvf.173.1582232121178; 
 Thu, 20 Feb 2020 12:55:21 -0800 (PST)
Received: from redhat.com (bzq-109-67-14-209.red.bezeqint.net. [109.67.14.209])
 by smtp.gmail.com with ESMTPSA id g19sm391571qkk.91.2020.02.20.12.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 12:55:20 -0800 (PST)
Date: Thu, 20 Feb 2020 15:55:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 2/2] virtio: let virtio use DMA API when guest RAM is
 protected
Message-ID: <20200220154904-mutt-send-email-mst@kernel.org>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220160606.53156-3-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20200220160606.53156-3-pasic@linux.ibm.com>
X-MC-Unique: _2b2aHf6OiWoHQ0HocQZ-w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, David Gibson <david@gibson.dropbear.id.au>,
 Michael Mueller <mimu@linux.ibm.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On Thu, Feb 20, 2020 at 05:06:06PM +0100, Halil Pasic wrote:
> Currently the advanced guest memory protection technologies (AMD SEV,
> powerpc secure guest technology and s390 Protected VMs) abuse the
> VIRTIO_F_IOMMU_PLATFORM flag to make virtio core use the DMA API, which
> is in turn necessary, to make IO work with guest memory protection.
> 
> But VIRTIO_F_IOMMU_PLATFORM a.k.a. VIRTIO_F_ACCESS_PLATFORM is really a
> different beast: with virtio devices whose implementation runs on an SMP
> CPU we are still fine with doing all the usual optimizations, it is just
> that we need to make sure that the memory protection mechanism does not
> get in the way. The VIRTIO_F_ACCESS_PLATFORM mandates more work on the
> side of the guest (and possibly he host side as well) than we actually
> need.
> 
> An additional benefit of teaching the guest to make the right decision
> (and use DMA API) on it's own is: removing the need, to mandate special
> VM configuration for guests that may run with protection. This is
> especially interesting for s390 as VIRTIO_F_IOMMU_PLATFORM pushes all
> the virtio control structures into the first 2G of guest memory:
> something we don't necessarily want to do per-default.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Tested-by: Ram Pai <linuxram@us.ibm.com>
> Tested-by: Michael Mueller <mimu@linux.ibm.com>

This might work for you but it's fragile, since without
VIRTIO_F_ACCESS_PLATFORM hypervisor assumes it gets
GPA's, not DMA addresses.



IOW this looks like another iteration of:

	virtio: Support encrypted memory on powerpc secure guests

which I was under the impression was abandoned as unnecessary.


To summarize, the necessary conditions for a hack along these lines
(using DMA API without VIRTIO_F_ACCESS_PLATFORM) are that we detect that:

  - secure guest mode is enabled - so we know that since we don't share
    most memory regular virtio code won't
    work, even though the buggy hypervisor didn't set VIRTIO_F_ACCESS_PLATFORM
  - DMA API is giving us addresses that are actually also physical
    addresses
  - Hypervisor is buggy and didn't enable VIRTIO_F_ACCESS_PLATFORM
 
I don't see how this patch does this.


> ---
>  drivers/virtio/virtio_ring.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 867c7ebd3f10..fafc8f924955 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -243,6 +243,9 @@ static bool vring_use_dma_api(struct virtio_device *vdev)
>  	if (!virtio_has_iommu_quirk(vdev))
>  		return true;
>  
> +	if (force_dma_unencrypted(&vdev->dev))
> +		return true;
> +
>  	/* Otherwise, we are left to guess. */
>  	/*
>  	 * In theory, it's possible to have a buggy QEMU-supposed
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
