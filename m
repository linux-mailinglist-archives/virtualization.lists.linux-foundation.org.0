Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A897D287D53
	for <lists.virtualization@lfdr.de>; Thu,  8 Oct 2020 22:43:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3379387263;
	Thu,  8 Oct 2020 20:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXJe1n83D9re; Thu,  8 Oct 2020 20:43:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 48F9B8726F;
	Thu,  8 Oct 2020 20:43:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27F77C07FF;
	Thu,  8 Oct 2020 20:43:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7702EC0051
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 20:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6389387263
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 20:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0UOR6KakP5p9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 20:43:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C1C4687244
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 20:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602189785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=huKURS9xZVwjRl6HwVKXLMhhJbFrna5oxeAZtRaNfLM=;
 b=XntqAV6R1GvrlFkLdDIUC/xMyHYjio6kfZv35RvU8oZm2LQ7ab3J4QTY2VlTAW9a6WKQlr
 +3jYcB0QSYCA3Q18i9LGBI1tltuO2Mhwg89ZrjXTHBfqRs/LsVdHkNLn6/2fAf6EnbAg+r
 SB4hJ6oxNm0YJ+n0igiAt+eQh0fgXHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-0rDDCUGZOiWINQ_Q48nHTg-1; Thu, 08 Oct 2020 16:43:03 -0400
X-MC-Unique: 0rDDCUGZOiWINQ_Q48nHTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B147425EB;
 Thu,  8 Oct 2020 20:43:02 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-112-116.ams2.redhat.com
 [10.36.112.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 556BD55786;
 Thu,  8 Oct 2020 20:42:57 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: mst@redhat.com
Subject: [PATCH v2] vringh: fix __vringh_iov() when riov and wiov are different
Date: Thu,  8 Oct 2020 22:42:56 +0200
Message-Id: <20201008204256.162292-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org
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

If riov and wiov are both defined and they point to different
objects, only riov is initialized. If the wiov is not initialized
by the caller, the function fails returning -EINVAL and printing
"Readable desc 0x... after writable" error message.

This issue happens when descriptors have both readable and writable
buffers (eg. virtio-blk devices has virtio_blk_outhdr in the readable
buffer and status as last byte of writable buffer) and we call
__vringh_iov() to get both type of buffers in two different iovecs.

Let's replace the 'else if' clause with 'if' to initialize both
riov and wiov if they are not NULL.

As checkpatch pointed out, we also avoid crashing the kernel
when riov and wiov are both NULL, replacing BUG() with WARN_ON()
and returning -EINVAL.

Fixes: f87d0fbb5798 ("vringh: host-side implementation of virtio rings.")
Cc: stable@vger.kernel.org
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/vringh.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index e059a9a47cdf..8bd8b403f087 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -284,13 +284,14 @@ __vringh_iov(struct vringh *vrh, u16 i,
 	desc_max = vrh->vring.num;
 	up_next = -1;
 
+	/* You must want something! */
+	if (WARN_ON(!riov && !wiov))
+		return -EINVAL;
+
 	if (riov)
 		riov->i = riov->used = 0;
-	else if (wiov)
+	if (wiov)
 		wiov->i = wiov->used = 0;
-	else
-		/* You must want something! */
-		BUG();
 
 	for (;;) {
 		void *addr;
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
