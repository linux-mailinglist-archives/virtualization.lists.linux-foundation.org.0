Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B21FEB27
	for <lists.virtualization@lfdr.de>; Thu, 18 Jun 2020 07:56:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4761A20371;
	Thu, 18 Jun 2020 05:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3lx+0ZvWy+aL; Thu, 18 Jun 2020 05:56:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 266FE20370;
	Thu, 18 Jun 2020 05:56:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E49B7C016E;
	Thu, 18 Jun 2020 05:56:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B3E5C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5E6AB87D87
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBljmrTMHsyQ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:56:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 352C587AB6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592459805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vvsTC0zu1qccVdGrPvwGZCDTTN58VYTB/3udUE8lYkM=;
 b=iZflSJKZjwUQ/vy4LCm1b4gT3zmMlPBUBQuypFYbzobTw6cYTN9F6uGQ5Cvhu4kCjlDynl
 tGB527RwF/VXA+ZSZYoNWY/rBLg26s701kxaHSFHL6B3l1+poN1FxKEFNqPvqYS28pbDzG
 QaW8HRah+1YAwpCYR/PYOv0LJnLvQvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-dpMveLesOnykM1hhHxBXzA-1; Thu, 18 Jun 2020 01:56:41 -0400
X-MC-Unique: dpMveLesOnykM1hhHxBXzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC7D1835B58;
 Thu, 18 Jun 2020 05:56:39 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-219.pek2.redhat.com [10.72.13.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A9335C1D6;
 Thu, 18 Jun 2020 05:56:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/5] support batched IOTLB updating in vhost-vdpa
Date: Thu, 18 Jun 2020 13:56:21 +0800
Message-Id: <20200618055626.25660-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: shahafs@mellanox.com, lulu@redhat.com, saugatm@xilinx.com,
 mhabets@solarflare.com, vmireyno@marvell.com, gdawar@xilinx.com,
 eperezma@redhat.com, hanand@xilinx.com, zhangweining@ruijie.com.cn,
 eli@mellanox.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

Hi all:

This series tries to support batched IOTLB updating vhost-vdpa.

Currently vhost-vdpa accepts userspace mapping via IOTLB API, and it
can only forward one mapping to IOMMU or device through IOMMU API or
dma_map(). Though set_map() is deisgend to have the capability to pass
an rbtree based mapping to vDPA device, it's still be called at least
once for each VHOST_IOTLB_UPDATE or VHOST_IOTLB_INVALIDATE. This is
because vhost-vdpa doesn't know the userspace start or stop then
updating.

So this patch introduces two flags as hints for vhost-vdpa to call
set_map() only when userspace finish a batch of IOTLB updating.

So instead of:

1) VHOST_IOTLB_UPDATE/VHOST_IOTLB_INVALIDATE -> set_map() (s)
2) VHOST_IOTLB_UPDATE/VHOST_IOTLB_INVALIDATE -> set_map() (s)
...
n) VHOST_IOTLB_UPDATE/VHOST_IOTLB_INVALIDATE -> set_map() (s)

With the help of hints, we do:

0) VHOST_IOTLB_BATCH_START

1) VHOST_IOTLB_UPDATE/INVALIDATE
...
n) VHOST_IOTLB_UPDATE/INVALIDATE

n+1) VHOST_IOTLB_BATCH_END -> set_map()

One one call of set_map() to vDPA device for a batch of IOTLB
mappings. So for the device that has its own DMA translation logic, it
can efficiently structure the memory mapping to get best performance.

Note, this only impact the devices that want its own DMA
translation. For other type of device, no changes in behaviour.

Please reivew.

Jason Wang (5):
  vhost-vdpa: refine ioctl pre-processing
  vhost: generialize backend features setting/getting
  vhost-vdpa: support get/set backend features
  vhost-vdpa: support IOTLB batching hints
  vdpasim: support batch updating

 drivers/vdpa/vdpa_sim/vdpa_sim.c | 40 +++++++++++++++++++++--
 drivers/vhost/net.c              | 18 ++---------
 drivers/vhost/vdpa.c             | 55 ++++++++++++++++++++++++++------
 drivers/vhost/vhost.c            | 15 +++++++++
 drivers/vhost/vhost.h            |  2 ++
 include/uapi/linux/vhost.h       |  2 ++
 include/uapi/linux/vhost_types.h |  7 ++++
 7 files changed, 110 insertions(+), 29 deletions(-)

-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
