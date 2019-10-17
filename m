Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D865FDAE55
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 15:27:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B872A15A3;
	Thu, 17 Oct 2019 13:26:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1EE2815A1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 13:26:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D2EC35D3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 13:26:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 619EB3082E72;
	Thu, 17 Oct 2019 13:26:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D03160852;
	Thu, 17 Oct 2019 13:26:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id DAED5934C; Thu, 17 Oct 2019 15:26:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/qxl: allocate small objects top-down
Date: Thu, 17 Oct 2019 15:26:38 +0200
Message-Id: <20191017132638.9693-6-kraxel@redhat.com>
In-Reply-To: <20191017132638.9693-1-kraxel@redhat.com>
References: <20191017132638.9693-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 17 Oct 2019 13:26:43 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

qxl uses small buffer objects for qxl commands.
Allocate them top-down to reduce fragmentation.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_object.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 927ab917b834..ad336c98a0cf 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -54,9 +54,14 @@ bool qxl_ttm_bo_is_qxl_bo(struct ttm_buffer_object *bo)
 void qxl_ttm_placement_from_domain(struct qxl_bo *qbo, u32 domain, bool pinned)
 {
 	u32 c = 0;
-	u32 pflag = pinned ? TTM_PL_FLAG_NO_EVICT : 0;
+	u32 pflag = 0;
 	unsigned int i;
 
+	if (pinned)
+		pflag |= TTM_PL_FLAG_NO_EVICT;
+	if (qbo->tbo.base.size <= PAGE_SIZE)
+		pflag |= TTM_PL_FLAG_TOPDOWN;
+
 	qbo->placement.placement = qbo->placements;
 	qbo->placement.busy_placement = qbo->placements;
 	if (domain == QXL_GEM_DOMAIN_VRAM)
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
