Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0181B3DEFED
	for <lists.virtualization@lfdr.de>; Tue,  3 Aug 2021 16:17:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 736BB402D1;
	Tue,  3 Aug 2021 14:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXTAVkx_S2wH; Tue,  3 Aug 2021 14:17:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6FA1B404CF;
	Tue,  3 Aug 2021 14:17:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DC36C000E;
	Tue,  3 Aug 2021 14:17:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66E2EC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 14:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0CEF4036F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 14:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wd21dX5AQIL2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 14:17:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8B63402D1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 14:17:12 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1628000228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0k6H0TlpQiIG8T0gkNhLFAoaG8dP3h1ysdzyIOTlzbg=;
 b=IdCNmtXWkWR04l93utaEbWisUqgSX+dBsCOfdXQoDAipMLnvjKsikYNCRqqU899fMoXuTg
 s8yxboNK+sIuCbRlmz/nNr65YmVO5Yzg3nUsZFk8xoNYyfig1BWc8zPY2DZ3jZ2bQNoapo
 Z9617OCaHPL4RkhCRUQFGz4nLnERe4gz9zt8oycKx6Ll1C2IkRt7U4EJ7BLHoPVxOVgu+K
 A2FzxUImK30aqumH9YfdkWZnAJtGIRre2wJOoIw4zbYHXNNkrPz2fg3xjPBjZAHRPQir2I
 xhiUOX87sMzRmwG1DpTDkxRGwlhphjLQXiuwqIFzjidNCR1D5dJNiYKbmdkwKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1628000228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0k6H0TlpQiIG8T0gkNhLFAoaG8dP3h1ysdzyIOTlzbg=;
 b=udVCVLJ2newdh0ZNz56+jM9pkapoG3FVJX45U+XcubImZJjAMfVV4GflHIaF7zx5LTUb9A
 oEOrO6NraEAp6sCA==
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/38] crypto: virtio: Replace deprecated CPU-hotplug
 functions.
Date: Tue,  3 Aug 2021 16:15:55 +0200
Message-Id: <20210803141621.780504-13-bigeasy@linutronix.de>
In-Reply-To: <20210803141621.780504-1-bigeasy@linutronix.de>
References: <20210803141621.780504-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 tglx@linutronix.de, virtualization@lists.linux-foundation.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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

The functions get_online_cpus() and put_online_cpus() have been
deprecated during the CPU hotplug rework. They map directly to
cpus_read_lock() and cpus_read_unlock().

Replace deprecated CPU-hotplug functions with the official version.
The behavior remains unchanged.

Cc: Gonglei <arei.gonglei@huawei.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: virtualization@lists.linux-foundation.org
Cc: linux-crypto@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/crypto/virtio/virtio_crypto_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/virtio/virtio_crypto_core.c b/drivers/crypto/virtio/virtio_crypto_core.c
index 080955a1dd9c0..e2375d9923087 100644
--- a/drivers/crypto/virtio/virtio_crypto_core.c
+++ b/drivers/crypto/virtio/virtio_crypto_core.c
@@ -187,9 +187,9 @@ static int virtcrypto_init_vqs(struct virtio_crypto *vi)
 	if (ret)
 		goto err_free;
 
-	get_online_cpus();
+	cpus_read_lock();
 	virtcrypto_set_affinity(vi);
-	put_online_cpus();
+	cpus_read_unlock();
 
 	return 0;
 
-- 
2.32.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
