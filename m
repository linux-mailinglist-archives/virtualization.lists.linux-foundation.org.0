Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B33684E
	for <lists.virtualization@lfdr.de>; Thu,  6 Jun 2019 01:45:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9612F2C;
	Wed,  5 Jun 2019 23:44:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B3197B9E
	for <virtualization@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 23:44:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 673B54C3
	for <virtualization@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 23:44:30 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 196so216155pgc.6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 05 Jun 2019 16:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JGZHkET7ircbdI4+qsEOTZZ3N7wqYFaIsKw134Y8zSg=;
	b=D/budo1PK18/IqefI0C+NDDtMB6Kq021s90lMxfG8mkD3QwgRZ3SpWJjeoeyjcMAjq
	qj7bZAPDW4RBkBNoGzwBg/d+5lm1QxrxIQBdze1XX4ZXAiZUxfn1h2CyqZwPUeYH+nd8
	XXZeeT5ys/4udAedP7+XQAEsiArU4JVoXlzOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JGZHkET7ircbdI4+qsEOTZZ3N7wqYFaIsKw134Y8zSg=;
	b=MeJfpvLU0ErC83BgwJeap7Ltc8i4h4u/uzKPWKdV6Dz20dvLZVzbBAdrMv5Uzo80I/
	cQhYbhY+k2/GS+PbRnipYRuJC9iEhH2TJe2T2WU1EKuQvf5LSn3tDLU5jcxF9Af4RjT4
	r36hLaH0+HnKySADAjgTvVoblKY6kgk+qpun/Np5J8sMHR1xWIFj1XHVP5MMCXOw34bz
	pAnP4/p1Fh3zMGbksjlvpVyhHeiHfy404+LjgioEeqeKAB5XObC52q2e2ubIqvt0+khH
	BKvgA6k8lrCV4Y5ZoHb0xIyMpssen1b31yVSGZCn2WbUYb1KFRYs0eb00btcTfuk0+Qo
	11KQ==
X-Gm-Message-State: APjAAAXidvjM9HWihlph0FNSPe53E9nY+5uPiPwoOOSfz5+26UYyagb3
	HALT3qgNuPtyQZ3fpb7m4wvAwg==
X-Google-Smtp-Source: APXvYqxFOCt0W56XzBova1UQmMRH+3FDeIu1QrMrvbTscJCf2fyKPmERQgzHuiUrdAh9B1tYQgUDGQ==
X-Received: by 2002:a63:5443:: with SMTP id e3mr408680pgm.265.1559778270052;
	Wed, 05 Jun 2019 16:44:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id ce3sm104736pjb.11.2019.06.05.16.44.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 16:44:29 -0700 (PDT)
From: davidriley@chromium.org
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH 2/4] drm/virtio: Wake up all waiters when capset response
	comes in.
Date: Wed,  5 Jun 2019 16:44:21 -0700
Message-Id: <20190605234423.11348-2-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190605234423.11348-1-davidriley@chromium.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org
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

From: David Riley <davidriley@chromium.org>

If multiple callers occur simultaneously, wake them all up.

Signed-off-by: David Riley <davidriley@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index e62fe24b1a2e..da71568adb9a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -588,7 +588,7 @@ static void virtio_gpu_cmd_capset_cb(struct virtio_gpu_device *vgdev,
 		}
 	}
 	spin_unlock(&vgdev->display_info_lock);
-	wake_up(&vgdev->resp_wq);
+	wake_up_all(&vgdev->resp_wq);
 }
 
 static int virtio_get_edid_block(void *data, u8 *buf,
-- 
2.22.0.rc1.311.g5d7573a151-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
