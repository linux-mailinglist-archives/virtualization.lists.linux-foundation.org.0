Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D9880652CC8
	for <lists.virtualization@lfdr.de>; Wed, 21 Dec 2022 07:17:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E25FD41836;
	Wed, 21 Dec 2022 06:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E25FD41836
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DDhQ72Zu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYr7ho2I73o9; Wed, 21 Dec 2022 06:17:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5025F417C1;
	Wed, 21 Dec 2022 06:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5025F417C1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EEFEC0070;
	Wed, 21 Dec 2022 06:17:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18BD6C007D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Dec 2022 06:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF72860FD9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Dec 2022 06:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF72860FD9
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=DDhQ72Zu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mcEqKbQ1oGxk
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Dec 2022 06:17:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 763B760FC0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 763B760FC0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Dec 2022 06:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671603430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJgJpF5xZkDorw1tYw0inGkzyUnI/sANbAPj2wEvpBo=;
 b=DDhQ72ZuU/qjzyN7sM/8IJ5kmzZ9VP9+JAsFMGgC1t4W2Oi/qUE0k0tiOQc1RLRlmBRURB
 rOmsgWBBMnTnkPR+DB+sakcE2lryX2ESjAsutuADT4nfxRPzAReTqSXuMrgIj2/Wn2uqEA
 tQEo5mue6r7Ewz8HhkqNQIeOQXH4Tn8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-K258nhXDPxuz3qsE6vOB7A-1; Wed, 21 Dec 2022 01:17:06 -0500
X-MC-Unique: K258nhXDPxuz3qsE6vOB7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDB33886462;
 Wed, 21 Dec 2022 06:17:05 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-236.pek2.redhat.com
 [10.72.13.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BB022166B26;
 Wed, 21 Dec 2022 06:17:03 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 2/4] vdpasim: customize allocation size
Date: Wed, 21 Dec 2022 14:16:50 +0800
Message-Id: <20221221061652.15202-3-jasowang@redhat.com>
In-Reply-To: <20221221061652.15202-1-jasowang@redhat.com>
References: <20221221061652.15202-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Cc: eperezma@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

Allow individual simulator to customize the allocation size.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c     | 8 ++++++--
 drivers/vdpa/vdpa_sim/vdpa_sim.h     | 1 +
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c | 1 +
 drivers/vdpa/vdpa_sim/vdpa_sim_net.c | 1 +
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 757afef86ba0..55aaa023a6e2 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -253,7 +253,10 @@ struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr,
 	struct vdpa_device *vdpa;
 	struct vdpasim *vdpasim;
 	struct device *dev;
-	int i, ret = -ENOMEM;
+	int i, ret = -EINVAL;
+
+	if (!dev_attr->alloc_size)
+		goto err_alloc;
 
 	if (config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) {
 		if (config->device_features &
@@ -268,9 +271,10 @@ struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr,
 	else
 		ops = &vdpasim_config_ops;
 
+	ret = -ENOMEM;
 	vdpa = __vdpa_alloc_device(NULL, ops,
 				   dev_attr->ngroups, dev_attr->nas,
-				   sizeof(struct vdpasim),
+				   dev_attr->alloc_size,
 				   dev_attr->name, false);
 	if (IS_ERR(vdpa)) {
 		ret = PTR_ERR(vdpa);
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.h b/drivers/vdpa/vdpa_sim/vdpa_sim.h
index 0e78737dcc16..51c070a543f1 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.h
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.h
@@ -37,6 +37,7 @@ struct vdpasim_dev_attr {
 	struct vdpa_mgmt_dev *mgmt_dev;
 	const char *name;
 	u64 supported_features;
+	size_t alloc_size;
 	size_t config_size;
 	size_t buffer_size;
 	int nvqs;
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
index c6db1a1baf76..4f7c35f59aa5 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
@@ -378,6 +378,7 @@ static int vdpasim_blk_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
 	dev_attr.nvqs = VDPASIM_BLK_VQ_NUM;
 	dev_attr.ngroups = VDPASIM_BLK_GROUP_NUM;
 	dev_attr.nas = VDPASIM_BLK_AS_NUM;
+	dev_attr.alloc_size = sizeof(struct vdpasim);
 	dev_attr.config_size = sizeof(struct virtio_blk_config);
 	dev_attr.get_config = vdpasim_blk_get_config;
 	dev_attr.work_fn = vdpasim_blk_work;
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
index c3cb225ea469..20cd5cdff919 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
@@ -249,6 +249,7 @@ static int vdpasim_net_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
 	dev_attr.nvqs = VDPASIM_NET_VQ_NUM;
 	dev_attr.ngroups = VDPASIM_NET_GROUP_NUM;
 	dev_attr.nas = VDPASIM_NET_AS_NUM;
+	dev_attr.alloc_size = sizeof(struct vdpasim);
 	dev_attr.config_size = sizeof(struct virtio_net_config);
 	dev_attr.get_config = vdpasim_net_get_config;
 	dev_attr.work_fn = vdpasim_net_work;
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
