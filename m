Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6571FC4A5
	for <lists.virtualization@lfdr.de>; Wed, 17 Jun 2020 05:30:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5C3EF895F9;
	Wed, 17 Jun 2020 03:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id glT-fqQrNUMF; Wed, 17 Jun 2020 03:30:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 15ED3895F1;
	Wed, 17 Jun 2020 03:30:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07FB1C016E;
	Wed, 17 Jun 2020 03:30:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B953C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 03:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8B6CB86E29
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 03:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4g3PtIEjIw1t
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 03:30:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0645386DAA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 03:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592364621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+42FNXKIBA3SLmmXlWtUDtUR9h03h5BkA4akBDJ4BI=;
 b=eyYy5OkSER9A66xyZP4KRUMUg2VnaToBV/GDY6K0Q4YRAB54r1hyXezepPaA9bwwtl7FoD
 USVKS/Ryq80D4ZKi7+YK687ntdE+ZZtaE/Gismix43piG9CW+qPG2LxsfMtzmKBryCduXE
 /m0L2MF7xOD89S7pfCZmswiOpo0jSXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-_Fs2v4dOOqel8S6cuann0w-1; Tue, 16 Jun 2020 23:30:20 -0400
X-MC-Unique: _Fs2v4dOOqel8S6cuann0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14D2380F5E0;
 Wed, 17 Jun 2020 03:30:18 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-217.pek2.redhat.com [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90CD45C1D4;
 Wed, 17 Jun 2020 03:30:04 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] vdpa_sim: implement get_iova_range bus operation
Date: Wed, 17 Jun 2020 11:29:45 +0800
Message-Id: <20200617032947.6371-3-jasowang@redhat.com>
In-Reply-To: <20200617032947.6371-1-jasowang@redhat.com>
References: <20200617032947.6371-1-jasowang@redhat.com>
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

This patch implements get_iova_range method for vdpa_sim. Since
vdpa_sim is a software device, simply advertise a [0ULL, ~0ULL] range.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index c7334cc65bb2..b3a6dc5b9984 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -524,6 +524,16 @@ static u32 vdpasim_get_generation(struct vdpa_device *vdpa)
 	return vdpasim->generation;
 }
 
+static struct vdpa_iova_range vdpasim_get_iova_range(struct vdpa_device *vdpa)
+{
+	struct vdpa_iova_range range;
+
+	range.start = 0ULL;
+	range.end = ~0ULL;
+
+	return range;
+}
+
 static int vdpasim_set_map(struct vdpa_device *vdpa,
 			   struct vhost_iotlb *iotlb)
 {
@@ -597,6 +607,7 @@ static const struct vdpa_config_ops vdpasim_net_config_ops = {
 	.get_config             = vdpasim_get_config,
 	.set_config             = vdpasim_set_config,
 	.get_generation         = vdpasim_get_generation,
+	.get_iova_range         = vdpasim_get_iova_range,
 	.set_map                = vdpasim_set_map,
 	.dma_map                = vdpasim_dma_map,
 	.dma_unmap              = vdpasim_dma_unmap,
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
