Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F8D46A2E
	for <lists.virtualization@lfdr.de>; Fri, 14 Jun 2019 22:37:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BD6B1FC2;
	Fri, 14 Jun 2019 20:37:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 76878FC2
	for <virtualization@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 20:37:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E5676822
	for <virtualization@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 20:37:05 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id m10so5242934edv.6
	for <virtualization@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 13:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Y9RKgY0+3FkjSX0Oldmu3gGGi6J9Dx0mTVEOdTGhQwU=;
	b=BPfkevHAKLwcTEw0iqHFXr8QiwGBGtYDzLrlPA04hLqsksgpZSe8k1jkI+UeyWJCq0
	bzYSraRuURwxAl6JOFAj1AjqcABPYDgSWlvxFGBSdSQAMcRaz1OOnyQjz3xnOfl1CwyA
	mnEW049jvD964PgHDYJaWX322cLd5Um9CNf7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Y9RKgY0+3FkjSX0Oldmu3gGGi6J9Dx0mTVEOdTGhQwU=;
	b=iX+lxlWYJYrqdIlo+/dVpnIiacSTGNz5/V8BA4gost0TSo4poYwC36zbAp5q8xqS2j
	dDJ7E2MJDDci/v/cu/ULlZGHrO+HadjgXafCpiAQHJ3FqW82A8Kqw+QNV3+qa3J91TpG
	vlF7JEpPSPVgRbwnmQXoICYbiFBVYOUMC38HhteI4byYmbhTlJidMY0Z0lidaBmtQZEm
	B+WrndZDFBn7goz26lLRC3IWhL+t7LB8OLcStzsPniATR7jQzJIR2xEZvvdx8hSzFW7J
	VMBrV//gJz+s7t5zX+StxYOMEBesrGrnYc2GH4ZfIxx254Nxoc3BkX0pmutJczAKmuMO
	lXnw==
X-Gm-Message-State: APjAAAUrYlFFZDIWBfehncUV434VWrB9yjiWHetHiELmFFqv9btPV8km
	B5f1VGamTD1MJzSvoU5TIHgfEA==
X-Google-Smtp-Source: APXvYqzkCm47/FYrY7Q0W3jwPMfoOrKGsg0RU324Ysjn2Lsd6f06AYcd7EAKzECV9fCuHygeacDimA==
X-Received: by 2002:a50:8825:: with SMTP id b34mr25676201edb.22.1560544624634; 
	Fri, 14 Jun 2019 13:37:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	n15sm1166672edd.49.2019.06.14.13.37.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 13:37:04 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 37/59] drm/virtio: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:53 +0200
Message-Id: <20190614203615.12639-38-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	virtualization@lists.linux-foundation.org,
	Daniel Vetter <daniel.vetter@intel.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

They're the default.

Aside: Would be really nice to switch the others over to
drm_gem_object_funcs.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 0afdf51fdcfd..99bcd290f1fb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -207,8 +207,6 @@ static struct drm_driver driver = {
 #endif
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = drm_gem_prime_export,
-	.gem_prime_import = drm_gem_prime_import,
 	.gem_prime_get_sg_table = virtgpu_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
 	.gem_prime_vmap = virtgpu_gem_prime_vmap,
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
