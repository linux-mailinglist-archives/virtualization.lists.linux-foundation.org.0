Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F27EBB398
	for <lists.virtualization@lfdr.de>; Mon, 23 Sep 2019 14:21:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 482ACCCE;
	Mon, 23 Sep 2019 12:21:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 69D76CC6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 12:21:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E2875102
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 12:21:51 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16FBE63704
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 12:21:51 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id s3so17327836qkd.6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 05:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=a9/IjKSOTtP+H0DwvJWJwjvwhzIswSQaCoNDgf8fYiY=;
	b=kEx1HvXTuERwzy4Q8Ok7MyTaqaFy65aR4zFg2+Vgt33f31ENkaKJQKTLLRXlxclSzH
	nGulX9SP4z/9BYLCzSuZS6XMe46OprAxL00HkMgc3mHo5x1jd+XsTUS1KWKXXGw/qaC/
	lMkXqXnfrG50+QENIGSb1QEF+yBoIFclSChgk+DV9X+HRjrFRScmvwv/93/+qbmNhGie
	0F21W7OudfdezZxV8ZRVHfR2BFBrpALDzds5VxhL1LTwBCr4n/5MNIcyQn7FnSPJZfmN
	v+cUgPQJn4wu1tKZ30X+AoCsR1CLPqsBOz3ES8MrGUgrL77FyaP60ZbzZAE0d+xjyVel
	jiCw==
X-Gm-Message-State: APjAAAXHmUuHKi8gCIU/trYtniAx6tcCaeUK07Ppj8JYAt+hYgG2gG69
	rAVx04p2GRW3ykiUhAKVSb8I9itTuc1ZZRsPA7YX8wYPypS8E82/v4C3+ArRqNXXUpJIbeLAtnN
	zEPMwFuf1yOlzu4UDnvSo5afghZYxhJANEOfimrIHcQ==
X-Received: by 2002:ac8:7117:: with SMTP id z23mr16276202qto.309.1569241310360;
	Mon, 23 Sep 2019 05:21:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy19kCOwHbgejDjIiixAFXfW0feeppk9Ux+t6GtFmBM+eqf5FZ/rCyZVT2dupdlVrgcrW4SDA==
X-Received: by 2002:ac8:7117:: with SMTP id z23mr16276147qto.309.1569241310042;
	Mon, 23 Sep 2019 05:21:50 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	o38sm6573805qtc.39.2019.09.23.05.21.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 05:21:48 -0700 (PDT)
Date: Mon, 23 Sep 2019 08:21:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH V2 0/6] mdev based hardware virtio offloading support
Message-ID: <20190923074913-mutt-send-email-mst@kernel.org>
References: <20190920082050.19352-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920082050.19352-1-jasowang@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, zhihong.wang@intel.com,
	rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
	akrowiak@linux.ibm.com, oberpar@linux.ibm.com,
	pmorel@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
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

On Fri, Sep 20, 2019 at 04:20:44PM +0800, Jason Wang wrote:
> Hi all:
> 
> There are hardware that can do virtio datapath offloading while having
> its own control path. This path tries to implement a mdev based
> unified API to support using kernel virtio driver to drive those
> devices. This is done by introducing a new mdev transport for virtio
> (virtio_mdev) and register itself as a new kind of mdev driver. Then
> it provides a unified way for kernel virtio driver to talk with mdev
> device implementation.

This is actually simple enough that I'm inclined to just
put this into linux-next.
This mixes virtio and vfio so the code can thinkably
be merged through either tree.
Alex, any strong opinions on any of this?

> Though the series only contain kernel driver support, the goal is to
> make the transport generic enough to support userspace drivers. This
> means vhost-mdev[1] could be built on top as well by resuing the
> transport.
> 
> A sample driver is also implemented which simulate a virito-net
> loopback ethernet device on top of vringh + workqueue. This could be
> used as a reference implementation for real hardware driver.
> 
> Consider mdev framework only support VFIO device and driver right now,
> this series also extend it to support other types. This is done
> through introducing class id to the device and pairing it with
> id_talbe claimed by the driver. On top, this seris also decouple
> device specific parents ops out of the common ones.
> 
> Pktgen test was done with virito-net + mvnet loop back device.
> 
> Please review.
> 
> Changes from V1:
> 
> - rename device id to class id
> - add docs for class id and device specific ops (device_ops)
> - split device_ops into seperate headers
> - drop the mdev_set_dma_ops()
> - use device_ops to implement the transport API, then it's not a part
>   of UAPI any more
> - use GFP_ATOMIC in mvnet sample device and other tweaks
> - set_vring_base/get_vring_base support for mvnet device
> 
> Jason Wang (6):
>   mdev: class id support
>   mdev: introduce device specific ops
>   mdev: introduce virtio device and its device ops
>   virtio: introudce a mdev based transport
>   vringh: fix copy direction of vringh_iov_push_kern()
>   docs: Sample driver to demonstrate how to implement virtio-mdev
>     framework
> 
>  .../driver-api/vfio-mediated-device.rst       |  11 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |  17 +-
>  drivers/s390/cio/vfio_ccw_ops.c               |  17 +-
>  drivers/s390/crypto/vfio_ap_ops.c             |  14 +-
>  drivers/vfio/mdev/Kconfig                     |   7 +
>  drivers/vfio/mdev/Makefile                    |   1 +
>  drivers/vfio/mdev/mdev_core.c                 |  21 +-
>  drivers/vfio/mdev/mdev_driver.c               |  14 +
>  drivers/vfio/mdev/mdev_private.h              |   1 +
>  drivers/vfio/mdev/vfio_mdev.c                 |  37 +-
>  drivers/vfio/mdev/virtio_mdev.c               | 418 +++++++++++
>  drivers/vhost/vringh.c                        |   8 +-
>  include/linux/mdev.h                          |  46 +-
>  include/linux/mod_devicetable.h               |   8 +
>  include/linux/vfio_mdev.h                     |  50 ++
>  include/linux/virtio_mdev.h                   | 141 ++++
>  samples/Kconfig                               |   7 +
>  samples/vfio-mdev/Makefile                    |   1 +
>  samples/vfio-mdev/mbochs.c                    |  19 +-
>  samples/vfio-mdev/mdpy.c                      |  19 +-
>  samples/vfio-mdev/mtty.c                      |  17 +-
>  samples/vfio-mdev/mvnet.c                     | 688 ++++++++++++++++++
>  22 files changed, 1473 insertions(+), 89 deletions(-)
>  create mode 100644 drivers/vfio/mdev/virtio_mdev.c
>  create mode 100644 include/linux/vfio_mdev.h
>  create mode 100644 include/linux/virtio_mdev.h
>  create mode 100644 samples/vfio-mdev/mvnet.c
> 
> -- 
> 2.19.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
