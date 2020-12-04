Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D232CE6D7
	for <lists.virtualization@lfdr.de>; Fri,  4 Dec 2020 05:05:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D37B87C02;
	Fri,  4 Dec 2020 04:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bSjFFJqI-Tm; Fri,  4 Dec 2020 04:05:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 51DC987C0F;
	Fri,  4 Dec 2020 04:05:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CE85C0FA7;
	Fri,  4 Dec 2020 04:05:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FDB3C0FA7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 04:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 582F88787B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 04:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKLvJbs32QDH
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 04:05:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C982287840
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 04:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607054712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JtJSGoa5TRfuuBNc87icAYiWh/b5eXjv2GjseWaFBo=;
 b=FNnJMBsUhth2YXqWEUR/u4+lZlJcMioGJ6KbhtiIMiIxoH0a2NZCwgJoOeaku7RqrMghuo
 xmbFoVFiX7aX5X7HvF6E/xU62X2GpfoWE5JM9dmwJN+C9NWppBegheabmXhiCo2Cv+PlDf
 tuv+D7vsXhOzG7a8vuQh5nVpTT1+w3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-Tbf_OSFTMAKtM-xFIMgy7w-1; Thu, 03 Dec 2020 23:05:11 -0500
X-MC-Unique: Tbf_OSFTMAKtM-xFIMgy7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2390180EF81;
 Fri,  4 Dec 2020 04:05:10 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-116.pek2.redhat.com [10.72.12.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1D441A8A9;
 Fri,  4 Dec 2020 04:05:07 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 18/19] virtio_vdpa: don't warn when fail to disable vq
Date: Fri,  4 Dec 2020 12:03:52 +0800
Message-Id: <20201204040353.21679-19-jasowang@redhat.com>
In-Reply-To: <20201204040353.21679-1-jasowang@redhat.com>
References: <20201204040353.21679-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: shahafs@mellanox.com
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

There's no guarantee that the device can disable a specific virtqueue
through set_vq_ready(). One example is the modern virtio-pci
device. So this patch removes the warning.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_vdpa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index 4a9ddb44b2a7..e28acf482e0c 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -225,9 +225,8 @@ static void virtio_vdpa_del_vq(struct virtqueue *vq)
 	list_del(&info->node);
 	spin_unlock_irqrestore(&vd_dev->lock, flags);
 
-	/* Select and deactivate the queue */
+	/* Select and deactivate the queue (best effort) */
 	ops->set_vq_ready(vdpa, index, 0);
-	WARN_ON(ops->get_vq_ready(vdpa, index));
 
 	vring_del_virtqueue(vq);
 
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
