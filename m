Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB703BCCEB
	for <lists.virtualization@lfdr.de>; Tue,  6 Jul 2021 13:20:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ABF860816;
	Tue,  6 Jul 2021 11:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hYt_OCBSm1Wf; Tue,  6 Jul 2021 11:20:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8AC6C60848;
	Tue,  6 Jul 2021 11:20:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 055D5C000E;
	Tue,  6 Jul 2021 11:20:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CB4CC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E02E6403E3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z2ix0Yq4l6Ar
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:19:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C340403D7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:19:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DCA261D6D;
 Tue,  6 Jul 2021 11:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570399;
 bh=9f4U18zgpgzwMfn2wNYwWW5+rtYiDiEiuDTIc+NA4i8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mArFGm8Rxw0Wxerad562tUhnxkLfrHPg++m8IjCNIYbx6e5S+5qBldQTenqkTaiK2
 XUkp7gWH3Gq3D8a0MeFmBDqQ1vbsWaerBSAsZxYr+KMxhBvedPZ9S3OEmI3TA4bDmm
 UA0v9NyHxL1buNbQKIpQObp7SahgQGGTZS9LicCpQ02lVo1jcmbXO6ngAH+AC6DDCr
 /ZBMn+JhiPpi6sIFd3bzObutKTUtXyb+VCZOf8vpioLbBPRg2ur77sg6bYOat3ZGq/
 QPN7CVAonqi3EWKaBpJIyqq0VASfrf/FljxuEDcQcuEkhnWC97A0kXwWpnr+C2oumL
 7o8IYQmPUP6Qw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 069/160] virtio_net: Remove BUG() to avoid
 machine dead
Date: Tue,  6 Jul 2021 07:16:55 -0400
Message-Id: <20210706111827.2060499-69-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>,
 Xianting Tian <xianting.tian@linux.alibaba.com>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Leon Romanovsky <leonro@nvidia.com>,
 "David S . Miller" <davem@davemloft.net>
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

From: Xianting Tian <xianting.tian@linux.alibaba.com>

[ Upstream commit 85eb1389458d134bdb75dad502cc026c3753a619 ]

We should not directly BUG() when there is hdr error, it is
better to output a print when such error happens. Currently,
the caller of xmit_skb() already did it.

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/virtio_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 447582fa20a5..f7ce341bb328 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1558,7 +1558,7 @@ static int xmit_skb(struct send_queue *sq, struct sk_buff *skb)
 	if (virtio_net_hdr_from_skb(skb, &hdr->hdr,
 				    virtio_is_little_endian(vi->vdev), false,
 				    0))
-		BUG();
+		return -EPROTO;
 
 	if (vi->mergeable_rx_bufs)
 		hdr->num_buffers = 0;
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
