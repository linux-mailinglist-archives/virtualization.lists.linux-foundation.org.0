Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA3CDC732
	for <lists.virtualization@lfdr.de>; Fri, 18 Oct 2019 16:20:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DCE27EE5;
	Fri, 18 Oct 2019 14:20:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4AA96ED6
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 14:20:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DB0DD8C7
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 14:20:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 778C7C057F2C;
	Fri, 18 Oct 2019 14:20:26 +0000 (UTC)
Received: from gondolin (dhcp-192-202.str.redhat.com [10.33.192.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45C8519D70;
	Fri, 18 Oct 2019 14:20:10 +0000 (UTC)
Date: Fri, 18 Oct 2019 16:20:07 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V4 5/6] virtio: introduce a mdev based transport
Message-ID: <20191018162007.31631039.cohuck@redhat.com>
In-Reply-To: <20191017104836.32464-6-jasowang@redhat.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
	<20191017104836.32464-6-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 18 Oct 2019 14:20:27 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org,
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

On Thu, 17 Oct 2019 18:48:35 +0800
Jason Wang <jasowang@redhat.com> wrote:

> This patch introduces a new mdev transport for virtio. This is used to
> use kernel virtio driver to drive the mediated device that is capable
> of populating virtqueue directly.
> 
> A new virtio-mdev driver will be registered to the mdev bus, when a
> new virtio-mdev device is probed, it will register the device with
> mdev based config ops. This means it is a software transport between
> mdev driver and mdev device. The transport was implemented through
> device specific ops which is a part of mdev_parent_ops now.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/virtio/Kconfig       |   7 +
>  drivers/virtio/Makefile      |   1 +
>  drivers/virtio/virtio_mdev.c | 409 +++++++++++++++++++++++++++++++++++
>  3 files changed, 417 insertions(+)

(...)

> +static int virtio_mdev_probe(struct device *dev)
> +{
> +	struct mdev_device *mdev = mdev_from_dev(dev);
> +	const struct virtio_mdev_device_ops *ops = mdev_get_dev_ops(mdev);
> +	struct virtio_mdev_device *vm_dev;
> +	int rc;
> +
> +	vm_dev = devm_kzalloc(dev, sizeof(*vm_dev), GFP_KERNEL);
> +	if (!vm_dev)
> +		return -ENOMEM;
> +
> +	vm_dev->vdev.dev.parent = dev;
> +	vm_dev->vdev.dev.release = virtio_mdev_release_dev;
> +	vm_dev->vdev.config = &virtio_mdev_config_ops;
> +	vm_dev->mdev = mdev;
> +	INIT_LIST_HEAD(&vm_dev->virtqueues);
> +	spin_lock_init(&vm_dev->lock);
> +
> +	vm_dev->version = ops->get_mdev_features(mdev);
> +	if (vm_dev->version != VIRTIO_MDEV_F_VERSION_1) {
> +		dev_err(dev, "VIRTIO_MDEV_F_VERSION_1 is mandatory\n");
> +		return -ENXIO;
> +	}

Hm, so how is that mdev features interface supposed to work? If
VIRTIO_MDEV_F_VERSION_1 is a bit, I would expect this code to test for
its presence, and not for identity.

What will happen if we come up with a version 2? If this is backwards
compatible, will both version 2 and version 1 be set?

> +
> +	vm_dev->vdev.id.device = ops->get_device_id(mdev);
> +	if (vm_dev->vdev.id.device == 0)
> +		return -ENODEV;
> +
> +	vm_dev->vdev.id.vendor = ops->get_vendor_id(mdev);
> +	rc = register_virtio_device(&vm_dev->vdev);
> +	if (rc)
> +		put_device(dev);
> +	else
> +		dev_set_drvdata(dev, vm_dev);
> +
> +	return rc;
> +}

(...)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
