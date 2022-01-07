Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 16986487315
	for <lists.virtualization@lfdr.de>; Fri,  7 Jan 2022 07:33:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64542832FF;
	Fri,  7 Jan 2022 06:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O13NWSBb2NYT; Fri,  7 Jan 2022 06:33:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2CB56831CB;
	Fri,  7 Jan 2022 06:33:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19CF4C0074;
	Fri,  7 Jan 2022 06:33:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D892C001E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Jan 2022 06:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D5454014E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Jan 2022 06:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mKbMYV6txROs
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Jan 2022 06:33:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF2CD40283
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Jan 2022 06:33:11 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R391e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=3; SR=0; TI=SMTPD_---0V19LP-J_1641537186; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V19LP-J_1641537186) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 07 Jan 2022 14:33:06 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH 0/6] virtio: support advance DMA
Date: Fri,  7 Jan 2022 14:33:00 +0800
Message-Id: <20220107063306.23240-1-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Cc: "Michael S. Tsirkin" <mst@redhat.com>
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

virtqueue_add() only supports virtual addresses, dma is completed in
virtqueue_add().

In some scenarios (such as the AF_XDP scenario), DMA is completed in advance, so
it is necessary for us to support passing the DMA address to virtqueue_add().

This patch set stipulates that if sg->dma_address is not NULL, use this
address as the DMA address. And record this information in extra->flags,
which can be skipped when executing dma unmap.

    extra->flags |= VRING_DESC_F_PREDMA;

But the indirect desc does not have a corresponding extra, so the second and
third patches of this patch set are to allocate the corresponding extra while
allocating the indirect desc. Each desc must have a corresponding extra because
it is possible in an sgs some are advance DMA, while others are virtual
addresses. So we must allocate an extra for each indirect desc.

Xuan Zhuo (6):
  virtio: rename vring_unmap_state_packed() to
    vring_unmap_extra_packed()
  virtio: split: alloc indirect desc with extra
  virtio: packed: alloc indirect desc with extra
  virtio: split: virtqueue_add_split() support dma address
  virtio: packed: virtqueue_add_packed() support dma address
  virtio: add api virtio_dma_map() for advance dma

 drivers/virtio/virtio_ring.c | 387 ++++++++++++++++++++---------------
 include/linux/virtio.h       |   9 +
 2 files changed, 232 insertions(+), 164 deletions(-)

--
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
