Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB6C24AA96
	for <lists.virtualization@lfdr.de>; Thu, 20 Aug 2020 02:03:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0A7588828C;
	Thu, 20 Aug 2020 00:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIhtBh-MIcFg; Thu, 20 Aug 2020 00:03:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7B1ED88287;
	Thu, 20 Aug 2020 00:03:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CA64C0051;
	Thu, 20 Aug 2020 00:03:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13176C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 00:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 00716844A8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 00:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVgxhWNCM5SO
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 00:03:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8EA758447F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 00:03:44 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C418208E4;
 Thu, 20 Aug 2020 00:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597881824;
 bh=gDxGAOb0qK+ueuz1Ha9bY/C+e/XGqAv2qeL00uHAwHA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CRcznKHtH/PyqVwpWkzzYNAaHaJ1XiMWQIR2/M9T/GVW7cUfiFvbclzcmVZiaRm6N
 donfcs60nxArnm+cuOz2fNmmbjwIbxnytZXzgOfpiTKf9iIslAIDXQ/ashu8Tj9iOR
 Y4ow0PVm7p4+IpMfgi8yUvANajSXvr9cPJuhrhro=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 11/13] virtio_ring: Avoid loop when vq is broken
 in virtqueue_poll
Date: Wed, 19 Aug 2020 20:03:26 -0400
Message-Id: <20200820000328.215755-11-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200820000328.215755-1-sashal@kernel.org>
References: <20200820000328.215755-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Mao Wenan <wenan.mao@linux.alibaba.com>,
 virtualization@lists.linux-foundation.org,
 "Michael S . Tsirkin" <mst@redhat.com>
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

From: Mao Wenan <wenan.mao@linux.alibaba.com>

[ Upstream commit 481a0d7422db26fb63e2d64f0652667a5c6d0f3e ]

The loop may exist if vq->broken is true,
virtqueue_get_buf_ctx_packed or virtqueue_get_buf_ctx_split
will return NULL, so virtnet_poll will reschedule napi to
receive packet, it will lead cpu usage(si) to 100%.

call trace as below:
virtnet_poll
	virtnet_receive
		virtqueue_get_buf_ctx
			virtqueue_get_buf_ctx_packed
			virtqueue_get_buf_ctx_split
	virtqueue_napi_complete
		virtqueue_poll           //return true
		virtqueue_napi_schedule //it will reschedule napi

to fix this, return false if vq is broken in virtqueue_poll.

Signed-off-by: Mao Wenan <wenan.mao@linux.alibaba.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Link: https://lore.kernel.org/r/1596354249-96204-1-git-send-email-wenan.mao@linux.alibaba.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/virtio/virtio_ring.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index b82bb0b081615..51278f8bd3ab3 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -829,6 +829,9 @@ bool virtqueue_poll(struct virtqueue *_vq, unsigned last_used_idx)
 {
 	struct vring_virtqueue *vq = to_vvq(_vq);
 
+	if (unlikely(vq->broken))
+		return false;
+
 	virtio_mb(vq->weak_barriers);
 	return (u16)last_used_idx != virtio16_to_cpu(_vq->vdev, vq->vring.used->idx);
 }
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
