Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE2FEE039
	for <lists.virtualization@lfdr.de>; Mon,  4 Nov 2019 13:41:41 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5EACBC83;
	Mon,  4 Nov 2019 12:41:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D9DFAC5C
	for <virtualization@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 12:41:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 107388AF
	for <virtualization@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 12:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572871291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding;
	bh=3lRiWjx8vPj59KFI8nozsNjrvfoBBNyG6+tCqhhdcCI=;
	b=HJHV8punUkgiB6m2d1AJvORUGBV0mAuI2CWKZTsCAmUhJmLFiX9Qsjvy70SxIxZxXa+3JH
	GGlyfELxmZKSKWYHMw0MtA1eCAHOh42wlJomY17J/ReyDTaXiRqO0vHTmfu5N4mdUhrVUl
	rgL1s82RnwG6bcrvays6wd2VAUrxDpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-368-L0fFHBqMNn6BGBO4yKeKXg-1; Mon, 04 Nov 2019 07:41:27 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E293D8017DD;
	Mon,  4 Nov 2019 12:41:23 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-65.pek2.redhat.com [10.72.12.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EB3560C63;
	Mon,  4 Nov 2019 12:39:59 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
	kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
	tiwei.bie@intel.com
Subject: [PATCH V7 0/6] mdev based hardware virtio offloading support
Date: Mon,  4 Nov 2019 20:39:46 +0800
Message-Id: <20191104123952.17276-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: L0fFHBqMNn6BGBO4yKeKXg-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, sebott@linux.ibm.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	virtualization@lists.linux-foundation.org,
	rob.miller@broadcom.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	jani.nikula@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, stefanha@redhat.com,
	akrowiak@linux.ibm.com, netdev@vger.kernel.org,
	cohuck@redhat.com, oberpar@linux.ibm.com,
	maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
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

Hi all:

There are hardwares that can do virtio datapath offloading while
having its own control path. This path tries to implement a mdev based
unified API to support using kernel virtio driver to drive those
devices. This is done by introducing a new mdev transport for virtio
(virtio_mdev) and register itself as a new kind of mdev driver. Then
it provides a unified way for kernel virtio driver to talk with mdev
device implementation.

Though the series only contains kernel driver support, the goal is to
make the transport generic enough to support userspace drivers. This
means vhost-mdev[1] could be built on top as well by resuing the
transport.

A sample driver is also implemented which simulate a virito-net
loopback ethernet device on top of vringh + workqueue. This could be
used as a reference implementation for real hardware driver.

Also a real ICF VF driver was also posted here[2] which is a good
reference for vendors who is interested in their own virtio datapath
offloading product.

Consider mdev framework only support VFIO device and driver right now,
this series also extend it to support other types. This is done
through introducing class id to the device and pairing it with
id_talbe claimed by the driver. On top, this seris also decouple
device specific parents ops out of the common ones.

Pktgen test was done with virito-net + mvnet loop back device.

Please review.

[1] https://lkml.org/lkml/2019/10/31/440
[2] https://lkml.org/lkml/2019/10/15/1226

Changes from V5:

- use dev_warn() instead of WARN(1) when class id is not set
- validate id_table before trying to do matching between device and
  driver
- add wildcard for modpost script
- use unique name for id_table
- move get_mdev_features() to be the first member of virtio_device_ops
  and more comments for it
- typo fixes for the comments above virtio_mdev_ops

Changes from V4:

- keep mdev_set_class() for the device that doesn't use device ops
- use union for device ops pointer in mdev_device
- introduce class specific helper for getting is device ops
- use WARN_ON instead of BUG_ON in mdev_set_virtio_ops
- explain details of get_mdev_features() and get_vendor_id()
- distinguish the optional virito device ops from mandatory ones and
  make get_generation() optional
- rename vfio_mdev.h to vfio_mdev_ops.h, rename virito_mdev.h to
  virtio_mdev_ops.h
- don't abuse version fileds in virtio_mdev structure, use features
  instead
- fix warning during device remove
- style & docs tweaks and typo fixes

Changes from V3:

- document that class id (device ops) must be specified in create()
- add WARN() when trying to set class_id when it has already set
- add WARN() when class_id is not specified in create() and correctly
  return an error in this case
- correct the prototype of mdev_set_class() in the doc
- add documention of mdev_set_class()
- remove the unnecessary "class_id_fail" label when class id is not
  specified in create()
- convert id_table in vfio_mdev to const
- move mdev_set_class and its friends after mdev_uuid()
- suqash the patch of bus uevent into patch of introducing class id
- tweak the words in the docs per Cornelia suggestion
- tie class_id and device ops through class specific initialization
  routine like mdev_set_vfio_ops()
- typos fixes in the docs of virtio-mdev callbacks
- document the usage of virtqueues in struct virtio_mdev_device
- remove the useless vqs array in struct virtio_mdev_device
- rename MDEV_ID_XXX to MDEV_CLASS_ID_XXX

Changes from V2:

- fail when class_id is not specified
- drop the vringh patch
- match the doc to the code
- tweak the commit log
- move device_ops from parent to mdev device
- remove the unused MDEV_ID_VHOST

Changes from V1:

- move virtio_mdev.c to drivers/virtio
- store class_id in mdev_device instead of mdev_parent
- store device_ops in mdev_device instead of mdev_parent
- reorder the patch, vringh fix comes first
- really silent compiling warnings
- really switch to use u16 for class_id
- uevent and modpost support for mdev class_id
- vraious tweaks per comments from Parav

Changes from RFC-V2:

- silent compile warnings on some specific configuration
- use u16 instead u8 for class id
- reseve MDEV_ID_VHOST for future vhost-mdev work
- introduce "virtio" type for mvnet and make "vhost" type for future
  work
- add entries in MAINTAINER
- tweak and typos fixes in commit log

Changes from RFC-V1:

- rename device id to class id
- add docs for class id and device specific ops (device_ops)
- split device_ops into seperate headers
- drop the mdev_set_dma_ops()
- use device_ops to implement the transport API, then it's not a part
  of UAPI any more
- use GFP_ATOMIC in mvnet sample device and other tweaks
- set_vring_base/get_vring_base support for mvnet device

Jason Wang (6):
  mdev: class id support
  modpost: add support for mdev class id
  mdev: introduce device specific ops
  mdev: introduce virtio device and its device ops
  virtio: introduce a mdev based transport
  docs: sample driver to demonstrate how to implement virtio-mdev
    framework

 .../driver-api/vfio-mediated-device.rst       |  38 +-
 MAINTAINERS                                   |   2 +
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  17 +-
 drivers/s390/cio/vfio_ccw_ops.c               |  17 +-
 drivers/s390/crypto/vfio_ap_ops.c             |  13 +-
 drivers/vfio/mdev/mdev_core.c                 |  57 ++
 drivers/vfio/mdev/mdev_driver.c               |  25 +
 drivers/vfio/mdev/mdev_private.h              |   8 +
 drivers/vfio/mdev/vfio_mdev.c                 |  45 +-
 drivers/virtio/Kconfig                        |   7 +
 drivers/virtio/Makefile                       |   1 +
 drivers/virtio/virtio_mdev.c                  | 413 +++++++++++
 include/linux/mdev.h                          |  57 +-
 include/linux/mdev_vfio_ops.h                 |  52 ++
 include/linux/mdev_virtio_ops.h               | 166 +++++
 include/linux/mod_devicetable.h               |   8 +
 samples/Kconfig                               |   7 +
 samples/vfio-mdev/Makefile                    |   1 +
 samples/vfio-mdev/mbochs.c                    |  19 +-
 samples/vfio-mdev/mdpy.c                      |  19 +-
 samples/vfio-mdev/mtty.c                      |  17 +-
 samples/vfio-mdev/mvnet.c                     | 691 ++++++++++++++++++
 scripts/mod/devicetable-offsets.c             |   3 +
 scripts/mod/file2alias.c                      |  11 +
 24 files changed, 1603 insertions(+), 91 deletions(-)
 create mode 100644 drivers/virtio/virtio_mdev.c
 create mode 100644 include/linux/mdev_vfio_ops.h
 create mode 100644 include/linux/mdev_virtio_ops.h
 create mode 100644 samples/vfio-mdev/mvnet.c

-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
