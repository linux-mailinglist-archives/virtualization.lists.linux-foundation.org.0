Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1D9BD54D
	for <lists.virtualization@lfdr.de>; Wed, 25 Sep 2019 01:07:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D2378D3B;
	Tue, 24 Sep 2019 23:07:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 391D3CB0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 23:07:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 858478A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 23:07:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB6B830C7C71;
	Tue, 24 Sep 2019 23:07:11 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F01219C7F;
	Tue, 24 Sep 2019 23:07:04 +0000 (UTC)
Date: Tue, 24 Sep 2019 17:06:40 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
Message-ID: <20190924170640.1da03bae@x1.home>
In-Reply-To: <20190924135332.14160-7-jasowang@redhat.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
	<20190924135332.14160-7-jasowang@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 24 Sep 2019 23:07:12 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
	airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	parav@mellanox.com, zhihong.wang@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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

On Tue, 24 Sep 2019 21:53:30 +0800
Jason Wang <jasowang@redhat.com> wrote:

> This patch implements basic support for mdev driver that supports
> virtio transport for kernel virtio driver.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  include/linux/mdev.h        |   2 +
>  include/linux/virtio_mdev.h | 145 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 147 insertions(+)
>  create mode 100644 include/linux/virtio_mdev.h
> 
> diff --git a/include/linux/mdev.h b/include/linux/mdev.h
> index 3414307311f1..73ac27b3b868 100644
> --- a/include/linux/mdev.h
> +++ b/include/linux/mdev.h
> @@ -126,6 +126,8 @@ struct mdev_device *mdev_from_dev(struct device *dev);
>  
>  enum {
>  	MDEV_ID_VFIO = 1,
> +	MDEV_ID_VIRTIO = 2,
> +	MDEV_ID_VHOST = 3,

MDEV_ID_VHOST isn't used yet here.  Also, given the strong
interdependence between the class_id and the ops structure, we might
wand to define them in the same place.  Thanks,

Alex

>  	/* New entries must be added here */
>  };
>  
> diff --git a/include/linux/virtio_mdev.h b/include/linux/virtio_mdev.h
> new file mode 100644
> index 000000000000..d1a40a739266
> --- /dev/null
> +++ b/include/linux/virtio_mdev.h
> @@ -0,0 +1,145 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Virtio mediated device driver
> + *
> + * Copyright 2019, Red Hat Corp.
> + *     Author: Jason Wang <jasowang@redhat.com>
> + */
> +#ifndef _LINUX_VIRTIO_MDEV_H
> +#define _LINUX_VIRTIO_MDEV_H
> +
> +#include <linux/interrupt.h>
> +#include <linux/mdev.h>
> +#include <uapi/linux/vhost.h>
> +
> +#define VIRTIO_MDEV_DEVICE_API_STRING		"virtio-mdev"
> +#define VIRTIO_MDEV_VERSION 0x1
> +
> +struct virtio_mdev_callback {
> +	irqreturn_t (*callback)(void *data);
> +	void *private;
> +};
> +
> +/**
> + * struct vfio_mdev_device_ops - Structure to be registered for each
> + * mdev device to register the device to virtio-mdev module.
> + *
> + * @set_vq_address:		Set the address of virtqueue
> + *				@mdev: mediated device
> + *				@idx: virtqueue index
> + *				@desc_area: address of desc area
> + *				@driver_area: address of driver area
> + *				@device_area: address of device area
> + *				Returns integer: success (0) or error (< 0)
> + * @set_vq_num:		Set the size of virtqueue
> + *				@mdev: mediated device
> + *				@idx: virtqueue index
> + *				@num: the size of virtqueue
> + * @kick_vq:			Kick the virtqueue
> + *				@mdev: mediated device
> + *				@idx: virtqueue index
> + * @set_vq_cb:			Set the interrut calback function for
> + *				a virtqueue
> + *				@mdev: mediated device
> + *				@idx: virtqueue index
> + *				@cb: virtio-mdev interrupt callback structure
> + * @set_vq_ready:		Set ready status for a virtqueue
> + *				@mdev: mediated device
> + *				@idx: virtqueue index
> + *				@ready: ready (true) not ready(false)
> + * @get_vq_ready:		Get ready status for a virtqueue
> + *				@mdev: mediated device
> + *				@idx: virtqueue index
> + *				Returns boolean: ready (true) or not (false)
> + * @set_vq_state:		Set the state for a virtqueue
> + *				@mdev: mediated device
> + *				@idx: virtqueue index
> + *				@state: virtqueue state (last_avail_idx)
> + *				Returns integer: success (0) or error (< 0)
> + * @get_vq_state:		Get the state for a virtqueue
> + *				@mdev: mediated device
> + *				@idx: virtqueue index
> + *				Returns virtqueue state (last_avail_idx)
> + * @get_vq_align:		Get the virtqueue align requirement
> + *				for the device
> + *				@mdev: mediated device
> + *				Returns virtqueue algin requirement
> + * @get_features:		Get virtio features supported by the device
> + *				@mdev: mediated device
> + *				Returns the features support by the
> + *				device
> + * @get_features:		Set virtio features supported by the driver
> + *				@mdev: mediated device
> + *				@features: feature support by the driver
> + *				Returns integer: success (0) or error (< 0)
> + * @set_config_cb:		Set the config interrupt callback
> + *				@mdev: mediated device
> + *				@cb: virtio-mdev interrupt callback structure
> + * @get_device_id:		Get virtio device id
> + *				@mdev: mediated device
> + *				Returns u32: virtio device id
> + * @get_vendor_id:		Get virtio vendor id
> + *				@mdev: mediated device
> + *				Returns u32: virtio vendor id
> + * @get_status:		Get the device status
> + *				@mdev: mediated device
> + *				Returns u8: virtio device status
> + * @set_status:		Set the device status
> + *				@mdev: mediated device
> + *				@status: virtio device status
> + * @get_config:		Read from device specific confiugration space
> + *				@mdev: mediated device
> + *				@offset: offset from the beginning of
> + *				configuration space
> + *				@buf: buffer used to read to
> + *				@len: the length to read from
> + *				configration space
> + * @set_config:		Write to device specific confiugration space
> + *				@mdev: mediated device
> + *				@offset: offset from the beginning of
> + *				configuration space
> + *				@buf: buffer used to write from
> + *				@len: the length to write to
> + *				configration space
> + * @get_version:		Get the version of virtio mdev device
> + *				@mdev: mediated device
> + *				Returns integer: version of the device
> + * @get_generation:		Get device generaton
> + *				@mdev: mediated device
> + *				Returns u32: device generation
> + */
> +struct virtio_mdev_device_ops {
> +	/* Virtqueue ops */
> +	int (*set_vq_address)(struct mdev_device *mdev,
> +			      u16 idx, u64 desc_area, u64 driver_area,
> +			      u64 device_area);
> +	void (*set_vq_num)(struct mdev_device *mdev, u16 idx, u32 num);
> +	void (*kick_vq)(struct mdev_device *mdev, u16 idx);
> +	void (*set_vq_cb)(struct mdev_device *mdev, u16 idx,
> +			  struct virtio_mdev_callback *cb);
> +	void (*set_vq_ready)(struct mdev_device *mdev, u16 idx, bool ready);
> +	bool (*get_vq_ready)(struct mdev_device *mdev, u16 idx);
> +	int (*set_vq_state)(struct mdev_device *mdev, u16 idx, u64 state);
> +	u64 (*get_vq_state)(struct mdev_device *mdev, u16 idx);
> +
> +	/* Device ops */
> +	u16 (*get_vq_align)(struct mdev_device *mdev);
> +	u64 (*get_features)(struct mdev_device *mdev);
> +	int (*set_features)(struct mdev_device *mdev, u64 features);
> +	void (*set_config_cb)(struct mdev_device *mdev,
> +			      struct virtio_mdev_callback *cb);
> +	u16 (*get_queue_max)(struct mdev_device *mdev);
> +	u32 (*get_device_id)(struct mdev_device *mdev);
> +	u32 (*get_vendor_id)(struct mdev_device *mdev);
> +	u8 (*get_status)(struct mdev_device *mdev);
> +	void (*set_status)(struct mdev_device *mdev, u8 status);
> +	void (*get_config)(struct mdev_device *mdev, unsigned int offset,
> +			   void *buf, unsigned int len);
> +	void (*set_config)(struct mdev_device *mdev, unsigned int offset,
> +			   const void *buf, unsigned int len);
> +	int (*get_version)(struct mdev_device *mdev);
> +	u32 (*get_generation)(struct mdev_device *mdev);
> +};
> +
> +#endif
> +

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
