Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E9821079F
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 11:09:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB0B28C0F8;
	Wed,  1 Jul 2020 09:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3nddpc4MCV9; Wed,  1 Jul 2020 09:09:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D8CE8B8CF;
	Wed,  1 Jul 2020 09:09:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED011C0733;
	Wed,  1 Jul 2020 09:09:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7921C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 09:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A06948B8F7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 09:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rp8mkSR0bBCr
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 09:09:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 78A8E8B8BC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593594572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7iSWdZz1MQYnvIIt6jkhrHrV7ZLYvXqE5mMXKJ+C5ME=;
 b=i2HM49l8NKqtDsONZi6jn7D7ZrPcD7yfQQkfgjuqLxrPAPzPycD6NT1sChd+5fZzLasNAR
 cZIg4nrSIzHWRr0PBVdE8PrapsHmTk/ObM9dHbFYt4LRrk06pCh695N5XdnDXdHBuu/5hT
 3zYp3US0ygLelosI7SSuyFLyCt8dHp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-ft1kK71qO1OkZUKpp4aHNw-1; Wed, 01 Jul 2020 05:09:30 -0400
X-MC-Unique: ft1kK71qO1OkZUKpp4aHNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B4151005513;
 Wed,  1 Jul 2020 09:09:28 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 979BD71662;
 Wed,  1 Jul 2020 09:08:47 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/5]
Date: Wed,  1 Jul 2020 17:08:34 +0800
Message-Id: <20200701090839.12994-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
dma_map(). Though set_map() is designed to have the capability to pass
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

Note, this only impacts the devices that want its own DMA
translation (less times of set_map() call). For other type of devices,
there's no changes in the behaviour.

Changes from RFCV1:

- tweak the comments per Michael's request

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
 include/uapi/linux/vhost_types.h | 11 +++++++
 7 files changed, 114 insertions(+), 29 deletions(-)

-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
