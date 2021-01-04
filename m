Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3B62E9079
	for <lists.virtualization@lfdr.de>; Mon,  4 Jan 2021 07:55:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D304686F9F;
	Mon,  4 Jan 2021 06:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRH2j4K7+-UK; Mon,  4 Jan 2021 06:55:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E331786F3F;
	Mon,  4 Jan 2021 06:55:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9B6AC013A;
	Mon,  4 Jan 2021 06:55:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D49ACC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C1052859E3
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sbmf32wyXlXd
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 08FF785624
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609743314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UAzO6IPOfba8T/LupAj9FrEly/L1acxCYUKfdREpa0A=;
 b=As3aQVZQq22RLEDZ3TlM4ldtSp3TdYkSOxoHHJpb3OJ55XxQ29Z2IJqj9Sh7gPcZKBMioV
 DG3Y9b5KKefTUfMfdGXbYCWJ7Xqy0VDenab8QKwmT1oBqSX9J2iOGpkKpmvQFP7RH0Q7Fq
 xhCgB3r7GeQkt/wEnzVjY7EC0Ky6qsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-LKHfDSYnPiSkIlE2NtzhcQ-1; Mon, 04 Jan 2021 01:55:12 -0500
X-MC-Unique: LKHfDSYnPiSkIlE2NtzhcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F15F107ACE3;
 Mon,  4 Jan 2021 06:55:11 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-91.pek2.redhat.com [10.72.13.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABBFD10016FA;
 Mon,  4 Jan 2021 06:55:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V3 00/19] vDPA driver for virtio-pci device
Date: Mon,  4 Jan 2021 14:54:44 +0800
Message-Id: <20210104065503.199631-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: shahafs@mellanox.com, rdunlap@infradead.org, lulu@redhat.com
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

This series tries to implement a vDPA driver for virtio-pci device
which will bridge between vDPA bus and virtio-pci device.

This could be used for future feature prototyping and testing.

Please review

Changes since V2:

- tweak config prompt
- switch from 'cb' to 'config_cb' for vp_vdpa config interrupt
- use a macro for vp_vdpa msix name length

Changes since V1:

- don't try to use devres for virtio-pci core
- tweak the commit log
- split the patches furtherly to ease the reviewing

Changes since RFC:

- Split common codes from virito-pci and share it with vDPA driver
- Use dynamic id in order to be less confusing with virtio-pci driver
- No feature whitelist, supporting any features (mq, config etc)

Thanks

Jason Wang (19):
  virtio-pci: do not access iomem via struct virtio_pci_device directly
  virtio-pci: split out modern device
  virtio-pci-modern: factor out modern device initialization logic
  virtio-pci-modern: introduce vp_modern_remove()
  virtio-pci-modern: introduce helper to set config vector
  virtio-pci-modern: introduce helpers for setting and getting status
  virtio-pci-modern: introduce helpers for setting and getting features
  virtio-pci-modern: introduce vp_modern_generation()
  virtio-pci-modern: introduce vp_modern_set_queue_vector()
  virtio-pci-modern: introduce vp_modern_queue_address()
  virtio-pci-modern: introduce helper to set/get queue_enable
  virtio-pci-modern: introduce helper for setting/geting queue size
  virtio-pci-modern: introduce helper for getting queue nums
  virtio-pci-modern: introduce helper to get notification offset
  virito-pci-modern: rename map_capability() to
    vp_modern_map_capability()
  virtio-pci: introduce modern device module
  vdpa: set the virtqueue num during register
  virtio_vdpa: don't warn when fail to disable vq
  vdpa: introduce virtio pci driver

 drivers/vdpa/Kconfig                   |   6 +
 drivers/vdpa/Makefile                  |   1 +
 drivers/vdpa/ifcvf/ifcvf_main.c        |   5 +-
 drivers/vdpa/mlx5/net/mlx5_vnet.c      |   5 +-
 drivers/vdpa/vdpa.c                    |   8 +-
 drivers/vdpa/vdpa_sim/vdpa_sim.c       |   4 +-
 drivers/vdpa/virtio_pci/Makefile       |   2 +
 drivers/vdpa/virtio_pci/vp_vdpa.c      | 456 +++++++++++++++++++
 drivers/virtio/Kconfig                 |  10 +-
 drivers/virtio/Makefile                |   1 +
 drivers/virtio/virtio_pci_common.h     |  22 +-
 drivers/virtio/virtio_pci_modern.c     | 506 +++------------------
 drivers/virtio/virtio_pci_modern_dev.c | 599 +++++++++++++++++++++++++
 drivers/virtio/virtio_vdpa.c           |   3 +-
 include/linux/vdpa.h                   |   7 +-
 include/linux/virtio_pci_modern.h      | 111 +++++
 16 files changed, 1274 insertions(+), 472 deletions(-)
 create mode 100644 drivers/vdpa/virtio_pci/Makefile
 create mode 100644 drivers/vdpa/virtio_pci/vp_vdpa.c
 create mode 100644 drivers/virtio/virtio_pci_modern_dev.c
 create mode 100644 include/linux/virtio_pci_modern.h

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
