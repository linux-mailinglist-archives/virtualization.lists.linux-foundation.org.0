Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD1219AC3B
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 15:00:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B543020033;
	Wed,  1 Apr 2020 13:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PptZ09sKhaSa; Wed,  1 Apr 2020 13:00:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 119D5204C0;
	Wed,  1 Apr 2020 13:00:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECC79C089F;
	Wed,  1 Apr 2020 13:00:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D637C089F;
 Wed,  1 Apr 2020 13:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 07A262039E;
 Wed,  1 Apr 2020 13:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7PZOohDRQd89; Wed,  1 Apr 2020 13:00:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 6C75A20033;
 Wed,  1 Apr 2020 13:00:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5BCE30E;
 Wed,  1 Apr 2020 06:00:16 -0700 (PDT)
Received: from [10.57.60.204] (unknown [10.57.60.204])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6DF53F71E;
 Wed,  1 Apr 2020 06:00:14 -0700 (PDT)
Subject: Re: [RFC PATCH v2] iommu/virtio: Use page size bitmap supported by
 endpoint
To: Bharat Bhushan <bbhushan2@marvell.com>, jean-philippe@linaro.org,
 joro@8bytes.org, mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, eric.auger.pro@gmail.com, eric.auger@redhat.com
References: <20200401113804.21616-1-bbhushan2@marvell.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b75beb74-89ce-fd6a-6207-3c0d7f479215@arm.com>
Date: Wed, 1 Apr 2020 14:00:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401113804.21616-1-bbhushan2@marvell.com>
Content-Language: en-GB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 2020-04-01 12:38 pm, Bharat Bhushan wrote:
> Different endpoint can support different page size, probe
> endpoint if it supports specific page size otherwise use
> global page sizes.
> 
> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> ---
>   drivers/iommu/virtio-iommu.c      | 33 +++++++++++++++++++++++++++----
>   include/uapi/linux/virtio_iommu.h |  7 +++++++
>   2 files changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index cce329d71fba..c794cb5b7b3e 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -78,6 +78,7 @@ struct viommu_endpoint {
>   	struct viommu_dev		*viommu;
>   	struct viommu_domain		*vdomain;
>   	struct list_head		resv_regions;
> +	u64				pgsize_bitmap;
>   };
>   
>   struct viommu_request {
> @@ -415,6 +416,20 @@ static int viommu_replay_mappings(struct viommu_domain *vdomain)
>   	return ret;
>   }
>   
> +static int viommu_set_pgsize_bitmap(struct viommu_endpoint *vdev,
> +				    struct virtio_iommu_probe_pgsize_mask *mask,
> +				    size_t len)
> +
> +{
> +	u64 pgsize_bitmap = le64_to_cpu(mask->pgsize_bitmap);
> +
> +	if (len < sizeof(*mask))
> +		return -EINVAL;
> +
> +	vdev->pgsize_bitmap = pgsize_bitmap;
> +	return 0;
> +}
> +
>   static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
>   			       struct virtio_iommu_probe_resv_mem *mem,
>   			       size_t len)
> @@ -494,11 +509,13 @@ static int viommu_probe_endpoint(struct viommu_dev *viommu, struct device *dev)
>   	while (type != VIRTIO_IOMMU_PROBE_T_NONE &&
>   	       cur < viommu->probe_size) {
>   		len = le16_to_cpu(prop->length) + sizeof(*prop);
> -
>   		switch (type) {
>   		case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
>   			ret = viommu_add_resv_mem(vdev, (void *)prop, len);
>   			break;
> +		case VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK:
> +			ret = viommu_set_pgsize_bitmap(vdev, (void *)prop, len);
> +			break;
>   		default:
>   			dev_err(dev, "unknown viommu prop 0x%x\n", type);
>   		}
> @@ -607,16 +624,23 @@ static struct iommu_domain *viommu_domain_alloc(unsigned type)
>   	return &vdomain->domain;
>   }
>   
> -static int viommu_domain_finalise(struct viommu_dev *viommu,
> +static int viommu_domain_finalise(struct viommu_endpoint *vdev,
>   				  struct iommu_domain *domain)
>   {
>   	int ret;
>   	struct viommu_domain *vdomain = to_viommu_domain(domain);
> +	struct viommu_dev *viommu = vdev->viommu;
>   
>   	vdomain->viommu		= viommu;
>   	vdomain->map_flags	= viommu->map_flags;
>   
> -	domain->pgsize_bitmap	= viommu->pgsize_bitmap;
> +	/* Devices in same domain must support same size pages */

AFAICS what the code appears to do is enforce that the first endpoint 
attached to any domain has the same pgsize_bitmap as the most recently 
probed viommu_dev instance, then ignore any subsequent endpoints 
attached to the same domain. Thus I'm not sure that comment is accurate.

Robin.

> +	if ((domain->pgsize_bitmap != viommu->pgsize_bitmap) &&
> +	    (domain->pgsize_bitmap != vdev->pgsize_bitmap))
> +		return -EINVAL;
> +
> +	domain->pgsize_bitmap = vdev->pgsize_bitmap;
> +
>   	domain->geometry	= viommu->geometry;
>   
>   	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain,
> @@ -657,7 +681,7 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   		 * Properly initialize the domain now that we know which viommu
>   		 * owns it.
>   		 */
> -		ret = viommu_domain_finalise(vdev->viommu, domain);
> +		ret = viommu_domain_finalise(vdev, domain);
>   	} else if (vdomain->viommu != vdev->viommu) {
>   		dev_err(dev, "cannot attach to foreign vIOMMU\n");
>   		ret = -EXDEV;
> @@ -875,6 +899,7 @@ static int viommu_add_device(struct device *dev)
>   
>   	vdev->dev = dev;
>   	vdev->viommu = viommu;
> +	vdev->pgsize_bitmap = viommu->pgsize_bitmap;
>   	INIT_LIST_HEAD(&vdev->resv_regions);
>   	fwspec->iommu_priv = vdev;
>   
> diff --git a/include/uapi/linux/virtio_iommu.h b/include/uapi/linux/virtio_iommu.h
> index 237e36a280cb..dc9d3f40bcd8 100644
> --- a/include/uapi/linux/virtio_iommu.h
> +++ b/include/uapi/linux/virtio_iommu.h
> @@ -111,6 +111,7 @@ struct virtio_iommu_req_unmap {
>   
>   #define VIRTIO_IOMMU_PROBE_T_NONE		0
>   #define VIRTIO_IOMMU_PROBE_T_RESV_MEM		1
> +#define VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK	2
>   
>   #define VIRTIO_IOMMU_PROBE_T_MASK		0xfff
>   
> @@ -119,6 +120,12 @@ struct virtio_iommu_probe_property {
>   	__le16					length;
>   };
>   
> +struct virtio_iommu_probe_pgsize_mask {
> +	struct virtio_iommu_probe_property	head;
> +	__u8					reserved[4];
> +	__u64					pgsize_bitmap;
> +};
> +
>   #define VIRTIO_IOMMU_RESV_MEM_T_RESERVED	0
>   #define VIRTIO_IOMMU_RESV_MEM_T_MSI		1
>   
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
