Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D72B61FB823
	for <lists.virtualization@lfdr.de>; Tue, 16 Jun 2020 17:54:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6054587945;
	Tue, 16 Jun 2020 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_mv0HzTcRBf; Tue, 16 Jun 2020 15:54:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 63FA587973;
	Tue, 16 Jun 2020 15:54:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 415EAC0888;
	Tue, 16 Jun 2020 15:54:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06240C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 15:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E956087969
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKR5tBm9SD1I
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 15:54:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7DA9887940
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 15:54:06 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BEC4321556;
 Tue, 16 Jun 2020 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592322846;
 bh=Cy0Pcw1eJIo5XdE8jhQZwIHhrSWVtsnsbrsGEpRIzio=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wdHfHaf6aTqQaKcdcn4ZMpBUZvOfioXcFV3h9CBEKD9Pp1jXjgaN1cc7/ZbhTunzh
 CHkbirW0HqF08nshMqj57ewn1WdSdMI93bsm2zmXtqmGhOIlLTi2fCY0a3xb67H80F
 wjXhqzQNmh/2J16frxeOWjSd9/b8Rflk8zkyKgzs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.6 099/161] crypto: virtio: Fix use-after-free in
 virtio_crypto_skcipher_finalize_req()
Date: Tue, 16 Jun 2020 17:34:49 +0200
Message-Id: <20200616153111.084131462@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200616153106.402291280@linuxfoundation.org>
References: <20200616153106.402291280@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 LABBE Corentin <clabbe@baylibre.com>,
 "Longpeng\(Mike\)" <longpeng2@huawei.com>,
 "David S. Miller" <davem@davemloft.net>
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

From: Longpeng(Mike) <longpeng2@huawei.com>

commit 8c855f0720ff006d75d0a2512c7f6c4f60ff60ee upstream.

The system'll crash when the users insmod crypto/tcrypto.ko with mode=155
( testing "authenc(hmac(sha1),cbc(aes))" ). It's caused by reuse the memory
of request structure.

In crypto_authenc_init_tfm(), the reqsize is set to:
  [PART 1] sizeof(authenc_request_ctx) +
  [PART 2] ictx->reqoff +
  [PART 3] MAX(ahash part, skcipher part)
and the 'PART 3' is used by both ahash and skcipher in turn.

When the virtio_crypto driver finish skcipher req, it'll call ->complete
callback(in crypto_finalize_skcipher_request) and then free its
resources whose pointers are recorded in 'skcipher parts'.

However, the ->complete is 'crypto_authenc_encrypt_done' in this case,
it will use the 'ahash part' of the request and change its content,
so virtio_crypto driver will get the wrong pointer after ->complete
finish and mistakenly free some other's memory. So the system will crash
when these memory will be used again.

The resources which need to be cleaned up are not used any more. But the
pointers of these resources may be changed in the function
"crypto_finalize_skcipher_request". Thus release specific resources before
calling this function.

Fixes: dbaf0624ffa5 ("crypto: add virtio-crypto driver")
Reported-by: LABBE Corentin <clabbe@baylibre.com>
Cc: Gonglei <arei.gonglei@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: virtualization@lists.linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20200123101000.GB24255@Red
Acked-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
Link: https://lore.kernel.org/r/20200602070501.2023-3-longpeng2@huawei.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/crypto/virtio/virtio_crypto_algs.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/drivers/crypto/virtio/virtio_crypto_algs.c
+++ b/drivers/crypto/virtio/virtio_crypto_algs.c
@@ -578,10 +578,11 @@ static void virtio_crypto_skcipher_final
 		scatterwalk_map_and_copy(req->iv, req->dst,
 					 req->cryptlen - AES_BLOCK_SIZE,
 					 AES_BLOCK_SIZE, 0);
-	crypto_finalize_skcipher_request(vc_sym_req->base.dataq->engine,
-					   req, err);
 	kzfree(vc_sym_req->iv);
 	virtcrypto_clear_request(&vc_sym_req->base);
+
+	crypto_finalize_skcipher_request(vc_sym_req->base.dataq->engine,
+					   req, err);
 }
 
 static struct virtio_crypto_algo virtio_crypto_algs[] = { {


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
