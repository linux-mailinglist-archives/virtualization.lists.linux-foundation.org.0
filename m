Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8113024C0
	for <lists.virtualization@lfdr.de>; Mon, 25 Jan 2021 13:16:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C06A862C7;
	Mon, 25 Jan 2021 12:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YwQRUtNCkZWh; Mon, 25 Jan 2021 12:16:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 218AC86190;
	Mon, 25 Jan 2021 12:16:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05516C013A;
	Mon, 25 Jan 2021 12:16:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9A0AC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 12:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 73E07203D5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 12:16:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sy7Sjk4ccXrL
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 12:16:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id D9E21203CE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611576987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OcdVLRRdgBx5PAA8S6DFEnpuC3aQxaux8RhxdrxChZA=;
 b=BdlTb1gWtkcnhSx8sEHdaIxmiZdxocmXttemudesNICFite5DoRizjcy7z1EmUiLkOjdTA
 kI9XoMhShrpRJRKJL5UsJU0m/ClDD4am2i2BPSlfInbmACnkzL2ABoJHt0DT9opYV94Igv
 M9RPc/AxXwnWui4Ci4bb2lz7foLrTyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-8YSlVxJtP4G0aOtk8Y-r5w-1; Mon, 25 Jan 2021 07:16:23 -0500
X-MC-Unique: 8YSlVxJtP4G0aOtk8Y-r5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 263341934101;
 Mon, 25 Jan 2021 12:16:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D51210013BD;
 Mon, 25 Jan 2021 12:16:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 84FB31800393; Mon, 25 Jan 2021 13:16:19 +0100 (CET)
Date: Mon, 25 Jan 2021 13:16:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 2/4] drm/qxl: unpin release objects
Message-ID: <20210125121619.7w3flilhe5juiuyf@sirius.home.kraxel.org>
References: <20210120111240.2509679-1-kraxel@redhat.com>
 <20210120111240.2509679-3-kraxel@redhat.com>
 <a4187459-1dbd-e799-fba4-bf7021de831b@suse.de>
 <20210122133545.acloe4ytgp6r4iql@sirius.home.kraxel.org>
 <CAKMK7uHeQt6VPkm0ufuVVxdGQkmq3+1vrDERzZS54rtcVhJRAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHeQt6VPkm0ufuVVxdGQkmq3+1vrDERzZS54rtcVhJRAw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

> > Just calling ttm_bo_unpin() here makes lockdep unhappy.
> 
> How does that one splat? But yeah if that's a problem should be
> explained in the comment. I'd then also only do a pin_count--; to make
> sure you can still catch other pin leaks if you have them. Setting it
> to 0 kinda defeats the warning.

Figured the unpin is at the completely wrong place while trying to
reproduce the lockdep splat ...

take care,
  Gerd

From 43befab4a935114e8620af62781666fa81288255 Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 25 Jan 2021 13:10:50 +0100
Subject: [PATCH] drm/qxl: unpin release objects

Balances the qxl_create_bo(..., pinned=true, ...);
call in qxl_release_bo_alloc().

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index c52412724c26..28013fd1f8ea 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -347,6 +347,7 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 
 	mutex_lock(&qdev->release_mutex);
 	if (qdev->current_release_bo_offset[cur_idx] + 1 >= releases_per_bo[cur_idx]) {
+		qxl_bo_unpin(qdev->current_release_bo[cur_idx]);
 		qxl_bo_unref(&qdev->current_release_bo[cur_idx]);
 		qdev->current_release_bo_offset[cur_idx] = 0;
 		qdev->current_release_bo[cur_idx] = NULL;
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
