Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DB85964B1E4
	for <lists.virtualization@lfdr.de>; Tue, 13 Dec 2022 10:07:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48791408D8;
	Tue, 13 Dec 2022 09:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48791408D8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WhrdwsMi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zgjk2S676Y0k; Tue, 13 Dec 2022 09:07:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 23C3C408D3;
	Tue, 13 Dec 2022 09:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23C3C408D3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54B68C007C;
	Tue, 13 Dec 2022 09:07:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EDDEC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 09:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F0D5408D3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 09:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F0D5408D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4KH0TrUeT-b
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 09:07:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 572E8400D1
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 572E8400D1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670922445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xS/8xvH79U0/asorExnaiOvmHaZmjwQI42/K+CiILXM=;
 b=WhrdwsMis9mEtfBTb6BpATwuCYJsALrBNzzgZCCKlC2DvXU5mxKlGDMnSFz6gTfa6+3ci6
 2Iw7P0TSX/yb4gN0UeK9IUAE32csPEzgPZc5zpdeVYahXQ04RaU+lPgmX3/D1XVLPCyA4p
 EdqHcscMvLO1HwxCMOytrlhAlVelbxU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-kxxqnWQ-PKmhloyUxEmFuA-1; Tue, 13 Dec 2022 04:07:23 -0500
X-MC-Unique: kxxqnWQ-PKmhloyUxEmFuA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19AF085A5B6;
 Tue, 13 Dec 2022 09:07:23 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-188.pek2.redhat.com
 [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9D9A492B00;
 Tue, 13 Dec 2022 09:07:20 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH] vdpasim: fix memory leak when freeing IOTLBs
Date: Tue, 13 Dec 2022 17:07:17 +0800
Message-Id: <20221213090717.61529-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Cc: gautam.dawar@xilinx.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

After commit bda324fd037a ("vdpasim: control virtqueue support"),
vdpasim->iommu became an array of IOTLB, so we should clean the
mappings of each free one by one instead of just deleting the ranges
in the first IOTLB which may leak maps.

Fixes: bda324fd037a ("vdpasim: control virtqueue support")
Cc: Gautam Dawar <gautam.dawar@xilinx.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index b071f0d842fb..9668dc477843 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -690,7 +690,9 @@ static void vdpasim_free(struct vdpa_device *vdpa)
 	}
 
 	kvfree(vdpasim->buffer);
-	vhost_iotlb_free(vdpasim->iommu);
+	for (i = 0; i < vdpasim->dev_attr.nas; i++)
+		vhost_iotlb_reset(&vdpasim->iommu[i]);
+	kfree(vdpasim->iommu);
 	kfree(vdpasim->vqs);
 	kfree(vdpasim->config);
 }
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
