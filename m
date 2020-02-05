Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CC7152678
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 07:53:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 838D881428;
	Wed,  5 Feb 2020 06:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ZgM1U7ZtPjm; Wed,  5 Feb 2020 06:53:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E00A784EA0;
	Wed,  5 Feb 2020 06:53:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D30FBC0174;
	Wed,  5 Feb 2020 06:53:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F2A1C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 184AF84EA0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:53:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWyXeMd0Q+H3
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:53:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 54D3981428
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580885602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=d/H8Uw2fGE2aBzDIfMTx++ovLGWmzUssb90jy8x2c6E=;
 b=PucvsHxdRgeHf1zvoUePt+k+C4jaMQ/M8VoSkRzYE36et9C9RyNRDYlWJyuXv43LlrpsDb
 Gg36uYaSY2l2Mnd/fC4ODKtx7wKwD4cbAurZrR2PpCyjnAFmpKglBo/xVvpNH/ZW8t1Ovn
 U9eZ3b8gSp4spo5ZyHacq3yxc71w+vk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-Rxn7RGLHPnCfgZTy0C8iXw-1; Wed, 05 Feb 2020 01:53:17 -0500
X-MC-Unique: Rxn7RGLHPnCfgZTy0C8iXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B93CD8010FE;
 Wed,  5 Feb 2020 06:53:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD4C460BF7;
 Wed,  5 Feb 2020 06:53:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 105AD9D1E; Wed,  5 Feb 2020 07:53:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: fix vblank handling
Date: Wed,  5 Feb 2020 07:53:11 +0100
Message-Id: <20200205065312.15790-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, gurchetansingh@chromium.org,
 tzimmermann@suse.de,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 olvaffe@gmail.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

virtio has its own commit fail function.  Add the
drm_atomic_helper_fake_vblank() call there.

Fixes: 2a735ad3d211 ("drm/virtio: Remove sending of vblank event")
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index ecf4ba7cc32b..7b0f0643bb2d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -324,6 +324,7 @@ static void vgdev_atomic_commit_tail(struct drm_atomic_state *state)
 	drm_atomic_helper_commit_modeset_enables(dev, state);
 	drm_atomic_helper_commit_planes(dev, state, 0);
 
+	drm_atomic_helper_fake_vblank(state);
 	drm_atomic_helper_commit_hw_done(state);
 
 	drm_atomic_helper_wait_for_vblanks(dev, state);
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
