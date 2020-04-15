Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4111A948E
	for <lists.virtualization@lfdr.de>; Wed, 15 Apr 2020 09:41:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7723F86E9F;
	Wed, 15 Apr 2020 07:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXQkyj2Ac+C4; Wed, 15 Apr 2020 07:41:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E952D86EAC;
	Wed, 15 Apr 2020 07:41:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDAE1C0172;
	Wed, 15 Apr 2020 07:41:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8F01C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D5A2586E82
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wG+Fj9GBtnPV
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 28E2986E7F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:42 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a25so17886857wrd.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6PYhK9PeyHN9Se7zWckWuH+CKUAQb8wgDIX1vJ8dbfI=;
 b=EMxn3uLWNiLBg9QPG3GAvetV8BTE4dERLT4lGe7A7UC7Kx+Nl6vYMYBupbOr26MzGj
 JJ5quQtUSVT6O5DaaTplhEbnRFOzQrh1QBYYKHPORAjTpmUAIJ8D5Q8iyJWZT/fcpM6q
 fPxQ2hQIKOBsCZtKJ0aRG75irqgiLY9807UR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6PYhK9PeyHN9Se7zWckWuH+CKUAQb8wgDIX1vJ8dbfI=;
 b=UzW0uPB+VwwHsZDFeRGOS1VlG5dG3nzVR7ynjyaF2zZEcSEymkjaD521nHg8J6gf/Z
 FbVsCy9Rf8GcUbmmUwp51dg7yW+KFmR3zDs9RZcFiSQ0XoHiInAjX3AQRE7kTLETfpF4
 iebMBp69icdXD16HludY76obmy+Ed+F495Juek0Z/pJsdbh3q+SXotI7lRl9TzhHqdnM
 aztA/10bZJE5cXZ1Pzl6wPydqkKIZ//ooMcPkldAvVG4nRF6FOE4zR4etMakLDw9TBog
 hJZKBp8CtZWlUBt6p9awM+RgTNamQ6e8QDRbQ9pM9g7IQGGQLkr3eTNIuU99cf1b3Ls6
 MDSw==
X-Gm-Message-State: AGi0Pub7w68TXQKLGgLXI4Ub9wS6y7DoQAKV8CYhTba7fKm/dF8SFlVv
 Q2uXCE90SbPmGdAhDXdQ3C7yag==
X-Google-Smtp-Source: APiQypLV8WXAklnMnfy9GuM7TFNlpDXlkMzsNe1juREetHB5Fq/+q5s/1uJxKuGWuPYrSXbMvAJSIA==
X-Received: by 2002:a5d:45cf:: with SMTP id b15mr41966wrs.78.1586936500685;
 Wed, 15 Apr 2020 00:41:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 59/59] drm/bochs: Remove explicit drm_connector_register
Date: Wed, 15 Apr 2020 09:40:34 +0200
Message-Id: <20200415074034.175360-60-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 virtualization@lists.linux-foundation.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
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

This is leftovers from the old drm_driver->load callback
upside-down issues. It doesn't do anything for not-hotplugged
connectors since drm_dev_register takes care of that.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/bochs/bochs_kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 7f4bcfad87e9..05d8373888e8 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -104,7 +104,6 @@ static void bochs_connector_init(struct drm_device *dev)
 			   DRM_MODE_CONNECTOR_VIRTUAL);
 	drm_connector_helper_add(connector,
 				 &bochs_connector_connector_helper_funcs);
-	drm_connector_register(connector);
 
 	bochs_hw_load_edid(bochs);
 	if (bochs->edid) {
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
