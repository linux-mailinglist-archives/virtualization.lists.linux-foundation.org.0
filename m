Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F376D4F7000
	for <lists.virtualization@lfdr.de>; Thu,  7 Apr 2022 03:14:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5F206119F;
	Thu,  7 Apr 2022 01:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yk7QzScnotLt; Thu,  7 Apr 2022 01:14:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6669A611A1;
	Thu,  7 Apr 2022 01:14:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02E33C0083;
	Thu,  7 Apr 2022 01:14:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36CC3C0012
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 01:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1566F8331B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 01:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id brR1cAaew9hQ
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 01:14:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C51383227
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 01:14:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6C1F61DAE;
 Thu,  7 Apr 2022 01:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6EDC385A8;
 Thu,  7 Apr 2022 01:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649294090;
 bh=s/wM9yw1sAuIFJAp3+xxsTnu7j5+IlJj2gurHg09ouM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MBauZixEz6txklnhEftxCdpEjKUczEmBADysQ4Cx2o4BEXP5tm0Gh4rzydc3MMXBQ
 sE9RRsqDrgycRk38aghqYqRS47Nvh2PanGVceXAwjGTsFMMBPNM76v2aeq0gAb8Uh+
 inP5DVN8Kkphodg6DBT8YPyC+W4x1x/XgX8OF+CN22m2CBwK/3hZ1CCJO+hxGVswh4
 aJGTC8FsdL8StMLW/O8RIceg5vyxMvVC3GNuXGImDUE7P2Zu6K9TEkMMHVQY+KO9uU
 42s1xSMosJK5NCmwcvExXH8fNUtxbfEpvkrzDCY+Eu5IbrOHldRwXgLjXG5Ap529qt
 dz1EwbirGCmog==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 15/25] vhost_vdpa: don't setup irq offloading
 when irq_num < 0
Date: Wed,  6 Apr 2022 21:14:03 -0400
Message-Id: <20220407011413.114662-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407011413.114662-1-sashal@kernel.org>
References: <20220407011413.114662-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Zhu Lingshan <lingshan.zhu@intel.com>
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

From: Zhu Lingshan <lingshan.zhu@intel.com>

[ Upstream commit cce0ab2b2a39072d81f98017f7b076f3410ef740 ]

When irq number is negative(e.g., -EINVAL), the virtqueue
may be disabled or the virtqueues are sharing a device irq.
In such case, we should not setup irq offloading for a virtqueue.

Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
Link: https://lore.kernel.org/r/20220222115428.998334-3-lingshan.zhu@intel.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/vhost/vdpa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index e4d60009d908..04578aa87e4d 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -97,8 +97,11 @@ static void vhost_vdpa_setup_vq_irq(struct vhost_vdpa *v, u16 qid)
 		return;
 
 	irq = ops->get_vq_irq(vdpa, qid);
+	if (irq < 0)
+		return;
+
 	irq_bypass_unregister_producer(&vq->call_ctx.producer);
-	if (!vq->call_ctx.ctx || irq < 0)
+	if (!vq->call_ctx.ctx)
 		return;
 
 	vq->call_ctx.producer.token = vq->call_ctx.ctx;
-- 
2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
