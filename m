Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 096961FF1B1
	for <lists.virtualization@lfdr.de>; Thu, 18 Jun 2020 14:29:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AF76B8775A;
	Thu, 18 Jun 2020 12:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCQbtO_iVmWK; Thu, 18 Jun 2020 12:29:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EBCE9876A0;
	Thu, 18 Jun 2020 12:29:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFABDC016E;
	Thu, 18 Jun 2020 12:29:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8896C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 12:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EF44081F34
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 12:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1o5lKUcvfHR
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 12:29:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7D9DE88293
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 12:29:02 +0000 (UTC)
IronPort-SDR: vs+38XGpsk6m24FqNsyzr6kH05BIhpK2BU2ti65Y+F3h6l824GU12KH+hXdmse+e/fhIih4QCl
 zgnpGnCdeibg==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="140891775"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="140891775"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 05:29:02 -0700
IronPort-SDR: zWy8t80wDV3GuZ52l+NYpDNn/3ln0dvMXJ/H9oYoCF5qW3xuuq0EMo/imTeISD+XE2ObbLZB5A
 WKm5dp7d7X8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="317811874"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.48.152])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jun 2020 05:28:58 -0700
Date: Thu, 18 Jun 2020 14:28:56 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 1/3] virtio: add dma-buf support for exported objects
Message-ID: <20200618122856.GC4189@ubuntu>
References: <20200526105811.30784-1-stevensd@chromium.org>
 <20200526105811.30784-2-stevensd@chromium.org>
 <20200604145620-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604145620-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Maxime Ripard <mripard@kernel.org>, virtio-dev@lists.oasis-open.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 David Stevens <stevensd@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
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

Hi Michael,

On Thu, Jun 04, 2020 at 03:05:23PM -0400, Michael S. Tsirkin wrote:
> On Tue, May 26, 2020 at 07:58:09PM +0900, David Stevens wrote:
> > This change adds a new flavor of dma-bufs that can be used by virtio
> > drivers to share exported objects. A virtio dma-buf can be queried by
> > virtio drivers to obtain the UUID which identifies the underlying
> > exported object.
> > 
> > Signed-off-by: David Stevens <stevensd@chromium.org>
> 
> Is this just for graphics? If yes I'd rather we put it in the graphics
> driver. We can always move it later ...

Wouldn't this be the API that audio virtualisation will have to use to share 
buffers between the host and any guests?

Thanks
Guennadi

> > ---
> >  drivers/virtio/Makefile         |  2 +-
> >  drivers/virtio/virtio.c         |  6 +++
> >  drivers/virtio/virtio_dma_buf.c | 89 +++++++++++++++++++++++++++++++++
> >  include/linux/virtio.h          |  1 +
> >  include/linux/virtio_dma_buf.h  | 58 +++++++++++++++++++++
> >  5 files changed, 155 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/virtio/virtio_dma_buf.c
> >  create mode 100644 include/linux/virtio_dma_buf.h
> > 
> > diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> > index 29a1386ecc03..ecdae5b596de 100644
> > --- a/drivers/virtio/Makefile
> > +++ b/drivers/virtio/Makefile
> > @@ -1,5 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> > +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
> >  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
> >  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
> >  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > index a977e32a88f2..5d46f0ded92d 100644
> > --- a/drivers/virtio/virtio.c
> > +++ b/drivers/virtio/virtio.c
> > @@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(register_virtio_device);
> >  
> > +bool is_virtio_device(struct device *dev)
> > +{
> > +	return dev->bus == &virtio_bus;
> > +}
> > +EXPORT_SYMBOL_GPL(is_virtio_device);
> > +
> >  void unregister_virtio_device(struct virtio_device *dev)
> >  {
> >  	int index = dev->index; /* save for after device release */
> > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> > new file mode 100644
> > index 000000000000..23e3399b11ed
> > --- /dev/null
> > +++ b/drivers/virtio/virtio_dma_buf.c
> > @@ -0,0 +1,89 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * dma-bufs for virtio exported objects
> > + *
> > + * Copyright (C) 2020 Google, Inc.
> > + */
> > +
> > +#include <linux/virtio_dma_buf.h>
> > +
> > +/**
> > + * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> > + *
> > + * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> > + * for an virtio exported object that can be queried by other virtio drivers
> > + * for the object's UUID.
> > + */
> > +struct dma_buf *virtio_dma_buf_export(
> > +		const struct virtio_dma_buf_export_info *virtio_exp_info)
> > +{
> > +	struct dma_buf_export_info exp_info;
> > +
> > +	if (!virtio_exp_info->ops
> > +		|| virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
> > +		|| !virtio_exp_info->ops->get_uuid) {
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	exp_info.exp_name = virtio_exp_info->exp_name;
> > +	exp_info.owner = virtio_exp_info->owner;
> > +	exp_info.ops = &virtio_exp_info->ops->ops;
> > +	exp_info.size = virtio_exp_info->size;
> > +	exp_info.flags = virtio_exp_info->flags;
> > +	exp_info.resv = virtio_exp_info->resv;
> > +	exp_info.priv = virtio_exp_info->priv;
> > +	BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
> > +		     != sizeof(struct dma_buf_export_info));
> 
> This is the only part that gives me pause. Why do we need this hack?
> What's wrong with just using dma_buf_export_info directly,
> and if you want the virtio ops, just using container_off?
> 
> 
> 
> > +
> > +	return dma_buf_export(&exp_info);
> > +}
> > +EXPORT_SYMBOL(virtio_dma_buf_export);
> > +
> > +/**
> > + * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> > + */
> > +int virtio_dma_buf_attach(struct dma_buf *dma_buf,
> > +			  struct dma_buf_attachment *attach)
> > +{
> > +	int ret;
> > +	const struct virtio_dma_buf_ops *ops = container_of(
> > +			dma_buf->ops, const struct virtio_dma_buf_ops, ops);
> > +
> > +	if (ops->device_attach) {
> > +		ret = ops->device_attach(dma_buf, attach);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(virtio_dma_buf_attach);
> > +
> > +/**
> > + * is_virtio_dma_buf - returns true if the given dma-buf is a virtio dma-buf
> > + * @dma_buf: buffer to query
> > + */
> > +bool is_virtio_dma_buf(struct dma_buf *dma_buf)
> > +{
> > +	return dma_buf->ops->attach == &virtio_dma_buf_attach;
> > +}
> > +EXPORT_SYMBOL(is_virtio_dma_buf);
> > +
> > +/**
> > + * virtio_dma_buf_get_uuid - gets the uuid of the virtio dma-buf's exported object
> > + * @dma_buf: [in] buffer to query
> > + * @uuid: [out] the uuid
> > + *
> > + * Returns: 0 on success, negative on failure.
> > + */
> > +int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
> > +			    uuid_t *uuid)
> > +{
> > +	const struct virtio_dma_buf_ops *ops = container_of(
> > +			dma_buf->ops, const struct virtio_dma_buf_ops, ops);
> > +
> > +	if (!is_virtio_dma_buf(dma_buf))
> > +		return -EINVAL;
> > +
> > +	return ops->get_uuid(dma_buf, uuid);
> > +}
> > +EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
> > diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> > index 15f906e4a748..9397e25616c4 100644
> > --- a/include/linux/virtio.h
> > +++ b/include/linux/virtio.h
> > @@ -128,6 +128,7 @@ static inline struct virtio_device *dev_to_virtio(struct device *_dev)
> >  void virtio_add_status(struct virtio_device *dev, unsigned int status);
> >  int register_virtio_device(struct virtio_device *dev);
> >  void unregister_virtio_device(struct virtio_device *dev);
> > +bool is_virtio_device(struct device *dev);
> >  
> >  void virtio_break_device(struct virtio_device *dev);
> >  
> > diff --git a/include/linux/virtio_dma_buf.h b/include/linux/virtio_dma_buf.h
> > new file mode 100644
> > index 000000000000..29fee167afbd
> > --- /dev/null
> > +++ b/include/linux/virtio_dma_buf.h
> > @@ -0,0 +1,58 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * dma-bufs for virtio exported objects
> > + *
> > + * Copyright (C) 2020 Google, Inc.
> > + */
> > +
> > +#ifndef _LINUX_VIRTIO_DMA_BUF_H
> > +#define _LINUX_VIRTIO_DMA_BUF_H
> > +
> > +#include <linux/dma-buf.h>
> > +#include <linux/uuid.h>
> > +#include <linux/virtio.h>
> > +
> > +/**
> > + * struct virtio_dma_buf_ops - operations possible on exported object dma-buf
> > + * @ops: the base dma_buf_ops. ops.attach MUST be virtio_dma_buf_attach.
> > + * @device_attach: [optional] callback invoked by virtio_dma_buf_attach during
> > + *		   all attach operations.
> > + * @get_uid: [required] callback to get the uuid of the exported object.
> > + */
> > +struct virtio_dma_buf_ops {
> > +	struct dma_buf_ops ops;
> > +	int (*device_attach)(struct dma_buf *dma_buf,
> > +			     struct dma_buf_attachment *attach);
> > +	int (*get_uuid)(struct dma_buf *dma_buf, uuid_t *uuid);
> > +};
> > +
> > +/**
> > + * struct virtio_dma_buf_export_info - see struct dma_buf_export_info
> > + */
> > +struct virtio_dma_buf_export_info {
> > +	const char *exp_name;
> > +	struct module *owner;
> > +	const struct virtio_dma_buf_ops *ops;
> > +	size_t size;
> > +	int flags;
> > +	struct dma_resv *resv;
> > +	void *priv;
> > +};
> > +
> > +/**
> > + * DEFINE_VIRTIO_DMA_BUF_EXPORT_INFO - helper macro for exporters
> > + */
> > +#define DEFINE_VIRTIO_DMA_BUF_EXPORT_INFO(name)	\
> > +	struct virtio_dma_buf_export_info name = { \
> > +		.exp_name = KBUILD_MODNAME, \
> > +		.owner = THIS_MODULE }
> > +
> > +int virtio_dma_buf_attach(struct dma_buf *dma_buf,
> > +			  struct dma_buf_attachment *attach);
> > +
> > +struct dma_buf *virtio_dma_buf_export(
> > +		const struct virtio_dma_buf_export_info *virtio_exp_info);
> > +bool is_virtio_dma_buf(struct dma_buf *dma_buf);
> > +int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf, uuid_t *uuid);
> > +
> > +#endif /* _LINUX_VIRTIO_DMA_BUF_H */
> > -- 
> > 2.27.0.rc0.183.gde8f92d652-goog
> 
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
