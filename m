Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC0C1945B0
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 18:41:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6CBA888075;
	Thu, 26 Mar 2020 17:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1FwO5j1ei48; Thu, 26 Mar 2020 17:41:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D2E2C8939A;
	Thu, 26 Mar 2020 17:41:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A528EC0177;
	Thu, 26 Mar 2020 17:41:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91B5CC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 17:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8E72C8739F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 17:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nF-3dps-x6x9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 17:41:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 93D2987397
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585244494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISTlfCKATsCDv+JiN5ZYg6YS8C+c5x0snN2wLo4zcls=;
 b=ClaywJr6ZjNjjWkzK8/g89vtCN0nEjLVo1BglkKhGrtnsF+3xwACoRSTD3kAylJXHqFozC
 xpaXjHHPsiKRly5j8Seq2HXffY3ZgjqRBR95KxByGkeqtyYDz4Bk5/F5ndno9gZFJHmmuN
 Jq1vTbhIDnjQGuBJy3pod4eiYSF4TfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-X1JCpKU2MDSDLbR2BUekJw-1; Thu, 26 Mar 2020 13:41:31 -0400
X-MC-Unique: X1JCpKU2MDSDLbR2BUekJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70940DB4A;
 Thu, 26 Mar 2020 17:41:29 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C232460C56;
 Thu, 26 Mar 2020 17:41:27 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] iommu/virtio: Reject IOMMU page granule larger
 than PAGE_SIZE
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu@lists.linux-foundation.org
References: <20200326093558.2641019-1-jean-philippe@linaro.org>
 <20200326093558.2641019-4-jean-philippe@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <04ed8a3e-5602-1a5f-1fa3-ac517fede0b1@redhat.com>
Date: Thu, 26 Mar 2020 18:41:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200326093558.2641019-4-jean-philippe@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: joro@8bytes.org, mst@redhat.com, bbhushan2@marvell.com,
 virtualization@lists.linux-foundation.org
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

Hi Jean,

On 3/26/20 10:35 AM, Jean-Philippe Brucker wrote:
> We don't currently support IOMMUs with a page granule larger than the
> system page size. The IOVA allocator has a BUG_ON() in this case, and
> VFIO has a WARN_ON().
> 
> Removing these obstacles ranges doesn't seem possible without major
> changes to the DMA API and VFIO. Some callers of iommu_map(), for
> example, want to map multiple page-aligned regions adjacent to each
> others for scatter-gather purposes. Even in simple DMA API uses, a call
> to dma_map_page() would let the endpoint access neighbouring memory. And
> VFIO users cannot ensure that their virtual address buffer is physically
> contiguous at the IOMMU granule.
> 
> Rather than triggering the IOVA BUG_ON() on mismatched page sizes, abort
> the vdomain finalise() with an error message. We could simply abort the
> viommu probe(), but an upcoming extension to virtio-iommu will allow
> setting different page masks for each endpoint.
> 
> Reported-by: Bharat Bhushan <bbhushan2@marvell.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
> v1->v2: Move to vdomain_finalise(), improve commit message
> ---
>  drivers/iommu/virtio-iommu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index 5eed75cd121f..750f69c49b95 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -607,12 +607,22 @@ static struct iommu_domain *viommu_domain_alloc(unsigned type)
>  	return &vdomain->domain;
>  }
>  
> -static int viommu_domain_finalise(struct viommu_dev *viommu,
> +static int viommu_domain_finalise(struct viommu_endpoint *vdev,
>  				  struct iommu_domain *domain)
>  {
>  	int ret;
> +	unsigned long viommu_page_size;
> +	struct viommu_dev *viommu = vdev->viommu;
>  	struct viommu_domain *vdomain = to_viommu_domain(domain);
>  
> +	viommu_page_size = 1UL << __ffs(viommu->pgsize_bitmap);
> +	if (viommu_page_size > PAGE_SIZE) {
> +		dev_err(vdev->dev,
> +			"granule 0x%lx larger than system page size 0x%lx\n",
> +			viommu_page_size, PAGE_SIZE);
> +		return -EINVAL;
> +	}
> +
>  	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain,
>  			      viommu->last_domain, GFP_KERNEL);
>  	if (ret < 0)
> @@ -659,7 +669,7 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  		 * Properly initialize the domain now that we know which viommu
>  		 * owns it.
>  		 */
> -		ret = viommu_domain_finalise(vdev->viommu, domain);
> +		ret = viommu_domain_finalise(vdev, domain);
>  	} else if (vdomain->viommu != vdev->viommu) {
>  		dev_err(dev, "cannot attach to foreign vIOMMU\n");
>  		ret = -EXDEV;
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
