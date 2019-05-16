Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC1208C9
	for <lists.virtualization@lfdr.de>; Thu, 16 May 2019 15:59:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 45C3EE33;
	Thu, 16 May 2019 13:59:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E0F909E7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 13:59:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4EB07897
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 13:59:20 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id f24so3924323qtk.11
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 06:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=4W8nxk4k4MVtLI1JLQcZmk+Bl22d4lanY5c6NY2cMcc=;
	b=nRI1cI+IB/vKSHSF53Zy8fVLGe0dGokhVqgRrvUm3fIxUZlg36ZbNEV/OnSu/CN4qe
	JsWSC1rHt1k/PC6XzGy5BI3S6T4v054kq7EX7tnKmI1OQZ6+iGRROOgm0BbcfJb7jXgC
	x/56+gFmS5kRS+L1XbYgBl/d8I9umAUAl1bcHJ/ULdsX44L27U5u6f0Z65wcTJfcTHdr
	5IkJJSCHnWqfAmffHid44ioTCcuH/8TRdSd1YAlhB62h+FViWzgZAQiVdHQFYDHLchiY
	YyBqCaFDl/6oGN5owl/EUDq+//QGEPvW1GdP5PTQ+QDrD/Qr0gBFDOfL5RFRruMO2atx
	mo+g==
X-Gm-Message-State: APjAAAXe9PHWcpAwiMzthxYdkopXHxfuxZhiby94mLlBDr/M+5c6B29h
	Ty9+jFf6B7RsG8H080BDJQDNcA==
X-Google-Smtp-Source: APXvYqwNqjWbg9ip//OmA0nM3GR5PQZt9aCGRYqOitDJVOvfxjGNt2YWHJMFjse5jwjGBTbN3j6Jnw==
X-Received: by 2002:a0c:fe48:: with SMTP id u8mr39012393qvs.234.1558015159428; 
	Thu, 16 May 2019 06:59:19 -0700 (PDT)
Received: from redhat.com ([185.54.206.10]) by smtp.gmail.com with ESMTPSA id
	o37sm3676500qta.86.2019.05.16.06.59.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 16 May 2019 06:59:18 -0700 (PDT)
Date: Thu, 16 May 2019 09:59:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v9 2/7] virtio-pmem: Add virtio pmem driver
Message-ID: <20190516095618-mutt-send-email-mst@kernel.org>
References: <20190514145422.16923-1-pagupta@redhat.com>
	<20190514145422.16923-3-pagupta@redhat.com>
	<9f6b1d8e-ef90-7d8b-56da-61a426953ba3@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f6b1d8e-ef90-7d8b-56da-61a426953ba3@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Pankaj Gupta <pagupta@redhat.com>, cohuck@redhat.com, jack@suse.cz,
	kvm@vger.kernel.org, david@fromorbit.com, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org,
	adilger.kernel@dilger.ca, zwisler@kernel.org,
	aarcange@redhat.com, dave.jiang@intel.com, jstaron@google.com,
	linux-nvdimm@lists.01.org, vishal.l.verma@intel.com,
	willy@infradead.org, hch@infradead.org,
	linux-acpi@vger.kernel.org, jmoyer@redhat.com,
	linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval.shaia@oracle.com, stefanha@redhat.com,
	pbonzini@redhat.com, dan.j.williams@intel.com,
	lcapitulino@redhat.com, nilal@redhat.com, tytso@mit.edu,
	xiaoguangrong.eric@gmail.com, darrick.wong@oracle.com,
	rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	imammedo@redhat.com
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

On Wed, May 15, 2019 at 10:46:00PM +0200, David Hildenbrand wrote:
> > +	vpmem->vdev = vdev;
> > +	vdev->priv = vpmem;
> > +	err = init_vq(vpmem);
> > +	if (err) {
> > +		dev_err(&vdev->dev, "failed to initialize virtio pmem vq's\n");
> > +		goto out_err;
> > +	}
> > +
> > +	virtio_cread(vpmem->vdev, struct virtio_pmem_config,
> > +			start, &vpmem->start);
> > +	virtio_cread(vpmem->vdev, struct virtio_pmem_config,
> > +			size, &vpmem->size);
> > +
> > +	res.start = vpmem->start;
> > +	res.end   = vpmem->start + vpmem->size-1;
> 
> nit: " - 1;"
> 
> > +	vpmem->nd_desc.provider_name = "virtio-pmem";
> > +	vpmem->nd_desc.module = THIS_MODULE;
> > +
> > +	vpmem->nvdimm_bus = nvdimm_bus_register(&vdev->dev,
> > +						&vpmem->nd_desc);
> > +	if (!vpmem->nvdimm_bus) {
> > +		dev_err(&vdev->dev, "failed to register device with nvdimm_bus\n");
> > +		err = -ENXIO;
> > +		goto out_vq;
> > +	}
> > +
> > +	dev_set_drvdata(&vdev->dev, vpmem->nvdimm_bus);
> > +
> > +	ndr_desc.res = &res;
> > +	ndr_desc.numa_node = nid;
> > +	ndr_desc.flush = async_pmem_flush;
> > +	set_bit(ND_REGION_PAGEMAP, &ndr_desc.flags);
> > +	set_bit(ND_REGION_ASYNC, &ndr_desc.flags);
> > +	nd_region = nvdimm_pmem_region_create(vpmem->nvdimm_bus, &ndr_desc);
> > +	if (!nd_region) {
> > +		dev_err(&vdev->dev, "failed to create nvdimm region\n");
> > +		err = -ENXIO;
> > +		goto out_nd;
> > +	}
> > +	nd_region->provider_data = dev_to_virtio(nd_region->dev.parent->parent);
> > +	return 0;
> > +out_nd:
> > +	nvdimm_bus_unregister(vpmem->nvdimm_bus);
> > +out_vq:
> > +	vdev->config->del_vqs(vdev);
> > +out_err:
> > +	return err;
> > +}
> > +
> > +static void virtio_pmem_remove(struct virtio_device *vdev)
> > +{
> > +	struct nvdimm_bus *nvdimm_bus = dev_get_drvdata(&vdev->dev);
> > +
> > +	nvdimm_bus_unregister(nvdimm_bus);
> > +	vdev->config->del_vqs(vdev);
> > +	vdev->config->reset(vdev);
> > +}
> > +
> > +static struct virtio_driver virtio_pmem_driver = {
> > +	.driver.name		= KBUILD_MODNAME,
> > +	.driver.owner		= THIS_MODULE,
> > +	.id_table		= id_table,
> > +	.probe			= virtio_pmem_probe,
> > +	.remove			= virtio_pmem_remove,
> > +};
> > +
> > +module_virtio_driver(virtio_pmem_driver);
> > +MODULE_DEVICE_TABLE(virtio, id_table);
> > +MODULE_DESCRIPTION("Virtio pmem driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/nvdimm/virtio_pmem.h b/drivers/nvdimm/virtio_pmem.h
> > new file mode 100644
> > index 000000000000..ab1da877575d
> > --- /dev/null
> > +++ b/drivers/nvdimm/virtio_pmem.h
> > @@ -0,0 +1,60 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * virtio_pmem.h: virtio pmem Driver
> > + *
> > + * Discovers persistent memory range information
> > + * from host and provides a virtio based flushing
> > + * interface.
> > + **/
> > +
> > +#ifndef _LINUX_VIRTIO_PMEM_H
> > +#define _LINUX_VIRTIO_PMEM_H
> > +
> > +#include <linux/virtio_ids.h>
> > +#include <linux/module.h>
> > +#include <linux/virtio_config.h>
> > +#include <uapi/linux/virtio_pmem.h>
> > +#include <linux/libnvdimm.h>
> > +#include <linux/spinlock.h>
> > +
> > +struct virtio_pmem_request {
> > +	/* Host return status corresponding to flush request */
> > +	int ret;
> > +
> > +	/* command name*/
> > +	char name[16];
> 
> So ... why are we sending string commands and expect native-endianess
> integers and don't define a proper request/response structure + request
> types in include/uapi/linux/virtio_pmem.h like

passing names could be ok.
I missed the fact we return a native endian int.
Pls fix that.


> 
> struct virtio_pmem_resp {
> 	__virtio32 ret;
> }
> 
> #define VIRTIO_PMEM_REQ_TYPE_FLUSH	1
> struct virtio_pmem_req {
> 	__virtio16 type;
> }
> 
> ... and this way we also define a proper endianess format for exchange
> and keep it extensible
> 
> @MST, what's your take on this?

Extensions can always use feature bits so I don't think
it's a problem.

> 
> -- 
> 
> Thanks,
> 
> David / dhildenb
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
