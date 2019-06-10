Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E783BE3A
	for <lists.virtualization@lfdr.de>; Mon, 10 Jun 2019 23:18:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 37FEBE70;
	Mon, 10 Jun 2019 21:18:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 134ECE61
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 21:18:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BBAF76D6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 21:18:20 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id a186so6007437pfa.5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 14:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vsVuZqN3BZSGA+LoVgx6ta+tF2PXiYDgRAf6MbHU3GI=;
	b=iOFhp97OR2XlAA4aQQYWlKmqqKyQE7mzMS+NyecweCZB2em2RWpyOF7yGs/OR4EsPo
	HLRUd7mFxlWl/mhy46zcVHdx1fam2I7BLziF07sxeXDAmX7xJ84JATe1nfiqQpAWfxSH
	aTL2zNkINzYLA9wyQl5EnKhO2k505n8llkvpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vsVuZqN3BZSGA+LoVgx6ta+tF2PXiYDgRAf6MbHU3GI=;
	b=GLki6+ME2iOoTZLr6pdukJdmBx6a4plR/NiSVGapKe2X1L8beHe5dWY5ocF5lb9aKC
	O9LZGdZeNCK4dirSiewr2lIRotxJXre7AJoMEP1OMyg0ZjHykDKIt2XT2Rm9EUv5ivw/
	67rxjLvzUmGQG99L2hyzu3BogaYsfmAJrhgE+Phjjl6O7VDZsNcVXwqagm4giB9W7LuD
	e4Au8P5CmmURMU+3nGs9ecBVtU5en5jczarJ0q5r2MqV6gx6eyTEoOIZ788BiOehJilF
	/FV9kfsa5Yz0uiNJPGGZR2L4HUn1kmUMF15hjNDfF+WHxmGugMmhpaxhyVt9QFH3KuQP
	4hsA==
X-Gm-Message-State: APjAAAVBsgM/BgwcZ3O3d8Ftt7q8Ou0tnsInrF3b2SU9iAC4fHVKfYXW
	Bvv8yEMUj4pzMXtMqin/hbxm4g==
X-Google-Smtp-Source: APXvYqyAAVeRLFb2ZVyVA/0TT4TC0xtqnzO+EKpJMFECU/BWdHQEiQ+mA4zE+9LfkIxP0C4B1c4e9Q==
X-Received: by 2002:aa7:8188:: with SMTP id g8mr26139750pfi.221.1560201500417; 
	Mon, 10 Jun 2019 14:18:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id
	z15sm10573320pge.40.2019.06.10.14.18.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jun 2019 14:18:19 -0700 (PDT)
From: davidriley@chromium.org
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v2 1/4] drm/virtio: Ensure cached capset entries are valid
	before copying.
Date: Mon, 10 Jun 2019 14:18:07 -0700
Message-Id: <20190610211810.253227-2-davidriley@chromium.org>
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
2.22.0.rc2.383.gf4fbbf30c2-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
