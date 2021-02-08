Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ED569312F40
	for <lists.virtualization@lfdr.de>; Mon,  8 Feb 2021 11:42:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ABA1286785;
	Mon,  8 Feb 2021 10:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvXtQcHqCQBp; Mon,  8 Feb 2021 10:42:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4099B8678A;
	Mon,  8 Feb 2021 10:42:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D3F3C013A;
	Mon,  8 Feb 2021 10:42:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A1E1C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 10:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 860E486785
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 10:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8Iae-5BB84o
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 10:42:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E8EB48678A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 10:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612780932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yx6OCfShF0609v+W3vjhiUcxaTTyjoM+WtY0G5Wv7+4=;
 b=YDiM/Lr9rtNRxheFB3XMs910TNN1G04VvSNTQAhXPD+OGzwsKNhM+NX449NRjZlbuQwhux
 VQjRAIBIBCtZOIamUnydM9jh3Ddy9ZAM5qLit8p37wspbGAO3bFR48hVGPs+osa6gq/aDG
 NW9cppjrYlEl6kcYji6BBVDruD3S+7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-6-5c_2iNNOiCQ_Xc4LVApQ-1; Mon, 08 Feb 2021 05:42:11 -0500
X-MC-Unique: 6-5c_2iNNOiCQ_Xc4LVApQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AE4CC7407;
 Mon,  8 Feb 2021 10:42:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-170.ams2.redhat.com
 [10.36.112.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED29072163;
 Mon,  8 Feb 2021 10:42:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0F1BB18000AF; Mon,  8 Feb 2021 11:42:01 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/qxl: properly handle device init failures
Date: Mon,  8 Feb 2021 11:41:49 +0100
Message-Id: <20210208104149.423758-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: David Airlie <airlied@linux.ie>, Tong Zhang <ztong0001@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
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

Specifically do not try release resources which where
not allocated in the first place.

Cc: Tong Zhang <ztong0001@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 3 +++
 drivers/gpu/drm/qxl/qxl_kms.c     | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index c326412136c5..ec50d2cfd4e1 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -1183,6 +1183,9 @@ int qxl_destroy_monitors_object(struct qxl_device *qdev)
 {
 	int ret;
 
+	if (!qdev->monitors_config_bo)
+		return 0;
+
 	qdev->monitors_config = NULL;
 	qdev->ram_header->monitors_config = 0;
 
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 66d74aaaee06..4dc5ad13f12c 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -288,6 +288,10 @@ void qxl_device_fini(struct qxl_device *qdev)
 {
 	int cur_idx;
 
+	/* check if qxl_device_init() was successful (gc_work is initialized last) */
+	if (!qdev->gc_work.func)
+		return;
+
 	for (cur_idx = 0; cur_idx < 3; cur_idx++) {
 		if (!qdev->current_release_bo[cur_idx])
 			continue;
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
