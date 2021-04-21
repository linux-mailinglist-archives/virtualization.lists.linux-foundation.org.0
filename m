Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4AE3663EE
	for <lists.virtualization@lfdr.de>; Wed, 21 Apr 2021 05:21:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BE5540381;
	Wed, 21 Apr 2021 03:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VRqA3PAF2ZS3; Wed, 21 Apr 2021 03:21:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1702B4037E;
	Wed, 21 Apr 2021 03:21:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AA21C000B;
	Wed, 21 Apr 2021 03:21:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8031C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 03:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98F8A40622
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 03:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6kByIgqj2yBC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 03:21:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D94A40624
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 03:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618975297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GEfjyJT9pCdQ1S+UliWsNNDLnxg2PWz47J1URl6HOzU=;
 b=KPeZ6XcCi16gHoXX3NcNeMxPNp+Ou6LF2+ZPdfCcTpXdfenEM4xkxSAK97pLvEQ4LK0m37
 PmhtynD8xW0hwuJy52avYI3ynlBQ1Qc8Wb1IR6JWmBZg94VcQEkNU+ujm+KbzorWZp9UP+
 8l4me/4YeBVVe1Rrq243iydU+lHRc7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-b2XJ9duBPvGdM2cnsCx9ww-1; Tue, 20 Apr 2021 23:21:33 -0400
X-MC-Unique: b2XJ9duBPvGdM2cnsCx9ww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84BEA8189C6;
 Wed, 21 Apr 2021 03:21:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-189.pek2.redhat.com
 [10.72.13.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F6836064B;
 Wed, 21 Apr 2021 03:21:19 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [RFC PATCH 0/7] Untrusted device support for virtio
Date: Wed, 21 Apr 2021 11:21:10 +0800
Message-Id: <20210421032117.5177-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: ashish.kalra@amd.com, file@sect.tu-berlin.de,
 martin.radev@aisec.fraunhofer.de, kvm@vger.kernel.org, konrad.wilk@oracle.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 xieyongji@bytedance.com, stefanha@redhat.com
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

Sometimes, the driver doesn't trust the device. This is usually
happens for the encrtpyed VM or VDUSE[1]. In both cases, technology
like swiotlb is used to prevent the poking/mangling of memory from the
device. But this is not sufficient since current virtio driver may
trust what is stored in the descriptor table (coherent mapping) for
performing the DMA operations like unmap and bounce so the device may
choose to utilize the behaviour of swiotlb to perform attacks[2].

For double insurance, to protect from a malicous device, when DMA API
is used for the device, this series store and use the descriptor
metadata in an auxiliay structure which can not be accessed via
swiotlb instead of the ones in the descriptor table. Actually, we've
almost achieved that through packed virtqueue and we just need to fix
a corner case of handling mapping errors. For split virtqueue we just
follow what's done in the packed.

Note that we don't duplicate descriptor medata for indirect
descriptors since it uses stream mapping which is read only so it's
safe if the metadata of non-indirect descriptors are correct.

The behaivor for non DMA API is kept for minimizing the performance
impact.

Slightly tested with packed on/off, iommu on/of, swiotlb force/off in
the guest.

Please review.

[1] https://lore.kernel.org/netdev/fab615ce-5e13-a3b3-3715-a4203b4ab010@redhat.com/T/
[2] https://yhbt.net/lore/all/c3629a27-3590-1d9f-211b-c0b7be152b32@redhat.com/T/#mc6b6e2343cbeffca68ca7a97e0f473aaa871c95b

Jason Wang (7):
  virtio-ring: maintain next in extra state for packed virtqueue
  virtio_ring: rename vring_desc_extra_packed
  virtio-ring: factor out desc_extra allocation
  virtio_ring: secure handling of mapping errors
  virtio_ring: introduce virtqueue_desc_add_split()
  virtio: use err label in __vring_new_virtqueue()
  virtio-ring: store DMA metadata in desc_extra for split virtqueue

 drivers/virtio/virtio_ring.c | 189 ++++++++++++++++++++++++++---------
 1 file changed, 141 insertions(+), 48 deletions(-)

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
