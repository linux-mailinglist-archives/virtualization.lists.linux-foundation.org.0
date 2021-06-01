Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 323DB396F30
	for <lists.virtualization@lfdr.de>; Tue,  1 Jun 2021 10:45:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F22D6078E;
	Tue,  1 Jun 2021 08:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWIJs8K3weCK; Tue,  1 Jun 2021 08:45:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A3BE607CB;
	Tue,  1 Jun 2021 08:45:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96796C0024;
	Tue,  1 Jun 2021 08:45:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3141C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 08:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D93EE40339
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 08:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6ZttncNqTlg
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 08:45:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F90C40338
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622537122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=m8BOMT+1NjAco9MxdqnLMg71t/kZo3fvIxUKRkXGuWc=;
 b=XLhr5iRDuVqFqVwp1FYxUXcvNYPVqkRqS3iIs0RmID7HKsyCziBpKaD2T/j9g93GQUXB/h
 Y5/2RuGbVFW+zB0gi+WuFAfHojmkO9fzVHftzSbttU/GECBDDrQwGWXt8vxFQ558ddnU84
 Tz+l3e+HLWsv8P/6ZhAhnowFqXsnHt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-T-5UWkCIOhO0x1dG2qwbKw-1; Tue, 01 Jun 2021 04:45:19 -0400
X-MC-Unique: T-5UWkCIOhO0x1dG2qwbKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C841107ACFC;
 Tue,  1 Jun 2021 08:45:18 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-16.pek2.redhat.com [10.72.12.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BC871037E81;
 Tue,  1 Jun 2021 08:45:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH 0/4] Packed virtqueue state support for vDPA
Date: Tue,  1 Jun 2021 16:44:59 +0800
Message-Id: <20210601084503.34724-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: eli@mellanox.com
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

Hi:

This series implements the packed virtqueue state support for
vDPA. This is done via extending the vdpa_vq_state to support packed
virtqueue.

For virtio-vDPA, an initial state required by the virtio spec is set.

For vhost-vDPA, the packed virtqueue support still needs to be done at
both vhost core and vhost-vDPA in the future.

Please review.

Eli Cohen (1):
  virtio/vdpa: clear the virtqueue state during probe

Jason Wang (3):
  vdpa: support packed virtqueue for set/get_vq_state()
  virtio-pci library: introduce vp_modern_get_driver_features()
  vp_vdpa: allow set vq state to initial state after reset

 drivers/vdpa/ifcvf/ifcvf_main.c        |  4 +--
 drivers/vdpa/vdpa_sim/vdpa_sim.c       |  4 +--
 drivers/vdpa/virtio_pci/vp_vdpa.c      | 42 ++++++++++++++++++++++++--
 drivers/vhost/vdpa.c                   |  4 +--
 drivers/virtio/virtio_pci_modern_dev.c | 21 +++++++++++++
 drivers/virtio/virtio_vdpa.c           | 15 +++++++++
 include/linux/vdpa.h                   | 25 +++++++++++++--
 include/linux/virtio_pci_modern.h      |  1 +
 8 files changed, 105 insertions(+), 11 deletions(-)

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
