Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BD59D30F58B
	for <lists.virtualization@lfdr.de>; Thu,  4 Feb 2021 15:57:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56B9186208;
	Thu,  4 Feb 2021 14:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U14HbysrLWxI; Thu,  4 Feb 2021 14:57:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DC6B586302;
	Thu,  4 Feb 2021 14:57:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3581C08A1;
	Thu,  4 Feb 2021 14:57:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25E1EC013A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 14:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1BBE2226E9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 14:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id agsjcsLlSPIe
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 14:57:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 82FB8204C6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612450644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EA/nqaRotJYvNBeiSlgDMpuTxEUgkrxx00l2lNqSnQk=;
 b=Dov7pfLc0NBdldkjqHnAO+dalG32TrJC+ekrRuWcp/W9NjR+r7Q7cnDXIvZ5A+drb066yf
 jpo8Rc6DSuglLxZ0RyN2jLJtQXbpqzyIldPvn/9AnPpvAdQ/iyVnNatMgNwzXohHHOkmdx
 CJc5n/DqPelkOsNynFADJYXRl8Q/oaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-FOeDsbq6PK-AybmChuKnxg-1; Thu, 04 Feb 2021 09:57:20 -0500
X-MC-Unique: FOeDsbq6PK-AybmChuKnxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B03C80402E;
 Thu,  4 Feb 2021 14:57:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFCE45D6D7;
 Thu,  4 Feb 2021 14:57:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C26801801022; Thu,  4 Feb 2021 15:57:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 06/10] drm/qxl: properly pin/unpin shadow
Date: Thu,  4 Feb 2021 15:57:07 +0100
Message-Id: <20210204145712.1531203-7-kraxel@redhat.com>
In-Reply-To: <20210204145712.1531203-1-kraxel@redhat.com>
References: <20210204145712.1531203-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 60331e31861a..d25fd3acc891 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -802,12 +802,14 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 		}
 		if (user_bo->shadow != qdev->dumb_shadow_bo) {
 			if (user_bo->shadow) {
+				qxl_bo_unpin(user_bo->shadow);
 				drm_gem_object_put
 					(&user_bo->shadow->tbo.base);
 				user_bo->shadow = NULL;
 			}
 			drm_gem_object_get(&qdev->dumb_shadow_bo->tbo.base);
 			user_bo->shadow = qdev->dumb_shadow_bo;
+			qxl_bo_pin(user_bo->shadow);
 		}
 	}
 
@@ -833,6 +835,7 @@ static void qxl_plane_cleanup_fb(struct drm_plane *plane,
 	qxl_bo_unpin(user_bo);
 
 	if (old_state->fb != plane->state->fb && user_bo->shadow) {
+		qxl_bo_unpin(user_bo->shadow);
 		drm_gem_object_put(&user_bo->shadow->tbo.base);
 		user_bo->shadow = NULL;
 	}
@@ -1230,6 +1233,7 @@ int qxl_modeset_init(struct qxl_device *qdev)
 void qxl_modeset_fini(struct qxl_device *qdev)
 {
 	if (qdev->dumb_shadow_bo) {
+		qxl_bo_unpin(qdev->dumb_shadow_bo);
 		drm_gem_object_put(&qdev->dumb_shadow_bo->tbo.base);
 		qdev->dumb_shadow_bo = NULL;
 	}
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
