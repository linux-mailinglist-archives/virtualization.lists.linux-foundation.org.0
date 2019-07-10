Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F3564963
	for <lists.virtualization@lfdr.de>; Wed, 10 Jul 2019 17:12:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5B2AE4597;
	Wed, 10 Jul 2019 15:12:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 61D15458B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 15:02:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1ABAB886
	for <virtualization@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 15:02:47 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 039F42064B;
	Wed, 10 Jul 2019 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562770966;
	bh=iDWaGuCyFWXcNVHxVD68Z0CNqAgj+ipuFl5jzHmj4kA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ry5jxnTIsLHN8kFUiyUPGvn8wgjYz4kNq7bT2vJRzmzCiK2OFkeI0K/AjwYhujbGu
	pjl6z+HpwjjSZN+V9BONgpuiUyWoNrb7Jicd5EhYIf/8Xy9CsKrWF87Wp7qUyixY15
	D9b2Q6KRH5JPdt9aY/t1XSLhkQRBS9Up+PwCHA1E=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 03/11] drm/virtio: move
	drm_connector_update_edid_property() call
Date: Wed, 10 Jul 2019 11:02:30 -0400
Message-Id: <20190710150240.6984-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710150240.6984-1-sashal@kernel.org>
References: <20190710150240.6984-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	Max Filippov <jcmvbkbc@gmail.com>
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

From: Gerd Hoffmann <kraxel@redhat.com>

[ Upstream commit 41de4be6f6efa4132b29af51158cd672d93f2543 ]

drm_connector_update_edid_property can sleep, we must not
call it while holding a spinlock.  Move the callsite.

Fixes: b4b01b4995fb ("drm/virtio: add edid support")
Reported-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Max Filippov <jcmvbkbc@gmail.com>
Tested-by: Cornelia Huck <cohuck@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20190405044602.2334-1-kraxel@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 6bc2008b0d0d..3ef24f89ef93 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -620,11 +620,11 @@ static void virtio_gpu_cmd_get_edid_cb(struct virtio_gpu_device *vgdev,
 	output = vgdev->outputs + scanout;
 
 	new_edid = drm_do_get_edid(&output->conn, virtio_get_edid_block, resp);
+	drm_connector_update_edid_property(&output->conn, new_edid);
 
 	spin_lock(&vgdev->display_info_lock);
 	old_edid = output->edid;
 	output->edid = new_edid;
-	drm_connector_update_edid_property(&output->conn, output->edid);
 	spin_unlock(&vgdev->display_info_lock);
 
 	kfree(old_edid);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
