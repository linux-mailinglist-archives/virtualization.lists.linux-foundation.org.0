Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EC90DAE551
	for <lists.virtualization@lfdr.de>; Tue, 10 Sep 2019 10:20:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D953DE78;
	Tue, 10 Sep 2019 08:20:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0929DE70
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 08:20:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 77CA082B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 08:20:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 026D55859E;
	Tue, 10 Sep 2019 08:20:03 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-188.pek2.redhat.com [10.72.12.188])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 449B56092F;
	Tue, 10 Sep 2019 08:19:49 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: [RFC PATCH 0/4] mdev based hardware virtio offloading support
Date: Tue, 10 Sep 2019 16:19:31 +0800
Message-Id: <20190910081935.30516-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 10 Sep 2019 08:20:03 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: idos@mellanox.com, cohuck@redhat.com, kwankhede@nvidia.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	xiao.w.wang@intel.com, zhihong.wang@intel.com,
	haotian.wang@sifive.com, rob.miller@broadcom.com
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

There are hardware that can do virtio datapath offloading while having
its own control path. This path tries to implement a mdev based
unified API to support using kernel virtio driver to drive those
devices. This is done by introducing a new mdev transport for virtio
(virtio_mdev) and register itself as a new kind of mdev driver. Then
it provides a unified way for kernel virtio driver to talk with mdev
device implementation.

Though the series only contain kernel driver support, the goal is to
make the transport generic enough to support userspace drivers. This
means vhost-mdev[1] could be built on top as well by resuing the
transport.

A sample driver is also implemented which simulate a virito-net
loopback ethernet device on top of vringh + workqueue. This could be
used as a reference implementation for real hardware driver.

Notes:

- Some of the key transport command for vhost-mdev(userspace driver)
  is not introduced. This includes:
  1) set/get virtqueue state (idx etc), this could be simply done by
     introducing new transport command
  2) dirty pages tracking, could be simply done by introducing new
     transport command
  3) set/get device internal state, this requires more thought, of
     course we can introduce device specific transport command, but it
     would be better to have a unified API
- Current mdev_parent_ops assumes all pointers are userspace pointer,
  this block the kernel driver, this series just abuse those as kernel
  pointer and this could be addressed by inventing new parent_ops.
- For quick POC, mdev transport was just derived from virtio-MMIO,
  I'm pretty sure it has lots of space to be optimized, please share
  your thought.

Please review.

[1] https://lkml.org/lkml/2019/8/28/35

Jason Wang (4):
  vringh: fix copy direction of vringh_iov_push_kern()
  mdev: introduce helper to set per device dma ops
  virtio: introudce a mdev based transport
  docs: Sample driver to demonstrate how to implement virtio-mdev
    framework

 drivers/vfio/mdev/Kconfig        |   7 +
 drivers/vfio/mdev/Makefile       |   1 +
 drivers/vfio/mdev/mdev_core.c    |   7 +
 drivers/vfio/mdev/virtio_mdev.c  | 500 ++++++++++++++++++++
 drivers/vhost/vringh.c           |   8 +-
 include/linux/mdev.h             |   2 +
 include/uapi/linux/virtio_mdev.h | 131 ++++++
 samples/Kconfig                  |   7 +
 samples/vfio-mdev/Makefile       |   1 +
 samples/vfio-mdev/mvnet.c        | 766 +++++++++++++++++++++++++++++++
 10 files changed, 1429 insertions(+), 1 deletion(-)
 create mode 100644 drivers/vfio/mdev/virtio_mdev.c
 create mode 100644 include/uapi/linux/virtio_mdev.h
 create mode 100644 samples/vfio-mdev/mvnet.c

-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
