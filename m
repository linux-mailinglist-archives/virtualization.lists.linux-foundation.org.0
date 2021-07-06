Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9F83BCF48
	for <lists.virtualization@lfdr.de>; Tue,  6 Jul 2021 13:28:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E6DF60853;
	Tue,  6 Jul 2021 11:28:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOK_Y0_-L6XA; Tue,  6 Jul 2021 11:28:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6B0CC6084D;
	Tue,  6 Jul 2021 11:28:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEAE7C000E;
	Tue,  6 Jul 2021 11:28:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70649C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CF2783192
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIfzEerwSVT8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:28:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 075EC83180
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:28:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F135461F22;
 Tue,  6 Jul 2021 11:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570896;
 bh=sCPVr7Zd+H5/hjvU4EXEkWQYTiG50FlZdz5A3qgX7zs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mXrqxBjDbvPpKh7DwEEsPLEQj+Vmn6XXASYlgo8OzEiWFXwq5ulW2JOqcB9BH8a0x
 +JXTBUeL8VkVr4w0dMXjkXBC4LtSZ2dmHLkUoJWU/h3QcgpiTThzD7ILVsdXYZdEed
 +t/wbsZP09coSHBrALwN+UVHtt7iQC/dq/K/s1+1ciETiTtuWffCYUsYZcUHydHaIj
 i6BJM7CEX30HPWAY1kH4VgdAxuTGRXh7aq86wHfwOTBQwcFsvaNpQSKeWDxyL0cPBc
 FPWSPVjjZ23180TnWI9zAaNar21ojvR8mN/T1lfr1+5/Fiy9wslYDPhcWBIarZobNu
 qvdrzpvkt3AMw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 21/45] virtio_net: Remove BUG() to avoid machine
 dead
Date: Tue,  6 Jul 2021 07:27:25 -0400
Message-Id: <20210706112749.2065541-21-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112749.2065541-1-sashal@kernel.org>
References: <20210706112749.2065541-1-sashal@kernel.org>
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
index 2d2a307c0231..71052d17c9ae 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1262,7 +1262,7 @@ static int xmit_skb(struct send_queue *sq, struct sk_buff *skb)
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
