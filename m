Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EED42C575E
	for <lists.virtualization@lfdr.de>; Thu, 26 Nov 2020 15:50:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CCB28877B7;
	Thu, 26 Nov 2020 14:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FB8-agviExC; Thu, 26 Nov 2020 14:50:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 179D5877BF;
	Thu, 26 Nov 2020 14:50:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF0E0C0052;
	Thu, 26 Nov 2020 14:50:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4B0CC0052
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DFAEE2E23B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70idC16eiwlg
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:50:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id A54C32E249
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606402240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5MEy+nYHquOaJZFWUznRCJ+zGo/LLrF9K07U0tqIAng=;
 b=Xi7xSbWve4Z004Y2PrmVyMzN542dMfBpS1s04hgtKVG52w/2rCl2KIDHYJMwECWsl/uwgC
 c+HC89xLbofYYkW5GwNOKRkiWwp2Plictwai/qtn44GokcRAfkfjO+TeAjYEgqq1WTGGiR
 HSSmaMiPwHeRzCHFtBIOEPnTR/dI6BQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-TWC7LeO6M7-qddLCO9ul8Q-1; Thu, 26 Nov 2020 09:50:38 -0500
X-MC-Unique: TWC7LeO6M7-qddLCO9ul8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A309C805BFE;
 Thu, 26 Nov 2020 14:50:37 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-252.ams2.redhat.com
 [10.36.113.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D541D5C1BD;
 Thu, 26 Nov 2020 14:50:35 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v2 05/17] vdpa_sim: rename vdpasim_config_ops variables
Date: Thu, 26 Nov 2020 15:49:38 +0100
Message-Id: <20201126144950.92850-6-sgarzare@redhat.com>
In-Reply-To: <20201126144950.92850-1-sgarzare@redhat.com>
References: <20201126144950.92850-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>
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

These variables stores generic callbacks used by the vDPA simulator
core, so we can remove the 'net' word in their names.

Co-developed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 40664d87f303..62204e064841 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -331,8 +331,8 @@ static const struct dma_map_ops vdpasim_dma_ops = {
 	.free = vdpasim_free_coherent,
 };
 
-static const struct vdpa_config_ops vdpasim_net_config_ops;
-static const struct vdpa_config_ops vdpasim_net_batch_config_ops;
+static const struct vdpa_config_ops vdpasim_config_ops;
+static const struct vdpa_config_ops vdpasim_batch_config_ops;
 
 static struct vdpasim *vdpasim_create(void)
 {
@@ -342,9 +342,9 @@ static struct vdpasim *vdpasim_create(void)
 	int i, ret = -ENOMEM;
 
 	if (batch_mapping)
-		ops = &vdpasim_net_batch_config_ops;
+		ops = &vdpasim_batch_config_ops;
 	else
-		ops = &vdpasim_net_config_ops;
+		ops = &vdpasim_config_ops;
 
 	vdpasim = vdpa_alloc_device(struct vdpasim, vdpa, NULL, ops, VDPASIM_VQ_NUM);
 	if (!vdpasim)
@@ -657,7 +657,7 @@ static void vdpasim_free(struct vdpa_device *vdpa)
 	kfree(vdpasim->vqs);
 }
 
-static const struct vdpa_config_ops vdpasim_net_config_ops = {
+static const struct vdpa_config_ops vdpasim_config_ops = {
 	.set_vq_address         = vdpasim_set_vq_address,
 	.set_vq_num             = vdpasim_set_vq_num,
 	.kick_vq                = vdpasim_kick_vq,
@@ -684,7 +684,7 @@ static const struct vdpa_config_ops vdpasim_net_config_ops = {
 	.free                   = vdpasim_free,
 };
 
-static const struct vdpa_config_ops vdpasim_net_batch_config_ops = {
+static const struct vdpa_config_ops vdpasim_batch_config_ops = {
 	.set_vq_address         = vdpasim_set_vq_address,
 	.set_vq_num             = vdpasim_set_vq_num,
 	.kick_vq                = vdpasim_kick_vq,
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
