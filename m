Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D743BB7AE
	for <lists.virtualization@lfdr.de>; Mon,  5 Jul 2021 09:19:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5397C83A59;
	Mon,  5 Jul 2021 07:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rs9DkJ1FNad5; Mon,  5 Jul 2021 07:19:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4351983A5A;
	Mon,  5 Jul 2021 07:19:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5951C001F;
	Mon,  5 Jul 2021 07:19:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9F67C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 07:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A928F401A4
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 07:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wyLiKephU_76
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 07:19:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 186CC40169
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625469570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AsZSFMJJkoJGWjbavb6OT4THQJwUV8GZhfv+a3hztGw=;
 b=BuG0yfRk291+TgiriLkxeTmUyY+11wK33rjA0oA/mooeOKlR0qDaMlLXvXcsSDm3//cuKK
 hm0ablxOxmjtZYlqv9mDAxO4k6FAWHjiTqMEn+c1IM6C5VUHdfucmEsf42dVHLg20/Mi0i
 OL6DYagAcuXJ373kP6VLED/tIguj8PI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-88fkwEcTN6ymt989fu6u9Q-1; Mon, 05 Jul 2021 03:19:28 -0400
X-MC-Unique: 88fkwEcTN6ymt989fu6u9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B913E79EDC;
 Mon,  5 Jul 2021 07:19:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-21.pek2.redhat.com [10.72.13.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E95D85D9FC;
 Mon,  5 Jul 2021 07:19:23 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Subject: [PATCH 2/2] vdpa: vp_vdpa: don't use hard-coded maximum virtqueue size
Date: Mon,  5 Jul 2021 15:19:10 +0800
Message-Id: <20210705071910.31965-2-jasowang@redhat.com>
In-Reply-To: <20210705071910.31965-1-jasowang@redhat.com>
References: <20210705071910.31965-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: netdev@vger.kernel.org, stefanha@redhat.com, xieyongji@bytedance.com
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

This patch switch to read virtqueue size from the capability instead
of depending on the hardcoded value. This allows the per virtqueue
size could be advertised.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/virtio_pci/vp_vdpa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
index 2926641fb586..198f7076e4d9 100644
--- a/drivers/vdpa/virtio_pci/vp_vdpa.c
+++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
@@ -18,7 +18,6 @@
 #include <linux/virtio_pci.h>
 #include <linux/virtio_pci_modern.h>
 
-#define VP_VDPA_QUEUE_MAX 256
 #define VP_VDPA_DRIVER_NAME "vp_vdpa"
 #define VP_VDPA_NAME_SIZE 256
 
@@ -197,7 +196,10 @@ static void vp_vdpa_set_status(struct vdpa_device *vdpa, u8 status)
 
 static u16 vp_vdpa_get_vq_num_max(struct vdpa_device *vdpa, u16 qid)
 {
-	return VP_VDPA_QUEUE_MAX;
+	struct vp_vdpa *vp_vdpa = vdpa_to_vp(vdpa);
+	struct virtio_pci_modern_device *mdev = &vp_vdpa->mdev;
+
+	return vp_modern_get_queue_size(mdev, qid);
 }
 
 static int vp_vdpa_get_vq_state(struct vdpa_device *vdpa, u16 qid,
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
