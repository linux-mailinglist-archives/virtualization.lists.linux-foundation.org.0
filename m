Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 526CE13DB10
	for <lists.virtualization@lfdr.de>; Thu, 16 Jan 2020 14:04:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E86432150A;
	Thu, 16 Jan 2020 13:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0el7m+VS9yhr; Thu, 16 Jan 2020 13:04:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DC13620491;
	Thu, 16 Jan 2020 13:04:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0C4FC077D;
	Thu, 16 Jan 2020 13:04:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01808C077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 13:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F120387D0B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 13:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FnUpuCJ+qF6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 13:04:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7D14987D7F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 13:04:43 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF24B20748;
 Thu, 16 Jan 2020 13:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579179883;
 bh=cqwlyhWBKAqKJrhsN4Hb/s3j5SSMsdchtDX67lvtUpA=;
 h=Subject:To:Cc:From:Date:From;
 b=TfqBl70RNLqvTGX9+QC2QLnStgDOFpMFg92STheXYZalDdulewnOq0KluV/l6gEfd
 5WczJToWoAWM+tgkPAyGLoW8Rqp44W94DEZKSxs3rm+Z1yU2NTf+Xwv8Dc0CWNug9C
 VKrCTUR+d/9hOctS3UYdi/idfqXjyw9IwwVhSe1c=
Subject: Patch "crypto: virtio - implement missing support for output IVs" has
 been added to the 5.4-stable tree
To: ardb@kernel.org, arei.gonglei@huawei.com, gregkh@linuxfoundation.org,
 herbert@gondor.apana.org.au, jasowang@redhat.com, mst@redhat.com,
 virtualization@lists.linux-foundation.org
From: <gregkh@linuxfoundation.org>
Date: Thu, 16 Jan 2020 14:04:17 +0100
Message-ID: <157917985760138@kroah.com>
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

    crypto: virtio - implement missing support for output IVs

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     crypto-virtio-implement-missing-support-for-output-ivs.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 500e6807ce93b1fdc7d5b827c5cc167cc35630db Mon Sep 17 00:00:00 2001
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 9 Nov 2019 18:09:26 +0100
Subject: crypto: virtio - implement missing support for output IVs

From: Ard Biesheuvel <ardb@kernel.org>

commit 500e6807ce93b1fdc7d5b827c5cc167cc35630db upstream.

In order to allow for CBC to be chained, which is something that the
CTS template relies upon, implementations of CBC need to pass the
IV to be used for subsequent invocations via the IV buffer. This was
not implemented yet for virtio-crypto so implement it now.

Fixes: dbaf0624ffa5 ("crypto: add virtio-crypto driver")
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Gonglei <arei.gonglei@huawei.com>
Cc: virtualization@lists.linux-foundation.org
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/crypto/virtio/virtio_crypto_algs.c |    9 +++++++++
 1 file changed, 9 insertions(+)

--- a/drivers/crypto/virtio/virtio_crypto_algs.c
+++ b/drivers/crypto/virtio/virtio_crypto_algs.c
@@ -435,6 +435,11 @@ __virtio_crypto_ablkcipher_do_req(struct
 		goto free;
 	}
 	memcpy(iv, req->info, ivsize);
+	if (!vc_sym_req->encrypt)
+		scatterwalk_map_and_copy(req->info, req->src,
+					 req->nbytes - AES_BLOCK_SIZE,
+					 AES_BLOCK_SIZE, 0);
+
 	sg_init_one(&iv_sg, iv, ivsize);
 	sgs[num_out++] = &iv_sg;
 	vc_sym_req->iv = iv;
@@ -571,6 +576,10 @@ static void virtio_crypto_ablkcipher_fin
 	struct ablkcipher_request *req,
 	int err)
 {
+	if (vc_sym_req->encrypt)
+		scatterwalk_map_and_copy(req->info, req->dst,
+					 req->nbytes - AES_BLOCK_SIZE,
+					 AES_BLOCK_SIZE, 0);
 	crypto_finalize_ablkcipher_request(vc_sym_req->base.dataq->engine,
 					   req, err);
 	kzfree(vc_sym_req->iv);


Patches currently in stable-queue which might be from ardb@kernel.org are

queue-5.4/crypto-virtio-implement-missing-support-for-output-ivs.patch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
