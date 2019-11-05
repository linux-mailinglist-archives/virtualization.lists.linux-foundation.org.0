Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5921EF0368
	for <lists.virtualization@lfdr.de>; Tue,  5 Nov 2019 17:51:07 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B2078D83;
	Tue,  5 Nov 2019 16:51:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2F4C2D83
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 16:50:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 49856189
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 16:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572972655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=DEq/4N6z16D+kibBkGDa/kA9t8KJGrCRdBUQy6uE194=;
	b=aCP80+BpFVXW9q2bKK9XWMdMd4FPzGixMyzL3PJTFsHfjG8BjohepaqUWrP6C9w0BJDSML
	RMhlsHdaXhsf6Anm5JpmpvdJJEQUPrSbB9hW5Kdor3ZMN9yGa6dvnkbzWH1iWI6vwRQbG6
	MHVZ9/q1GZy+k5i8yLyPQ4E6LfUw0xc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-333-Dv4NBosnMKiU07dNahgicg-1; Tue, 05 Nov 2019 11:50:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99D18800C73;
	Tue,  5 Nov 2019 16:50:47 +0000 (UTC)
Received: from gondolin (unknown [10.36.118.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2771608AC;
	Tue,  5 Nov 2019 16:50:27 +0000 (UTC)
Date: Tue, 5 Nov 2019 17:50:25 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V8 3/6] mdev: introduce device specific ops
Message-ID: <20191105175025.1a620844.cohuck@redhat.com>
In-Reply-To: <20191105093240.5135-4-jasowang@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
	<20191105093240.5135-4-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Dv4NBosnMKiU07dNahgicg-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
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

On Tue,  5 Nov 2019 17:32:37 +0800
Jason Wang <jasowang@redhat.com> wrote:

> Currently, except for the create and remove, the rest of
> mdev_parent_ops is designed for vfio-mdev driver only and may not help
> for kernel mdev driver. With the help of class id, this patch
> introduces device specific callbacks inside mdev_device
> structure. This allows different set of callback to be used by
> vfio-mdev and virtio-mdev.
> 
> Reviewed-by: Parav Pandit <parav@mellanox.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  .../driver-api/vfio-mediated-device.rst       | 35 +++++++++----
>  MAINTAINERS                                   |  1 +
>  drivers/gpu/drm/i915/gvt/kvmgt.c              | 18 ++++---
>  drivers/s390/cio/vfio_ccw_ops.c               | 18 ++++---
>  drivers/s390/crypto/vfio_ap_ops.c             | 14 +++--
>  drivers/vfio/mdev/mdev_core.c                 | 24 ++++++++-
>  drivers/vfio/mdev/mdev_private.h              |  5 ++
>  drivers/vfio/mdev/vfio_mdev.c                 | 37 ++++++-------
>  include/linux/mdev.h                          | 43 ++++-----------
>  include/linux/mdev_vfio_ops.h                 | 52 +++++++++++++++++++
>  samples/vfio-mdev/mbochs.c                    | 20 ++++---
>  samples/vfio-mdev/mdpy.c                      | 20 ++++---
>  samples/vfio-mdev/mtty.c                      | 18 ++++---
>  13 files changed, 206 insertions(+), 99 deletions(-)
>  create mode 100644 include/linux/mdev_vfio_ops.h
> 

(...)

> @@ -172,10 +163,34 @@ that a driver should use to unregister itself with the mdev core driver::
>  
>  	extern void mdev_unregister_device(struct device *dev);
>  
> -It is also required to specify the class_id in create() callback through::
> +As multiple types of mediated devices may be supported, class id needs
> +to be specified in the create callback(). This could be done

The brackets should probably go behind 'create'?

> +explicitly for the device that does not use on mdev bus for its

"for devices that do not use the mdev bus" ?

But why wouldn't they? I feel like I've missed some discussion here :/

> +operation through:
>  
>  	int mdev_set_class(struct mdev_device *mdev, u16 id);
>  
> +For the device that uses on the mdev bus for its operation, the class

"For devices that use the mdev bus..."

But same comment as above.

> +should provide helper function to set class id and device specific
> +ops. E.g for vfio-mdev devices, the function to be called is::
> +
> +	int mdev_set_vfio_ops(struct mdev_device *mdev,
> +                              const struct mdev_vfio_device_ops *vfio_ops);
> +
> +The class id (set by this function to MDEV_CLASS_ID_VFIO) is used to
> +match a device with an mdev driver via its id table. The device
> +specific callbacks (specified in *vfio_ops) are obtainable via
> +mdev_get_vfio_ops() (for use by the mdev bus driver). A vfio-mdev
> +device (class id MDEV_CLASS_ID_VFIO) uses the following
> +device-specific ops:
> +
> +* open: open callback of vfio mediated device
> +* close: close callback of vfio mediated device
> +* ioctl: ioctl callback of vfio mediated device
> +* read : read emulation callback
> +* write: write emulation callback
> +* mmap: mmap emulation callback
> +
>  Mediated Device Management Interface Through sysfs
>  ==================================================

Otherwise, looks good.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
