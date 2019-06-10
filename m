Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5325B3BE3B
	for <lists.virtualization@lfdr.de>; Mon, 10 Jun 2019 23:18:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 77445E77;
	Mon, 10 Jun 2019 21:18:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 874C7E63
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 21:18:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 41A65174
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 21:18:23 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id e5so4129472pls.13
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 14:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bWLAT9NRUlrvBrwvfr/QvssLLaOWbMrJHilGpaJk6Vg=;
	b=BTzCAwo8NHk+PHsfqTl2EKRbG/LlCt1ISxn+UsNbzk38J68Eg/Mk2VTGW55dB5oXjA
	XIhFJ4r7p/+0R5+GQoR+EfDPsQMC6lPpPTAx6o0dks7q+pOjNdAs5/Izn17m7TOcluBx
	hsV9CQJVZjpaUFYHgo07Z55lsL5rHeKj9BY5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bWLAT9NRUlrvBrwvfr/QvssLLaOWbMrJHilGpaJk6Vg=;
	b=XA0ih22rxm2gxkhqnwjnKvYInolQzFS3u2YEUWii0X79redQkw0hURKeGbaznxWjBn
	r/QdTsB2KWb3i9np70/H4Qj3DkBRIvUwevShy8yZORTYMrBjiFWKvx1HFduKimz0873L
	kAJ5hzokRehV7nHEIejV0Fy7gK0S7fL6MrJcAa/4u7xjByR8UPkXk3YgVCvQ/p/74doT
	PfH9fhjVDAdOpPbI6XKHuC80vAVrqu1WMKgA95erVz1maxBdN359zip79NxV1O8L1IrO
	YIr5H9LDIcl26W3z9/XI0hDkPXbaxnTn39Jz0LW0sYR9u4l/uFmhSK9HmWF0VQ9AELu+
	/nLQ==
X-Gm-Message-State: APjAAAV+6BCehXl9jDKF+MJvVgtsMckCtbmKNEPr6G1B2hrYqlskI6Oz
	/xbiR4ccYAMLVWVS6PmmY/un1A==
X-Google-Smtp-Source: APXvYqwfPRIJrAHffgJVE/PjgxqqcuAjPPWZKIHoej5vh8l1LwNLGrzjub7p09dUcEeYhj9/su30qw==
X-Received: by 2002:a17:902:a716:: with SMTP id
	w22mr72043801plq.270.1560201502923; 
	Mon, 10 Jun 2019 14:18:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id
	y13sm14241062pfb.143.2019.06.10.14.18.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jun 2019 14:18:22 -0700 (PDT)
From: davidriley@chromium.org
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v2 2/4] drm/virtio: Wake up all waiters when capset response
	comes in.
Date: Mon, 10 Jun 2019 14:18:08 -0700
Message-Id: <20190610211810.253227-3-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190605234423.11348-1-davidriley@chromium.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>
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
2.22.0.rc2.383.gf4fbbf30c2-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
