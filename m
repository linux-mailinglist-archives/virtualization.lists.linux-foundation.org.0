Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C3F57AE4F
	for <lists.virtualization@lfdr.de>; Wed, 20 Jul 2022 05:04:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAA3782FA2;
	Wed, 20 Jul 2022 03:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAA3782FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mB4avNtGsdMm; Wed, 20 Jul 2022 03:04:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 590868305C;
	Wed, 20 Jul 2022 03:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 590868305C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D9C5C0078;
	Wed, 20 Jul 2022 03:04:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93B20C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jul 2022 03:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 588AC40390
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jul 2022 03:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 588AC40390
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sdce_dhsAQPl
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jul 2022 03:04:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73777400DB
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73777400DB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jul 2022 03:04:44 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0VJuvIOR_1658286276; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VJuvIOR_1658286276) by smtp.aliyun-inc.com;
 Wed, 20 Jul 2022 11:04:37 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v12 00/40] virtio pci support VIRTIO_F_RING_RESET
Date: Wed, 20 Jul 2022 11:03:56 +0800
Message-Id: <20220720030436.79520-1-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-Git-Hash: 366032b2ffac
Cc: Vadim Pasternak <vadimp@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 kangjie.xu@linux.alibaba.com, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 kvm@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 Richard Weinberger <richard@nod.at>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 John Fastabend <john.fastabend@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Farman <farman@linux.ibm.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Johannes Berg <johannes@sipsolutions.net>,
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

The virtio spec already supports the virtio queue reset function. This patch set
is to add this function to the kernel. The relevant virtio spec information is
here:

    https://github.com/oasis-tcs/virtio-spec/issues/124
    https://github.com/oasis-tcs/virtio-spec/issues/139

Also regarding MMIO support for queue reset, I plan to support it after this
patch is passed.

This patch set implements the refactoring of vring. Finally, the
virtuque_resize() interface is provided based on the reset function of the
transport layer.

Test environment:
    Host: 4.19.91
    Qemu: QEMU emulator version 6.2.50 (with vq reset support)
    Test Cmd:  ethtool -G eth1 rx $1 tx $2; ethtool -g eth1

    The default is split mode, modify Qemu virtio-net to add PACKED feature to test
    packed mode.

Qemu code:
    https://github.com/fengidri/qemu/compare/89f3bfa3265554d1d591ee4d7f1197b6e3397e84...master

In order to simplify the review of this patch set, the function of reusing
the old buffers after resize will be introduced in subsequent patch sets.

Please review. Thanks.

v12:
  1. access vq->num_max directly without helper
  2. rename the vq reset callbacks:
 	     int (*disable_vq_and_reset)(struct virtqueue *vq);
 	     int (*enable_vq_after_reset)(struct virtqueue *vq);

  3. rename vring to vring_split, vring_packed
  4. protect sq->reset by tx lock

v11:
  1. struct virtio_pci_common_cfg to virtio_pci_modern.h
  2. conflict resolution

v10:
  1. on top of the harden vring IRQ
  2. factor out split and packed from struct vring_virtqueue
  3. some suggest from @Jason Wang

v9:
  1. Provide a virtqueue_resize() interface directly
  2. A patch set including vring resize, virtio pci reset, virtio-net resize
  3. No more separate structs

v8:
  1. Provide a virtqueue_reset() interface directly
  2. Split the two patch sets, this is the first part
  3. Add independent allocation helper for allocating state, extra

v7:
  1. fix #6 subject typo
  2. fix #6 ring_size_in_bytes is uninitialized
  3. check by: make W=12

v6:
  1. virtio_pci: use synchronize_irq(irq) to sync the irq callbacks
  2. Introduce virtqueue_reset_vring() to implement the reset of vring during
     the reset process. May use the old vring if num of the vq not change.
  3. find_vqs() support sizes to special the max size of each vq

v5:
  1. add virtio-net support set_ringparam

v4:
  1. just the code of virtio, without virtio-net
  2. Performing reset on a queue is divided into these steps:
    1. reset_vq: reset one vq
    2. recycle the buffer from vq by virtqueue_detach_unused_buf()
    3. release the ring of the vq by vring_release_virtqueue()
    4. enable_reset_vq: re-enable the reset queue
  3. Simplify the parameters of enable_reset_vq()
  4. add container structures for virtio_pci_common_cfg

v3:
  1. keep vq, irq unreleased

Xuan Zhuo (40):
  virtio: record the maximum queue num supported by the device.
  virtio: struct virtio_config_ops add callbacks for queue_reset
  virtio_ring: update the document of the virtqueue_detach_unused_buf
    for queue reset
  virtio_ring: extract the logic of freeing vring
  virtio_ring: split vring_virtqueue
  virtio_ring: introduce virtqueue_init()
  virtio_ring: split: introduce vring_free_split()
  virtio_ring: split: extract the logic of alloc queue
  virtio_ring: split: extract the logic of alloc state and extra
  virtio_ring: split: extract the logic of attach vring
  virtio_ring: split: extract the logic of vring init
  virtio_ring: split: introduce virtqueue_reinit_split()
  virtio_ring: split: reserve vring_align, may_reduce_num
  virtio_ring: split: introduce virtqueue_resize_split()
  virtio_ring: packed: introduce vring_free_packed
  virtio_ring: packed: extract the logic of alloc queue
  virtio_ring: packed: extract the logic of alloc state and extra
  virtio_ring: packed: extract the logic of attach vring
  virtio_ring: packed: extract the logic of vring init
  virtio_ring: packed: introduce virtqueue_reinit_packed()
  virtio_ring: packed: introduce virtqueue_resize_packed()
  virtio_ring: introduce virtqueue_resize()
  virtio_pci: struct virtio_pci_common_cfg add queue_notify_data
  virtio: allow to unbreak/break virtqueue individually
  virtio: queue_reset: add VIRTIO_F_RING_RESET
  virtio_ring: struct virtqueue introduce reset
  virtio_pci: struct virtio_pci_common_cfg add queue_reset
  virtio_pci: introduce helper to get/set queue reset
  virtio_pci: extract the logic of active vq for modern pci
  virtio_pci: support VIRTIO_F_RING_RESET
  virtio: find_vqs() add arg sizes
  virtio_pci: support the arg sizes of find_vqs()
  virtio_mmio: support the arg sizes of find_vqs()
  virtio: add helper virtio_find_vqs_ctx_size()
  virtio_net: set the default max ring size by find_vqs()
  virtio_net: get ringparam by virtqueue_get_vring_max_size()
  virtio_net: split free_unused_bufs()
  virtio_net: support rx queue resize
  virtio_net: support tx queue resize
  virtio_net: support set_ringparam

 arch/um/drivers/virtio_uml.c             |   3 +-
 drivers/net/virtio_net.c                 | 208 +++++-
 drivers/platform/mellanox/mlxbf-tmfifo.c |   3 +
 drivers/remoteproc/remoteproc_virtio.c   |   3 +
 drivers/s390/virtio/virtio_ccw.c         |   4 +
 drivers/virtio/virtio_mmio.c             |  11 +-
 drivers/virtio/virtio_pci_common.c       |  32 +-
 drivers/virtio/virtio_pci_common.h       |   3 +-
 drivers/virtio/virtio_pci_legacy.c       |   8 +-
 drivers/virtio/virtio_pci_modern.c       | 161 ++++-
 drivers/virtio/virtio_pci_modern_dev.c   |  39 ++
 drivers/virtio/virtio_ring.c             | 769 +++++++++++++++++------
 drivers/virtio/virtio_vdpa.c             |   3 +
 include/linux/virtio.h                   |  10 +
 include/linux/virtio_config.h            |  40 +-
 include/linux/virtio_pci_modern.h        |   9 +
 include/uapi/linux/virtio_config.h       |   7 +-
 include/uapi/linux/virtio_pci.h          |   2 +
 18 files changed, 1038 insertions(+), 277 deletions(-)

--
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
