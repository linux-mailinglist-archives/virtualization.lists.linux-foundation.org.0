Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374A3F5452
	for <lists.virtualization@lfdr.de>; Tue, 24 Aug 2021 02:54:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA63402C4;
	Tue, 24 Aug 2021 00:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AdjpYJE6WLpL; Tue, 24 Aug 2021 00:54:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3AE3B40301;
	Tue, 24 Aug 2021 00:54:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF35AC000E;
	Tue, 24 Aug 2021 00:54:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49AECC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 225F840379
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZxh7lgg9PRf
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:54:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D5D340366
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:54:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25259613BD;
 Tue, 24 Aug 2021 00:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629766449;
 bh=HigKvF2qlGkAo5mFN3wN0d0VrImeDgmCAblcxl/51ZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K4NhVefoVDPYpOH0i4aRpgIICQ95O8lAxUlsK96MJibMlWPuJLA3vmG2/bwu5fy6T
 rBzWF+A5+cf9ho4MZ8f3EVLqJe6kWU3plJAzppblARuMwI2m8ezg+fV0OJzbqs0Ysh
 nalxLdgC+FWpYLEqUX3UJl+s6G8UqSjUJJj6D76iiTz3Opef49XF3/3ZU8mWXNwX/+
 Om7BBmCLYhzkp9N6PAhrr06THeK/YQAmhrQxHaltBIdv5erA4ELqsJmtAMNVBufKA4
 TnskoqXuDfQFvEtuq6mkxNdi4CentUP5U/HbgDoNWA6vAFon8y9fMugsraJd1ZIsnw
 0zaD0zrZN5GLw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 09/26] vringh: Use wiov->used to check for
 read/write desc order
Date: Mon, 23 Aug 2021 20:53:39 -0400
Message-Id: <20210824005356.630888-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824005356.630888-1-sashal@kernel.org>
References: <20210824005356.630888-1-sashal@kernel.org>
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
index 4af8fa259d65..14e2043d7685 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -359,7 +359,7 @@ __vringh_iov(struct vringh *vrh, u16 i,
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
