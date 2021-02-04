Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18830F589
	for <lists.virtualization@lfdr.de>; Thu,  4 Feb 2021 15:57:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D605086B18;
	Thu,  4 Feb 2021 14:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXNhdJmB7iKN; Thu,  4 Feb 2021 14:57:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E891B86A09;
	Thu,  4 Feb 2021 14:57:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C46FAC013A;
	Thu,  4 Feb 2021 14:57:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 509A1C1834
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 14:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 397AD86130
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 14:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dUEk2Eur0MWM
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 14:57:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 577988612E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612450642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBs15qRjjzjdlUKrkJJe9FgGE4IM/0kRP7oncF/GMkk=;
 b=ejb1QP82rn9qhkZ+0uus96vXDOU1us8zlwAqatcJ6r5w1mOOGf0++Lf1WZMCBEKkwIBGv8
 U5jyTtq5756OwoxUcPEyIzC8aH2Fustf7MqtAANqVYyRuW3tMClovwuLpXbrPm/1sa6DIa
 LnwHGtLGuUwBekpj1RdZfWdBha7RZBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-8N-LUYrQPYuG6999JiEovQ-1; Thu, 04 Feb 2021 09:57:20 -0500
X-MC-Unique: 8N-LUYrQPYuG6999JiEovQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 360A3107ACE6;
 Thu,  4 Feb 2021 14:57:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC460100F493;
 Thu,  4 Feb 2021 14:57:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DE1C31801023; Thu,  4 Feb 2021 15:57:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 07/10] drm/qxl: handle shadow in primary destroy
Date: Thu,  4 Feb 2021 15:57:08 +0100
Message-Id: <20210204145712.1531203-8-kraxel@redhat.com>
In-Reply-To: <20210204145712.1531203-1-kraxel@redhat.com>
References: <20210204145712.1531203-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
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

qxl_primary_atomic_disable must check whenever the framebuffer bo has a
shadow surface and in case it has check the shadow primary status.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index d25fd3acc891..c326412136c5 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -562,6 +562,8 @@ static void qxl_primary_atomic_disable(struct drm_plane *plane,
 	if (old_state->fb) {
 		struct qxl_bo *bo = gem_to_qxl_bo(old_state->fb->obj[0]);
 
+		if (bo->shadow)
+			bo = bo->shadow;
 		if (bo->is_primary) {
 			qxl_io_destroy_primary(qdev);
 			bo->is_primary = false;
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
