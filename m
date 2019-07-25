Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B75A74B6E
	for <lists.virtualization@lfdr.de>; Thu, 25 Jul 2019 12:21:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AC7BFE95;
	Thu, 25 Jul 2019 10:21:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8D077DCA
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 10:21:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4BA958D2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 10:21:37 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y8so23248962plr.12
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 03:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JpFXTqBiiF/d0FWq+ji6QHY6zUynDSMtWm/er7s/Jh0=;
	b=kji/UF2eV8qHYMdbqskMt6Ux4Dd8KtsNq7korGFByiRLA//9JNBlfJnLK3kLPqni24
	LZlQcEqlULQCkSFaswVc4umI+nHSlLgVEcuANIcOLfDEL/syjIcQ/48J4Cc+UoCXEQdJ
	x8HPK7REeezOh69mIMxMAnlD/IRMr3WI/r/A0facrnc1RXNNFa6Yd/ZkNnP6WXB8+nC/
	Pslct7+Sv3kxiQBp1niRy1cJ38JMklfghh6U1RtUCYe5QexyeepJ2TCzm9lwrC7Ejv3k
	OpmTrsVFBcg1GpFxhgS2KyUgSsvTwzaGERRHQhafwNdEPm4Jgc/Yysi5PnnQnrj5/UK4
	j51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JpFXTqBiiF/d0FWq+ji6QHY6zUynDSMtWm/er7s/Jh0=;
	b=N4bSq75/vvIz8KbVbjxBxSQylDoKgQEIw+IrMUZjGTAnZQh4d13JguSv8OTxnzwTpI
	bjLHAFBNwdMfXdRaml7wXUMmqMrWkajtSKXW3X3TqDYMz+kdRmF84f3zscePafAZWy62
	Gn/p0wVSZcxWLB9B3o8FVcQKqREj9Lodb4PMBqyGOcoKkjESjQwVom6VY89RlEgdPLIO
	mfm/rulr2BQVSDIg7q+97tfu4UrVQ1NtEgVUHLzhdqy1kaCHfxn7O4IBjLA5+3x7L5CA
	vfs+Omiq0ydedW6wbPJUWT7uc6F5XrzCovat4F/+Eys2IY0CdWzy1tKBxzJI7z8CiRO+
	F0qw==
X-Gm-Message-State: APjAAAWPdR1aFf7p70GiHIRZqvoj6V2CU4X5xwMgiZIjNYAfNzy4UjGA
	x646QsuTfBGfeeFydUx6IiU=
X-Google-Smtp-Source: APXvYqzh1lqPLfRIcHRSuzwanRKOlrhGFebC2GTMee0mYsp8VZxX5o3zpNO6UUAl4caXFvOkglFXdg==
X-Received: by 2002:a17:902:7c96:: with SMTP id
	y22mr92009461pll.39.1564050097023; 
	Thu, 25 Jul 2019 03:21:37 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
	by smtp.gmail.com with ESMTPSA id
	p27sm74548188pfq.136.2019.07.25.03.21.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jul 2019 03:21:36 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: airlied@redhat.com, kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu: drm: qxl: Fix possible null-pointer dereferences in
	qxl_crtc_atomic_flush()
Date: Thu, 25 Jul 2019 18:21:27 +0800
Message-Id: <20190725102127.16086-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

In qxl_crtc_atomic_flush(), there is an if statement on line 376 to
check whether crtc->state is NULL:
    if (crtc->state && crtc->state->event)

When crtc->state is NULL and qxl_crtc_update_monitors_config() is call, 
qxl_crtc_update_monitors_config() uses crtc->state on line 326:
    if (crtc->state->active)
and on line 358:
    DRM_DEBUG_KMS(..., crtc->state->active, ...);

Thus, possible null-pointer dereferences may occur.

To fix these bugs, crtc->state is checked before calling
qxl_crtc_update_monitors_config().

These bugs are found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 8b319ebbb0fb..fae18ef1ba59 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -382,7 +382,8 @@ static void qxl_crtc_atomic_flush(struct drm_crtc *crtc,
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-	qxl_crtc_update_monitors_config(crtc, "flush");
+	if (crtc->state)
+		qxl_crtc_update_monitors_config(crtc, "flush");
 }
 
 static void qxl_crtc_destroy(struct drm_crtc *crtc)
-- 
2.17.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
