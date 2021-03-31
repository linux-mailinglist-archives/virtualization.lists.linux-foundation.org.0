Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 73647348EDE
	for <lists.virtualization@lfdr.de>; Thu, 25 Mar 2021 12:25:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C563F60727;
	Thu, 25 Mar 2021 11:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qw6Tvj3tgxKQ; Thu, 25 Mar 2021 11:25:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id B952060756;
	Thu, 25 Mar 2021 11:25:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E75EC000A;
	Thu, 25 Mar 2021 11:25:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7055FC000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 11:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 514B240186
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 11:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YeoWwxFekH_H
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 11:25:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6CA340183
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 11:25:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A0C661A30;
 Thu, 25 Mar 2021 11:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616671530;
 bh=lQLmD8mWJ5lbA1jcQr4LGTtmStNrM7Wj2L0lbI7A420=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bt0qDbF+AVkNZZ5pYtAAgisiShbQecvaEgnb9KzT6WH6GMaVOOJfVo25QRIrmEbie
 q5NQf4zmn3Bi4tfdbmhZtzu/11k34ywLnv/oZeYu/E6PekMEINgbCakUhucVi3OhVr
 TbJU+IshuKqYQpemhbVAw+QIlDTEX4jCoAb1o8wDXkEIOtSWC1ZWVHUN4KFKQb7gVh
 UnGS5V5R0spDdciyA6I9wApSCBkiJoyigmpioxP5pzylaUqHykIK3+c7ndfRrPYTZ9
 pzXKV+ZBcpOKatkEOb5G1SDMwd7dujkVGWBOAFQS8kyfc2xp3zXxsYwo8H4DKfVle+
 e48F5pvyMLCzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 23/44] vhost: Fix vhost_vq_reset()
Date: Thu, 25 Mar 2021 07:24:38 -0400
Message-Id: <20210325112459.1926846-23-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112459.1926846-1-sashal@kernel.org>
References: <20210325112459.1926846-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Laurent Vivier <lvivier@redhat.com>, Sasha Levin <sashal@kernel.org>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, virtualization@lists.linux-foundation.org
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

From: Laurent Vivier <lvivier@redhat.com>

[ Upstream commit beb691e69f4dec7bfe8b81b509848acfd1f0dbf9 ]

vhost_reset_is_le() is vhost_init_is_le(), and in the case of
cross-endian legacy, vhost_init_is_le() depends on vq->user_be.

vq->user_be is set by vhost_disable_cross_endian().

But in vhost_vq_reset(), we have:

    vhost_reset_is_le(vq);
    vhost_disable_cross_endian(vq);

And so user_be is used before being set.

To fix that, reverse the lines order as there is no other dependency
between them.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Link: https://lore.kernel.org/r/20210312140913.788592-1-lvivier@redhat.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/vhost/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index a262e12c6dc2..5ccb0705beae 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -332,8 +332,8 @@ static void vhost_vq_reset(struct vhost_dev *dev,
 	vq->error_ctx = NULL;
 	vq->kick = NULL;
 	vq->log_ctx = NULL;
-	vhost_reset_is_le(vq);
 	vhost_disable_cross_endian(vq);
+	vhost_reset_is_le(vq);
 	vq->busyloop_timeout = 0;
 	vq->umem = NULL;
 	vq->iotlb = NULL;
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
