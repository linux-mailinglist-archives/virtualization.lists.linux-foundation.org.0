Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C66EB193251
	for <lists.virtualization@lfdr.de>; Wed, 25 Mar 2020 22:05:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C409986DAA;
	Wed, 25 Mar 2020 21:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YofJVl8nQZFr; Wed, 25 Mar 2020 21:05:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 01EB786D5D;
	Wed, 25 Mar 2020 21:05:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D041EC0177;
	Wed, 25 Mar 2020 21:05:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A86EC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 21:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2CB3D88216
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 21:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnAsTH97sZDI
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 21:05:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 68DDC881F9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 21:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585170325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=geCa1OSxny+PzgSp/iZxt6RW2EJVp1S56y0SbXLYQ/Q=;
 b=KmqP2Or98K9bGioZaH2B1B+9o0H7M3Xx9Tazl/cpY5OJUM5znwklPLB4KXvouxf8SW/Z2o
 LHSR1kzIlSGHst1h/nw/g23nTLjHvQcugp1Nr2cI5mG2JXYCv1TJ1OfH9Sh5pcuAAvrQMC
 m4mbYa9Dn97VF3ZLpsxzN3IPnjONTRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-KBGHRYj6MUGvl1wqUslS3g-1; Wed, 25 Mar 2020 17:05:23 -0400
X-MC-Unique: KBGHRYj6MUGvl1wqUslS3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0969E189F762;
 Wed, 25 Mar 2020 21:05:22 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 839E95D9CA;
 Wed, 25 Mar 2020 21:05:18 +0000 (UTC)
Subject: Re: [PATCH] iommu/virtio: Reject IOMMU page granule larger than
 PAGE_SIZE
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
References: <20200318114047.1518048-1-jean-philippe@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8305aadc-ee0e-382d-b605-b6cfce98b2ac@redhat.com>
Date: Wed, 25 Mar 2020 22:05:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200318114047.1518048-1-jean-philippe@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: joro@8bytes.org, robin.murphy@arm.com,
 Bharat Bhushan <bbhushan2@marvell.com>
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

On 3/18/20 12:40 PM, Jean-Philippe Brucker wrote:
> We don't currently support IOMMUs with a page granule larger than the
> system page size. The IOVA allocator has a BUG_ON() in this case, and
> VFIO has a WARN_ON().
> 
> It might be possible to remove these obstacles if necessary. If the host
> uses 64kB pages and the guest uses 4kB, then a device driver calling
> alloc_page() followed by dma_map_page() will create a 64kB mapping for a
> 4kB physical page, allowing the endpoint to access the neighbouring 60kB
> of memory. This problem could be worked around with bounce buffers.
> 
> For the moment, rather than triggering the IOVA BUG_ON() on mismatched
> page sizes, abort the virtio-iommu probe with an error message.
> 
> Reported-by: Bharat Bhushan <bbhushan2@marvell.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/virtio-iommu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index 6d4e3c2a2ddb..80d5d8f621ab 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -998,6 +998,7 @@ static int viommu_probe(struct virtio_device *vdev)
>  	struct device *parent_dev = vdev->dev.parent;
>  	struct viommu_dev *viommu = NULL;
>  	struct device *dev = &vdev->dev;
> +	unsigned long viommu_page_size;
>  	u64 input_start = 0;
>  	u64 input_end = -1UL;
>  	int ret;
> @@ -1028,6 +1029,14 @@ static int viommu_probe(struct virtio_device *vdev)
>  		goto err_free_vqs;
>  	}
>  
> +	viommu_page_size = 1UL << __ffs(viommu->pgsize_bitmap);
Given the fact we now head towards probing the device for its
page_size_mask in viommu_add_device() the check may need to happen
later, in viommu_domain_finalise() for instance?

Thanks

Eric
> +	if (viommu_page_size > PAGE_SIZE) {
> +		dev_err(dev, "granule 0x%lx larger than system page size 0x%lx\n",
> +			viommu_page_size, PAGE_SIZE);
> +		ret = -EINVAL;
> +		goto err_free_vqs;
> +	}
> +
>  	viommu->map_flags = VIRTIO_IOMMU_MAP_F_READ | VIRTIO_IOMMU_MAP_F_WRITE;
>  	viommu->last_domain = ~0U;
>  
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
