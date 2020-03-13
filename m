Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EC541185017
	for <lists.virtualization@lfdr.de>; Fri, 13 Mar 2020 21:18:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2241320507;
	Fri, 13 Mar 2020 20:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4qZg2aluYHN3; Fri, 13 Mar 2020 20:18:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 78CFD20509;
	Fri, 13 Mar 2020 20:18:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CD11C1D88;
	Fri, 13 Mar 2020 20:18:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47F1DC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 20:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 44610886F0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 20:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dJnqDbWek3bE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 20:18:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6176B886F5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 20:18:04 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id j11so8932569lfg.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 13:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BOrKdqp0xX849tkbGYoL5GifZ0fJWuSnmKvneHoBEPI=;
 b=SFHap9SA3MQWq/rDzTcpj95GukhT+WmakBXzY2/W/iVbaG3CYS78HgdDNCnklu2dLE
 kFU0QDG9SImIs7hlVZiJyUAgm7YUizziMveCoCVIzJ9O8cqrKgolPpoV6am7DfhU89XJ
 ltxCH8nvbIYs393MHpsDO6BhvtaKdvLKO1cCTYQMgnrpgZsHazgpH66LACi+70HhiJ6l
 AJYv+s/W3gch6gNZXXxxbLFCll+TfRRcrcTxa5xQeHRhtYaQSbszeLTX6zP5G5Jz7Jm/
 gUDVBMvSktGH2MZ2dnKv8dJAIQub63dYzfpzuua04+X6h9+JvUqOMVK/Ctt+DZXCV3Yi
 OCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BOrKdqp0xX849tkbGYoL5GifZ0fJWuSnmKvneHoBEPI=;
 b=LJiEG47/x5ZIpzwrYoNscTc/IpdiaD3MInHpsai2WflXgOQiEmZsA3jDmJ+jYUAdOA
 UA5/P9FDI6rTIqWapUabSQbTrzmsZbVN8yyiDe68lXE1BDLZtd5AURJWbsxVd7OM/pbl
 dopn+iNhBba9CfncX5g84f4fgsiBBm7LDQnC+jv+yworAATu5Flk8o1PH6Nb3yhtb7LQ
 y1Gxl1hLQGVweHO+tA4esYL+U0PzeYxK3CGzKWXV5MmbykhbtrxqlDA5Z1UEm85vSHEb
 dfjyck5Pz0Oq2BAf2YWnXGz5YAW6zgjsoZyM4FwBN6/B3gRwLAeFLvyG+GSXDUL0f4YX
 TFdg==
X-Gm-Message-State: ANhLgQ1WdhJZwxqBDyoJMdMsHywJ4pwQS+iqK64gzsZBVYLamlX1Zfvx
 43NJKzJHfHXmKfXzDdhFIjg=
X-Google-Smtp-Source: ADFU+vuWMe8I2528Uyu2tKaIGPqCCGIWF6uu2OphKJd6rnCU8MYCRJ3bIyFwbbl07L6oMFBFxGQoig==
X-Received: by 2002:a19:7d04:: with SMTP id y4mr9463704lfc.111.1584130682588; 
 Fri, 13 Mar 2020 13:18:02 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 v10sm30774074lfb.61.2020.03.13.13.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 13:18:01 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/3] drm/atmel-hlcdc: Use drm_encoder_init()
Date: Fri, 13 Mar 2020 21:17:44 +0100
Message-Id: <20200313201744.19773-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313201744.19773-1-sam@ravnborg.org>
References: <20200313201744.19773-1-sam@ravnborg.org>
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Jose Roberto de Souza <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Emil Velikov <emil.velikov@collabora.com>, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-renesas-soc@vger.kernel.org
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

atmel-hlcdc has no need to extend the functionality of the
encoder, so use drm_encoder_init().

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index a845d587c315..96e0d85748d2 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -22,10 +22,6 @@ struct atmel_hlcdc_rgb_output {
 	int bus_fmt;
 };
 
-static const struct drm_encoder_funcs atmel_hlcdc_panel_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static struct atmel_hlcdc_rgb_output *
 atmel_hlcdc_encoder_to_rgb_output(struct drm_encoder *encoder)
 {
@@ -98,9 +94,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 		return -EINVAL;
 	}
 
-	ret = drm_encoder_init_funcs(dev, &output->encoder,
-				     &atmel_hlcdc_panel_encoder_funcs,
-				     DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_encoder_init(dev, &output->encoder, DRM_MODE_ENCODER_NONE);
 	if (ret)
 		return ret;
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
