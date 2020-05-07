Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B787C1C8851
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 13:33:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3AC7688453;
	Thu,  7 May 2020 11:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfVc+QF7UfWH; Thu,  7 May 2020 11:32:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B770C884FF;
	Thu,  7 May 2020 11:32:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 947A3C0865;
	Thu,  7 May 2020 11:32:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80258C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 11:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7A05D20763
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 11:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HpR5WA-XyvpS
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 11:32:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 9CF9D203F8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 11:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588851173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zKLGgGO4EC8bZEq/1EyPdX/1tzanL3uq/PXrZRZ5pUs=;
 b=M4sEetfASNdYEQoUg/wfJqB1vXeLgZEBF4zQFUf1T5WjcEzFiJT89/DBGXpjK3QgLNALwq
 h788FU2dmrdTRLytRXq+xbkeDQKKfM6cFuF+XqUqDYA964G/guQ7BVpRUu6kjZGBf8jaV0
 OQ2Q8SFXWDdZrgKKeUDRNTlAb0Cfv3E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-B_8rwGQpMdCWjJMQ7Q3h1g-1; Thu, 07 May 2020 07:32:49 -0400
X-MC-Unique: B_8rwGQpMdCWjJMQ7Q3h1g-1
Received: by mail-wm1-f71.google.com with SMTP id n17so2369713wmi.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 07 May 2020 04:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zKLGgGO4EC8bZEq/1EyPdX/1tzanL3uq/PXrZRZ5pUs=;
 b=idnFE9U2C6O2V1SQvOp9bbHBKufzXbRpLTav86rhK3UM7ddELftHtDM9SG/kw6bX/W
 E2L1/3BxNRgoSAAL52ZPMsboyk30aNa2T2EyDPxt74t2LDuTXe6ZXttn/CZpoH7BiY1B
 4qrGXkT+bJhV6xC+1sM8orfjlgUBxEnvGeLIp+H1KuZ4LENJk5rLnBbH1IfYDndAY1cm
 QwLiOic2gZ5Xjf5mIfmq17nfRqKs8Dml04XXOwX6TgxoMt4WiKMjrqP3jNy7H0KYfmPv
 lGlsTzjev0h5XfEF0VcRCe8qBXxDhtDHcp5cw9iac2RbcYVK1EwP3Kf0WiA2hc+WpRrp
 Mf2g==
X-Gm-Message-State: AGi0PuZWRNMEHaPjS5y4HQT+7rJZzKjlATwFvSOC+ppXZScCODuIBADc
 NJQZCeW74NsrsQtPKBdf2nYCawYHe0AG0ux1N9gKRMQM5kam1L/6NmudZYljPbjfW7+IiIFf79d
 E+kJK6uZKNubG7qJkPMoArog92/BQ30ebOyE09Gedpw==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr1636654wmj.100.1588851168105; 
 Thu, 07 May 2020 04:32:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypKMkK4Y96wvTf/c8NvxL5kFBl0MGlrC6lL6F0vzq4zAXwQPVzNdt6CSv6HKmQS/jT5SdzM0nA==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr1636629wmj.100.1588851167852; 
 Thu, 07 May 2020 04:32:47 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 p8sm7547138wre.11.2020.05.07.04.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 04:32:47 -0700 (PDT)
Date: Thu, 7 May 2020 07:32:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bharat Bhushan <bbhushan2@marvell.com>
Subject: Re: [EXT] Re: [PATCH v5] iommu/virtio: Use page size bitmap
 supported by endpoint
Message-ID: <20200507072619-mutt-send-email-mst@kernel.org>
References: <20200505093004.1935-1-bbhushan2@marvell.com>
 <20200505200659-mutt-send-email-mst@kernel.org>
 <MWHPR1801MB19669FA26D44E1C31DF89BDBE3A50@MWHPR1801MB1966.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR1801MB19669FA26D44E1C31DF89BDBE3A50@MWHPR1801MB1966.namprd18.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
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

On Thu, May 07, 2020 at 11:24:29AM +0000, Bharat Bhushan wrote:
> 
> 
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, May 6, 2020 5:53 AM
> > To: Bharat Bhushan <bbhushan2@marvell.com>
> > Cc: jean-philippe@linaro.org; joro@8bytes.org; jasowang@redhat.com;
> > virtualization@lists.linux-foundation.org; iommu@lists.linux-foundation.org;
> > linux-kernel@vger.kernel.org; eric.auger.pro@gmail.com; eric.auger@redhat.com
> > Subject: [EXT] Re: [PATCH v5] iommu/virtio: Use page size bitmap supported by
> > endpoint
> > 
> > External Email
> > 
> > ----------------------------------------------------------------------
> > On Tue, May 05, 2020 at 03:00:04PM +0530, Bharat Bhushan wrote:
> > > Different endpoint can support different page size, probe endpoint if
> > > it supports specific page size otherwise use global page sizes.
> > >
> > > Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> > > ---
> > > v4->v5:
> > >  - Rebase to Linux v5.7-rc4
> > >
> > > v3->v4:
> > >  - Fix whitespace error
> > >
> > > v2->v3:
> > >  - Fixed error return for incompatible endpoint
> > >  - __u64 changed to __le64 in header file
> > >
> > >  drivers/iommu/virtio-iommu.c      | 48 ++++++++++++++++++++++++++++---
> > >  include/uapi/linux/virtio_iommu.h |  7 +++++
> > >  2 files changed, 51 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/iommu/virtio-iommu.c
> > > b/drivers/iommu/virtio-iommu.c index d5cac4f46ca5..9513d2ab819e 100644
> > > --- a/drivers/iommu/virtio-iommu.c
> > > +++ b/drivers/iommu/virtio-iommu.c
> > > @@ -78,6 +78,7 @@ struct viommu_endpoint {
> > >  	struct viommu_dev		*viommu;
> > >  	struct viommu_domain		*vdomain;
> > >  	struct list_head		resv_regions;
> > > +	u64				pgsize_bitmap;
> > >  };
> > >
> > >  struct viommu_request {
> > > @@ -415,6 +416,19 @@ static int viommu_replay_mappings(struct
> > viommu_domain *vdomain)
> > >  	return ret;
> > >  }
> > >
> > > +static int viommu_set_pgsize_bitmap(struct viommu_endpoint *vdev,
> > > +				    struct virtio_iommu_probe_pgsize_mask *mask,
> > > +				    size_t len)
> > > +{
> > > +	u64 pgsize_bitmap = le64_to_cpu(mask->pgsize_bitmap);
> > > +
> > > +	if (len < sizeof(*mask))
> > 
> > This is too late to validate length, you have dereferenced it already.
> > do it before the read pls.
> 
> Yes, Will change here and other places as well
> 
> > 
> > > +		return -EINVAL;
> > 
> > OK but note that guest will then just proceed to ignore the property. Is that really
> > OK? Wouldn't host want to know?
> 
> 
> Guest need to be in sync with device, so yes seems like guest need to tell device which page-size-mask it is using.
> 
> Corresponding spec change patch (https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg06214.html)
> 
> Would like Jean/Eric to comment here as well.
> 
> > 
> > 
> > > +
> > > +	vdev->pgsize_bitmap = pgsize_bitmap;
> > 
> > what if bitmap is 0? Is that a valid size? I see a bunch of BUG_ON with that value ...
> 
> As per spec proposed device is supposed to set at-least one bit.
> Will add a bug_on her.

Or better fail probe ...

> Should we add bug_on or switch to global config page-size mask if this is zero (notify device which page-size-mask it is using).

It's a spec violation, I wouldn't try to use the device.

> > 
> > I also see a bunch of code like e.g. this:
> > 
> >         pg_size = 1UL << __ffs(pgsize_bitmap);
> > 
> > which probably won't DTRT on a 32 bit guest if the bitmap has bits set in the high
> > word.
> > 
> 
> My thought is that in that case viommu_domain_finalise() will fail, do not proceed.

That's undefined behaviour in C. You need to make sure this condition
is never reached. And spec does not make this illegal at all
so it looks like we actually need to handle this gracefully.


> > 
> > 
> > > +	return 0;
> > > +}
> > > +
> > >  static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
> > >  			       struct virtio_iommu_probe_resv_mem *mem,
> > >  			       size_t len)
> > > @@ -499,6 +513,9 @@ static int viommu_probe_endpoint(struct viommu_dev
> > *viommu, struct device *dev)
> > >  		case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
> > >  			ret = viommu_add_resv_mem(vdev, (void *)prop, len);
> > >  			break;
> > > +		case VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK:
> > > +			ret = viommu_set_pgsize_bitmap(vdev, (void *)prop, len);
> > > +			break;
> > >  		default:
> > >  			dev_err(dev, "unknown viommu prop 0x%x\n", type);
> > >  		}
> > > @@ -630,7 +647,7 @@ static int viommu_domain_finalise(struct
> > > viommu_endpoint *vdev,
> > >
> > >  	vdomain->id		= (unsigned int)ret;
> > >
> > > -	domain->pgsize_bitmap	= viommu->pgsize_bitmap;
> > > +	domain->pgsize_bitmap	= vdev->pgsize_bitmap;
> > >  	domain->geometry	= viommu->geometry;
> > >
> > >  	vdomain->map_flags	= viommu->map_flags;
> > > @@ -654,6 +671,29 @@ static void viommu_domain_free(struct iommu_domain
> > *domain)
> > >  	kfree(vdomain);
> > >  }
> > >
> > > +/*
> > > + * Check whether the endpoint's capabilities are compatible with
> > > +other
> > > + * endpoints in the domain. Report any inconsistency.
> > > + */
> > > +static bool viommu_endpoint_is_compatible(struct viommu_endpoint *vdev,
> > > +					  struct viommu_domain *vdomain) {
> > > +	struct device *dev = vdev->dev;
> > > +
> > > +	if (vdomain->viommu != vdev->viommu) {
> > > +		dev_err(dev, "cannot attach to foreign vIOMMU\n");
> > > +		return false;
> > > +	}
> > > +
> > > +	if (vdomain->domain.pgsize_bitmap != vdev->pgsize_bitmap) {
> > > +		dev_err(dev, "incompatible domain bitmap 0x%lx != 0x%llx\n",
> > > +			vdomain->domain.pgsize_bitmap, vdev->pgsize_bitmap);
> > > +		return false;
> > > +	}
> > 
> > I'm confused by this. So let's assume host supports pages sizes of 4k, 2M, 1G. It
> > signals this in the properties. Nice.
> > Now domain supports 4k, 2M and that's all. Why is that a problem?
> > Just don't use 1G ...
> 
> Is not it too to change the existing domain properties, for devices already attached to domain? New devices must match to domain page-size.

Again if IOMMU supports more page sizes than domain uses, why is
that a problem? Just don't utilize the bits domain does not use.


> > 
> > 
> > > +
> > > +	return true;
> > > +}
> > > +
> > >  static int viommu_attach_dev(struct iommu_domain *domain, struct
> > > device *dev)  {
> > >  	int i;
> > > @@ -670,9 +710,8 @@ static int viommu_attach_dev(struct iommu_domain
> > *domain, struct device *dev)
> > >  		 * owns it.
> > >  		 */
> > >  		ret = viommu_domain_finalise(vdev, domain);
> > > -	} else if (vdomain->viommu != vdev->viommu) {
> > > -		dev_err(dev, "cannot attach to foreign vIOMMU\n");
> > > -		ret = -EXDEV;
> > > +	} else if (!viommu_endpoint_is_compatible(vdev, vdomain)) {
> > > +		ret = -EINVAL;
> > >  	}
> > >  	mutex_unlock(&vdomain->mutex);
> > >
> > > @@ -886,6 +925,7 @@ static int viommu_add_device(struct device *dev)
> > >
> > >  	vdev->dev = dev;
> > >  	vdev->viommu = viommu;
> > > +	vdev->pgsize_bitmap = viommu->pgsize_bitmap;
> > >  	INIT_LIST_HEAD(&vdev->resv_regions);
> > >  	dev_iommu_priv_set(dev, vdev);
> > >
> > > diff --git a/include/uapi/linux/virtio_iommu.h
> > > b/include/uapi/linux/virtio_iommu.h
> > > index 48e3c29223b5..2cced7accc99 100644
> > > --- a/include/uapi/linux/virtio_iommu.h
> > > +++ b/include/uapi/linux/virtio_iommu.h
> > 
> > As any virtio UAPI change, you need to copy virtio TC at some point before this is
> > merged ...
> 
> Jean already send patch for same
> https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg06214.html
> 
> Do we need to do anything additional?


Yes, that is spec patch. you need to see the UAPI patch to virtio-dev.

> > 
> > > @@ -111,6 +111,7 @@ struct virtio_iommu_req_unmap {
> > >
> > >  #define VIRTIO_IOMMU_PROBE_T_NONE		0
> > >  #define VIRTIO_IOMMU_PROBE_T_RESV_MEM		1
> > > +#define VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK	2
> > >
> > >  #define VIRTIO_IOMMU_PROBE_T_MASK		0xfff
> > >
> > 
> > Does host need to know that guest will ignore the page size mask?
> > Maybe we need a feature bit.
> > 
> > > @@ -119,6 +120,12 @@ struct virtio_iommu_probe_property {
> > >  	__le16					length;
> > >  };
> > >
> > > +struct virtio_iommu_probe_pgsize_mask {
> > > +	struct virtio_iommu_probe_property	head;
> > > +	__u8					reserved[4];
> > > +	__le64					pgsize_bitmap;
> > > +};
> > > +
> > 
> > This is UAPI. Document the format of pgsize_bitmap please.
> 
> Ok,
> 
> Thanks
> -Bharat
> 
> > 
> > 
> > >  #define VIRTIO_IOMMU_RESV_MEM_T_RESERVED	0
> > >  #define VIRTIO_IOMMU_RESV_MEM_T_MSI		1
> > >
> > > --
> > > 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
