Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D08701FA175
	for <lists.virtualization@lfdr.de>; Mon, 15 Jun 2020 22:28:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5B9C486D5D;
	Mon, 15 Jun 2020 20:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPz9pw-ndFzd; Mon, 15 Jun 2020 20:28:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A576686D61;
	Mon, 15 Jun 2020 20:28:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C742C016E;
	Mon, 15 Jun 2020 20:28:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D365CC016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 20:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C2A1C89043
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 20:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjXnIA+UsopA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 20:28:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1D6A189041
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 20:28:21 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64A3020714;
 Mon, 15 Jun 2020 20:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592252901;
 bh=l8JCfRQxeofToZojTFyDL95eoUKf/7vK8092dfPrcBE=;
 h=Subject:To:Cc:From:Date:From;
 b=Zx4SnSn9gF1In3Nq5MNxE256AWWjHM/2cE0HE6vkKBTZ9NtR2ioDUWshPhatN2oz7
 9RN45dci3K/RtTf1xRQtZMH1GMMPG7+1rIbjqthgwT1yakvdqz1p+TFzNPQLjWBff4
 qbsQMcf9w9f7oFtUKEtDRAwxsS8dlD65el1c10Yk=
Subject: Patch "crypto: virtio: Fix use-after-free in
 virtio_crypto_skcipher_finalize_req()" has been added to the 5.7-stable tree
To: arei.gonglei@huawei.com, clabbe@baylibre.com, davem@davemloft.net,
 gregkh@linuxfoundation.org, herbert@gondor.apana.org.au, jasowang@redhat.com,
 longpeng2@huawei.com, mst@redhat.com,
 virtualization@lists.linux-foundation.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 15 Jun 2020 22:27:56 +0200
Message-ID: <15922528768535@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
Cc: stable-commits@vger.kernel.org
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


This is a note to let you know that I've just added the patch titled

    crypto: virtio: Fix use-after-free in virtio_crypto_skcipher_finalize_req()

to the 5.7-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     crypto-virtio-fix-use-after-free-in-virtio_crypto_skcipher_finalize_req.patch
and it can be found in the queue-5.7 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 8c855f0720ff006d75d0a2512c7f6c4f60ff60ee Mon Sep 17 00:00:00 2001
From: "Longpeng(Mike)" <longpeng2@huawei.com>
Date: Tue, 2 Jun 2020 15:05:00 +0800
Subject: crypto: virtio: Fix use-after-free in virtio_crypto_skcipher_finalize_req()

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


Patches currently in stable-queue which might be from longpeng2@huawei.com are

queue-5.7/crypto-virtio-fix-src-dst-scatterlist-calculation-in-__virtio_crypto_skcipher_do_req.patch
queue-5.7/crypto-virtio-fix-dest-length-calculation-in-__virtio_crypto_skcipher_do_req.patch
queue-5.7/crypto-virtio-fix-use-after-free-in-virtio_crypto_skcipher_finalize_req.patch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
