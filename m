Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E1D3BE3C
	for <lists.virtualization@lfdr.de>; Mon, 10 Jun 2019 23:19:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CD1C3E7E;
	Mon, 10 Jun 2019 21:18:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 602BCE78
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 21:18:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0A7F0174
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 21:18:25 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 83so5676368pgg.8
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 14:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NP01C7FGf5lxdvTmoSCPFBCPy5Bu0zVjIzvG3I+uzsk=;
	b=he+m3/R6d4WOz248hKEgrFo7XRgWBhY10YKEcExRTGj4loUd1d2D8qSf/4aeg5scMY
	AyAJux2zPZ583C6cHkDjwiDONDughIB3f4nxO2RH6Pjjv9X6OcnkjLb5/yCxTDwDns1v
	eH6ZyRxvCZ5YyXcJrIgIgdUBsJmOzPBY32ZzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NP01C7FGf5lxdvTmoSCPFBCPy5Bu0zVjIzvG3I+uzsk=;
	b=BJIl7acIQU0usBqti8iXwS9rkDO5wJ12o0Qhl+/MqmJX8QwtXNQVwLslzLV8rOlRZL
	GRNxBEcjwxBycQIUCd2bjemNgnYTxCHi0qODzEq3rMvQcW0U2OoaRPgCZgMtHMhzxo8+
	0FDf6APWW/NaDFIYn2sQl3B+J8cYPxgMNIhN2wT4S/VMPqheSYkiJGfXTBaVLaUdYJa6
	7rcegiI8+sq2jVSU+5T77Pcxp48ZjGRIoQ0v8wMLPX49ctOGOJTYRWWSgK9JGtNDoOX/
	2/kwNoFj37nRsHEfN7mQTyJXNY/sCL5pWV0Hh+8vJLndWocOyrcaXUSfuTMr+hwG2G8i
	fN4w==
X-Gm-Message-State: APjAAAUTV3rRvGv8yhLGxVNfWZM4YPYBGmeWq86A4c6rHijX0TW6CKsX
	Kabl9crAwSIazDgsA6/rxKynSQ==
X-Google-Smtp-Source: APXvYqyWCx2wwO3RZDWC6w+KkvtMx9THHvgIOX7vkYR2WNfySgWalTTwUj9doH3hsQm+oago2gRGvg==
X-Received: by 2002:a17:90a:af8e:: with SMTP id
	w14mr23816885pjq.89.1560201505577; 
	Mon, 10 Jun 2019 14:18:25 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id
	a7sm10762032pgj.42.2019.06.10.14.18.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jun 2019 14:18:24 -0700 (PDT)
From: davidriley@chromium.org
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v2 3/4] drm/virtio: Fix cache entry creation race.
Date: Mon, 10 Jun 2019 14:18:09 -0700
Message-Id: <20190610211810.253227-4-davidriley@chromium.org>
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

virtio_gpu_cmd_get_capset would check for the existence of an entry
under lock.  If it was not found, it would unlock and call
virtio_gpu_cmd_get_capset to create a new entry.  The new entry would
be added it to the list without checking if it was added by another
task during the period where the lock was not held resulting in
duplicate entries.

Compounding this issue, virtio_gpu_cmd_capset_cb would stop iterating
after find the first matching entry.  Multiple callbacks would modify
the first entry, but any subsequent entries and their associated waiters
would eventually timeout since they don't become valid, also wasting
memory along the way.

Signed-off-by: David Riley <davidriley@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index da71568adb9a..dd5ead2541c2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -684,8 +684,11 @@ int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 	int max_size;
 	struct virtio_gpu_drv_cap_cache *cache_ent;
+	struct virtio_gpu_drv_cap_cache *search_ent;
 	void *resp_buf;
 
+	*cache_p = NULL;
+
 	if (idx >= vgdev->num_capsets)
 		return -EINVAL;
 
@@ -716,9 +719,26 @@ int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
 	atomic_set(&cache_ent->is_valid, 0);
 	cache_ent->size = max_size;
 	spin_lock(&vgdev->display_info_lock);
-	list_add_tail(&cache_ent->head, &vgdev->cap_cache);
+	/* Search while under lock in case it was added by another task. */
+	list_for_each_entry(search_ent, &vgdev->cap_cache, head) {
+		if (search_ent->id == vgdev->capsets[idx].id &&
+		    search_ent->version == version) {
+			*cache_p = search_ent;
+			break;
+		}
+	}
+	if (!*cache_p)
+		list_add_tail(&cache_ent->head, &vgdev->cap_cache);
 	spin_unlock(&vgdev->display_info_lock);
 
+	if (*cache_p) {
+		/* Entry was found, so free everything that was just created. */
+		kfree(resp_buf);
+		kfree(cache_ent->caps_cache);
+		kfree(cache_ent);
+		return 0;
+	}
+
 	cmd_p = virtio_gpu_alloc_cmd_resp
 		(vgdev, &virtio_gpu_cmd_capset_cb, &vbuf, sizeof(*cmd_p),
 		 sizeof(struct virtio_gpu_resp_capset) + max_size,
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
