Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0615B1C6502
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 02:22:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 695A122053;
	Wed,  6 May 2020 00:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jToeBlKSMrn1; Wed,  6 May 2020 00:22:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 972592156E;
	Wed,  6 May 2020 00:22:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75260C0859;
	Wed,  6 May 2020 00:22:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80B7BC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 00:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6F2D287954
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 00:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gVQ8iPl8JJ1R
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 00:22:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 88DAE87884
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 00:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588724564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QoqKXjvHS1POFny3QwrSW9RfCPL+8QBVwaJ8hMnU7Dg=;
 b=GMtg5u3V3ux1e2JFEZCzfioibkN0672ovbrqgn4rLmVYbfAIjNLeakLioPgT9G0tQFqeVF
 xEph5LjebH2eDgAqKuML7WbHeEU3t/sJ2Oicd5JoHWwJvZ+119HkbIv41oQE9SYN06xkOl
 2CEN6gx8Ec8hlWErCnbcHjniNWyX2wE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-Zx9vG9oRMrSxH1tNyix49Q-1; Tue, 05 May 2020 20:22:42 -0400
X-MC-Unique: Zx9vG9oRMrSxH1tNyix49Q-1
Received: by mail-wr1-f72.google.com with SMTP id v17so310312wrq.8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 05 May 2020 17:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QoqKXjvHS1POFny3QwrSW9RfCPL+8QBVwaJ8hMnU7Dg=;
 b=sOsuSpOmFPjFbusjBt4nK+rrYRVX7s9ODKhUiUeWAKM4lzUcfJRZZ8CXTgpzDSwpOI
 Lo4NUST1ZGKEsKKn2kwAKjrLEFZP7e9RnbmcePPOPTxsrnSRmkECEy8Uigm69i7lBekL
 A7VLES66UKXUP0MyfJehmcOj7K4oDkdx76V3070nkcBqCsEmMcSkNVicVMzTqorZGeU9
 ezpO9WHmNHfl15wLjpMSZtZSfxzlNS3Gh12F6aD4L3f2b2gYhcyNxXaMs3OPqr5ObZ4d
 Kn5oyrfygRFCf1+vef0uP36AbnieaUZwgt8mQMwQ42l5AY0hKoYRjlSGCz6hXhx9afb3
 P7Aw==
X-Gm-Message-State: AGi0PuZUMNVRLP2b1d1GxDzmTwE0C5y8cTR17uYts7oM2sxiXTfjzdGK
 7tpPszT9KqzZXXsk9/xk71mw3ei2Rbxp+AFzujJlhjhdmj50riWoWaHzcnjekeshvVH6QjYr76n
 s7L2nFZYUwbqCGbDNoJZAndc/nNtV3dvOM2Wfs/WUcg==
X-Received: by 2002:adf:f4c4:: with SMTP id h4mr6674138wrp.142.1588724561118; 
 Tue, 05 May 2020 17:22:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypJmoSpO73yXNDTz8jDLDw6M0OmFQm9c8vXZNzPGPO9rFjmHx4lA5SH/ADZzc+i0KYiNA0+Q4A==
X-Received: by 2002:adf:f4c4:: with SMTP id h4mr6674112wrp.142.1588724560893; 
 Tue, 05 May 2020 17:22:40 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 n12sm299685wrj.95.2020.05.05.17.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 17:22:40 -0700 (PDT)
Date: Tue, 5 May 2020 20:22:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bharat Bhushan <bbhushan2@marvell.com>
Subject: Re: [PATCH v5] iommu/virtio: Use page size bitmap supported by
 endpoint
Message-ID: <20200505200659-mutt-send-email-mst@kernel.org>
References: <20200505093004.1935-1-bbhushan2@marvell.com>
MIME-Version: 1.0
In-Reply-To: <20200505093004.1935-1-bbhushan2@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: jean-philippe@linaro.org, joro@8bytes.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, eric.auger.pro@gmail.com
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

On Tue, May 05, 2020 at 03:00:04PM +0530, Bharat Bhushan wrote:
> Different endpoint can support different page size, probe
> endpoint if it supports specific page size otherwise use
> global page sizes.
> 
> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> ---
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
>  drivers/iommu/virtio-iommu.c      | 48 ++++++++++++++++++++++++++++---
>  include/uapi/linux/virtio_iommu.h |  7 +++++
>  2 files changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index d5cac4f46ca5..9513d2ab819e 100644
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
> @@ -415,6 +416,19 @@ static int viommu_replay_mappings(struct viommu_domain *vdomain)
>  	return ret;
>  }
>  
> +static int viommu_set_pgsize_bitmap(struct viommu_endpoint *vdev,
> +				    struct virtio_iommu_probe_pgsize_mask *mask,
> +				    size_t len)
> +{
> +	u64 pgsize_bitmap = le64_to_cpu(mask->pgsize_bitmap);
> +
> +	if (len < sizeof(*mask))

This is too late to validate length, you have dereferenced it already.
do it before the read pls.

> +		return -EINVAL;

OK but note that guest will then just proceed to ignore the
property. Is that really OK? Wouldn't host want to know?


> +
> +	vdev->pgsize_bitmap = pgsize_bitmap;

what if bitmap is 0? Is that a valid size? I see a bunch of
BUG_ON with that value ...

I also see a bunch of code like e.g. this:

        pg_size = 1UL << __ffs(pgsize_bitmap);

which probably won't DTRT on a 32 bit guest if the bitmap has bits
set in the high word.



> +	return 0;
> +}
> +
>  static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
>  			       struct virtio_iommu_probe_resv_mem *mem,
>  			       size_t len)
> @@ -499,6 +513,9 @@ static int viommu_probe_endpoint(struct viommu_dev *viommu, struct device *dev)
>  		case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
>  			ret = viommu_add_resv_mem(vdev, (void *)prop, len);
>  			break;
> +		case VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK:
> +			ret = viommu_set_pgsize_bitmap(vdev, (void *)prop, len);
> +			break;
>  		default:
>  			dev_err(dev, "unknown viommu prop 0x%x\n", type);
>  		}
> @@ -630,7 +647,7 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
>  
>  	vdomain->id		= (unsigned int)ret;
>  
> -	domain->pgsize_bitmap	= viommu->pgsize_bitmap;
> +	domain->pgsize_bitmap	= vdev->pgsize_bitmap;
>  	domain->geometry	= viommu->geometry;
>  
>  	vdomain->map_flags	= viommu->map_flags;
> @@ -654,6 +671,29 @@ static void viommu_domain_free(struct iommu_domain *domain)
>  	kfree(vdomain);
>  }
>  
> +/*
> + * Check whether the endpoint's capabilities are compatible with other
> + * endpoints in the domain. Report any inconsistency.
> + */
> +static bool viommu_endpoint_is_compatible(struct viommu_endpoint *vdev,
> +					  struct viommu_domain *vdomain)
> +{
> +	struct device *dev = vdev->dev;
> +
> +	if (vdomain->viommu != vdev->viommu) {
> +		dev_err(dev, "cannot attach to foreign vIOMMU\n");
> +		return false;
> +	}
> +
> +	if (vdomain->domain.pgsize_bitmap != vdev->pgsize_bitmap) {
> +		dev_err(dev, "incompatible domain bitmap 0x%lx != 0x%llx\n",
> +			vdomain->domain.pgsize_bitmap, vdev->pgsize_bitmap);
> +		return false;
> +	}

I'm confused by this. So let's assume host supports pages sizes
of 4k, 2M, 1G. It signals this in the properties. Nice.
Now domain supports 4k, 2M and that's all. Why is that a problem?
Just don't use 1G ...


> +
> +	return true;
> +}
> +
>  static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  {
>  	int i;
> @@ -670,9 +710,8 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
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
> @@ -886,6 +925,7 @@ static int viommu_add_device(struct device *dev)
>  
>  	vdev->dev = dev;
>  	vdev->viommu = viommu;
> +	vdev->pgsize_bitmap = viommu->pgsize_bitmap;
>  	INIT_LIST_HEAD(&vdev->resv_regions);
>  	dev_iommu_priv_set(dev, vdev);
>  
> diff --git a/include/uapi/linux/virtio_iommu.h b/include/uapi/linux/virtio_iommu.h
> index 48e3c29223b5..2cced7accc99 100644
> --- a/include/uapi/linux/virtio_iommu.h
> +++ b/include/uapi/linux/virtio_iommu.h

As any virtio UAPI change, you need to copy virtio TC at some point
before this is merged ...

> @@ -111,6 +111,7 @@ struct virtio_iommu_req_unmap {
>  
>  #define VIRTIO_IOMMU_PROBE_T_NONE		0
>  #define VIRTIO_IOMMU_PROBE_T_RESV_MEM		1
> +#define VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK	2
>  
>  #define VIRTIO_IOMMU_PROBE_T_MASK		0xfff
>

Does host need to know that guest will ignore the page size mask?
Maybe we need a feature bit.
  
> @@ -119,6 +120,12 @@ struct virtio_iommu_probe_property {
>  	__le16					length;
>  };
>  
> +struct virtio_iommu_probe_pgsize_mask {
> +	struct virtio_iommu_probe_property	head;
> +	__u8					reserved[4];
> +	__le64					pgsize_bitmap;
> +};
> +

This is UAPI. Document the format of pgsize_bitmap please.


>  #define VIRTIO_IOMMU_RESV_MEM_T_RESERVED	0
>  #define VIRTIO_IOMMU_RESV_MEM_T_MSI		1
>  
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
