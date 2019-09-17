Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B99B4510
	for <lists.virtualization@lfdr.de>; Tue, 17 Sep 2019 03:05:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7D8EBC9E;
	Tue, 17 Sep 2019 01:05:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8D7D9C4E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 01:05:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5A62C7DB
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 01:04:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Sep 2019 18:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,514,1559545200"; d="scan'208";a="180611926"
Received: from dpdk-virtio-tbie-2.sh.intel.com ([10.67.104.71])
	by orsmga008.jf.intel.com with ESMTP; 16 Sep 2019 18:04:55 -0700
From: Tiwei Bie <tiwei.bie@intel.com>
To: mst@redhat.com, jasowang@redhat.com, alex.williamson@redhat.com,
	maxime.coquelin@redhat.com
Subject: [RFC v4 0/3] vhost: introduce mdev based hardware backend
Date: Tue, 17 Sep 2019 09:02:01 +0800
Message-Id: <20190917010204.30376-1-tiwei.bie@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, lingshan.zhu@intel.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This RFC is to demonstrate below ideas,

a) Build vhost-mdev on top of the same abstraction defined in
   the virtio-mdev series [1];

b) Introduce /dev/vhost-mdev to do vhost ioctls and support
   setting mdev device as backend;

Now the userspace API looks like this:

- Userspace generates a compatible mdev device;

- Userspace opens this mdev device with VFIO API (including
  doing IOMMU programming for this mdev device with VFIO's
  container/group based interface);

- Userspace opens /dev/vhost-mdev and gets vhost fd;

- Userspace uses vhost ioctls to setup vhost (userspace should
  do VHOST_MDEV_SET_BACKEND ioctl with VFIO group fd and device
  fd first before doing other vhost ioctls);

Only compile test has been done for this series for now.

RFCv3: https://patchwork.kernel.org/patch/11117785/

[1] https://lkml.org/lkml/2019/9/10/135

Tiwei Bie (3):
  vfio: support getting vfio device from device fd
  vfio: support checking vfio driver by device ops
  vhost: introduce mdev based hardware backend

 drivers/vfio/mdev/vfio_mdev.c    |   3 +-
 drivers/vfio/vfio.c              |  32 +++
 drivers/vhost/Kconfig            |   9 +
 drivers/vhost/Makefile           |   3 +
 drivers/vhost/mdev.c             | 462 +++++++++++++++++++++++++++++++
 drivers/vhost/vhost.c            |  39 ++-
 drivers/vhost/vhost.h            |   6 +
 include/linux/vfio.h             |  11 +
 include/uapi/linux/vhost.h       |  10 +
 include/uapi/linux/vhost_types.h |   5 +
 10 files changed, 573 insertions(+), 7 deletions(-)
 create mode 100644 drivers/vhost/mdev.c

-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
