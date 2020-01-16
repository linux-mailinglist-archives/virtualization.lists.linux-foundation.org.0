Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D849413DA3B
	for <lists.virtualization@lfdr.de>; Thu, 16 Jan 2020 13:43:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D9A7B2152C;
	Thu, 16 Jan 2020 12:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYlVgWDc3YZL; Thu, 16 Jan 2020 12:43:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2E9022150A;
	Thu, 16 Jan 2020 12:43:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08898C077D;
	Thu, 16 Jan 2020 12:43:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AE53C077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 91CB7861B2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhM-UKs72K3z
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:42:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 197C2861A3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579178575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WoZ0K4rRpiCW2qZjV/rJhDzQmCc+LfTgnMm+6gb2PKw=;
 b=e5PLuWH4GY8a3WNn6r9eqt5OPvBfw2AYbDBHeGNA3NaqiGOL6WvRVpkaHdqGwZLlxJnhGS
 TE+99FG5MnYzd9rMs2ZHuV6YOYUG8VMvlTdRTSa/tJuHYh/3ymvh2SnADZ/91JfAMMek0J
 LrImgMgsagkVeGMG7eNlT6uePpzlqrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-PcWvHHUMNVOFfEm04vtmnQ-1; Thu, 16 Jan 2020 07:42:52 -0500
X-MC-Unique: PcWvHHUMNVOFfEm04vtmnQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4009DB61;
 Thu, 16 Jan 2020 12:42:49 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-70.pek2.redhat.com [10.72.12.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBB995C1C3;
 Thu, 16 Jan 2020 12:42:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org
Subject: [PATCH 0/5] vDPA support
Date: Thu, 16 Jan 2020 20:42:26 +0800
Message-Id: <20200116124231.20253-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: jakub.kicinski@netronome.com, mhabets@solarflare.com, jgg@mellanox.com,
 rob.miller@broadcom.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, haotian.wang@sifive.com, shahafs@mellanox.com,
 parav@mellanox.com, jiri@mellanox.com, xiao.w.wang@intel.com,
 stefanha@redhat.com, zhihong.wang@intel.com, rdunlap@infradead.org,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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

Hi all:

Based on the comments and discussion for mdev based hardware virtio
offloading support[1]. A different approach to support vDPA device is
proposed in this series.

Instead of leveraging VFIO/mdev which may not work for some
vendors. This series tries to introduce a dedicated vDPA bus and
leverage vhost for userspace drivers. This help for the devices that
are not fit for VFIO and may reduce the conflict when try to propose a
bus template for virtual devices in [1].

The vDPA support is split into following parts:

1) vDPA core (bus, device and driver abstraction)
2) virtio vDPA transport for kernel virtio driver to control vDPA
   device
3) vhost vDPA bus driver for userspace vhost driver to control vDPA
   device
4) vendor vDPA drivers
5) management API

Both 1) and 2) are included in this series. Tiwei will work on part
3). For 4), Ling Shan will work and post IFCVF driver. For 5) we leave
it to vendor to implement, but it's better to come into an agreement
for management to create/configure/destroy vDPA device.

The sample driver is kept but renamed to vdap_sim. An on-chip IOMMU
implementation is added to sample device to make it work for both
kernel virtio driver and userspace vhost driver. It implements a sysfs
based management API, but it can switch to any other (e.g devlink) if
necessary.

Please refer each patch for more information.

Comments are welcomed.

[1] https://lkml.org/lkml/2019/11/18/261

Jason Wang (5):
  vhost: factor out IOTLB
  vringh: IOTLB support
  vDPA: introduce vDPA bus
  virtio: introduce a vDPA based transport
  vdpasim: vDPA device simulator

 MAINTAINERS                    |   2 +
 drivers/vhost/Kconfig          |   7 +
 drivers/vhost/Kconfig.vringh   |   1 +
 drivers/vhost/Makefile         |   2 +
 drivers/vhost/net.c            |   2 +-
 drivers/vhost/vhost.c          | 221 +++------
 drivers/vhost/vhost.h          |  36 +-
 drivers/vhost/vhost_iotlb.c    | 171 +++++++
 drivers/vhost/vringh.c         | 434 +++++++++++++++++-
 drivers/virtio/Kconfig         |  15 +
 drivers/virtio/Makefile        |   2 +
 drivers/virtio/vdpa/Kconfig    |  26 ++
 drivers/virtio/vdpa/Makefile   |   3 +
 drivers/virtio/vdpa/vdpa.c     | 141 ++++++
 drivers/virtio/vdpa/vdpa_sim.c | 796 +++++++++++++++++++++++++++++++++
 drivers/virtio/virtio_vdpa.c   | 400 +++++++++++++++++
 include/linux/vdpa.h           | 191 ++++++++
 include/linux/vhost_iotlb.h    |  45 ++
 include/linux/vringh.h         |  36 ++
 19 files changed, 2327 insertions(+), 204 deletions(-)
 create mode 100644 drivers/vhost/vhost_iotlb.c
 create mode 100644 drivers/virtio/vdpa/Kconfig
 create mode 100644 drivers/virtio/vdpa/Makefile
 create mode 100644 drivers/virtio/vdpa/vdpa.c
 create mode 100644 drivers/virtio/vdpa/vdpa_sim.c
 create mode 100644 drivers/virtio/virtio_vdpa.c
 create mode 100644 include/linux/vdpa.h
 create mode 100644 include/linux/vhost_iotlb.h

-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
