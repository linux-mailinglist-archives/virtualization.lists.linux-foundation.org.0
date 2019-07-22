Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9A3702C0
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 16:55:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CA6ABCC9;
	Mon, 22 Jul 2019 14:55:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C7158C21;
	Mon, 22 Jul 2019 14:55:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8C9E17F8;
	Mon, 22 Jul 2019 14:55:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8DD5C057F2C;
	Mon, 22 Jul 2019 14:55:18 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6CAA60A9F;
	Mon, 22 Jul 2019 14:55:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com, mst@redhat.com,
	jasowang@redhat.com, virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Fix NULL pointer dereference with virtio-blk-pci and
	virtual IOMMU
Date: Mon, 22 Jul 2019 16:55:07 +0200
Message-Id: <20190722145509.1284-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 22 Jul 2019 14:55:19 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

When running a guest featuring a virtio-blk-pci protected with a virtual
IOMMU we hit a NULL pointer dereference.

This series removes the dma_max_mapping_size() call in
virtio_max_dma_size when the device does not have any dma_mask set.
A check is also added to early return in dma_addressing_limited()
if the dma_mask is NULL.

Eric Auger (2):
  dma-mapping: Protect dma_addressing_limited against NULL dma_mask
  virtio/virtio_ring: Fix the dma_max_mapping_size call

 drivers/virtio/virtio_ring.c | 2 +-
 include/linux/dma-mapping.h  | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
