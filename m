Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7341EEAD4
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 21:05:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CB07F24E7D;
	Thu,  4 Jun 2020 19:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6JrV19K5zec; Thu,  4 Jun 2020 19:05:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0AD4024E08;
	Thu,  4 Jun 2020 19:05:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7E50C016E;
	Thu,  4 Jun 2020 19:05:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E946C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 19:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1AE9C881DA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 19:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSCKYBbSEgTp
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 19:05:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 19BD386C80
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 19:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591297531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ul0Gd1q39xy/+znscqHyGd+HqqENFH8nbxN3dnuntWk=;
 b=JwG/n1Xe+hXwWLoJ9cU4Vy3J5+fIjogt34Hq4y7QbUE4c+aGLOoLMsNXJ9Cgy+Ejd2l8VO
 HcFd9th+bUuk9ZqnESYVkgkdnOlzR5/Bo6QAZ3YYdCAa7uPEqSBLUlbtdtvnB8gUm3Ityt
 0zrL64eADI0j2lzUzdzE4dr2Siafjgw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-q6280J0OONWwWfIYs30pAg-1; Thu, 04 Jun 2020 15:05:29 -0400
X-MC-Unique: q6280J0OONWwWfIYs30pAg-1
Received: by mail-wr1-f70.google.com with SMTP id h6so2813447wrx.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 04 Jun 2020 12:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ul0Gd1q39xy/+znscqHyGd+HqqENFH8nbxN3dnuntWk=;
 b=ZfJ+PRawxFEzo4Z+SrMfmOJbWXpFotauZ3S4b9EZMKiTRyCSPKZvYgFuGL3Wnpmw0L
 5c/RmrezMS6nRhUPr+VW3+oaCYY2k7o+Fpf2Ir367RjLQMlZHK7/6M3gc4mcyAqHdS0H
 eyySFHIve0LoIinrnQqUYBlN3VQr6KTohauWtOialPOe4dWlPnoVMkNMuN3MBTM7+jl4
 xBWAH4kj5xR4gu4/+1ijsku0LQfVBeeRY46CyJeTjLiUHcqpUHN0OVoRNYpEjMigs5sS
 WB772hIJnEJQ1jVgCi5tvPGZjVaN4U/lgbjq+rnisXUbCWXdsC0UV8w4HhkhdXEf48P5
 cGnw==
X-Gm-Message-State: AOAM5318D7JhImnSeW+/UDL/7zENsMiQkHD7ceRon0M/fpCF6X52jGlU
 1kjNuJ8oA+OKhZqUTq42mZVG36fs9MOR3mA9OPvsIWL/ByRIUEzzgZ6YJOpSlJLfWJy9G6W6uc1
 Ex3KZdWTFwDLAQmoaNGl9k9HLiMDCMxHKFIUaLaaYow==
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr4956124wmj.146.1591297528016; 
 Thu, 04 Jun 2020 12:05:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyilb2EQmaD9XeUNkwrvnyHI7PCfvokVhncmnDFTklSZwJ5vM0u4I0Afx8vNqV5lpNVQn4Mag==
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr4956100wmj.146.1591297527751; 
 Thu, 04 Jun 2020 12:05:27 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 j190sm8467500wmb.33.2020.06.04.12.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 12:05:27 -0700 (PDT)
Date: Thu, 4 Jun 2020 15:05:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v4 1/3] virtio: add dma-buf support for exported objects
Message-ID: <20200604145620-mutt-send-email-mst@kernel.org>
References: <20200526105811.30784-1-stevensd@chromium.org>
 <20200526105811.30784-2-stevensd@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200526105811.30784-2-stevensd@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: dri-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
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

On Tue, May 26, 2020 at 07:58:09PM +0900, David Stevens wrote:
> This change adds a new flavor of dma-bufs that can be used by virtio
> drivers to share exported objects. A virtio dma-buf can be queried by
> virtio drivers to obtain the UUID which identifies the underlying
> exported object.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>

Is this just for graphics? If yes I'd rather we put it in the graphics
driver. We can always move it later ...

> ---
>  drivers/virtio/Makefile         |  2 +-
>  drivers/virtio/virtio.c         |  6 +++
>  drivers/virtio/virtio_dma_buf.c | 89 +++++++++++++++++++++++++++++++++
>  include/linux/virtio.h          |  1 +
>  include/linux/virtio_dma_buf.h  | 58 +++++++++++++++++++++
>  5 files changed, 155 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/virtio/virtio_dma_buf.c
>  create mode 100644 include/linux/virtio_dma_buf.h
> 
> diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> index 29a1386ecc03..ecdae5b596de 100644
> --- a/drivers/virtio/Makefile
> +++ b/drivers/virtio/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
>  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
>  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
>  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index a977e32a88f2..5d46f0ded92d 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
>  }
>  EXPORT_SYMBOL_GPL(register_virtio_device);
>  
> +bool is_virtio_device(struct device *dev)
> +{
> +	return dev->bus == &virtio_bus;
> +}
> +EXPORT_SYMBOL_GPL(is_virtio_device);
> +
>  void unregister_virtio_device(struct virtio_device *dev)
>  {
>  	int index = dev->index; /* save for after device release */
> diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> new file mode 100644
> index 000000000000..23e3399b11ed
> --- /dev/null
> +++ b/drivers/virtio/virtio_dma_buf.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * dma-bufs for virtio exported objects
> + *
> + * Copyright (C) 2020 Google, Inc.
> + */
> +
> +#include <linux/virtio_dma_buf.h>
> +
> +/**
> + * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> + *
> + * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> + * for an virtio exported object that can be queried by other virtio drivers
> + * for the object's UUID.
> + */
> +struct dma_buf *virtio_dma_buf_export(
> +		const struct virtio_dma_buf_export_info *virtio_exp_info)
> +{
> +	struct dma_buf_export_info exp_info;
> +
> +	if (!virtio_exp_info->ops
> +		|| virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
> +		|| !virtio_exp_info->ops->get_uuid) {
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	exp_info.exp_name = virtio_exp_info->exp_name;
> +	exp_info.owner = virtio_exp_info->owner;
> +	exp_info.ops = &virtio_exp_info->ops->ops;
> +	exp_info.size = virtio_exp_info->size;
> +	exp_info.flags = virtio_exp_info->flags;
> +	exp_info.resv = virtio_exp_info->resv;
> +	exp_info.priv = virtio_exp_info->priv;
> +	BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
> +		     != sizeof(struct dma_buf_export_info));

This is the only part that gives me pause. Why do we need this hack?
What's wrong with just using dma_buf_export_info directly,
and if you want the virtio ops, just using container_off?



> +
> +	return dma_buf_export(&exp_info);
> +}
> +EXPORT_SYMBOL(virtio_dma_buf_export);
> +
> +/**
> + * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> + */
> +int virtio_dma_buf_attach(struct dma_buf *dma_buf,
> +			  struct dma_buf_attachment *attach)
> +{
> +	int ret;
> +	const struct virtio_dma_buf_ops *ops = container_of(
> +			dma_buf->ops, const struct virtio_dma_buf_ops, ops);
> +
> +	if (ops->device_attach) {
> +		ret = ops->device_attach(dma_buf, attach);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(virtio_dma_buf_attach);
> +
> +/**
> + * is_virtio_dma_buf - returns true if the given dma-buf is a virtio dma-buf
> + * @dma_buf: buffer to query
> + */
> +bool is_virtio_dma_buf(struct dma_buf *dma_buf)
> +{
> +	return dma_buf->ops->attach == &virtio_dma_buf_attach;
> +}
> +EXPORT_SYMBOL(is_virtio_dma_buf);
> +
> +/**
> + * virtio_dma_buf_get_uuid - gets the uuid of the virtio dma-buf's exported object
> + * @dma_buf: [in] buffer to query
> + * @uuid: [out] the uuid
> + *
> + * Returns: 0 on success, negative on failure.
> + */
> +int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
> +			    uuid_t *uuid)
> +{
> +	const struct virtio_dma_buf_ops *ops = container_of(
> +			dma_buf->ops, const struct virtio_dma_buf_ops, ops);
> +
> +	if (!is_virtio_dma_buf(dma_buf))
> +		return -EINVAL;
> +
> +	return ops->get_uuid(dma_buf, uuid);
> +}
> +EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index 15f906e4a748..9397e25616c4 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -128,6 +128,7 @@ static inline struct virtio_device *dev_to_virtio(struct device *_dev)
>  void virtio_add_status(struct virtio_device *dev, unsigned int status);
>  int register_virtio_device(struct virtio_device *dev);
>  void unregister_virtio_device(struct virtio_device *dev);
> +bool is_virtio_device(struct device *dev);
>  
>  void virtio_break_device(struct virtio_device *dev);
>  
> diff --git a/include/linux/virtio_dma_buf.h b/include/linux/virtio_dma_buf.h
> new file mode 100644
> index 000000000000..29fee167afbd
> --- /dev/null
> +++ b/include/linux/virtio_dma_buf.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * dma-bufs for virtio exported objects
> + *
> + * Copyright (C) 2020 Google, Inc.
> + */
> +
> +#ifndef _LINUX_VIRTIO_DMA_BUF_H
> +#define _LINUX_VIRTIO_DMA_BUF_H
> +
> +#include <linux/dma-buf.h>
> +#include <linux/uuid.h>
> +#include <linux/virtio.h>
> +
> +/**
> + * struct virtio_dma_buf_ops - operations possible on exported object dma-buf
> + * @ops: the base dma_buf_ops. ops.attach MUST be virtio_dma_buf_attach.
> + * @device_attach: [optional] callback invoked by virtio_dma_buf_attach during
> + *		   all attach operations.
> + * @get_uid: [required] callback to get the uuid of the exported object.
> + */
> +struct virtio_dma_buf_ops {
> +	struct dma_buf_ops ops;
> +	int (*device_attach)(struct dma_buf *dma_buf,
> +			     struct dma_buf_attachment *attach);
> +	int (*get_uuid)(struct dma_buf *dma_buf, uuid_t *uuid);
> +};
> +
> +/**
> + * struct virtio_dma_buf_export_info - see struct dma_buf_export_info
> + */
> +struct virtio_dma_buf_export_info {
> +	const char *exp_name;
> +	struct module *owner;
> +	const struct virtio_dma_buf_ops *ops;
> +	size_t size;
> +	int flags;
> +	struct dma_resv *resv;
> +	void *priv;
> +};
> +
> +/**
> + * DEFINE_VIRTIO_DMA_BUF_EXPORT_INFO - helper macro for exporters
> + */
> +#define DEFINE_VIRTIO_DMA_BUF_EXPORT_INFO(name)	\
> +	struct virtio_dma_buf_export_info name = { \
> +		.exp_name = KBUILD_MODNAME, \
> +		.owner = THIS_MODULE }
> +
> +int virtio_dma_buf_attach(struct dma_buf *dma_buf,
> +			  struct dma_buf_attachment *attach);
> +
> +struct dma_buf *virtio_dma_buf_export(
> +		const struct virtio_dma_buf_export_info *virtio_exp_info);
> +bool is_virtio_dma_buf(struct dma_buf *dma_buf);
> +int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf, uuid_t *uuid);
> +
> +#endif /* _LINUX_VIRTIO_DMA_BUF_H */
> -- 
> 2.27.0.rc0.183.gde8f92d652-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
