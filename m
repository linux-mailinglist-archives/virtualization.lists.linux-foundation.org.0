Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9194E758C48
	for <lists.virtualization@lfdr.de>; Wed, 19 Jul 2023 06:04:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 834A760FE0;
	Wed, 19 Jul 2023 04:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 834A760FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-J7KJOxPasW; Wed, 19 Jul 2023 04:04:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2D19061029;
	Wed, 19 Jul 2023 04:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D19061029
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D4ABC0DD4;
	Wed, 19 Jul 2023 04:04:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DC47C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Jul 2023 04:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C904A61006
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Jul 2023 04:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C904A61006
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otJqy2WdBEef
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Jul 2023 04:04:29 +0000 (UTC)
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0EC660FE0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Jul 2023 04:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0EC660FE0
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
 TI=SMTPD_---0Vnk1le9_1689739462; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vnk1le9_1689739462) by smtp.aliyun-inc.com;
 Wed, 19 Jul 2023 12:04:23 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost v12 00/10] virtio core prepares for AF_XDP
Date: Wed, 19 Jul 2023 12:04:12 +0800
Message-Id: <20230719040422.126357-1-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
X-Git-Hash: fc7afa711e97
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
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

## About DMA APIs

Now, virtio may can not work with DMA APIs when virtio features do not have
VIRTIO_F_ACCESS_PLATFORM.

1. I tried to let DMA APIs return phy address by virtio-device. But DMA APIs just
   work with the "real" devices.
2. I tried to let xsk support callballs to get phy address from virtio-net
   driver as the dma address. But the maintainers of xsk may want to use dma-buf
   to replace the DMA APIs. I think that may be a larger effort. We will wait
   too long.

So rethinking this, firstly, we can support premapped-dma only for devices with
VIRTIO_F_ACCESS_PLATFORM. In the case of af-xdp, if the users want to use it,
they have to update the device to support VIRTIO_F_RING_RESET, and they can also
enable the device's VIRTIO_F_ACCESS_PLATFORM feature.

Thanks for the help from Christoph.

## For AF_XDP

XDP socket(AF_XDP) is an excellent bypass kernel network framework. The zero
copy feature of xsk (XDP socket) needs to be supported by the driver. The
performance of zero copy is very good.

ENV: Qemu with vhost.

                   vhost cpu | Guest APP CPU |Guest Softirq CPU | PPS
-----------------------------|---------------|------------------|------------
xmit by sockperf:     90%    |   100%        |                  |  318967
xmit by xsk:          100%   |   30%         |   33%            | 1192064
recv by sockperf:     100%   |   68%         |   100%           |  692288
recv by xsk:          100%   |   33%         |   43%            |  771670

Before achieving the function of Virtio-Net, we also have to let virtio core
support these features:

1. virtio core support premapped
2. virtio core support reset per-queue

## VirtioNET rx dma merge

After introducing premapping, I added an example to virtio-net. virtio-net can
merge dma mappings through this feature. @Jason

kernel command line: intel_iommu=on iommu.passthrough=0

           |  strict=0  | strict=1
    Before |  775496pps | 428614pps
    After  | 1109316pps | 742853pps

Please review.

Thanks.

v12:
 1. Alloc dma info from the alloc frag. Avoid alloc array to store the dma info.
 2. rename virtqueue_set_premapped() to virtqueue_set_dma_premapped()

v11
 1. virtio-net merges dma operates based on the feature premapped
 2. A better way to handle the map error with the premapped

v10:
 1. support to set vq to premapped mode, then the vq just handles the premapped request.
 2. virtio-net support to do dma mapping in advance

v9:
 1. use flag to distinguish the premapped operations. no do judgment by sg.

v8:
 1. vring_sg_address: check by sg_page(sg) not dma_address. Because 0 is a valid dma address
 2. remove unused code from vring_map_one_sg()

v7:
 1. virtqueue_dma_dev() return NULL when virtio is without DMA API.

v6:
 1. change the size of the flags to u32.

v5:
 1. fix for error handler
 2. add flags to record internal dma mapping

v4:
 1. rename map_inter to dma_map_internal
 2. fix: Excess function parameter 'vq' description in 'virtqueue_dma_dev'

v3:
 1. add map_inter to struct desc state to reocrd whether virtio core do dma map

v2:
 1. based on sgs[0]->dma_address to judgment is premapped
 2. based on extra.addr to judgment to do unmap for no-indirect desc
 3. based on indir_desc to judgment to do unmap for indirect desc
 4. rename virtqueue_get_dma_dev to virtqueue_dma_dev

v1:
 1. expose dma device. NO introduce the api for dma and sync
 2. split some commit for review.






Xuan Zhuo (10):
  virtio_ring: check use_dma_api before unmap desc for indirect
  virtio_ring: put mapping error check in vring_map_one_sg
  virtio_ring: introduce virtqueue_set_dma_premapped()
  virtio_ring: support add premapped buf
  virtio_ring: introduce virtqueue_dma_dev()
  virtio_ring: skip unmap for premapped
  virtio_ring: correct the expression of the description of
    virtqueue_resize()
  virtio_ring: separate the logic of reset/enable from virtqueue_resize
  virtio_ring: introduce virtqueue_reset()
  virtio_net: merge dma operations when filling mergeable buffers

 drivers/net/virtio_net.c     | 225 +++++++++++++++++++++++++----
 drivers/virtio/virtio_ring.c | 265 ++++++++++++++++++++++++++++-------
 include/linux/virtio.h       |   6 +
 3 files changed, 418 insertions(+), 78 deletions(-)

--
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
