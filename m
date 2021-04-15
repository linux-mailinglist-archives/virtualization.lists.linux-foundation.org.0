Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 440FC360361
	for <lists.virtualization@lfdr.de>; Thu, 15 Apr 2021 09:32:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A33D640FA9;
	Thu, 15 Apr 2021 07:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqu9NhoykoHi; Thu, 15 Apr 2021 07:32:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E6440FB1;
	Thu, 15 Apr 2021 07:32:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62713C0017;
	Thu, 15 Apr 2021 07:32:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B2B5C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B6C0846E6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:32:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lqwXLvfTAxdJ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:32:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B28F3846D9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618471923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=8h+eVsApPwBeDOfwNE+ao4JuJ0Rk8cCsn+lmickkPFg=;
 b=GQaPKPSpmiRhAOmY/1SUrucI1zX3aDD9bimvk3eRxD6qv0W1BuZAv3ZZtBFa6fyslmIepU
 Rrjl/qs9oAGT++HeMyEQ51BlOYZItFlQJWhIPs0lCibuDbyNYbAq+/VISTx+8UTFPU0F/U
 UxmliEh76ETJosu13fOycmsZj3Pric0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-wR6ZR7f9M8eeLo2f16wgWw-1; Thu, 15 Apr 2021 03:31:57 -0400
X-MC-Unique: wR6ZR7f9M8eeLo2f16wgWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FB01817477;
 Thu, 15 Apr 2021 07:31:56 +0000 (UTC)
Received: from hp-dl380pg8-01.lab.eng.pek2.redhat.com
 (hp-dl380pg8-01.lab.eng.pek2.redhat.com [10.73.8.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DC626064B;
 Thu, 15 Apr 2021 07:31:51 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 0/7] Doorbell mapping support for virito-pci vDPA
Date: Thu, 15 Apr 2021 03:31:40 -0400
Message-Id: <20210415073147.19331-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: elic@nvidia.com, linux-kernel@vger.kernel.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi All:

This series implements the doorbell mapping support for virtio-pci
vDPA driver. Tested with page-per-vq=on in a nested guest.

Please review

Thanks

Jason Wang (7):
  virtio_pci_modern: introduce helper to map vq notify area
  virtio-pci library: switch to use vp_modern_map_vq_notify()
  vp_vdpa: switch to use vp_modern_map_vq_notify()
  virtio_pci_modern: hide vp_modern_get_queue_notify_off()
  virito_pci libray: hide vp_modern_map_capability()
  virtio-pci library: report resource address
  vp_vdpa: report doorbell address

 drivers/vdpa/virtio_pci/vp_vdpa.c      | 26 ++++++++--
 drivers/virtio/virtio_pci_modern.c     | 27 +---------
 drivers/virtio/virtio_pci_modern_dev.c | 68 +++++++++++++++++++++-----
 include/linux/virtio_pci_modern.h      | 11 ++---
 4 files changed, 83 insertions(+), 49 deletions(-)

-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
