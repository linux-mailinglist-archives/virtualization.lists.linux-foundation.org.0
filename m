Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A73F54C4
	for <lists.virtualization@lfdr.de>; Tue, 24 Aug 2021 02:55:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 861E480CB9;
	Tue, 24 Aug 2021 00:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7bQ_jOH_JtJ; Tue, 24 Aug 2021 00:55:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4F6F480BF5;
	Tue, 24 Aug 2021 00:55:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39B37C001B;
	Tue, 24 Aug 2021 00:55:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89DA0C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C0E980BF5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:55:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BbpiML5lb4nD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:55:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB08C80CB9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:55:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77560617E2;
 Tue, 24 Aug 2021 00:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629766542;
 bh=qhESlreqaguGA6UjYwAFl9MniaY/yGL8vZMgJ69S/zY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KQcbf4OsSTUMWcexDJg6LKYFdW3xQkGX3kgU+bF+RK7rtq8V3yTdKqSGfjLTc2yy5
 oNggMYYiZfu+3lXKiBg5ZZcVCTVIjQDvuXYh/cFCVMQK2Wfbjmerq9v1YI9O0MbLKJ
 0ty5wfylSsCfyJ7NfYgWnaWwO2TPVewZnxp/cKhQFS5W4fXrutBTVo9Oo3oeoVfAc8
 sAvLbUADY3bxqHUyydwKB+6t1UdmEZ9Cc6OVcdqXd5lkMA7b3glwniedZKhFn4O39T
 7M99vaYyn9+1on7XsSsByB3Eqr6XwnnKtjWqR6qYFKOhIQq4i0pk2AUZQJKK7+Qbm5
 7aHEzv0PWnXkw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 2/3] vringh: Use wiov->used to check for
 read/write desc order
Date: Mon, 23 Aug 2021 20:55:38 -0400
Message-Id: <20210824005539.631820-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824005539.631820-1-sashal@kernel.org>
References: <20210824005539.631820-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Neeraj Upadhyay <neeraju@codeaurora.org>
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

From: Neeraj Upadhyay <neeraju@codeaurora.org>

[ Upstream commit e74cfa91f42c50f7f649b0eca46aa049754ccdbd ]

As __vringh_iov() traverses a descriptor chain, it populates
each descriptor entry into either read or write vring iov
and increments that iov's ->used member. So, as we iterate
over a descriptor chain, at any point, (riov/wriov)->used
value gives the number of descriptor enteries available,
which are to be read or written by the device. As all read
iovs must precede the write iovs, wiov->used should be zero
when we are traversing a read descriptor. Current code checks
for wiov->i, to figure out whether any previous entry in the
current descriptor chain was a write descriptor. However,
iov->i is only incremented, when these vring iovs are consumed,
at a later point, and remain 0 in __vringh_iov(). So, correct
the check for read and write descriptor order, to use
wiov->used.

Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Neeraj Upadhyay <neeraju@codeaurora.org>
Link: https://lore.kernel.org/r/1624591502-4827-1-git-send-email-neeraju@codeaurora.org
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/vhost/vringh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index d56736655dec..da47542496cc 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -329,7 +329,7 @@ __vringh_iov(struct vringh *vrh, u16 i,
 			iov = wiov;
 		else {
 			iov = riov;
-			if (unlikely(wiov && wiov->i)) {
+			if (unlikely(wiov && wiov->used)) {
 				vringh_bad("Readable desc %p after writable",
 					   &descs[i]);
 				err = -EINVAL;
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
