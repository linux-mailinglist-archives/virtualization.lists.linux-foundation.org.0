Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7A466548F
	for <lists.virtualization@lfdr.de>; Wed, 11 Jan 2023 07:28:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1059040315;
	Wed, 11 Jan 2023 06:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1059040315
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H4fZ2u7M
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UuwipPCBsv7X; Wed, 11 Jan 2023 06:28:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7EE9D4031E;
	Wed, 11 Jan 2023 06:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EE9D4031E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFFC4C007B;
	Wed, 11 Jan 2023 06:28:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A4E7C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Jan 2023 06:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14D7F81F3B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Jan 2023 06:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14D7F81F3B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=H4fZ2u7M
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L8PovH9k1rBb
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Jan 2023 06:28:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5937981F34
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5937981F34
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Jan 2023 06:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673418499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zuZT9imH3GUC8e7yu58JVlPWyjWUNDx6BVFaTW7cVbc=;
 b=H4fZ2u7MF9V5aSEYk5X3dhgQVRB/kRON/v0IpXRE5ceN+4Se1RN+qB8OS53nfM/M/XhiME
 8lqcyw3VknBPNI/nzGdw5sBHEgpaVhr9hU0NbSq2xcNfXshJC5hqqTCKowb122ZoYTIFqS
 vj7MEFkKYS9wveXRgglcCAlzlpR8qt8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-wrl8SHr6O8eAICQ3lh1IcA-1; Wed, 11 Jan 2023 01:28:15 -0500
X-MC-Unique: wrl8SHr6O8eAICQ3lh1IcA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 133753C025BA;
 Wed, 11 Jan 2023 06:28:15 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-175.pek2.redhat.com
 [10.72.13.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F38DE4078903;
 Wed, 11 Jan 2023 06:28:11 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 0/5] virtio_ring: per virtqueue DMA device
Date: Wed, 11 Jan 2023 14:28:04 +0800
Message-Id: <20230111062809.25020-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Cc: gdawar@amd.com, elic@nvidia.com, linux-kernel@vger.kernel.org,
 tanuj.kamde@amd.com, virtualization@lists.linux-foundation.org
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

In some cases, the virtqueue could be backed by different devices. One
example is that in the case of vDPA some parent may emualte virtqueue
via vringh. In this case, it would be wrong if we stick with the
physical DMA device for software emulated device, since there's no
easy way for vringh to know about the hardware IOMMU mappings.

So this series tries to introduce per virtqueue DMA device, then
software virtqueues can utilize the transport specific method to
assign appropirate DMA device.

This fixes the crash of mlx5_vdpa + virtio_vdpa when platform IOMMU is
enabled but not in the passthrough mode. The reason for the crash is
that the virito_ring tries to map the control virtqueue into platform
IOMMU but the vringh assumes a direct mapping (PA as IOVA). This is
fixed by advetise the vDPA device that doesnt do DMA (without a DMA
ops). So DMA API can go with the direct mapping then the vringh will
be happy since mlx5_vdpa assuems a direct/identical mapping by
default.

Please review.

Thanks

Jason Wang (5):
  virtio_ring: per virtqueue dma device
  vdpa: introduce get_vq_dma_device()
  virtio-vdpa: support per vq dma device
  vdpa: set dma mask for vDPA device
  vdpa: mlx5: support per virtqueue dma device

 drivers/vdpa/mlx5/net/mlx5_vnet.c |  11 +++
 drivers/vdpa/vdpa.c               |   5 ++
 drivers/virtio/virtio_ring.c      | 133 +++++++++++++++++++++---------
 drivers/virtio/virtio_vdpa.c      |  13 ++-
 include/linux/vdpa.h              |   6 ++
 include/linux/virtio_ring.h       |  16 ++++
 6 files changed, 141 insertions(+), 43 deletions(-)

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
