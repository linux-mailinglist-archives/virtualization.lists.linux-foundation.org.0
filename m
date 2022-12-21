Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D9297652CC7
	for <lists.virtualization@lfdr.de>; Wed, 21 Dec 2022 07:17:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77CEE81FD7;
	Wed, 21 Dec 2022 06:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77CEE81FD7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=euYddKzO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JOCBZg11ykXt; Wed, 21 Dec 2022 06:17:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 39A3481F8F;
	Wed, 21 Dec 2022 06:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39A3481F8F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B6A6C0077;
	Wed, 21 Dec 2022 06:17:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1713DC007C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Dec 2022 06:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F152F40B25
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Dec 2022 06:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F152F40B25
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=euYddKzO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tm7iH_kYvXDv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Dec 2022 06:17:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 495F1400D1
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 495F1400D1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Dec 2022 06:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671603431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=efTUIZYKkcN6gJm1sKkzjaOGjtEXRgR99AIquQd4Vbw=;
 b=euYddKzObFPpvp1EFnw20iLLc4tf/F6+oljdWFsf8iUemwlflg9bsV3eAe4jFCdWqjABNa
 44niJXG1oikKMeVf0W+lFMa4ZFNxWfz0FdwFx9KfUz0aEHn+J3MKLzh4yzTBZhFF/16Do5
 fokNdAHdaGGu5YlAa8TvXp5R5GwGyO4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-lR64KuZONDOe9vjW3QznTA-1; Wed, 21 Dec 2022 01:17:09 -0500
X-MC-Unique: lR64KuZONDOe9vjW3QznTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34FB23813F2B;
 Wed, 21 Dec 2022 06:17:09 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-236.pek2.redhat.com
 [10.72.13.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 986562166B26;
 Wed, 21 Dec 2022 06:17:06 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 3/4] vdpa_sim: support vendor satistics
Date: Wed, 21 Dec 2022 14:16:51 +0800
Message-Id: <20221221061652.15202-4-jasowang@redhat.com>
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

This patch adds a new config ops callback to allow individual
simulator to implement the vendor stats callback.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 13 +++++++++++++
 drivers/vdpa/vdpa_sim/vdpa_sim.h |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 55aaa023a6e2..02e892f819e7 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -426,6 +426,18 @@ static int vdpasim_get_vq_state(struct vdpa_device *vdpa, u16 idx,
 	return 0;
 }
 
+static int vdpasim_get_vq_stats(struct vdpa_device *vdpa, u16 idx,
+				struct sk_buff *msg,
+				struct netlink_ext_ack *extack)
+{
+	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
+
+	if (vdpasim->dev_attr.get_stats)
+		return vdpasim->dev_attr.get_stats(vdpasim, idx,
+						   msg, extack);
+	return -EINVAL;
+}
+
 static u32 vdpasim_get_vq_align(struct vdpa_device *vdpa)
 {
 	return VDPASIM_QUEUE_ALIGN;
@@ -710,6 +722,7 @@ static const struct vdpa_config_ops vdpasim_config_ops = {
 	.set_vq_ready           = vdpasim_set_vq_ready,
 	.get_vq_ready           = vdpasim_get_vq_ready,
 	.set_vq_state           = vdpasim_set_vq_state,
+	.get_vendor_vq_stats    = vdpasim_get_vq_stats,
 	.get_vq_state           = vdpasim_get_vq_state,
 	.get_vq_align           = vdpasim_get_vq_align,
 	.get_vq_group           = vdpasim_get_vq_group,
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.h b/drivers/vdpa/vdpa_sim/vdpa_sim.h
index 51c070a543f1..d2a08c0abad7 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.h
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.h
@@ -48,6 +48,9 @@ struct vdpasim_dev_attr {
 	work_func_t work_fn;
 	void (*get_config)(struct vdpasim *vdpasim, void *config);
 	void (*set_config)(struct vdpasim *vdpasim, const void *config);
+	int (*get_stats)(struct vdpasim *vdpasim, u16 idx,
+			 struct sk_buff *msg,
+			 struct netlink_ext_ack *extack);
 };
 
 /* State of each vdpasim device */
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
