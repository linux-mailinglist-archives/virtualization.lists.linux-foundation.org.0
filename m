Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D700A3B9158
	for <lists.virtualization@lfdr.de>; Thu,  1 Jul 2021 13:54:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88EBD83C6A;
	Thu,  1 Jul 2021 11:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yevaZP5pTgET; Thu,  1 Jul 2021 11:54:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 56CAE83C67;
	Thu,  1 Jul 2021 11:54:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B609FC000E;
	Thu,  1 Jul 2021 11:54:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E56D0C000E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jul 2021 11:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF34083B84
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jul 2021 11:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NU80DPL8_s1
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jul 2021 11:54:08 +0000 (UTC)
X-Greylist: delayed 00:07:10 by SQLgrey-1.8.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 708FA83B60
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jul 2021 11:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1625140447;
 x=1656676447;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hBC7lTy6FHyGqO0SQzntsJ4n9KAu05Qu1gGf+/akR6U=;
 b=jn9rzHd3xPNIkSoHCjBB8SWuqOHRVJb1mfz13ZWTBp0pExCAT5FUUSOp
 grsGJNsWLWpHQ7CG6cbc6HdBdw73fUNPP54pxdLjIvYN+Dk65SuM7H3+N
 G408e4TM5sEod/ulNk93yV/6eQUVG/2jDi0QjzzXhZ58YTdipo/gAd4qL
 WWvPY1JK/qUy+dLjkp19EYBNWnZvo1nEfQze64D2CqZvf3L405fj4z5Cr
 Unka16LgI/qN+/U5FJ+j5T1WaA3lGI47gO6CgNHQUl0FtjwV+2CaElOD2
 xFHgKwAwLE79FJvhJa4zCrzx45x1+X5bwQVmhgWNybOgQDMqMRW8pllRe w==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH] virtio_vdpa: reject invalid vq indices
Date: Thu, 1 Jul 2021 13:46:52 +0200
Message-ID: <20210701114652.21956-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Vincent Whitchurch <vincent.whitchurch@axis.com>, kernel@axis.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Do not call vDPA drivers' callbacks with vq indicies larger than what
the drivers indicate that they support.  vDPA drivers do not bounds
check the indices.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
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
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
