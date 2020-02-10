Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E1E156E24
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 04:57:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B51AA84545;
	Mon, 10 Feb 2020 03:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiBrDgYsbunN; Mon, 10 Feb 2020 03:57:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 075BD85232;
	Mon, 10 Feb 2020 03:57:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE650C0171;
	Mon, 10 Feb 2020 03:57:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0F4DC0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 03:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BB09184545
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 03:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9vSDDdrZqlW
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 03:57:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DD350850EA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 03:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581307051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FpaNsEwT/ks+uSjIzZvFcpf96lfi9mqPgeVQPWwqQKs=;
 b=V8vhku9frgr1FMr1SCcN5PnSCbkyo052XS0frT1yA2uscBpbNsx1q+vuuvMs9xnL48Mj1l
 5XFlw2HreRI5CHvSLW+l1VJOK5if2GB7Hn/veknmZjzeGD9aMiMsoj6/tm04HSMwWbOhB7
 TrpmrPt0b1bLT/2DR3PDfMRtkUNfUuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-zqTqYp5IPvKusquXu357Vg-1; Sun, 09 Feb 2020 22:57:27 -0500
X-MC-Unique: zqTqYp5IPvKusquXu357Vg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03CD8800D5E;
 Mon, 10 Feb 2020 03:57:25 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-219.pek2.redhat.com [10.72.13.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB5E9101D481;
 Mon, 10 Feb 2020 03:56:13 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: [PATCH V2 0/5] vDPA support
Date: Mon, 10 Feb 2020 11:56:03 +0800
Message-Id: <20200210035608.10002-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: jgg@mellanox.com, rob.miller@broadcom.com, lulu@redhat.com,
 hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, mhabets@solarflare.com, shahafs@mellanox.com,
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

This is an updated version of kernel support for vDPA device. Various
changes were made based on the feedback since last verion. One major
change is to drop the sysfs API and leave the management interface for
future development, and introudce the incremental DMA bus
operations. Please see changelog for more information.

The work on vhost, IFCVF (intel VF driver for vDPA) and qemu is
ongoing.

Please provide feedback.

Thanks

Change from V1:

- drop sysfs API, leave the management interface to future development
  (Michael)
- introduce incremental DMA ops (dma_map/dma_unmap) (Michael)
- introduce dma_device and use it instead of parent device for doing
  IOMMU or DMA from bus driver (Michael, Jason, Ling Shan, Tiwei)
- accept parent device and dma device when register vdpa device
- coding style and compile fixes (Randy)
- using vdpa_xxx instead of xxx_vdpa (Jason)
- ove vDPA accessors to header and make it static inline (Jason)
- split vdp_register_device() into two helpers vdpa_init_device() and
  vdpa_register_device() which allows intermediate step to be done (Jason)
- warn on invalidate queue state when fail to creating virtqueue (Jason)
- make to_virtio_vdpa_device() static (Jason)
- use kmalloc/kfree instead of devres for virtio vdpa device (Jason)
- avoid using cast in vdpa bus function (Jason)
- introduce module_vdpa_driver and fix module refcnt (Jason)
- fix returning freed address in vdapsim coherent DMA addr allocation (Dan)
- various other fixes and tweaks

V1: https://lkml.org/lkml/2020/1/16/353

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
 drivers/vhost/vhost.c          | 221 ++++-------
 drivers/vhost/vhost.h          |  36 +-
 drivers/vhost/vhost_iotlb.c    | 171 +++++++++
 drivers/vhost/vringh.c         | 421 ++++++++++++++++++--
 drivers/virtio/Kconfig         |  15 +
 drivers/virtio/Makefile        |   2 +
 drivers/virtio/vdpa/Kconfig    |  26 ++
 drivers/virtio/vdpa/Makefile   |   3 +
 drivers/virtio/vdpa/vdpa.c     | 160 ++++++++
 drivers/virtio/vdpa/vdpa_sim.c | 678 +++++++++++++++++++++++++++++++++
 drivers/virtio/virtio_vdpa.c   | 392 +++++++++++++++++++
 include/linux/vdpa.h           | 233 +++++++++++
 include/linux/vhost_iotlb.h    |  45 +++
 include/linux/vringh.h         |  36 ++
 19 files changed, 2249 insertions(+), 204 deletions(-)
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
