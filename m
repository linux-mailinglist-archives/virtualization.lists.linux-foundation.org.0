Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 77395397EB4
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 04:16:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A0D240354;
	Wed,  2 Jun 2021 02:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WEDPanw1Liom; Wed,  2 Jun 2021 02:16:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0C8E40393;
	Wed,  2 Jun 2021 02:16:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E5E6C0001;
	Wed,  2 Jun 2021 02:16:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC637C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FEA140354
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9KCvYPlP7IS
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:16:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3AD340349
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622600159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0N48jdl0LC6EEeO/MPQo8KIfakfiafpunndtsq1f0hA=;
 b=Qj3X5G99sD4uzupUG8gHBPquaf9dzGaARDF4yYPCTujV4oTL+HBwLjMVxvJJflgvmDdr6u
 OwPauA5JUfqkMzGeM50L0Sctu6EVt53jsL8QWd+64LyArPciGbo/hGxpQ2XXN3sHA+A1HN
 jl1CKwEuO093u5VSGVuXYWYds1fAjSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-ew0GSzEyOyeLmFpa9-ZpvQ-1; Tue, 01 Jun 2021 22:15:57 -0400
X-MC-Unique: ew0GSzEyOyeLmFpa9-ZpvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6401D801817;
 Wed,  2 Jun 2021 02:15:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-99.pek2.redhat.com [10.72.12.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C553D60CD1;
 Wed,  2 Jun 2021 02:15:53 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH V2 RESEND 4/4] virtio/vdpa: clear the virtqueue state during
 probe
Date: Wed,  2 Jun 2021 10:15:36 +0800
Message-Id: <20210602021536.39525-5-jasowang@redhat.com>
In-Reply-To: <20210602021536.39525-1-jasowang@redhat.com>
References: <20210602021536.39525-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Eli Cohen <elic@nvidia.com>, eli@mellanox.com
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

From: Eli Cohen <elic@nvidia.com>

Clear the available index as part of the initialization process to
clear and values that might be left from previous usage of the device.
For example, if the device was previously used by vhost_vdpa and now
probed by vhost_vdpa, you want to start with indices.

Fixes: c043b4a8cf3b ("virtio: introduce a vDPA based transport")
Signed-off-by: Eli Cohen <elic@nvidia.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_vdpa.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index e28acf482e0c..e1a141135992 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -142,6 +142,8 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
 	struct vdpa_callback cb;
 	struct virtqueue *vq;
 	u64 desc_addr, driver_addr, device_addr;
+	/* Assume split virtqueue, switch to packed if necessary */
+	struct vdpa_vq_state state = {0};
 	unsigned long flags;
 	u32 align, num;
 	int err;
@@ -191,6 +193,19 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
 		goto err_vq;
 	}
 
+	/* reset virtqueue state index */
+	if (virtio_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
+		struct vdpa_vq_state_packed *s = &state.packed;
+
+		s->last_avail_counter = 1;
+		s->last_avail_idx = 0;
+		s->last_used_counter = 1;
+		s->last_used_idx = 0;
+	}
+	err = ops->set_vq_state(vdpa, index, &state);
+	if (err)
+		goto err_vq;
+
 	ops->set_vq_ready(vdpa, index, 1);
 
 	vq->priv = info;
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
