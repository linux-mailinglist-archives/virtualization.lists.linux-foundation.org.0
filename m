Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB9C1D2D69
	for <lists.virtualization@lfdr.de>; Thu, 14 May 2020 12:51:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E393F88677;
	Thu, 14 May 2020 10:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L3yI0gDgXTEt; Thu, 14 May 2020 10:51:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 523E788222;
	Thu, 14 May 2020 10:51:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A4E3C016F;
	Thu, 14 May 2020 10:51:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03D0BC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 10:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E61CB860FD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 10:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ywqy7los0nqV
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 10:51:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 495A884FB0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 10:50:28 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l18so3321162wrn.6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 03:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=38QmTxTEvJ+S2RAZ0sqfJydd1bsWIjyWyPL61uxbueE=;
 b=dXTFxbV4xPkr5lF2OCPKqUedgY0t6sReFjLznPu8135QK1a7rG1EDc7ReEtI+gsX1h
 9nhI7PGvc/jd2PFL3fifUvYOGN+czY8t1oia8m+HcwcgEH7qC3hmBXDtVGofOoNjEIDF
 +2oqoMus5jTzc2G8j14KYFk4pXUokob/sWThr/k4MNOy9fZLL8bBZoV7IWl7lDWBCDz+
 +9yowUBLrz6Upsqvh+Au4cUJ+7qcROlpazLY8IYe1eYkoFzm08OwcNJYl5sWVDMuaJQX
 H7EKrdPecwNVecOO8hsM00VbT366cc9mPfmKH/CWt25eLTsiZSNQCcuqh1/eL/5kw9NR
 iG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=38QmTxTEvJ+S2RAZ0sqfJydd1bsWIjyWyPL61uxbueE=;
 b=EqioRkK3jmI1GcTADMEQjk5stJNI52NxD1npr0u1Rn8BYSEFaMbTXvjc1lmVjSQ/lX
 jfpZEcDUE30w7oh1kLm8yYLMqfbvLOWiZUNtUBhgLcGyOS3VM7Cpg2Xj1EY/cg92HuGQ
 amqd0vOkNGRd+a1wGSuP1sQvDYKWb9wVDuPplVM9MxBhdkT1f4wYP7a8jTBdJeD5Z49L
 c3B+quLsINW/EknTU2/pvTiMqnJ1mT/ZgR+KRZSgOaXkzhnhjE4rt7Gimxr8c2QRFti4
 d95ohTcRTYP/56vtIbKW5THU2P49Otmnpq8MBAOnM77Lw+KP4CCuN+IwTjE4s0mDJbAm
 rAAA==
X-Gm-Message-State: AOAM530il9aLbdYVt3zW3MJVYiCde9ys9R6AOjaOLKF3IhqKRCpFmf8t
 bisvIOTgJY+PILYxf2MpFOzZxg==
X-Google-Smtp-Source: ABdhPJylSdZ+y+t7WLaiGVL0w8Eft2SxOfv0jQvv/uh4mawVTFMnwcN4CUndqM6JXoUXPa2i1y2wyQ==
X-Received: by 2002:adf:d0d1:: with SMTP id z17mr5069970wrh.175.1589453426540; 
 Thu, 14 May 2020 03:50:26 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id g135sm22120343wme.22.2020.05.14.03.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 03:50:26 -0700 (PDT)
Date: Thu, 14 May 2020 12:50:16 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v6] iommu/virtio: Use page size bitmap supported by
 endpoint
Message-ID: <20200514105016.GA2252@myrica>
References: <20200514075237.3941-1-bbhushan2@marvell.com>
 <20200514043747-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514043747-mutt-send-email-mst@kernel.org>
Cc: virtio-dev@lists.oasis-open.org, joro@8bytes.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eric.auger@redhat.com, iommu@lists.linux-foundation.org,
 Bharat Bhushan <bbhushan2@marvell.com>, eric.auger.pro@gmail.com
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

On Thu, May 14, 2020 at 05:31:00AM -0400, Michael S. Tsirkin wrote:
> On Thu, May 14, 2020 at 01:22:37PM +0530, Bharat Bhushan wrote:
> > Different endpoint can support different page size, probe
> > endpoint if it supports specific page size otherwise use
> > global page sizes.
> > 
> > Device attached to domain should support a minimum of
> > domain supported page sizes. If device supports more
> > than domain supported page sizes then device is limited
> > to use domain supported page sizes only.
> 
> OK so I am just trying to figure it out.
> Before the patch, we always use the domain supported page sizes
> right?
> 
> With the patch, we still do, but we also probe and
> validate that device supports all domain page sizes,
> if it does not then we fail to attach the device.

Generally there is one endpoint per domain. Linux creates the domains and
decides which endpoint goes in which domain. It puts multiple endpoints in
a domain in two cases:

* If endpoints cannot be isolated from each others by the IOMMU, for
  example if ACS isolation isn't enabled in PCIe. In that case endpoints
  are in the same IOMMU group, and therefore contained in the same domain.
  This is more of a quirk for broken hardware, and isn't much of a concern
  for virtualization because it's easy for the hypervisor to present
  endpoints isolated from each others.

* If userspace wants to put endpoints in the same VFIO container, then
  VFIO first attempts to put them in the same IOMMU domain, and falls back
  to multiple domains if that fails. That case is just a luxury and we
  shouldn't over-complicate the driver to cater for this.

So the attach checks don't need to be that complicated. Checking that the
page masks are exactly the same should be enough.

> This seems like a lot of effort for little benefit, can't
> hypervisor simply make sure endpoints support the
> iommu page sizes for us?

I tend to agree, it's not very likely that we'll have a configuration with
different page sizes between physical and virtual endpoints.

If there is a way for QEMU to simply reject VFIO devices that don't use
the same page mask as what's configured globally, let's do that instead of
introducing the page_size_mask property.

> > @@ -615,7 +636,7 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
> >  	struct viommu_dev *viommu = vdev->viommu;
> >  	struct viommu_domain *vdomain = to_viommu_domain(domain);
> >  
> > -	viommu_page_size = 1UL << __ffs(viommu->pgsize_bitmap);
> > +	viommu_page_size = 1UL << __ffs(vdev->pgsize_bitmap);
> >  	if (viommu_page_size > PAGE_SIZE) {
> >  		dev_err(vdev->dev,
> >  			"granule 0x%lx larger than system page size 0x%lx\n",
> 
> 
> Looks like this is messed up on 32 bit: e.g. 0x100000000 will try to do
> 1UL << -1, which is undefined behaviour. Which is btw already messed up
> wrt viommu->pgsize_bitmap, but that's not a reason to propagate
> the error.

Realistically we're not going to have a page granule larger than 4G, it's
going to be 4k or 64k. But we can add a check that truncates the
page_size_mask to 32-bit and makes sure that it's non-null.

> > +struct virtio_iommu_probe_pgsize_mask {
> > +	struct virtio_iommu_probe_property	head;
> > +	__u8					reserved[4];
> > +	/* Same format as virtio_iommu_config::page_size_mask */
> 
> It's actually slightly different in that
> this must be a superset of domain page size mask, right?

No it overrides the global mask

> > +	__le64					pgsize_bitmap;

Bharat, please rename this to page_size_mask for consistency

Thanks,
Jean

> > +};
> > +
> >  #define VIRTIO_IOMMU_RESV_MEM_T_RESERVED	0
> >  #define VIRTIO_IOMMU_RESV_MEM_T_MSI		1
> >  
> > -- 
> > 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
