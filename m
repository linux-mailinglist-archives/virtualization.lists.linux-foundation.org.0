Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B0422414ED7
	for <lists.virtualization@lfdr.de>; Wed, 22 Sep 2021 19:09:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1A004058E;
	Wed, 22 Sep 2021 17:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShgQYHgCP5RJ; Wed, 22 Sep 2021 17:09:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 81BDA405D3;
	Wed, 22 Sep 2021 17:09:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C554C0022;
	Wed, 22 Sep 2021 17:09:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B52BEC000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 17:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1327405E1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 17:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aggdTKNGbXFN
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 17:09:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7C1A405A8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632330563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQsej0EuCL2beLZAb1gxjyy0OhJfKtFa7H9euSdki+w=;
 b=KGGY/25bJPYLsK+sXDzgT4q+vDcxgUyHLOHELBcClcH9oanypt+dlzwGi9KtAKF4RnpNUs
 JHN3jOhyvnS9bl9/P6oxY+3xWczonaHY3YdWNtPePWupmvAcywsWhfoNaIr5F5t1MmjkdN
 8eSs4xMrY6a6zK1aXUgWYElfeLqgoK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-LNokeKBaN3iaxMNmJKsS3g-1; Wed, 22 Sep 2021 13:09:22 -0400
X-MC-Unique: LNokeKBaN3iaxMNmJKsS3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D266E79EDC;
 Wed, 22 Sep 2021 17:09:20 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50BFA652A1;
 Wed, 22 Sep 2021 17:09:18 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] hwrng: virtio - always add a pending request
Date: Wed, 22 Sep 2021 19:09:03 +0200
Message-Id: <20210922170903.577801-5-lvivier@redhat.com>
In-Reply-To: <20210922170903.577801-1-lvivier@redhat.com>
References: <20210922170903.577801-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Laurent Vivier <lvivier@redhat.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, amit@kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, rusty@rustcorp.com.au,
 virtualization@lists.linux-foundation.org,
 Alexander Potapenko <glider@google.com>, linux-crypto@vger.kernel.org,
 Matt Mackall <mpm@selenic.com>, akong@redhat.com,
 Dmitriy Vyukov <dvyukov@google.com>
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

If we ensure we have already some data available by enqueuing
again the buffer once data are exhausted, we can return what we
have without waiting for the device answer.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 drivers/char/hw_random/virtio-rng.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/char/hw_random/virtio-rng.c b/drivers/char/hw_random/virtio-rng.c
index 8ba97cf4ca8f..0b3c9b643495 100644
--- a/drivers/char/hw_random/virtio-rng.c
+++ b/drivers/char/hw_random/virtio-rng.c
@@ -20,7 +20,6 @@ struct virtrng_info {
 	struct virtqueue *vq;
 	char name[25];
 	int index;
-	bool busy;
 	bool hwrng_register_done;
 	bool hwrng_removed;
 	/* data transfer */
@@ -44,16 +43,16 @@ static void random_recv_done(struct virtqueue *vq)
 		return;
 
 	vi->data_idx = 0;
-	vi->busy = false;
 
 	complete(&vi->have_data);
 }
 
-/* The host will fill any buffer we give it with sweet, sweet randomness. */
-static void register_buffer(struct virtrng_info *vi)
+static void request_entropy(struct virtrng_info *vi)
 {
 	struct scatterlist sg;
 
+	reinit_completion(&vi->have_data);
+
 	sg_init_one(&sg, vi->data, sizeof(vi->data));
 
 	/* There should always be room for one buffer. */
@@ -69,6 +68,8 @@ static unsigned int copy_data(struct virtrng_info *vi, void *buf,
 	memcpy(buf, vi->data + vi->data_idx, size);
 	vi->data_idx += size;
 	vi->data_avail -= size;
+	if (vi->data_avail == 0)
+		request_entropy(vi);
 	return size;
 }
 
@@ -98,13 +99,7 @@ static int virtio_read(struct hwrng *rng, void *buf, size_t size, bool wait)
 	 * so either size is 0 or data_avail is 0
 	 */
 	while (size != 0) {
-		/* data_avail is 0 */
-		if (!vi->busy) {
-			/* no pending request, ask for more */
-			vi->busy = true;
-			reinit_completion(&vi->have_data);
-			register_buffer(vi);
-		}
+		/* data_avail is 0 but a request is pending */
 		ret = wait_for_completion_killable(&vi->have_data);
 		if (ret < 0)
 			return ret;
@@ -126,8 +121,7 @@ static void virtio_cleanup(struct hwrng *rng)
 {
 	struct virtrng_info *vi = (struct virtrng_info *)rng->priv;
 
-	if (vi->busy)
-		complete(&vi->have_data);
+	complete(&vi->have_data);
 }
 
 static int probe_common(struct virtio_device *vdev)
@@ -163,6 +157,9 @@ static int probe_common(struct virtio_device *vdev)
 		goto err_find;
 	}
 
+	/* we always have a pending entropy request */
+	request_entropy(vi);
+
 	return 0;
 
 err_find:
@@ -181,7 +178,6 @@ static void remove_common(struct virtio_device *vdev)
 	vi->data_idx = 0;
 	complete(&vi->have_data);
 	vdev->config->reset(vdev);
-	vi->busy = false;
 	if (vi->hwrng_register_done)
 		hwrng_unregister(&vi->hwrng);
 	vdev->config->del_vqs(vdev);
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
