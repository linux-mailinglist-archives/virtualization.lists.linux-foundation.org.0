Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5861A73762
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:08:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6E9B213EE;
	Wed, 24 Jul 2019 18:59:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1A121FE7
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 13:14:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BECE887D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 13:14:11 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x15so1287631pfq.0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 03 Jul 2019 06:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jBkyRyPJyPqYCM7LVKEeTlHKLt/amBJBKugaRL0hZwE=;
	b=DGEIzb1kDhOG9CcvmiofF51lt2Oy3LBkNSFVAyi4SdU9RMsBh0V1qV3pYI6gzIFB8X
	+WZiD2cNpLTG6ASxIPJoB6W9KZ8x9u3XWIq6xQ5/cCqfLU0qAabCO+U8SgkkG5/PqTU5
	Lovz+MSpHRrvjqqgJA38Bsdj382YQcZMoCvqtrg7iiSLesFNpkm1c4zOtzq0oYTCx6/k
	qiNsgR+HsMpilCWODBGJkZ6egXasBuP0QuE1ocEyk5w3eQpaoWc/AxbqQP4DitTn0jnH
	HW/DWB1U2qZl4BE15Ydo3bxKTaJFrrZBJrDox1CXPCEE49MphuvrE9tT8caMvlQb/f01
	dTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jBkyRyPJyPqYCM7LVKEeTlHKLt/amBJBKugaRL0hZwE=;
	b=QlKT7KLyXCTqRkH8tDwbrJ9DdBbMPEGxUGOSr64u47iguqWZTso7xqSHfSih7By5h2
	+rwULVxTiKSBZWl2AaPycPclyGbF2JtRXgVUBH4sDRFIB/qIzcRKAx5eCvWXDL2aQyaR
	sgsFpv9+NYsI/tgQTgRxW5hDfgkhw6dqosW12qztJP/uWRslnY1jb8tWuZ5epaynACFN
	tMAuEHG0PpYD2Ie9PSYYK3EJXD3bdhND330iAXSc25O48GedU63ZsO0a7D6j+7LcT8yn
	aq+eUZeEITldGemoRjDsgwrBq03QWXx2NvaY3jftRb/ObLNZmp55sHOPQGHVRNdrjA2C
	y0Jw==
X-Gm-Message-State: APjAAAXK4nXLJBRPeb1DqyhPQ4+RxdS/IJTK8fJyFVMjKEab9WG4HcgX
	vvJNXJaWIjG5sZu2orEFdU8=
X-Google-Smtp-Source: APXvYqyEZ8G/Ytxhng2bseN0byMkFtJdOYaPxiWptFTsBwFatUfS+q+t/spJFJj85TPYnm1YL2gsvA==
X-Received: by 2002:a17:90a:ad41:: with SMTP id
	w1mr12692927pjv.52.1562159651356; 
	Wed, 03 Jul 2019 06:14:11 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
	by smtp.googlemail.com with ESMTPSA id
	q98sm903544pjq.20.2019.07.03.06.14.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jul 2019 06:14:11 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 05/30] crypto: Use kmemdup rather than duplicating its
	implementation
Date: Wed,  3 Jul 2019 21:13:58 +0800
Message-Id: <20190703131358.24901-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_WEB autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	=?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
	Fuqian Huang <huangfq.daxian@gmail.com>,
	"David S . Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memset, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/crypto/caam/caampkc.c              | 11 +++--------
 drivers/crypto/virtio/virtio_crypto_algs.c |  4 +---
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/caam/caampkc.c b/drivers/crypto/caam/caampkc.c
index fe24485274e1..a03464b4c019 100644
--- a/drivers/crypto/caam/caampkc.c
+++ b/drivers/crypto/caam/caampkc.c
@@ -816,7 +816,7 @@ static int caam_rsa_set_pub_key(struct crypto_akcipher *tfm, const void *key,
 		return ret;
 
 	/* Copy key in DMA zone */
-	rsa_key->e = kzalloc(raw_key.e_sz, GFP_DMA | GFP_KERNEL);
+	rsa_key->e = kmemdup(raw_key.e, raw_key.e_sz, GFP_DMA | GFP_KERNEL);
 	if (!rsa_key->e)
 		goto err;
 
@@ -838,8 +838,6 @@ static int caam_rsa_set_pub_key(struct crypto_akcipher *tfm, const void *key,
 	rsa_key->e_sz = raw_key.e_sz;
 	rsa_key->n_sz = raw_key.n_sz;
 
-	memcpy(rsa_key->e, raw_key.e, raw_key.e_sz);
-
 	return 0;
 err:
 	caam_rsa_free_key(rsa_key);
@@ -920,11 +918,11 @@ static int caam_rsa_set_priv_key(struct crypto_akcipher *tfm, const void *key,
 		return ret;
 
 	/* Copy key in DMA zone */
-	rsa_key->d = kzalloc(raw_key.d_sz, GFP_DMA | GFP_KERNEL);
+	rsa_key->d = kmemdup(raw_key.d, raw_key.d_sz, GFP_DMA | GFP_KERNEL);
 	if (!rsa_key->d)
 		goto err;
 
-	rsa_key->e = kzalloc(raw_key.e_sz, GFP_DMA | GFP_KERNEL);
+	rsa_key->e = kmemdup(raw_key.e, raw_key.e_sz, GFP_DMA | GFP_KERNEL);
 	if (!rsa_key->e)
 		goto err;
 
@@ -947,9 +945,6 @@ static int caam_rsa_set_priv_key(struct crypto_akcipher *tfm, const void *key,
 	rsa_key->e_sz = raw_key.e_sz;
 	rsa_key->n_sz = raw_key.n_sz;
 
-	memcpy(rsa_key->d, raw_key.d, raw_key.d_sz);
-	memcpy(rsa_key->e, raw_key.e, raw_key.e_sz);
-
 	caam_rsa_set_priv_key_form(ctx, &raw_key);
 
 	return 0;
diff --git a/drivers/crypto/virtio/virtio_crypto_algs.c b/drivers/crypto/virtio/virtio_crypto_algs.c
index 10f266d462d6..42d19205166b 100644
--- a/drivers/crypto/virtio/virtio_crypto_algs.c
+++ b/drivers/crypto/virtio/virtio_crypto_algs.c
@@ -129,13 +129,11 @@ static int virtio_crypto_alg_ablkcipher_init_session(
 	 * Avoid to do DMA from the stack, switch to using
 	 * dynamically-allocated for the key
 	 */
-	uint8_t *cipher_key = kmalloc(keylen, GFP_ATOMIC);
+	uint8_t *cipher_key = kmemdup(key, keylen, GFP_ATOMIC);
 
 	if (!cipher_key)
 		return -ENOMEM;
 
-	memcpy(cipher_key, key, keylen);
-
 	spin_lock(&vcrypto->ctrl_lock);
 	/* Pad ctrl header */
 	vcrypto->ctrl.header.opcode =
-- 
2.11.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
