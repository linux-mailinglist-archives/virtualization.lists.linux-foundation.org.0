Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC7F397EA7
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 04:15:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C02FA402C4;
	Wed,  2 Jun 2021 02:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mM2wSLg6Xt5W; Wed,  2 Jun 2021 02:15:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id A98E7402B6;
	Wed,  2 Jun 2021 02:15:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57F11C0001;
	Wed,  2 Jun 2021 02:15:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA2C8C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB1C283147
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YJtd5Rb9izso
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:15:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 326A183145
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622600147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N2hbGFGlNW8qsY3oULviD3PMmzK5iC/Hpr9g3x8tySM=;
 b=BgqzhJeA2V2ka6pzmpheZS2yJAh9GEtFvuPgGhebhhn3SjApxQYjhqwah6ynl8TlUfp9vd
 VvWRAQNZhoJgw0L89ECDrf30+XUGrAbSMRIfo4hwnRTSYIERIRNV6jJhjPIRSzB716t5ry
 5lMqXpCPTaTdfBwjciG0eZ/NYL+Pza0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-7tJn53B3N5-yE_3yLMzS-Q-1; Tue, 01 Jun 2021 22:15:45 -0400
X-MC-Unique: 7tJn53B3N5-yE_3yLMzS-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 616F4801B13;
 Wed,  2 Jun 2021 02:15:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-99.pek2.redhat.com [10.72.12.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF824687EC;
 Wed,  2 Jun 2021 02:15:38 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH V2 RESEND 0/4] Packed virtqueue state support for vDPA
Date: Wed,  2 Jun 2021 10:15:32 +0800
Message-Id: <20210602021536.39525-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Tested with packed=on/off via virtio_vdpa driver.

Change since V1:
- unbreak mlx5_vdpa build

Thanks

Eli Cohen (1):
  virtio/vdpa: clear the virtqueue state during probe

Jason Wang (3):
  vdpa: support packed virtqueue for set/get_vq_state()
  virtio-pci library: introduce vp_modern_get_driver_features()
  vp_vdpa: allow set vq state to initial state after reset

 drivers/vdpa/ifcvf/ifcvf_main.c        |  4 +--
 drivers/vdpa/mlx5/net/mlx5_vnet.c      |  8 ++---
 drivers/vdpa/vdpa_sim/vdpa_sim.c       |  4 +--
 drivers/vdpa/virtio_pci/vp_vdpa.c      | 42 ++++++++++++++++++++++++--
 drivers/vhost/vdpa.c                   |  4 +--
 drivers/virtio/virtio_pci_modern_dev.c | 21 +++++++++++++
 drivers/virtio/virtio_vdpa.c           | 15 +++++++++
 include/linux/vdpa.h                   | 25 +++++++++++++--
 include/linux/virtio_pci_modern.h      |  1 +
 9 files changed, 109 insertions(+), 15 deletions(-)

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
