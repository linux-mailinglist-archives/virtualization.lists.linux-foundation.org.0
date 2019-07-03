Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B13373763
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:08:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B395A14FE;
	Wed, 24 Jul 2019 18:59:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5E176DCE
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 16:27:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D3689834
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 16:27:17 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u14so345189pfn.2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 03 Jul 2019 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ryQ+KV6I+HBh6xV68vUzaQ/j84wovxLqLnfA8omtyrY=;
	b=OD7BugQkK23UKrAdvIBgZXB8LBubmLCFmJqY3b/p6UcRfTTiHWgohMCNNbEcDS2eeO
	FMrXFQu3ZXoniAXFlPJJPEohRbHY4OcQjgb4eWS9CJV8YP7gRCvVsJSh5ZpFmpWXg7s3
	MxjUhUOqBwYGq/ocXxEwR3EOns2s/1+e3zj2aA0+RSNEsL1kvBWX4062hFoErBOP56oH
	LZHN8Z0Y8vsOuygdEO56hD8aaN8IJL8KnKa74TTxLrJF9rbYRD9U7pRbN2zNuPsJPZ1j
	xk6bsxhqS5gboFfZwQfVsfcLBamqwIq/AoXRqYA/AxsfcF1YgXQUTbFLPa6p9jekVaGO
	CQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ryQ+KV6I+HBh6xV68vUzaQ/j84wovxLqLnfA8omtyrY=;
	b=j1GOdPrC9II7a9ZPRy6pM52m2cHM0q374m6XvsEK07EBY9oyOzdQs6S9xMeE1esb7d
	T8WIhpAZkn2eNXGz4JM0s4epe40xRIZevLvZwRmJXTgarMMjx67sAzgsfmfFUFqkHOaF
	u5KX8cZZ0ebgcLeiGZWDO/eJ7ZwwSzE4JE8gT108I8qwxsmeIAVDNZlLun5kbLkn7QeK
	vpNCISV6xQNtAHsdytYgteU13s1k48CmjyDN6kmLnCEvDQot7wNZ2vw2HJl/PLd9pO+C
	w6XVB2j9Vz1OdazvKbv8MLMbNTmifHayX4oCtDks0aWZfcVUJQlyfMF6hHCaQzrXjt42
	YvUA==
X-Gm-Message-State: APjAAAWyUkAc0/0WuI34FXe6XVW7GezYlTHeKs8ycMEoV4ukKCmSZWCy
	8TXBHKQdES6uymi7TtvTrDQ=
X-Google-Smtp-Source: APXvYqzXA1rOPPHweXD5XzmorpU7NYYzo6+KU07FLUuYqjhEoveOo9let3lwgDMUXOQvB3YNvDcZGA==
X-Received: by 2002:a65:60cc:: with SMTP id r12mr32890562pgv.333.1562171237362;
	Wed, 03 Jul 2019 09:27:17 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
	by smtp.googlemail.com with ESMTPSA id
	s193sm3183112pgc.32.2019.07.03.09.27.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jul 2019 09:27:16 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH v2 06/35] crypto: Use kmemdup rather than duplicating its
	implementation
Date: Thu,  4 Jul 2019 00:27:08 +0800
Message-Id: <20190703162708.32137-1-huangfq.daxian@gmail.com>
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
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Fix a typo in commit message (memset -> memcpy)

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
