Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D886746A1F
	for <lists.virtualization@lfdr.de>; Fri, 14 Jun 2019 22:36:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6936FFA4;
	Fri, 14 Jun 2019 20:36:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 255BDFA4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 20:36:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7A902E5
	for <virtualization@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 20:36:52 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id k8so5196754edr.11
	for <virtualization@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 13:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=B/KPbcrrHFxjrwFW7sL1vNIAGEsxVpYmnZ7oDMzAkV4=;
	b=KuSCR2nEB5JU76Khlltio97e730XHa/vvyjsEawpd4UrWtvOJ3VeW+vhRcGIxmbMMI
	KwCEVIIdBRXxDmoEokx3ARO7k+Y5BdocSGEFCVrHvLouj+ab67HVkIvBjWMNX7iYigTX
	WnqYXgim/fwQLcKJaOcx5uapboQBlbiWjcddI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=B/KPbcrrHFxjrwFW7sL1vNIAGEsxVpYmnZ7oDMzAkV4=;
	b=En9kppEjmKVhle94Re2iimvoHLr5zIDYt5fa0lExTr2HaQ9sMV59BctMUKXyV9AgKl
	5tYUl4wCUAWDhWL9CWhxMO8vFR05e1PzQ3v2t7Uf6Qhndwi0ActiREmr5snZ4WoQeaEK
	c1K2bUUlRHD/PzO9zEpe7e+q+Y/CHuNdFgbCsVkngxcqxEPT4unOsEa9hLfAj3/h+0Rg
	C+OiY3N56fWh3VQlrjOMenMXvLLYiTU7NaHZoZctvVhoQCHSLiT5jyqFsd7YfzwtwOQo
	Kxmy6qEeTv0An6xCycVCv3N4GdCNKPOcDe6RAM7CAXLrMe6CsTCDLuEIWPBqc3C5Kdph
	X7RQ==
X-Gm-Message-State: APjAAAXDvbHatUGqQRyTqN+F2BzMTdW9BhO/BjQzXh2DSgZrLeiOZn0e
	+G/jfAfSgbVoFlQwyfo0Wbtslw==
X-Google-Smtp-Source: APXvYqxIfX3NomnfR0i5/JsCRkWABxprarJH50bGy+3xPhFA5HWFSziGXUQGn0KZGdrvzLOeV+nUng==
X-Received: by 2002:a17:906:4e57:: with SMTP id
	g23mr11650473ejw.52.1560544611160; 
	Fri, 14 Jun 2019 13:36:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	n15sm1166672edd.49.2019.06.14.13.36.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 13:36:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 25/59] drm/qxl: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:41 +0200
Message-Id: <20190614203615.12639-26-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	virtualization@lists.linux-foundation.org,
	Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
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
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 61e1ce16fc25..d8f64886474b 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -256,8 +256,6 @@ static struct drm_driver qxl_driver = {
 #endif
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = drm_gem_prime_export,
-	.gem_prime_import = drm_gem_prime_import,
 	.gem_prime_pin = qxl_gem_prime_pin,
 	.gem_prime_unpin = qxl_gem_prime_unpin,
 	.gem_prime_get_sg_table = qxl_gem_prime_get_sg_table,
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
