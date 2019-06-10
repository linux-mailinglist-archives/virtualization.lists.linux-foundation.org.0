Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B83C3BE3D
	for <lists.virtualization@lfdr.de>; Mon, 10 Jun 2019 23:19:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1F101E82;
	Mon, 10 Jun 2019 21:18:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2377BE7A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 21:18:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C9109174
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 21:18:28 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g21so4160119plq.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 14:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8nq9Im362lbv4azULZvOC9Ag2G2ZekGR7CCYDprgGF8=;
	b=FCNlBwOefmxV9kPIPrpaBd9HyXv2yEenUtOaw++Q3b8DYUHSXihBeppW/SIaMfVj5X
	jP4AxfQTg5gmZCoy5a/s/T7DlqJANXVakIx9E4W7j2FILbiSvu0yUKGMDBpgoqSfIRkG
	8f4i+L37sKl82vKcRN0id86xV7zHPQ7j7xd8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8nq9Im362lbv4azULZvOC9Ag2G2ZekGR7CCYDprgGF8=;
	b=BZe4ZJYmY2WGMVHsKgLLAMwogK7zyPhiIVyhZR+elF1V7GgSpgKosaaRpdeeAjlZsO
	kIOHzgDGJaCi4Am8j+EzBv4WCxKZFUsdQiozms5su7W2DSMtd5KHZiltAjX688mTNQ/m
	QfN7Gcf//MyswPb2FQWS7ABCteokFr2KKV/k0DE/7RJgX68KsrdP+LFebTtH4PyeCDKS
	v/X8TeNnIlc9vWR0kEMvxpN/ziYLAlzWv7VYZoEYa9mmO1k2uBvPyWaQOjUlGAgiaCss
	WIw848c6Vvuj/LsPmfh1/EJjRWXO2FurMmCBjQyebY2hDHQJ+vVf6GTZ2tmMZyAn2M43
	6/og==
X-Gm-Message-State: APjAAAXxyVR7hxVAxFavUDAdeCNU9J4gqK8MzexAgFxNCeO64QfRpLEr
	f5uF/XFtOkPuszoNJUueZ5onkw==
X-Google-Smtp-Source: APXvYqyMASM4YCvHQ5Ip2z9vUnGHsH6b1vlzz/iXUjTKHtkcitMyf7/FMV1pmortsoFPZ6YfD+n6Cw==
X-Received: by 2002:a17:902:5c5:: with SMTP id
	f63mr72275000plf.176.1560201508490; 
	Mon, 10 Jun 2019 14:18:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id
	q20sm16377982pgq.66.2019.06.10.14.18.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jun 2019 14:18:27 -0700 (PDT)
From: davidriley@chromium.org
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v2 4/4] drm/virtio: Add memory barriers for capset cache.
Date: Mon, 10 Jun 2019 14:18:10 -0700
Message-Id: <20190610211810.253227-5-davidriley@chromium.org>
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

After data is copied to the cache entry, atomic_set is used indicate
that the data is the entry is valid without appropriate memory barriers.
Similarly the read side was missing the corresponding memory barriers.

Signed-off-by: David Riley <davidriley@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 88c1ed57a3c5..a50495083d6f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -542,6 +542,9 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	if (!ret)
 		return -EBUSY;
 
+	/* is_valid check must proceed before copy of the cache entry. */
+	smp_rmb();
+
 	ptr = cache_ent->caps_cache;
 
 	if (copy_to_user((void __user *)(unsigned long)args->addr, ptr, size))
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index dd5ead2541c2..c7a5ca027245 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -583,6 +583,8 @@ static void virtio_gpu_cmd_capset_cb(struct virtio_gpu_device *vgdev,
 		    cache_ent->id == le32_to_cpu(cmd->capset_id)) {
 			memcpy(cache_ent->caps_cache, resp->capset_data,
 			       cache_ent->size);
+			/* Copy must occur before is_valid is signalled. */
+			smp_wmb();
 			atomic_set(&cache_ent->is_valid, 1);
 			break;
 		}
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
