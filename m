Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F076B2107C7
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 11:13:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 87FE52F953;
	Wed,  1 Jul 2020 09:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIaU+88IVNff; Wed,  1 Jul 2020 09:13:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 91B182FC50;
	Wed,  1 Jul 2020 09:13:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86995C0733;
	Wed,  1 Jul 2020 09:13:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29EFFC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 09:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0081B2F954
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 09:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gZuc1UDXbxOV
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 09:13:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id EF1672F953
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593594807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ANjSp1CGZSsGz6Jj2Dxzgjt9bQwE2jGuP+C3WvRPMLM=;
 b=SbcMjtapBdbKhClRVqkCW7LU2LgJV300KXkXbQeTpYY6MvvvA55y7X5PuYdJl06dVUwk57
 n10zqHjU21GzGmju4RVSXCQ1rv/DjanB7E1fNAoAIKbtlxpxHXuZjnOsYzYbeaHbRJJCSn
 Al+EczSV86T8TYwD1rXhsxf0Im1Fzo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-yv45vbF_PWiasw5_gEzo8Q-1; Wed, 01 Jul 2020 05:13:26 -0400
X-MC-Unique: yv45vbF_PWiasw5_gEzo8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 516B6BFC0;
 Wed,  1 Jul 2020 09:13:24 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E08CD9035F;
 Wed,  1 Jul 2020 09:12:02 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] vdpasim: support batch updating
Date: Wed,  1 Jul 2020 17:08:39 +0800
Message-Id: <20200701090839.12994-6-jasowang@redhat.com>
In-Reply-To: <20200701090839.12994-1-jasowang@redhat.com>
References: <20200701090839.12994-1-jasowang@redhat.com>
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

The vDPA simulator support both set_map() and dma_map()/dma_unmap()
operations. But vhost-vdpa can only use one of them. So this patch
introduce a module parameter (batch_mapping) that let vpda_sim to
support only one of those dma operations. The batched mapping via
set_map() is enabled by default.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 40 +++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index c7334cc65bb2..a7a0962ed8a8 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -33,6 +33,10 @@
 #define DRV_DESC     "vDPA Device Simulator"
 #define DRV_LICENSE  "GPL v2"
 
+static int batch_mapping = 1;
+module_param(batch_mapping, int, 0444);
+MODULE_PARM_DESC(batch_mapping, "Batched mapping 1 -Enable; 0 - Disable");
+
 struct vdpasim_virtqueue {
 	struct vringh vring;
 	struct vringh_kiov iov;
@@ -303,16 +307,22 @@ static const struct dma_map_ops vdpasim_dma_ops = {
 };
 
 static const struct vdpa_config_ops vdpasim_net_config_ops;
+static const struct vdpa_config_ops vdpasim_net_batch_config_ops;
 
 static struct vdpasim *vdpasim_create(void)
 {
+	const struct vdpa_config_ops *ops;
 	struct virtio_net_config *config;
 	struct vdpasim *vdpasim;
 	struct device *dev;
 	int ret = -ENOMEM;
 
-	vdpasim = vdpa_alloc_device(struct vdpasim, vdpa, NULL,
-				    &vdpasim_net_config_ops);
+	if (batch_mapping)
+		ops = &vdpasim_net_batch_config_ops;
+	else
+		ops = &vdpasim_net_config_ops;
+
+	vdpasim = vdpa_alloc_device(struct vdpasim, vdpa, NULL, ops);
 	if (!vdpasim)
 		goto err_alloc;
 
@@ -597,12 +607,36 @@ static const struct vdpa_config_ops vdpasim_net_config_ops = {
 	.get_config             = vdpasim_get_config,
 	.set_config             = vdpasim_set_config,
 	.get_generation         = vdpasim_get_generation,
-	.set_map                = vdpasim_set_map,
 	.dma_map                = vdpasim_dma_map,
 	.dma_unmap              = vdpasim_dma_unmap,
 	.free                   = vdpasim_free,
 };
 
+static const struct vdpa_config_ops vdpasim_net_batch_config_ops = {
+	.set_vq_address         = vdpasim_set_vq_address,
+	.set_vq_num             = vdpasim_set_vq_num,
+	.kick_vq                = vdpasim_kick_vq,
+	.set_vq_cb              = vdpasim_set_vq_cb,
+	.set_vq_ready           = vdpasim_set_vq_ready,
+	.get_vq_ready           = vdpasim_get_vq_ready,
+	.set_vq_state           = vdpasim_set_vq_state,
+	.get_vq_state           = vdpasim_get_vq_state,
+	.get_vq_align           = vdpasim_get_vq_align,
+	.get_features           = vdpasim_get_features,
+	.set_features           = vdpasim_set_features,
+	.set_config_cb          = vdpasim_set_config_cb,
+	.get_vq_num_max         = vdpasim_get_vq_num_max,
+	.get_device_id          = vdpasim_get_device_id,
+	.get_vendor_id          = vdpasim_get_vendor_id,
+	.get_status             = vdpasim_get_status,
+	.set_status             = vdpasim_set_status,
+	.get_config             = vdpasim_get_config,
+	.set_config             = vdpasim_set_config,
+	.get_generation         = vdpasim_get_generation,
+	.set_map                = vdpasim_set_map,
+	.free                   = vdpasim_free,
+};
+
 static int __init vdpasim_dev_init(void)
 {
 	vdpasim_dev = vdpasim_create();
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
