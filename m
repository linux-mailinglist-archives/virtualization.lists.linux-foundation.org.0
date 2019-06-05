Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3959C36846
	for <lists.virtualization@lfdr.de>; Thu,  6 Jun 2019 01:44:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BED12C2C;
	Wed,  5 Jun 2019 23:44:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7A5B12C
	for <virtualization@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 23:44:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2665819B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 23:44:27 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id v9so196539pgr.13
	for <virtualization@lists.linux-foundation.org>;
	Wed, 05 Jun 2019 16:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vyHkbOEMkgWVI1yREjgkQjgyvZb+xK4A4sfaT0UjXqc=;
	b=MRxSI6zkTMXESmwtjNnyGJHwIuyYXxr3GsKIJLzp62KNe+JF4RahnVj735T5TQpjTJ
	1DmcVhwU5wSDdCbOUqKVzxah/TfKcYHnfXJmIwd7rFo3xD1LU0upA51lJQo8prBDT1uc
	7d7/Hz8UYsm1aD8AnuYU3GESzf2NT38q94dOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vyHkbOEMkgWVI1yREjgkQjgyvZb+xK4A4sfaT0UjXqc=;
	b=JjhXYBQixCevrqfQvBdT7k3Kamul28lSp+oH2K+ZcZCsn3O53y7kVLUVc9lz/grYC8
	9niIHTfvKEClbgwHAKTOSAMlVHaS9+RtZtrVB8bY6EoQaZ4cFsSNBBt2EkQaKpxth2Rh
	0osqPoPEgghPCILMIL791xCD5wbuoaifXcHE5GJcGgiEX8X/Gu9bPiVVbEw8MWfomIjx
	xcD1+3mM8fyOnQYnMoOri52RTyRY8T5j2yK2s4R8SM1RRFT/tdtMWtsEWqALpazvWJ8b
	oqVhN46i/esK3YtotUVdqI7+viXCBQTtDjwPz3dCPkzVZ6i0jQYMkVgBTcRgM1Aznfxv
	2G3A==
X-Gm-Message-State: APjAAAVG8/wCOHXenw9+yPJWnj6ELXKxqTopmZPjtaVypImlXX7YkYDW
	zsrfc/oyhO0gA1+vFI/jcO3mXQ==
X-Google-Smtp-Source: APXvYqxR2BZjwTQAkG75ysAdGk8mlHNMgXAGJfJSmgUvu6H+vcz7IhZJ5J9HpwEQabmlAAHkJhMbVg==
X-Received: by 2002:a63:5ca:: with SMTP id 193mr446060pgf.232.1559778266823;
	Wed, 05 Jun 2019 16:44:26 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id
	y185sm68596pfy.110.2019.06.05.16.44.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 16:44:26 -0700 (PDT)
From: davidriley@chromium.org
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH 1/4] drm/virtio: Ensure cached capset entries are valid before
	copying.
Date: Wed,  5 Jun 2019 16:44:20 -0700
Message-Id: <20190605234423.11348-1-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
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

virtio_gpu_get_caps_ioctl could return success with invalid data if a
second caller to the function occurred after the entry was created in
virtio_gpu_cmd_get_capset but prior to the virtio_gpu_cmd_capset_cb
callback being called.  This could leak contents of memory as well
since the caps_cache allocation is done without zeroing.

Signed-off-by: David Riley <davidriley@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 949a264985fc..88c1ed57a3c5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -526,7 +526,6 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	list_for_each_entry(cache_ent, &vgdev->cap_cache, head) {
 		if (cache_ent->id == args->cap_set_id &&
 		    cache_ent->version == args->cap_set_ver) {
-			ptr = cache_ent->caps_cache;
 			spin_unlock(&vgdev->display_info_lock);
 			goto copy_exit;
 		}
@@ -537,6 +536,7 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
 				  &cache_ent);
 
+copy_exit:
 	ret = wait_event_timeout(vgdev->resp_wq,
 				 atomic_read(&cache_ent->is_valid), 5 * HZ);
 	if (!ret)
@@ -544,7 +544,6 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 
 	ptr = cache_ent->caps_cache;
 
-copy_exit:
 	if (copy_to_user((void __user *)(unsigned long)args->addr, ptr, size))
 		return -EFAULT;
 
-- 
2.22.0.rc1.311.g5d7573a151-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
