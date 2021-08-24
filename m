Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CD83F544C
	for <lists.virtualization@lfdr.de>; Tue, 24 Aug 2021 02:54:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25E9740242;
	Tue, 24 Aug 2021 00:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NqYM5SMjLTGj; Tue, 24 Aug 2021 00:54:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BBE8340367;
	Tue, 24 Aug 2021 00:54:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 456A0C000E;
	Tue, 24 Aug 2021 00:54:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFEF2C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDD3240302
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jjeXlCtgsOB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:54:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1928D402F7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:54:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C35A2613AD;
 Tue, 24 Aug 2021 00:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629766447;
 bh=ZMwVgeO8BXE4Vr6cAm+FMEPjYDhem2FmGyPCWR+8u7c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CveqHbIBU+nK7i3HfUx5EWwECbr77OEZfl0K0WvEMKop7yo2pn6HppsNG0PjlZjdj
 RDOdHmKivJTaNGqdLmQavX+SHMAA0GAxR6hHtNvfEbInMrPFHVB6Af9GM6l67Qaipq
 BNvm7n1MlkNnsiSfSPQjlIIXnHNJNwvB06leBW20ClIrQgCrAFS6bQ0UmoFVYPuw9s
 y/x7I7SUDrNf6PNDF0FUhO8Rcmcl5AJhy0rPMRa1jkZN5nQyF3OcGVr61TnpnbKlDE
 MsSE7XL0nVcbTZ1Qyj1xshE1eNXZ6hUtv96h0+0hXDzCOnymuju6rDiWOpLSPgB3S2
 bN0Ipq5oH/0og==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 08/26] virtio_vdpa: reject invalid vq indices
Date: Mon, 23 Aug 2021 20:53:38 -0400
Message-Id: <20210824005356.630888-8-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824005356.630888-1-sashal@kernel.org>
References: <20210824005356.630888-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 virtualization@lists.linux-foundation.org
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

From: Vincent Whitchurch <vincent.whitchurch@axis.com>

[ Upstream commit cb5d2c1f6cc0e5769099a7d44b9d08cf58cae206 ]

Do not call vDPA drivers' callbacks with vq indicies larger than what
the drivers indicate that they support.  vDPA drivers do not bounds
check the indices.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
Link: https://lore.kernel.org/r/20210701114652.21956-1-vincent.whitchurch@axis.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/virtio/virtio_vdpa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index e28acf482e0c..e9b9dd03f44a 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -149,6 +149,9 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
 	if (!name)
 		return NULL;
 
+	if (index >= vdpa->nvqs)
+		return ERR_PTR(-ENOENT);
+
 	/* Queue shouldn't already be set up. */
 	if (ops->get_vq_ready(vdpa, index))
 		return ERR_PTR(-ENOENT);
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
