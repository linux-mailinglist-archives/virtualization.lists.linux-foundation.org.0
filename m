Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D165AEEF
	for <lists.virtualization@lfdr.de>; Sun, 30 Jun 2019 08:20:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B7086B8F;
	Sun, 30 Jun 2019 06:20:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 18E33B5F
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 06:20:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BEE2BA8
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 06:20:00 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id h10so9826376ljg.0
	for <virtualization@lists.linux-foundation.org>;
	Sat, 29 Jun 2019 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=df6TXdUtR3ipnR42vURYQLM0/q5zcegSVg+0dPj2rTk=;
	b=VxOqeheLipwOZcxiXmZbL22VoOiadV1YESISqo4ht0/sHTS6LF4Jcz0QJt8pFYnlIw
	cVPHFT8d/0gFFXze2mExDFWw5L1Pe/fic7FNbBpHtERORDR5jVB6svkBqv/9imXcRpTf
	VqOJZIRMPeuGFjhW/XF2nvFoEI6yjYn/5xPu9W8Qu9bPHkSafXUgADMja0mcN1RLBexU
	maQ0MQObNEoHB8eX0/5Ki009dpoBJTKNpB7hCswMzKACRD22k4fHNdO7u5g9zwln/eYc
	RnXYuKy6qiosAIywb/DzrTXhLok6X4Y9z/T5aUhI+nX8FmuPLNHCvrr5pCwBnbzZfsa4
	dgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=df6TXdUtR3ipnR42vURYQLM0/q5zcegSVg+0dPj2rTk=;
	b=jkl+OmLKuIq3wRuwT2Dcsk+1BYJVW8laTA1E+dDYFoCIwYiplnmU9UG51HrbAzTOPf
	LBlagZTqY6AuoZQMXx8i2gX3r6vNcOkLgsCeUTjCwPRKhZVDShpaet9cUx3nZz3spUJm
	5YwBWUuYZs0+gS6pDM05B24z+pyMpqFpNHJOTHqrJa5jTuZ5D6HpC5cg0c+sBqEIEBfX
	HN4mshyckBGRw/1+0Y7UWhZWiPZFE7Pn/ZzrDpJFGg/WeKC/p9pdfS4h3XxkrlxQplHV
	BRill1D+t49gJmdpvSYXiSScWqC6oJhH/gudRfMBQMzDfm0hHCmjDvlOqG0gw4kvm/oA
	48AQ==
X-Gm-Message-State: APjAAAVZhoEWhxVm61W9Eg//2RY9ptOCykOSiBu8aSwlXhxn0zl7Q0o1
	P0lIqRWBqp1gNApBmEKrkQ0=
X-Google-Smtp-Source: APXvYqz7BY5amROXb4IBpNCR74H17q+t2hi8wBITZpz4k0UCQc0JKbOZyW+qFL46FJmvs4ud2d4e3A==
X-Received: by 2002:a2e:5d46:: with SMTP id r67mr10150572ljb.187.1561875599222;
	Sat, 29 Jun 2019 23:19:59 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
	by smtp.gmail.com with ESMTPSA id
	o74sm1794024lff.46.2019.06.29.23.19.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 29 Jun 2019 23:19:58 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 31/33] drm/bochs: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:19:20 +0200
Message-Id: <20190630061922.7254-32-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
	Daniel Vetter <daniel@ffwll.ch>, virtualization@lists.linux-foundation.org
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

Drop use of the deprecated drmP.h header file.
Made bochs.h self-contained and then fixed
fallout in remaining files.
Several unused includes was dropped in the process.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: virtualization@lists.linux-foundation.org
---
The list of cc: was too large to add all recipients to the cover letter.
Please find cover letter here:
https://lists.freedesktop.org/archives/dri-devel/2019-June/thread.html
Search for "drm: drop use of drmp.h in drm-misc"

        Sam

 drivers/gpu/drm/bochs/bochs.h     | 6 ++----
 drivers/gpu/drm/bochs/bochs_drv.c | 7 +++----
 drivers/gpu/drm/bochs/bochs_hw.c  | 4 ++++
 drivers/gpu/drm/bochs/bochs_kms.c | 8 +++++---
 4 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
index cc35d492142c..498e96fb61b6 100644
--- a/drivers/gpu/drm/bochs/bochs.h
+++ b/drivers/gpu/drm/bochs/bochs.h
@@ -1,17 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
 #include <linux/io.h>
 #include <linux/console.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/drm_simple_kms_helper.h>
-
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
-
+#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vram_mm_helper.h>
 
 /* ---------------------------------------------------------------------- */
diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index 78ad6c98861d..5d0a0060c22b 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -2,11 +2,10 @@
 /*
  */
 
-#include <linux/mm.h>
 #include <linux/module.h>
-#include <linux/slab.h>
-#include <drm/drm_fb_helper.h>
-#include <drm/drm_probe_helper.h>
+#include <linux/pci.h>
+
+#include <drm/drm_drv.h>
 #include <drm/drm_atomic_helper.h>
 
 #include "bochs.h"
diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
index 791ab2f79947..29217e696549 100644
--- a/drivers/gpu/drm/bochs/bochs_hw.c
+++ b/drivers/gpu/drm/bochs/bochs_hw.c
@@ -2,6 +2,10 @@
 /*
  */
 
+#include <linux/pci.h>
+
+#include <drm/drm_fourcc.h>
+
 #include "bochs.h"
 
 /* ---------------------------------------------------------------------- */
diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 5904eddc83a5..f6ae34bb2209 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -2,12 +2,14 @@
 /*
  */
 
-#include "bochs.h"
+#include <linux/moduleparam.h>
+
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
-#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "bochs.h"
 
 static int defx = 1024;
 static int defy = 768;
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
