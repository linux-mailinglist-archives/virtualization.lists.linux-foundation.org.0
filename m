Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FAA368E7E
	for <lists.virtualization@lfdr.de>; Fri, 23 Apr 2021 10:10:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E611040F81;
	Fri, 23 Apr 2021 08:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_CcV1u2F1tf; Fri, 23 Apr 2021 08:10:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87F6540FB5;
	Fri, 23 Apr 2021 08:10:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 094B2C001B;
	Fri, 23 Apr 2021 08:10:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 038B3C000B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Apr 2021 08:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEE2040607
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Apr 2021 08:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iZb2EMKYZeV8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Apr 2021 08:10:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B5B3400C9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Apr 2021 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619165412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pc9kV6aoLVJwEsHfUpicjnbTw0ZNIpHRhnJgCa+FrJA=;
 b=OtEv4XoTxMJQhpqtfkWCUNClYEEkLIYt+cqWjWO6/bOHfp8BriF87Ib7ofu+ICmfb66a1/
 NddbT+U9I476oTfBjfinzjYLN55LsdduLpnpHqXAKcvWr1OacPNN4nBSATYSf5FYDKoUEn
 S/tKHaQs3v2kGCClljNIWvkbcR8vRGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-j7lbdBtfOrKGXOLEB8R-Vw-1; Fri, 23 Apr 2021 04:10:08 -0400
X-MC-Unique: j7lbdBtfOrKGXOLEB8R-Vw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A2D484BA42;
 Fri, 23 Apr 2021 08:10:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-225.pek2.redhat.com
 [10.72.13.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A28A25C6DE;
 Fri, 23 Apr 2021 08:09:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [RFC PATCH V2 0/7] Do not read from descripto ring
Date: Fri, 23 Apr 2021 16:09:35 +0800
Message-Id: <20210423080942.2997-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: ashish.kalra@amd.com, file@sect.tu-berlin.de, kvm@vger.kernel.org,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, hch@infradead.org,
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

Hi:

Sometimes, the driver doesn't trust the device. This is usually
happens for the encrtpyed VM or VDUSE[1]. In both cases, technology
like swiotlb is used to prevent the poking/mangling of memory from the
device. But this is not sufficient since current virtio driver may
trust what is stored in the descriptor table (coherent mapping) for
performing the DMA operations like unmap and bounce so the device may
choose to utilize the behaviour of swiotlb to perform attacks[2].

To protect from a malicous device, this series store and use the
descriptor metadata in an auxiliay structure which can not be accessed
via swiotlb instead of the ones in the descriptor table. This means
the descriptor table is write-only from the view of the driver.

Actually, we've almost achieved that through packed virtqueue and we
just need to fix a corner case of handling mapping errors. For split
virtqueue we just follow what's done in the packed.

Note that we don't duplicate descriptor medata for indirect
descriptors since it uses stream mapping which is read only so it's
safe if the metadata of non-indirect descriptors are correct.

For split virtqueue, the change increase the footprint due the the
auxiliary metadata but it's almost neglectlable in the simple test
like pktgen or netpef.

Slightly tested with packed on/off, iommu on/of, swiotlb force/off in
the guest.

Please review.

Changes from V1:
- Always use auxiliary metadata for split virtqueue
- Don't read from descripto when detaching indirect descriptor

[1]
https://lore.kernel.org/netdev/fab615ce-5e13-a3b3-3715-a4203b4ab010@redhat.com/T/
[2]
https://yhbt.net/lore/all/c3629a27-3590-1d9f-211b-c0b7be152b32@redhat.com/T/#mc6b6e2343cbeffca68ca7a97e0f473aaa871c95b

Jason Wang (7):
  virtio-ring: maintain next in extra state for packed virtqueue
  virtio_ring: rename vring_desc_extra_packed
  virtio-ring: factor out desc_extra allocation
  virtio_ring: secure handling of mapping errors
  virtio_ring: introduce virtqueue_desc_add_split()
  virtio: use err label in __vring_new_virtqueue()
  virtio-ring: store DMA metadata in desc_extra for split virtqueue

 drivers/virtio/virtio_ring.c | 201 +++++++++++++++++++++++++----------
 1 file changed, 144 insertions(+), 57 deletions(-)

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
