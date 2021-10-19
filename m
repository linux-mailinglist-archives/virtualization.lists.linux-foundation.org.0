Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B6045432ECE
	for <lists.virtualization@lfdr.de>; Tue, 19 Oct 2021 09:02:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C965406F6;
	Tue, 19 Oct 2021 07:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ShPOlyLoHqD; Tue, 19 Oct 2021 07:02:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 23436406F7;
	Tue, 19 Oct 2021 07:02:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC1F4C001E;
	Tue, 19 Oct 2021 07:02:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FB32C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 07:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 122C8406FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 07:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vr9b4u18emy
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 07:02:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E83C1406F7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 07:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634626936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=sXWkpo3FdYBYbtFH/ABAUaAY4xibdiaBDtN9P+YJybM=;
 b=SxLn0HXrF7Jo6W1Rn7XfzLhoGwRpAK5OUBtgboRtojckzSZLzyrn1GOmcnAIzDxosDGhaj
 AziLeyVCUTJw/4oZZwXdrEBbEridDU9XPAeMsq1c8UTRB8vXaqaYJO577erg2T2Lr8r2bo
 2Lp0NHC1kCQjm4jVdIP91ggVGrKlqRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-agg0bTQ3Pf-sN9zA7OsrEQ-1; Tue, 19 Oct 2021 03:02:13 -0400
X-MC-Unique: agg0bTQ3Pf-sN9zA7OsrEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C55EB80A5C9;
 Tue, 19 Oct 2021 07:02:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-155.pek2.redhat.com
 [10.72.12.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D84970956;
 Tue, 19 Oct 2021 07:01:54 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V3 00/10] More virtio hardening
Date: Tue, 19 Oct 2021 15:01:42 +0800
Message-Id: <20211019070152.8236-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
patch 2 validates max_nr_ports for virito-console device.
patch 3-5 harden virtio-pci interrupts to make sure no exepcted
interrupt handler is tiggered. If this makes sense we can do similar
things in other transport drivers.
patch 6-7 validate used ring length.
patch 8-10 let the driver to validate the used length instead of the
virtio core when possible.

Smoking test on blk/net with packed=on/off and iommu_platform=on/off.

Please review.

Changes since V2:
- don't validate max_nr_ports in .validate()
- fail the probe instead of trying to work when blk/console returns
  invalid number of queues/ports
- use READ_ONCE() instead of smp_load_acquire() for checking
  intx_soft_enabled
- use "suppress_used_validation" instead of "validate_used"

Changes since V1:
- fix and document the memory ordering around the intx_soft_enabled
  when enabling and disabling INTX interrupt
- for the driver that can validate the used length, virtio core
  won't even try to allocate auxilary arrays and validate the used length
- tweak the commit log
- fix typos

Jason Wang (10):
  virtio-blk: validate num_queues during probe
  virtio_console: validate max_nr_ports before trying to use it
  virtio_config: introduce a new .enable_cbs method
  virtio_pci: harden MSI-X interrupts
  virtio-pci: harden INTX interrupts
  virtio_ring: fix typos in vring_desc_extra
  virtio_ring: validate used buffer length
  virtio-net: don't let virtio core to validate used length
  virtio-blk: don't let virtio core to validate used length
  virtio-scsi: don't let virtio core to validate used buffer length

 drivers/block/virtio_blk.c         |  5 +++
 drivers/char/virtio_console.c      |  9 +++++
 drivers/net/virtio_net.c           |  1 +
 drivers/scsi/virtio_scsi.c         |  1 +
 drivers/virtio/virtio_pci_common.c | 48 ++++++++++++++++++++----
 drivers/virtio/virtio_pci_common.h |  7 +++-
 drivers/virtio/virtio_pci_legacy.c |  5 ++-
 drivers/virtio/virtio_pci_modern.c |  6 ++-
 drivers/virtio/virtio_ring.c       | 60 +++++++++++++++++++++++++++++-
 include/linux/virtio.h             |  2 +
 include/linux/virtio_config.h      |  6 +++
 11 files changed, 135 insertions(+), 15 deletions(-)

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
