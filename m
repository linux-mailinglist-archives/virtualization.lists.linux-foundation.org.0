Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C2A429E0B
	for <lists.virtualization@lfdr.de>; Tue, 12 Oct 2021 08:53:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6180B608B1;
	Tue, 12 Oct 2021 06:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 62LkY_4FjCJ6; Tue, 12 Oct 2021 06:53:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3385C608A0;
	Tue, 12 Oct 2021 06:53:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA845C001E;
	Tue, 12 Oct 2021 06:53:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86347C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 06:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6554F40273
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 06:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7az9CZCGxia
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 06:52:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 898A2401B2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 06:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634021578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VYPjrfHoFryxA7atPdwxlCJUZlPks/b+YiU605lqPNo=;
 b=YfirmO1GPuHtPK99eDYtyjKhYuXyGpiMYbYHo7znxgpFyen3V/Xm+9nlPglJrGGYM+niGd
 wKKr8WTrDQ7RFBS+1gJJkZS6+NiZTpURqXvZPkNnF1RuAMEpWqaqIvgODML7sTtD/pv/Kl
 pknJBR57zoAXHFzg+tKObgQkufXXNEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-_gTnJdj7PqC_VRpApI3qhQ-1; Tue, 12 Oct 2021 02:52:56 -0400
X-MC-Unique: _gTnJdj7PqC_VRpApI3qhQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9A38100C67E;
 Tue, 12 Oct 2021 06:52:32 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-111.pek2.redhat.com
 [10.72.13.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1048D5F4E0;
 Tue, 12 Oct 2021 06:52:29 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V2 00/12] More virtio hardening
Date: Tue, 12 Oct 2021 14:52:15 +0800
Message-Id: <20211012065227.9953-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: konrad.wilk@oracle.com, f.hetzelt@tu-berlin.de,
 linux-kernel@vger.kernel.org, david.kaplan@amd.com,
 virtualization@lists.linux-foundation.org
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

Hi All:

This series treis to do more hardening for virito.

patch 1 validates the num_queues for virio-blk device.
patch 2-4 validates max_nr_ports for virito-console device.
patch 5-7 harden virtio-pci interrupts to make sure no exepcted
interrupt handler is tiggered. If this makes sense we can do similar
things in other transport drivers.
patch 8-9 validate used ring length.
patch 9-11 let the driver to validate the used length instead of the
virtio core

Smoking test on blk/net with packed=on/off and iommu_platform=on/off.

Please review.

Changes since V1:
- fix and document the memory ordering around the intx_soft_enabled
  when enabling and disabling INTX interrupt
- for the driver that can validate the used length, virtio core won't
  even try to allocate auxilary arrays and validate the used length
- tweak the commit log
- fix typos

Jason Wang (12):
  virtio-blk: validate num_queues during probe
  virtio: add doc for validate() method
  virtio-console: switch to use .validate()
  virtio_console: validate max_nr_ports before trying to use it
  virtio_config: introduce a new ready method
  virtio_pci: harden MSI-X interrupts
  virtio-pci: harden INTX interrupts
  virtio_ring: fix typos in vring_desc_extra
  virtio_ring: validate used buffer length
  virtio-net: don't let virtio core to validate used length
  virtio-blk: don't let virtio core to validate used length
  virtio-scsi: don't let virtio core to validate used buffer length

 drivers/block/virtio_blk.c         |  4 +-
 drivers/char/virtio_console.c      | 51 +++++++++++++++++--------
 drivers/net/virtio_net.c           |  1 +
 drivers/scsi/virtio_scsi.c         |  1 +
 drivers/virtio/virtio_pci_common.c | 49 ++++++++++++++++++++----
 drivers/virtio/virtio_pci_common.h |  7 +++-
 drivers/virtio/virtio_pci_legacy.c |  5 ++-
 drivers/virtio/virtio_pci_modern.c |  6 ++-
 drivers/virtio/virtio_ring.c       | 60 +++++++++++++++++++++++++++++-
 include/linux/virtio.h             |  3 ++
 include/linux/virtio_config.h      |  6 +++
 11 files changed, 162 insertions(+), 31 deletions(-)

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
