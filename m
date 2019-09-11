Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2B0AF41A
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 03:50:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D34F2ACD;
	Wed, 11 Sep 2019 01:50:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D6207A80
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 01:49:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0FDB882B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 01:49:58 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Sep 2019 18:49:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,491,1559545200"; d="scan'208";a="189527651"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.71])
	by orsmga006.jf.intel.com with ESMTP; 10 Sep 2019 18:49:54 -0700
Date: Wed, 11 Sep 2019 09:47:26 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH 3/4] virtio: introudce a mdev based transport
Message-ID: <20190911014726.GA14798@___>
References: <20190910081935.30516-1-jasowang@redhat.com>
	<20190910081935.30516-4-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910081935.30516-4-jasowang@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: idos@mellanox.com, kvm@vger.kernel.org, mst@redhat.com,
	netdev@vger.kernel.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	xiao.w.wang@intel.com, zhihong.wang@intel.com,
	maxime.coquelin@redhat.com, haotian.wang@sifive.com,
	rob.miller@broadcom.com
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

On Tue, Sep 10, 2019 at 04:19:34PM +0800, Jason Wang wrote:
> This path introduces a new mdev transport for virtio. This is used to
> use kernel virtio driver to drive the mediated device that is capable
> of populating virtqueue directly.
> 
> A new virtio-mdev driver will be registered to the mdev bus, when a
> new virtio-mdev device is probed, it will register the device with
> mdev based config ops. This means, unlike the exist hardware
> transport, this is a software transport between mdev driver and mdev
> device. The transport was implemented through:
> 
> - configuration access was implemented through parent_ops->read()/write()
> - vq/config callback was implemented through parent_ops->ioctl()
> 
> This transport is derived from virtio MMIO protocol and was wrote for
> kernel driver. But for the transport itself, but the design goal is to
> be generic enough to support userspace driver (this part will be added
> in the future).
> 
> Note:
> - current mdev assume all the parameter of parent_ops was from
>   userspace. This prevents us from implementing the kernel mdev
>   driver. For a quick POC, this patch just abuse those parameter and
>   assume the mdev device implementation will treat them as kernel
>   pointer. This should be addressed in the formal series by extending
>   mdev_parent_ops.
> - for a quick POC, I just drive the transport from MMIO, I'm pretty
>   there's lot of optimization space for this.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/vfio/mdev/Kconfig        |   7 +
>  drivers/vfio/mdev/Makefile       |   1 +
>  drivers/vfio/mdev/virtio_mdev.c  | 500 +++++++++++++++++++++++++++++++
>  include/uapi/linux/virtio_mdev.h | 131 ++++++++
>  4 files changed, 639 insertions(+)
>  create mode 100644 drivers/vfio/mdev/virtio_mdev.c
>  create mode 100644 include/uapi/linux/virtio_mdev.h
> 
[...]
> diff --git a/include/uapi/linux/virtio_mdev.h b/include/uapi/linux/virtio_mdev.h
> new file mode 100644
> index 000000000000..8040de6b960a
> --- /dev/null
> +++ b/include/uapi/linux/virtio_mdev.h
> @@ -0,0 +1,131 @@
> +/*
> + * Virtio mediated device driver
> + *
> + * Copyright 2019, Red Hat Corp.
> + *
> + * Based on Virtio MMIO driver by ARM Ltd, copyright ARM Ltd. 2011
> + *
> + * This header is BSD licensed so anyone can use the definitions to implement
> + * compatible drivers/servers.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the distribution.
> + * 3. Neither the name of IBM nor the names of its contributors
> + *    may be used to endorse or promote products derived from this software
> + *    without specific prior written permission.
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' AND
> + * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> + * ARE DISCLAIMED.  IN NO EVENT SHALL IBM OR CONTRIBUTORS BE LIABLE
> + * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> + * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> + * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> + * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> + * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> + * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> + * SUCH DAMAGE.
> + */
> +#ifndef _LINUX_VIRTIO_MDEV_H
> +#define _LINUX_VIRTIO_MDEV_H
> +
> +#include <linux/interrupt.h>
> +#include <linux/vringh.h>
> +#include <uapi/linux/virtio_net.h>
> +
> +/*
> + * Ioctls
> + */
> +
> +struct virtio_mdev_callback {
> +	irqreturn_t (*callback)(void *);
> +	void *private;
> +};
> +
> +#define VIRTIO_MDEV 0xAF
> +#define VIRTIO_MDEV_SET_VQ_CALLBACK _IOW(VIRTIO_MDEV, 0x00, \
> +					 struct virtio_mdev_callback)
> +#define VIRTIO_MDEV_SET_CONFIG_CALLBACK _IOW(VIRTIO_MDEV, 0x01, \
> +					struct virtio_mdev_callback)
> +
> +#define VIRTIO_MDEV_DEVICE_API_STRING		"virtio-mdev"
> +
> +/*
> + * Control registers
> + */
> +
> +/* Magic value ("virt" string) - Read Only */
> +#define VIRTIO_MDEV_MAGIC_VALUE		0x000
> +
> +/* Virtio device version - Read Only */
> +#define VIRTIO_MDEV_VERSION		0x004
> +
> +/* Virtio device ID - Read Only */
> +#define VIRTIO_MDEV_DEVICE_ID		0x008
> +
> +/* Virtio vendor ID - Read Only */
> +#define VIRTIO_MDEV_VENDOR_ID		0x00c
> +
> +/* Bitmask of the features supported by the device (host)
> + * (32 bits per set) - Read Only */
> +#define VIRTIO_MDEV_DEVICE_FEATURES	0x010
> +
> +/* Device (host) features set selector - Write Only */
> +#define VIRTIO_MDEV_DEVICE_FEATURES_SEL	0x014
> +
> +/* Bitmask of features activated by the driver (guest)
> + * (32 bits per set) - Write Only */
> +#define VIRTIO_MDEV_DRIVER_FEATURES	0x020
> +
> +/* Activated features set selector - Write Only */
> +#define VIRTIO_MDEV_DRIVER_FEATURES_SEL	0x024
> +
> +/* Queue selector - Write Only */
> +#define VIRTIO_MDEV_QUEUE_SEL		0x030
> +
> +/* Maximum size of the currently selected queue - Read Only */
> +#define VIRTIO_MDEV_QUEUE_NUM_MAX	0x034
> +
> +/* Queue size for the currently selected queue - Write Only */
> +#define VIRTIO_MDEV_QUEUE_NUM		0x038
> +
> +/* Ready bit for the currently selected queue - Read Write */
> +#define VIRTIO_MDEV_QUEUE_READY		0x044
> +
> +/* Alignment of virtqueue - Read Only */
> +#define VIRTIO_MDEV_QUEUE_ALIGN		0x048
> +
> +/* Queue notifier - Write Only */
> +#define VIRTIO_MDEV_QUEUE_NOTIFY	0x050
> +
> +/* Device status register - Read Write */
> +#define VIRTIO_MDEV_STATUS		0x060
> +
> +/* Selected queue's Descriptor Table address, 64 bits in two halves */
> +#define VIRTIO_MDEV_QUEUE_DESC_LOW	0x080
> +#define VIRTIO_MDEV_QUEUE_DESC_HIGH	0x084
> +
> +/* Selected queue's Available Ring address, 64 bits in two halves */
> +#define VIRTIO_MDEV_QUEUE_AVAIL_LOW	0x090
> +#define VIRTIO_MDEV_QUEUE_AVAIL_HIGH	0x094
> +
> +/* Selected queue's Used Ring address, 64 bits in two halves */
> +#define VIRTIO_MDEV_QUEUE_USED_LOW	0x0a0
> +#define VIRTIO_MDEV_QUEUE_USED_HIGH	0x0a4
> +
> +/* Configuration atomicity value */
> +#define VIRTIO_MDEV_CONFIG_GENERATION	0x0fc
> +
> +/* The config space is defined by each driver as
> + * the per-driver configuration space - Read Write */
> +#define VIRTIO_MDEV_CONFIG		0x100

IIUC, we can use above registers with virtio-mdev parent's
read()/write() to access the mdev device from kernel driver.
As you suggested, it's a choice to build vhost-mdev on top
of this abstraction as well. But virtio is the frontend
device which lacks some vhost backend features, e.g. get
vring base, set vring base, negotiate vhost features, etc.
So I'm wondering, does it make sense to reserve some space
for vhost-mdev in kernel to do vhost backend specific setups?
Or do you have any other thoughts?

Besides, I'm also wondering, what's the purpose of making
above registers part of UAPI? And if we make them part
of UAPI, do we also need to make them part of virtio spec?

Thanks!
Tiwei

> +
> +#endif
> +
> +
> +/* Ready bit for the currently selected queue - Read Write */
> -- 
> 2.19.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
