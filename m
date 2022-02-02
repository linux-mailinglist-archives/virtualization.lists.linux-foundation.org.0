Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4942B4A7518
	for <lists.virtualization@lfdr.de>; Wed,  2 Feb 2022 16:57:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF1A360FE0;
	Wed,  2 Feb 2022 15:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FMmJHH4JRi1; Wed,  2 Feb 2022 15:57:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A170960FF1;
	Wed,  2 Feb 2022 15:57:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C6BEC0077;
	Wed,  2 Feb 2022 15:57:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 651A3C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 15:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45C4060BE7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 15:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80Q-IeRVcIYD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 15:57:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C956E60BE0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=QzwLw7j8eTvZsRbJglcJOtBbwWYohx/2fo0FBI/zHLQ=; b=lIGa4JS6CboqrLuLU51vbGBy5v
 LUZTqwoJY2B7TqEJmBOq3DBaDsINQwkco4MR70yhNcpQ4rGLQKpBE9A3hwlBFUr453Eprfp/frLXl
 bAiw+m7cF6EY+eAE7/ONNOSG57ub97sMxqv/T/Us/VOkSh6s7c4Qjne9gR1kg9ykIKMFUi+15OObR
 Q/i9EGP1vCUS93CN9tds14oJ7AqrZ+7SGeUpk8kQ4BP/GMkezCBpTRLdYttN5PPo3M3vqSNoKC9Tw
 Mcw5ggKMjixI8OSuxsZnCVJZuhxMUorynzAF2ZgOGiloH4JEDIz1pkBRE/ww3U8Z8oOwSUIp6L3HI
 w8nKwwUA==;
Received: from [2001:4bb8:191:327d:b3e5:1ccd:eaac:6609] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFI0Q-00G6ZE-1B; Wed, 02 Feb 2022 15:57:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 4/5] memstick/mspro_block: fix handling of read-only devices
Date: Wed,  2 Feb 2022 16:56:58 +0100
Message-Id: <20220202155659.107895-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202155659.107895-1-hch@lst.de>
References: <20220202155659.107895-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-mmc@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

Use set_disk_ro to propagate the read-only state to the block layer
instead of checking for it in ->open and leaking a reference in case
of a read-only device.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/memstick/core/mspro_block.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index c0450397b6735..7ea312f0840e0 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -186,13 +186,8 @@ static int mspro_block_bd_open(struct block_device *bdev, fmode_t mode)
 
 	mutex_lock(&mspro_block_disk_lock);
 
-	if (msb && msb->card) {
+	if (msb && msb->card)
 		msb->usage_count++;
-		if ((mode & FMODE_WRITE) && msb->read_only)
-			rc = -EROFS;
-		else
-			rc = 0;
-	}
 
 	mutex_unlock(&mspro_block_disk_lock);
 
@@ -1239,6 +1234,9 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 	set_capacity(msb->disk, capacity);
 	dev_dbg(&card->dev, "capacity set %ld\n", capacity);
 
+	if (msb->read_only)
+		set_disk_ro(msb->disk, true);
+
 	rc = device_add_disk(&card->dev, msb->disk, NULL);
 	if (rc)
 		goto out_cleanup_disk;
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
