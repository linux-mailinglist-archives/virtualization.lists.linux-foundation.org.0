Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7111736851
	for <lists.virtualization@lfdr.de>; Thu,  6 Jun 2019 01:45:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5A119B8F;
	Wed,  5 Jun 2019 23:44:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 40593C91
	for <virtualization@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 23:44:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EB95419B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 23:44:34 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c85so296601pfc.1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 05 Jun 2019 16:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O/rnPOIToTFx5TLEufnCNbUgXKKUEmLsHgR6/mZpdjU=;
	b=MHtX30vwaCImP+Gi+3ZHA5YFvCgatPC5P2V/vbOYhAkd3uKWFpSwfQdIMqKJ1UN9mn
	ubpHA9QgM0UPJc143fTWqiXbi4prMSZRarIR96MLM1tgPc563MWE5mRtsemIxnOR/+2i
	tvCWi/hmoOEQ3lAIw8K9OJ6Tm6wuPY1LbOh44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O/rnPOIToTFx5TLEufnCNbUgXKKUEmLsHgR6/mZpdjU=;
	b=C8pDGg79OEGP0Tj8nx31D3Gg4tyuVVXEsPcINmlUB6OGP4QxL0zbEY7LSACv+JHcAM
	jSM8t6eiOp/YfLHnWQVPB5QC8610tejvyWhzuL6vCUCUT0KHC0foVGp836ctjZ6yo4x1
	bHQp5j/1i2wTcHcqtIOGhtVdlGF0zu+TOFnA+BP0UMa+7Cvfjf9UNgJLMhoKFH1xAZqc
	x85TrqLCN7w+yG85tXc3CK4nL0zhXkyQyL8aP7rWzMejm3JGtdD7bKkVqLg1S+VGDKmx
	BZoXuoMHVP89wfmMczOdSE+rUu8Ene0py+8AvQZGWuewRSZLMLBj28/QHQMHDF+wYRyf
	MZFw==
X-Gm-Message-State: APjAAAU4hFtREDN9F8DYCM8fPw/qSYzob5Plx83h6a3Wdcd7G39spMnS
	Ql/6AUH9SzGKihGHNYmrvV2Aew==
X-Google-Smtp-Source: APXvYqx3zG9rCLgbcYNCrxQmCKphQkBdlVy6ZRX+tG+qVBLLyEt6Kt8hYiRlUljA7AErFG1Rw0gooQ==
X-Received: by 2002:aa7:824b:: with SMTP id e11mr48252024pfn.33.1559778274578; 
	Wed, 05 Jun 2019 16:44:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id n13sm73547pff.59.2019.06.05.16.44.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 16:44:33 -0700 (PDT)
From: davidriley@chromium.org
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH 4/4] drm/virtio: Add memory barriers for capset cache.
Date: Wed,  5 Jun 2019 16:44:23 -0700
Message-Id: <20190605234423.11348-4-davidriley@chromium.org>
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

After data is copied to the cache entry, atomic_set is used indicate
that the data is the entry is valid without appropriate memory barriers.
Similarly the read side was missing the same memory barries.

Signed-off-by: David Riley <davidriley@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 88c1ed57a3c5..502f5f7c2298 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -542,6 +542,9 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	if (!ret)
 		return -EBUSY;
 
+	/* is_valid check must proceed before copy of the cache entry. */
+	virt_rmb();
+
 	ptr = cache_ent->caps_cache;
 
 	if (copy_to_user((void __user *)(unsigned long)args->addr, ptr, size))
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index dd5ead2541c2..b974eba4fe7d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -583,6 +583,8 @@ static void virtio_gpu_cmd_capset_cb(struct virtio_gpu_device *vgdev,
 		    cache_ent->id == le32_to_cpu(cmd->capset_id)) {
 			memcpy(cache_ent->caps_cache, resp->capset_data,
 			       cache_ent->size);
+			/* Copy must occur before is_valid is signalled. */
+			virt_wmb();
 			atomic_set(&cache_ent->is_valid, 1);
 			break;
 		}
-- 
2.22.0.rc1.311.g5d7573a151-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
