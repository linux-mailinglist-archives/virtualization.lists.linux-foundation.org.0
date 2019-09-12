Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E98AAB0BA1
	for <lists.virtualization@lfdr.de>; Thu, 12 Sep 2019 11:40:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E7575C9E;
	Thu, 12 Sep 2019 09:40:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 037B3AE7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 09:40:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A05CE81A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 09:40:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D954308FBFC;
	Thu, 12 Sep 2019 09:40:31 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-89.pek2.redhat.com [10.72.12.89])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 376B860852;
	Thu, 12 Sep 2019 09:40:14 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
	kwankhede@nvidia.com, alex.williamson@redhat.com
Subject: [RFC PATCH 0/2] Mdev: support mutiple kinds of devices
Date: Thu, 12 Sep 2019 17:40:10 +0800
Message-Id: <20190912094012.29653-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 12 Sep 2019 09:40:32 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: sebott@linux.ibm.com, mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	virtualization@lists.linux-foundation.org,
	rob.miller@broadcom.com, pasic@linux.ibm.com,
	borntraeger@de.ibm.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	jani.nikula@linux.intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	rodrigo.vivi@intel.com, lingshan.zhu@intel.com,
	akrowiak@linux.ibm.com, pmorel@linux.ibm.com, cohuck@redhat.com,
	oberpar@linux.ibm.com, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, zhihong.wang@intel.com
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

During the development of virtio-mdev[1]. I find that mdev needs to be
extended to support devices other than vfio mdev device. So this
series tries to extend the mdev to be able to differ from different
devices by:

- device id and matching for mdev bus
- device speicfic callbacks and move vfio callbacks there

Sent for early reivew, compile test only!

Thanks

[1] https://lkml.org/lkml/2019/9/10/135

Jason Wang (2):
  mdev: device id support
  mdev: introduce device specific ops

 drivers/gpu/drm/i915/gvt/kvmgt.c  | 16 ++++---
 drivers/s390/cio/vfio_ccw_ops.c   | 16 ++++---
 drivers/s390/crypto/vfio_ap_ops.c | 13 ++++--
 drivers/vfio/mdev/mdev_core.c     | 14 +++++-
 drivers/vfio/mdev/mdev_driver.c   | 14 ++++++
 drivers/vfio/mdev/mdev_private.h  |  1 +
 drivers/vfio/mdev/vfio_mdev.c     | 36 ++++++++++-----
 include/linux/mdev.h              | 76 +++++++++++++++++++------------
 include/linux/mod_devicetable.h   |  6 +++
 samples/vfio-mdev/mbochs.c        | 18 +++++---
 samples/vfio-mdev/mdpy.c          | 18 +++++---
 samples/vfio-mdev/mtty.c          | 16 ++++---
 12 files changed, 163 insertions(+), 81 deletions(-)

-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
