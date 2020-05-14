Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E151D28B3
	for <lists.virtualization@lfdr.de>; Thu, 14 May 2020 09:26:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BD7118967D;
	Thu, 14 May 2020 07:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t95EW5GOP2dp; Thu, 14 May 2020 07:26:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 54DFA88B26;
	Thu, 14 May 2020 07:26:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F58AC016F;
	Thu, 14 May 2020 07:26:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D498CC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 07:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BB1F989631
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 07:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6n30qjKFsfH
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 07:26:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C91F488B26
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 07:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589441161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=z22Wqt719gzXO2RzDZasKjbiB6qd6XqJTkPElK0QqYg=;
 b=foP+/jgc6K4qid6Go3a6Ft1NNYueFlqo3CVSfzLmKEAy6Ko+jIiI+pPf24gSxCQHUsl6qO
 AaKiWZD0JIB3ocR6Lzu3NLQcK93GpSjnWt/IiQSOTEdEHDbgirKRgOMrNA2Pr5M1lyiKDt
 N7gVn7Ff+/OVbRQvSp/NN2uHpZ2OWEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-1SZ4swkBOJa4iBMd9c1R7A-1; Thu, 14 May 2020 03:25:57 -0400
X-MC-Unique: 1SZ4swkBOJa4iBMd9c1R7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E630A0BD8;
 Thu, 14 May 2020 07:25:56 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-133.pek2.redhat.com [10.72.12.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEFE52BFF0;
 Thu, 14 May 2020 07:25:51 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH] vdpa_sim: do not reset IOTLB during device reset
Date: Thu, 14 May 2020 15:25:49 +0800
Message-Id: <20200514072549.29694-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

We reset IOTLB during device reset this breaks the assumption that the
mapping needs to be controlled via vDPA DMA ops explicitly in a
incremental way. So the networking will be broken after e.g a guest
reset.

Fix this by not resetting the IOTLB during device reset.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 7957d2d41fc4..cc5525743a25 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -119,8 +119,6 @@ static void vdpasim_reset(struct vdpasim *vdpasim)
 	for (i = 0; i < VDPASIM_VQ_NUM; i++)
 		vdpasim_vq_reset(&vdpasim->vqs[i]);
 
-	vhost_iotlb_reset(vdpasim->iommu);
-
 	vdpasim->features = 0;
 	vdpasim->status = 0;
 	++vdpasim->generation;
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
