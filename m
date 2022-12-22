Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B0479653BFD
	for <lists.virtualization@lfdr.de>; Thu, 22 Dec 2022 07:04:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6771403BE;
	Thu, 22 Dec 2022 06:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6771403BE
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R62w4Img
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kg0DW1xo3LkM; Thu, 22 Dec 2022 06:04:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DC4AA40153;
	Thu, 22 Dec 2022 06:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC4AA40153
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3507BC007C;
	Thu, 22 Dec 2022 06:04:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72260C0070
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 06:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E49A40153
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 06:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E49A40153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OHfJvzAgw_yd
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 06:04:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3788403BE
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3788403BE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 06:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671689092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rTeZDLahEEUIQy4wMRthdfJbzV+lOwcoNI4SggfJI8=;
 b=R62w4ImgynvjYrO7IgrIDcR2VDtZpEl+S4+8iqDsFZkGlcVbBS7eMDSJGc6NS3QAVxjW6+
 DPXzl5TiHAd6nmPvsm0E29IkXV1mRJkfx8jqT2nSB1lfW3vcSz042Kes0u94WxrmrO/Y2M
 vZsaudRsAAVF4kofjO1/fGuFdUFJ+UI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-V2twCnI5NIurCMkSOvZAzQ-1; Thu, 22 Dec 2022 01:04:49 -0500
X-MC-Unique: V2twCnI5NIurCMkSOvZAzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB30A29ABA2B;
 Thu, 22 Dec 2022 06:04:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-179.pek2.redhat.com
 [10.72.13.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48B21112132C;
 Thu, 22 Dec 2022 06:04:43 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [RFC PATCH 2/4] virtio_ring: switch to use BAD_RING()
Date: Thu, 22 Dec 2022 14:04:25 +0800
Message-Id: <20221222060427.21626-3-jasowang@redhat.com>
In-Reply-To: <20221222060427.21626-1-jasowang@redhat.com>
References: <20221222060427.21626-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 edumazet@google.com, maxime.coquelin@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net
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

Switch to reuse BAD_RING() to allow common logic to be implemented in
BAD_RING().

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 2e7689bb933b..90c2034a77f3 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -2237,7 +2237,7 @@ bool virtqueue_notify(struct virtqueue *_vq)
 
 	/* Prod other side to tell it about changes. */
 	if (!vq->notify(_vq)) {
-		vq->broken = true;
+		BAD_RING(vq, "vq %d is broken\n", vq->vq.index);
 		return false;
 	}
 	return true;
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
