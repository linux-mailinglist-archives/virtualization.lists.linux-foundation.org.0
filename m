Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C257B31D968
	for <lists.virtualization@lfdr.de>; Wed, 17 Feb 2021 13:32:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 487C98664E;
	Wed, 17 Feb 2021 12:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oYuWCPqkBDCc; Wed, 17 Feb 2021 12:32:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C7F1F87255;
	Wed, 17 Feb 2021 12:32:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EF9BC013A;
	Wed, 17 Feb 2021 12:32:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B148C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 20BB585FC9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yb0guJrAHric
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:32:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6680485FB9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613565142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kq5DugD1inTY+nk/xI8ba0kERqE5bPFWx/0JoZ2/L1c=;
 b=Xz4xeu8Esszy0Pa4CvQRrSNOrWyqVh3ww/sNKercFPUc7uNydXzCl0y6OtNELJonD+fvVi
 meVdKkRNFWn7VIhQH80/5pLF4sa0Mu3bVmH+iblpMnJkgbnrnIIMJuyUcvGtgebqoTKkQN
 7mmv9w4xW3i07xM6vvj40n2PSwReDGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-cWWPjsRnOuCH3UgO48axpQ-1; Wed, 17 Feb 2021 07:32:20 -0500
X-MC-Unique: cWWPjsRnOuCH3UgO48axpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13EE380196C;
 Wed, 17 Feb 2021 12:32:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DB195D9C2;
 Wed, 17 Feb 2021 12:32:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1E22918003B5; Wed, 17 Feb 2021 13:32:14 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/11] drm/qxl: fix lockdep issue in
 qxl_alloc_release_reserved
Date: Wed, 17 Feb 2021 13:32:06 +0100
Message-Id: <20210217123213.2199186-5-kraxel@redhat.com>
In-Reply-To: <20210217123213.2199186-1-kraxel@redhat.com>
References: <20210217123213.2199186-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>,
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

Call qxl_bo_unpin (which does a reservation) without holding the
release_mutex lock.  Fixes lockdep (correctly) warning on a possible
deadlock.

Fixes: 65ffea3c6e73 ("drm/qxl: unpin release objects")
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 716d706ca7f0..f5845c96d414 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -283,7 +283,7 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 				       int type, struct qxl_release **release,
 				       struct qxl_bo **rbo)
 {
-	struct qxl_bo *bo;
+	struct qxl_bo *bo, *free_bo = NULL;
 	int idr_ret;
 	int ret = 0;
 	union qxl_release_info *info;
@@ -315,8 +315,7 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 
 	mutex_lock(&qdev->release_mutex);
 	if (qdev->current_release_bo_offset[cur_idx] + 1 >= releases_per_bo[cur_idx]) {
-		qxl_bo_unpin(qdev->current_release_bo[cur_idx]);
-		qxl_bo_unref(&qdev->current_release_bo[cur_idx]);
+		free_bo = qdev->current_release_bo[cur_idx];
 		qdev->current_release_bo_offset[cur_idx] = 0;
 		qdev->current_release_bo[cur_idx] = NULL;
 	}
@@ -324,6 +323,10 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 		ret = qxl_release_bo_alloc(qdev, &qdev->current_release_bo[cur_idx], priority);
 		if (ret) {
 			mutex_unlock(&qdev->release_mutex);
+			if (free_bo) {
+				qxl_bo_unpin(free_bo);
+				qxl_bo_unref(&free_bo);
+			}
 			qxl_release_free(qdev, *release);
 			return ret;
 		}
@@ -339,6 +342,10 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 		*rbo = bo;
 
 	mutex_unlock(&qdev->release_mutex);
+	if (free_bo) {
+		qxl_bo_unpin(free_bo);
+		qxl_bo_unref(&free_bo);
+	}
 
 	ret = qxl_release_list_add(*release, bo);
 	qxl_bo_unref(&bo);
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
