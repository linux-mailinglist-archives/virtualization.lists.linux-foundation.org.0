Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEC319AF0B
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 17:49:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C214E86DDE;
	Wed,  1 Apr 2020 15:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOiRQZlfm6ch; Wed,  1 Apr 2020 15:49:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 11F1B86DB3;
	Wed,  1 Apr 2020 15:49:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3DB5C1D7F;
	Wed,  1 Apr 2020 15:49:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA894C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 15:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D99D086C6A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 15:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q85XAA_Jpf55
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 15:49:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 408B486C63
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 15:49:43 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 65so679650wrl.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Apr 2020 08:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=C/6o2vAlNYHnEoJMtN8wwi/oRzeStDRZUTB/Nd2Hv7M=;
 b=V1X71f5rZiDGmnBfh3sBWCp7T9Jp+5xgMJtds1xfZSu8D+O/hvzseXEbwd0hbE/ic5
 x2TkT+43IaifgxbqN3WD5qF0jkxiEJn/vxu7PJRb8DLrWPo6nyc2sc0xJTT/Dgr5U/Ks
 I+dljP0laNt/dwhmWSN9NgnGnsQ5TIJIRWzDiczColatMsLZ4AxN0FV2nGqCjw0hr5vA
 Zoy0T/CjYuH6DlYK8xB91i5btiy69jf9MTCkULGVja5Tvk+K0iLwEzJSa0OqQVJ5Ulf2
 xfg3KFSYDoo0qFQSaOx3myBfeqcG6DhAd2eTiiX5P4BHoNaXawbCHD7VO9oOVywNrhMn
 kYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C/6o2vAlNYHnEoJMtN8wwi/oRzeStDRZUTB/Nd2Hv7M=;
 b=tA0wduB6p8kRoFO89Zr9sgtFPWfpGrUg2xbfLNlwfL6fVnrCnCn5tPPh5OZ9OxYFQq
 qfmubUWLx8lFyCj9STFjIexkOP22oXQ1nDNznNkf3tNWJE08jgr/ZE20jfgsd31m5IJ5
 TWV/RuBB8OLqADdSzZw3oaBnY7M1nk8Ypa6hEoQdZaUZdfu4RjxJ2/Nlz3RTiG04eHnd
 IHncdVzs1HcpDmcASvEKBcUUCxehcXpQsp7XzRB9B5fMzWJImz8N7Y8We84C/mTCCxWs
 TOxEQYTyTl+Tjn340NG5jsPeiw794Xa7rlBi2+MjVnJxcZdglHm+blz8RaQ/PPb1p/Ax
 m8PA==
X-Gm-Message-State: ANhLgQ2CjzxuE+YJ2ldcWJemhxFpS38Mrvjsk88rziX1lkTlqzZ8dQwR
 RrLS0FhirvZZ1UGweJshXgbPtg==
X-Google-Smtp-Source: ADFU+vsj+IPnTlTnW8cEeiZkmxOp3zrZSNdsM6O5dJ55cTv7aer2xndG3sAVVLsjPUulI2AMAH/7/g==
X-Received: by 2002:adf:84a3:: with SMTP id 32mr25563249wrg.378.1585756181494; 
 Wed, 01 Apr 2020 08:49:41 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:6097:1406:6470:33b5])
 by smtp.gmail.com with ESMTPSA id s131sm3258684wmf.35.2020.04.01.08.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 08:49:40 -0700 (PDT)
Date: Wed, 1 Apr 2020 17:49:32 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC PATCH v2] iommu/virtio: Use page size bitmap supported by
 endpoint
Message-ID: <20200401154932.GA1124215@myrica>
References: <20200401113804.21616-1-bbhushan2@marvell.com>
 <b75beb74-89ce-fd6a-6207-3c0d7f479215@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b75beb74-89ce-fd6a-6207-3c0d7f479215@arm.com>
Cc: mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, Bharat Bhushan <bbhushan2@marvell.com>,
 joro@8bytes.org, eric.auger.pro@gmail.com
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

On Wed, Apr 01, 2020 at 02:00:13PM +0100, Robin Murphy wrote:
> On 2020-04-01 12:38 pm, Bharat Bhushan wrote:
> > Different endpoint can support different page size, probe
> > endpoint if it supports specific page size otherwise use
> > global page sizes.
> > 
> > Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> > ---
> >   drivers/iommu/virtio-iommu.c      | 33 +++++++++++++++++++++++++++----
> >   include/uapi/linux/virtio_iommu.h |  7 +++++++
> >   2 files changed, 36 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> > index cce329d71fba..c794cb5b7b3e 100644
> > --- a/drivers/iommu/virtio-iommu.c
> > +++ b/drivers/iommu/virtio-iommu.c
> > @@ -78,6 +78,7 @@ struct viommu_endpoint {
> >   	struct viommu_dev		*viommu;
> >   	struct viommu_domain		*vdomain;
> >   	struct list_head		resv_regions;
> > +	u64				pgsize_bitmap;
> >   };
> >   struct viommu_request {
> > @@ -415,6 +416,20 @@ static int viommu_replay_mappings(struct viommu_domain *vdomain)
> >   	return ret;
> >   }
> > +static int viommu_set_pgsize_bitmap(struct viommu_endpoint *vdev,
> > +				    struct virtio_iommu_probe_pgsize_mask *mask,
> > +				    size_t len)
> > +
> > +{
> > +	u64 pgsize_bitmap = le64_to_cpu(mask->pgsize_bitmap);
> > +
> > +	if (len < sizeof(*mask))
> > +		return -EINVAL;
> > +
> > +	vdev->pgsize_bitmap = pgsize_bitmap;
> > +	return 0;
> > +}
> > +
> >   static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
> >   			       struct virtio_iommu_probe_resv_mem *mem,
> >   			       size_t len)
> > @@ -494,11 +509,13 @@ static int viommu_probe_endpoint(struct viommu_dev *viommu, struct device *dev)
> >   	while (type != VIRTIO_IOMMU_PROBE_T_NONE &&
> >   	       cur < viommu->probe_size) {
> >   		len = le16_to_cpu(prop->length) + sizeof(*prop);
> > -

Whitespace change

> >   		switch (type) {
> >   		case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
> >   			ret = viommu_add_resv_mem(vdev, (void *)prop, len);
> >   			break;
> > +		case VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK:
> > +			ret = viommu_set_pgsize_bitmap(vdev, (void *)prop, len);
> > +			break;
> >   		default:
> >   			dev_err(dev, "unknown viommu prop 0x%x\n", type);
> >   		}
> > @@ -607,16 +624,23 @@ static struct iommu_domain *viommu_domain_alloc(unsigned type)
> >   	return &vdomain->domain;
> >   }
> > -static int viommu_domain_finalise(struct viommu_dev *viommu,
> > +static int viommu_domain_finalise(struct viommu_endpoint *vdev,
> >   				  struct iommu_domain *domain)
> >   {
> >   	int ret;
> >   	struct viommu_domain *vdomain = to_viommu_domain(domain);
> > +	struct viommu_dev *viommu = vdev->viommu;
> >   	vdomain->viommu		= viommu;
> >   	vdomain->map_flags	= viommu->map_flags;
> > -	domain->pgsize_bitmap	= viommu->pgsize_bitmap;
> > +	/* Devices in same domain must support same size pages */
> 
> AFAICS what the code appears to do is enforce that the first endpoint
> attached to any domain has the same pgsize_bitmap as the most recently
> probed viommu_dev instance, then ignore any subsequent endpoints attached to
> the same domain. Thus I'm not sure that comment is accurate.
> 

Yes viommu_domain_finalise() is only called once. What I had in mind is
something like:

---- 8< ----
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 750f69c49b95..8303b7b513ff 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -639,6 +639,29 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
 	return 0;
 }
 
+/*
+ * Check whether the endpoint's capabilities are compatible with other endpoints
+ * in the domain. Report any inconsistency.
+ */
+static bool viommu_endpoint_is_compatible(struct viommu_endpoint *vdev,
+					  struct viommu_domain *vdomain)
+{
+	struct device *dev = vdev->dev;
+
+	if (vdomain->viommu != vdev->viommu) {
+		dev_err(dev, "cannot attach to foreign vIOMMU\n");
+		return false;
+	}
+
+	if (vdomain->domain.pgsize_bitmap != vdev->pgsize_bitmap) {
+		dev_err(dev, "incompatible domain bitmap 0x%lx != 0x%lx\n",
+			vdomain->domain.pgsize_bitmap, vdev->pgsize_bitmap);
+		return false;
+	}
+
+	return true;
+}
+
 static void viommu_domain_free(struct iommu_domain *domain)
 {
 	struct viommu_domain *vdomain = to_viommu_domain(domain);
@@ -670,9 +693,8 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		 * owns it.
 		 */
 		ret = viommu_domain_finalise(vdev, domain);
-	} else if (vdomain->viommu != vdev->viommu) {
-		dev_err(dev, "cannot attach to foreign vIOMMU\n");
-		ret = -EXDEV;
+	} else if (!viommu_endpoint_is_compatible(vdev, vdomain)) {
+		ret = -EINVAL;
 	}
 	mutex_unlock(&vdomain->mutex);
---- >8 ----

> 
> > +	if ((domain->pgsize_bitmap != viommu->pgsize_bitmap) &&
> > +	    (domain->pgsize_bitmap != vdev->pgsize_bitmap))
> > +		return -EINVAL;
> > +
> > +	domain->pgsize_bitmap = vdev->pgsize_bitmap;
> > +
> >   	domain->geometry	= viommu->geometry;
> >   	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain,
> > @@ -657,7 +681,7 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
> >   		 * Properly initialize the domain now that we know which viommu
> >   		 * owns it.
> >   		 */
> > -		ret = viommu_domain_finalise(vdev->viommu, domain);
> > +		ret = viommu_domain_finalise(vdev, domain);
> >   	} else if (vdomain->viommu != vdev->viommu) {
> >   		dev_err(dev, "cannot attach to foreign vIOMMU\n");
> >   		ret = -EXDEV;
> > @@ -875,6 +899,7 @@ static int viommu_add_device(struct device *dev)
> >   	vdev->dev = dev;
> >   	vdev->viommu = viommu;
> > +	vdev->pgsize_bitmap = viommu->pgsize_bitmap;
> >   	INIT_LIST_HEAD(&vdev->resv_regions);
> >   	fwspec->iommu_priv = vdev;
> > diff --git a/include/uapi/linux/virtio_iommu.h b/include/uapi/linux/virtio_iommu.h
> > index 237e36a280cb..dc9d3f40bcd8 100644
> > --- a/include/uapi/linux/virtio_iommu.h
> > +++ b/include/uapi/linux/virtio_iommu.h
> > @@ -111,6 +111,7 @@ struct virtio_iommu_req_unmap {
> >   #define VIRTIO_IOMMU_PROBE_T_NONE		0
> >   #define VIRTIO_IOMMU_PROBE_T_RESV_MEM		1
> > +#define VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK	2
> >   #define VIRTIO_IOMMU_PROBE_T_MASK		0xfff
> > @@ -119,6 +120,12 @@ struct virtio_iommu_probe_property {
> >   	__le16					length;
> >   };
> > +struct virtio_iommu_probe_pgsize_mask {
> > +	struct virtio_iommu_probe_property	head;
> > +	__u8					reserved[4];
> > +	__u64					pgsize_bitmap;

Should be __le64

Thanks,
Jean

> > +};
> > +
> >   #define VIRTIO_IOMMU_RESV_MEM_T_RESERVED	0
> >   #define VIRTIO_IOMMU_RESV_MEM_T_MSI		1
> > 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
