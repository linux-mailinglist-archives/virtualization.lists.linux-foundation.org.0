Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4406DC2B
	for <lists.virtualization@lfdr.de>; Fri, 19 Jul 2019 06:15:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 09AAD21A2;
	Fri, 19 Jul 2019 04:14:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 048471133
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 04:14:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AFBED71C
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 04:14:40 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BFC6E2189E;
	Fri, 19 Jul 2019 04:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563509680;
	bh=5Nril+9LsbgUoVrHLsCvF9VUvW6BFiF0+UitNynqDi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DD9BJC9ZV/vNa+j0ww+cdUvh0ZbAE5RpKnjQ3gECJyG5T2EqPr4lndgZ3ODM60nZy
	QTqGeKCUuQGfgSTBryuraT/iyUI4DD+KXuHzPw3Y2d4yZ1iUkdFgREUKt6Q21SzmHu
	iH+f98LMAXfwAQNVTQ6zScw+SKhvtMhcnX8dl2TY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 10/35] drm/virtio: Add memory barriers for capset
	cache.
Date: Fri, 19 Jul 2019 00:13:58 -0400
Message-Id: <20190719041423.19322-10-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719041423.19322-1-sashal@kernel.org>
References: <20190719041423.19322-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

From: David Riley <davidriley@chromium.org>

[ Upstream commit 9ff3a5c88e1f1ab17a31402b96d45abe14aab9d7 ]

After data is copied to the cache entry, atomic_set is used indicate
that the data is the entry is valid without appropriate memory barriers.
Similarly the read side was missing the corresponding memory barriers.

Signed-off-by: David Riley <davidriley@chromium.org>
Link: http://patchwork.freedesktop.org/patch/msgid/20190610211810.253227-5-davidriley@chromium.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 6296e9f270ca..0b8f8c10f2ed 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -535,6 +535,9 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	ret = wait_event_timeout(vgdev->resp_wq,
 				 atomic_read(&cache_ent->is_valid), 5 * HZ);
 
+	/* is_valid check must proceed before copy of the cache entry. */
+	smp_rmb();
+
 	ptr = cache_ent->caps_cache;
 
 copy_exit:
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 52436b3c01bb..a1b3ea1ccb65 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -618,6 +618,8 @@ static void virtio_gpu_cmd_capset_cb(struct virtio_gpu_device *vgdev,
 		    cache_ent->id == le32_to_cpu(cmd->capset_id)) {
 			memcpy(cache_ent->caps_cache, resp->capset_data,
 			       cache_ent->size);
+			/* Copy must occur before is_valid is signalled. */
+			smp_wmb();
 			atomic_set(&cache_ent->is_valid, 1);
 			break;
 		}
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
