Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 182EC1D2B73
	for <lists.virtualization@lfdr.de>; Thu, 14 May 2020 11:31:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7AAB32279B;
	Thu, 14 May 2020 09:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wiPbqG3IMQck; Thu, 14 May 2020 09:31:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 87DA822713;
	Thu, 14 May 2020 09:31:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6820BC016F;
	Thu, 14 May 2020 09:31:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 186F3C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 09:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0CB2987855
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 09:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-oEV87zb-em
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 09:31:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B086487853
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 09:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589448667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+M/JCln9wzAsGjhD0XvCSZCE5bghanH9yHT8B9Yuz1U=;
 b=WQlMEZUzqSSuyTT0q8VjYFxxktwbG8Ytb9gFvpYD7vvCX1RnWNk4ESlbn5HHrO5FqPtX9w
 BNquoxpb2o9K53WPQwFYteHOYtKiO5Folnp1r5UXbNOrZ+JIVoDOa8b7Z+m21DJG3pa79R
 ExxcGMLy77NMyOz1hgWsJ4jQYMz2Y/w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-RfY8cZNSOBS0Atj4Vnqj8Q-1; Thu, 14 May 2020 05:31:05 -0400
X-MC-Unique: RfY8cZNSOBS0Atj4Vnqj8Q-1
Received: by mail-wm1-f70.google.com with SMTP id v23so8286984wmj.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 02:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+M/JCln9wzAsGjhD0XvCSZCE5bghanH9yHT8B9Yuz1U=;
 b=dNsDKPUP3HvHKu9P/zocVgJhiKJj/+p90XRnzqdpJmjjUpfWFX6e/l1mmGsDklb+kw
 Q2HH1gtiXziP4P7WAHEzN0zStTwey0O2sVAjxFQAsWKMFGdBVKfRXVHrHyq4ASgIvsED
 TdQSymwM2pstGHuJt4FnrqWpRNAVaAJN86ee+1XlGepf27YKXYPgwDnckw8LFail2FWZ
 WB/dwC6Nsgij0oi3wjEUFKcOaAHtkAgK1/XLue4/9YERVsuPhJVEBp9osO/FmsaRD44c
 HCDE5+oo7CmEQwDuuki44zC9+khioS/z+4wXQ0rFYt6gaSz0m7K0VUnn5qBG6aFRKGsQ
 2PMw==
X-Gm-Message-State: AOAM533tR0mXywCNuUuuBRQRawwBGtNoLfv2i09ralkJ2YC96CI8BIWl
 c7Z70layHDFyadBFA51UpzebX0//U/I+HYqUb0quTJdQIXSuzHubW1Z/neu7Dj8h7AKT0mgl3rd
 cUvTBDdi3eFocWt2t+A34LmGlFlfJdwf0w/INufZGaw==
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr4685753wrw.29.1589448664628;
 Thu, 14 May 2020 02:31:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycsR0+2Kleb6jHGMFKI+gdToHSPwOeDmcvW6rc5OTqQmi+/V8HolBTWiHvc8/6IWG23MXf2w==
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr4685718wrw.29.1589448664260;
 Thu, 14 May 2020 02:31:04 -0700 (PDT)
Received: from redhat.com (bzq-79-179-68-225.red.bezeqint.net. [79.179.68.225])
 by smtp.gmail.com with ESMTPSA id y70sm41006618wmc.36.2020.05.14.02.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 02:31:03 -0700 (PDT)
Date: Thu, 14 May 2020 05:31:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bharat Bhushan <bbhushan2@marvell.com>
Subject: Re: [PATCH v6] iommu/virtio: Use page size bitmap supported by
 endpoint
Message-ID: <20200514043747-mutt-send-email-mst@kernel.org>
References: <20200514075237.3941-1-bbhushan2@marvell.com>
MIME-Version: 1.0
In-Reply-To: <20200514075237.3941-1-bbhushan2@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: jean-philippe@linaro.org, virtio-dev@lists.oasis-open.org, joro@8bytes.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eric.auger@redhat.com, iommu@lists.linux-foundation.org,
 eric.auger.pro@gmail.com
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

On Thu, May 14, 2020 at 01:22:37PM +0530, Bharat Bhushan wrote:
> Different endpoint can support different page size, probe
> endpoint if it supports specific page size otherwise use
> global page sizes.
> 
> Device attached to domain should support a minimum of
> domain supported page sizes. If device supports more
> than domain supported page sizes then device is limited
> to use domain supported page sizes only.

OK so I am just trying to figure it out.
Before the patch, we always use the domain supported page sizes
right? With the patch, we still do, but we also probe and
validate that device supports all domain page sizes,
if it does not then we fail to attach the device.

This seems like a lot of effort for little benefit, can't
hypervisor simply make sure endpoints support the
iommu page sizes for us?



> 
> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> ---
> v5->v6
>  - property length before dereference
>  - Error out on no supported page sizes (page-size-mask is zero)
>  - Allow device to attach to domain even it supports
>    minimum of domain supported page sizes. In that case device
>    will use domain page sizes only.
>  - added format of pgsize_bitmap
> 
> v4->v5:
>  - Rebase to Linux v5.7-rc4
> 
> v3->v4:
>  - Fix whitespace error
> 
> v2->v3:
>  - Fixed error return for incompatible endpoint
>  - __u64 changed to __le64 in header file
> 
>  drivers/iommu/virtio-iommu.c      | 63 ++++++++++++++++++++++++++++---
>  include/uapi/linux/virtio_iommu.h | 14 ++++++-
>  2 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index 4e1d11af23c8..cbac3047a781 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -78,6 +78,7 @@ struct viommu_endpoint {
>  	struct viommu_dev		*viommu;
>  	struct viommu_domain		*vdomain;
>  	struct list_head		resv_regions;
> +	u64				pgsize_bitmap;
>  };
>  
>  struct viommu_request {
> @@ -415,6 +416,23 @@ static int viommu_replay_mappings(struct viommu_domain *vdomain)
>  	return ret;
>  }
>  
> +static int viommu_set_pgsize_bitmap(struct viommu_endpoint *vdev,
> +				    struct virtio_iommu_probe_pgsize_mask *mask,
> +				    size_t len)
> +{
> +	u64 pgsize_bitmap;
> +
> +	if (len < sizeof(*mask))
> +		return -EINVAL;
> +
> +	pgsize_bitmap = le64_to_cpu(mask->pgsize_bitmap);
> +	if (!pgsize_bitmap)
> +		return -EINVAL;
> +
> +	vdev->pgsize_bitmap = pgsize_bitmap;
> +	return 0;
> +}
> +
>  static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
>  			       struct virtio_iommu_probe_resv_mem *mem,
>  			       size_t len)
> @@ -499,6 +517,9 @@ static int viommu_probe_endpoint(struct viommu_dev *viommu, struct device *dev)
>  		case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
>  			ret = viommu_add_resv_mem(vdev, (void *)prop, len);
>  			break;
> +		case VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK:
> +			ret = viommu_set_pgsize_bitmap(vdev, (void *)prop, len);
> +			break;
>  		default:
>  			dev_err(dev, "unknown viommu prop 0x%x\n", type);
>  		}
> @@ -615,7 +636,7 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
>  	struct viommu_dev *viommu = vdev->viommu;
>  	struct viommu_domain *vdomain = to_viommu_domain(domain);
>  
> -	viommu_page_size = 1UL << __ffs(viommu->pgsize_bitmap);
> +	viommu_page_size = 1UL << __ffs(vdev->pgsize_bitmap);
>  	if (viommu_page_size > PAGE_SIZE) {
>  		dev_err(vdev->dev,
>  			"granule 0x%lx larger than system page size 0x%lx\n",


Looks like this is messed up on 32 bit: e.g. 0x100000000 will try to do
1UL << -1, which is undefined behaviour. Which is btw already messed up
wrt viommu->pgsize_bitmap, but that's not a reason to propagate
the error.


> @@ -630,7 +651,7 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
>  
>  	vdomain->id		= (unsigned int)ret;
>  
> -	domain->pgsize_bitmap	= viommu->pgsize_bitmap;
> +	domain->pgsize_bitmap	= vdev->pgsize_bitmap;
>  	domain->geometry	= viommu->geometry;
>  
>  	vdomain->map_flags	= viommu->map_flags;
> @@ -654,6 +675,38 @@ static void viommu_domain_free(struct iommu_domain *domain)
>  	kfree(vdomain);
>  }
>  
> +/*
> + * Check whether the endpoint's capabilities are compatible with other
> + * endpoints in the domain. Report any inconsistency.

This actually has side effects, so _is_ isn't a good name for it.
viommu_endpoint_compatible?

> + */
> +static bool viommu_endpoint_is_compatible(struct viommu_endpoint *vdev,
> +					  struct viommu_domain *vdomain)
> +{
> +	struct device *dev = vdev->dev;
> +	u64 pgsize_bitmap;
> +
> +	if (vdomain->viommu != vdev->viommu) {
> +		dev_err(dev, "cannot attach to foreign vIOMMU\n");
> +		return false;
> +	}
> +
> +	pgsize_bitmap = vdomain->domain.pgsize_bitmap & vdev->pgsize_bitmap;
> +


> +	if (pgsize_bitmap != vdomain->domain.pgsize_bitmap) {

So this triggers when device is not a superset of domain, right?
Maybe add a comment.

> +		dev_err(dev, "incompatible domain bitmap 0x%lx != 0x%llx\n",
> +			vdomain->domain.pgsize_bitmap, vdev->pgsize_bitmap);
> +		return false;
> +	}
> +
> +	/* Domain pagesize bitmap is subset of device pagesize bitmap */
> +	if (pgsize_bitmap != vdev->pgsize_bitmap) {
> +		dev_info(dev, "page size bitmap used %llx, supported %llx\n",
> +			 pgsize_bitmap, vdev->pgsize_bitmap);
> +		vdev->pgsize_bitmap = pgsize_bitmap;
> +	}
> +	return true;
> +}
> +
>  static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  {
>  	int i;
> @@ -670,9 +723,8 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  		 * owns it.
>  		 */
>  		ret = viommu_domain_finalise(vdev, domain);
> -	} else if (vdomain->viommu != vdev->viommu) {
> -		dev_err(dev, "cannot attach to foreign vIOMMU\n");
> -		ret = -EXDEV;
> +	} else if (!viommu_endpoint_is_compatible(vdev, vdomain)) {
> +		ret = -EINVAL;
>  	}
>  	mutex_unlock(&vdomain->mutex);
>  
> @@ -886,6 +938,7 @@ static int viommu_add_device(struct device *dev)
>  
>  	vdev->dev = dev;
>  	vdev->viommu = viommu;
> +	vdev->pgsize_bitmap = viommu->pgsize_bitmap;
>  	INIT_LIST_HEAD(&vdev->resv_regions);
>  	dev_iommu_priv_set(dev, vdev);
>  
> diff --git a/include/uapi/linux/virtio_iommu.h b/include/uapi/linux/virtio_iommu.h
> index 48e3c29223b5..15a8327ffef5 100644
> --- a/include/uapi/linux/virtio_iommu.h
> +++ b/include/uapi/linux/virtio_iommu.h
> @@ -28,7 +28,11 @@ struct virtio_iommu_range_32 {
>  };
>  
>  struct virtio_iommu_config {
> -	/* Supported page sizes */
> +	/*
> +	 * Bitmap of supported page sizes. The least significant bit
> +	 * indicates the smallest granularity and the other bits are
> +	 * hints indicating optimal block sizes.
> +	 */
>  	__u64					page_size_mask;
>  	/* Supported IOVA range */
>  	struct virtio_iommu_range_64		input_range;
> @@ -111,6 +115,7 @@ struct virtio_iommu_req_unmap {
>  
>  #define VIRTIO_IOMMU_PROBE_T_NONE		0
>  #define VIRTIO_IOMMU_PROBE_T_RESV_MEM		1
> +#define VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK	2
>  
>  #define VIRTIO_IOMMU_PROBE_T_MASK		0xfff
>  
> @@ -119,6 +124,13 @@ struct virtio_iommu_probe_property {
>  	__le16					length;
>  };
>  
> +struct virtio_iommu_probe_pgsize_mask {
> +	struct virtio_iommu_probe_property	head;
> +	__u8					reserved[4];
> +	/* Same format as virtio_iommu_config::page_size_mask */

It's actually slightly different in that
this must be a superset of domain page size mask, right?





> +	__le64					pgsize_bitmap;
> +};
> +
>  #define VIRTIO_IOMMU_RESV_MEM_T_RESERVED	0
>  #define VIRTIO_IOMMU_RESV_MEM_T_MSI		1
>  
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
