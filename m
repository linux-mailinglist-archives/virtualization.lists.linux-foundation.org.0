Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 220684FBA04
	for <lists.virtualization@lfdr.de>; Mon, 11 Apr 2022 12:47:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE97A82FD5;
	Mon, 11 Apr 2022 10:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_enqmeMiBDa; Mon, 11 Apr 2022 10:47:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7E71D830A7;
	Mon, 11 Apr 2022 10:47:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2F80C0084;
	Mon, 11 Apr 2022 10:47:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9864FC002C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Apr 2022 10:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 867E182FD5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Apr 2022 10:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7mcDDT0D5yGt
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Apr 2022 10:47:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B00DD830A7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Apr 2022 10:47:29 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 z6-20020a17090a398600b001cb9fca3210so2542985pjb.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Apr 2022 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VCyZPE/1genz1+mpMUrYj2NUOKWwI7kMWvqWcKDIk1M=;
 b=vPj3+pN/ZvXVWlHMIXDGI+KWTmVdEZCtOd5QuBIezD2AaHWHxLyT2lZ5bmGF7WIMfD
 vJSYKchuruiG3Rc7Ab0ySrcB+3fosp+W5TXqVUh6sx4cMIQmK/IutgfiEyGR66CwbvwT
 /Fnx9fzLyd9wTvJGzbLeqYxj9HO+nE46LLAQ3BnpoPIJupMF6Ci2a/XUvHcpn+r0oyWV
 Rppj5fzbUoBuBjPkW+7InpD6caWV2VXP+cd27pHi38nkAqvC/4ogCfJw8wQBm3saxdxE
 joqWtuZamjQ998wtMLan5rUqW6unLBYdN2NwahIubJGwmgJYZFVpvi6z5SaF2E29911x
 r8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VCyZPE/1genz1+mpMUrYj2NUOKWwI7kMWvqWcKDIk1M=;
 b=uwMJIPfSJCs7YLezI3wmlR7Vj+AKl17PkGvHjhfKZ/xtfHIA4OHma2r37GczVlmVTv
 fVCi+7s7pJy61KQSpFea4BcB8+FNr17r0PetXsx+wPEO+/Qfj++pFbN6Xm2NKzV5L5B3
 0BTkyNUuWu82Q8H9vT67WNRE8PWip1Xly/9nLKKQ1Fc96JT//2eWAt8kdb9xXmz94Yva
 kFO2t8J2PMrHada2IE1YCiTmzpEE3V2OqAim33NB1S6RbrY2E0VK9GqcvuW3QRzgHraF
 F3XYQTt8TPQFcnYJfyFH+VxK8takaGUNEWwmy4h/vjlFjj/jLBRthHNzNIaABJcseR1A
 MydQ==
X-Gm-Message-State: AOAM533fpIJbRgKkLdfZAWmIjHF8RAwU4c7gNPk2I4Co4OO+0667fEqe
 XP3boC7VjQTBU7WuF4p3BMGBTA==
X-Google-Smtp-Source: ABdhPJwZQbLpMmfpQRho0XUAFZKkmUwD7BN+UgNYMn222jjuO6QkYj36glLSMNwxV6eBJ1QMhVGBdw==
X-Received: by 2002:a17:90a:2b41:b0:1cb:62ba:d53 with SMTP id
 y1-20020a17090a2b4100b001cb62ba0d53mr12217386pjc.201.1649674048881; 
 Mon, 11 Apr 2022 03:47:28 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a636808000000b00398e9c7049bsm27541649pgc.31.2022.04.11.03.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 03:47:28 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	berrange@redhat.com,
	arei.gonglei@huawei.com
Subject: [PATCH v4 5/8] crypto: Implement RSA algorithm by hogweed
Date: Mon, 11 Apr 2022 18:43:24 +0800
Message-Id: <20220411104327.197048-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411104327.197048-1-pizhenwei@bytedance.com>
References: <20220411104327.197048-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Cc: helei.sig11@bytedance.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org
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

From: Lei He <helei.sig11@bytedance.com>

Implement RSA algorithm by hogweed from nettle. Thus QEMU supports
a 'real' RSA backend to handle request from guest side. It's
important to test RSA offload case without OS & hardware requirement.

Signed-off-by: Lei He <helei.sig11@bytedance.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 crypto/akcipher-nettle.c.inc | 448 +++++++++++++++++++++++++++++++++++
 crypto/akcipher.c            |   4 +
 crypto/meson.build           |   4 +
 crypto/rsakey-builtin.c.inc  | 150 ++++++++++++
 crypto/rsakey-nettle.c.inc   | 141 +++++++++++
 crypto/rsakey.c              |  43 ++++
 crypto/rsakey.h              |  96 ++++++++
 meson.build                  |  11 +
 8 files changed, 897 insertions(+)
 create mode 100644 crypto/akcipher-nettle.c.inc
 create mode 100644 crypto/rsakey-builtin.c.inc
 create mode 100644 crypto/rsakey-nettle.c.inc
 create mode 100644 crypto/rsakey.c
 create mode 100644 crypto/rsakey.h

diff --git a/crypto/akcipher-nettle.c.inc b/crypto/akcipher-nettle.c.inc
new file mode 100644
index 0000000000..de163cd89e
--- /dev/null
+++ b/crypto/akcipher-nettle.c.inc
@@ -0,0 +1,448 @@
+/*
+ * QEMU Crypto akcipher algorithms
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: lei he <helei.sig11@bytedance.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include <stdbool.h>
+
+#include <nettle/rsa.h>
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "asn1_decoder.h"
+#include "crypto/akcipher.h"
+#include "crypto/random.h"
+#include "qapi/error.h"
+#include "sysemu/cryptodev.h"
+#include "rsakey.h"
+
+typedef struct QCryptoNettleRSA {
+    QCryptoAkCipher akcipher;
+    struct rsa_public_key pub;
+    struct rsa_private_key priv;
+    QCryptoRSAPaddingAlgorithm padding_alg;
+    QCryptoHashAlgorithm hash_alg;
+} QCryptoNettleRSA;
+
+static void qcrypto_nettle_rsa_destroy(void *ptr)
+{
+    QCryptoNettleRSA *rsa = (QCryptoNettleRSA *)ptr;
+    if (!rsa) {
+        return;
+    }
+
+    rsa_public_key_clear(&rsa->pub);
+    rsa_private_key_clear(&rsa->priv);
+    g_free(rsa);
+}
+
+static QCryptoAkCipher *qcrypto_nettle_rsa_new(
+    const QCryptoAkCipherOptionsRSA *opt,
+    QCryptoAkCipherKeyType type,
+    const uint8_t *key,  size_t keylen,
+    Error **errp);
+
+QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
+                                      QCryptoAkCipherKeyType type,
+                                      const uint8_t *key, size_t keylen,
+                                      Error **errp)
+{
+    switch (opts->algorithm) {
+    case QCRYPTO_AKCIPHER_ALG_RSA:
+        return qcrypto_nettle_rsa_new(&opts->u.rsa, type, key, keylen, errp);
+
+    default:
+        error_setg(errp, "Unsupported algorithm: %u", opts->algorithm);
+        return NULL;
+    }
+
+    return NULL;
+}
+
+static void qcrypto_nettle_rsa_set_akcipher_size(QCryptoAkCipher *akcipher,
+                                                 int key_size)
+{
+    akcipher->max_plaintext_len = key_size;
+    akcipher->max_ciphertext_len = key_size;
+    akcipher->max_signature_len = key_size;
+    akcipher->max_dgst_len = key_size;
+}
+
+static int qcrypt_nettle_parse_rsa_private_key(QCryptoNettleRSA *rsa,
+                                               const uint8_t *key,
+                                               size_t keylen)
+{
+    QCryptoAkCipherRSAKey *rsa_key =
+        qcrypto_akcipher_parse_rsa_private_key(key, keylen);
+    int ret = -1;
+    if (!rsa_key) {
+        return ret;
+    }
+
+    nettle_mpz_init_set_str_256_u(rsa->pub.n, rsa_key->n.len, rsa_key->n.data);
+    nettle_mpz_init_set_str_256_u(rsa->pub.e, rsa_key->e.len, rsa_key->e.data);
+    nettle_mpz_init_set_str_256_u(rsa->priv.d, rsa_key->d.len, rsa_key->d.data);
+    nettle_mpz_init_set_str_256_u(rsa->priv.p, rsa_key->p.len, rsa_key->p.data);
+    nettle_mpz_init_set_str_256_u(rsa->priv.q, rsa_key->q.len, rsa_key->q.data);
+    nettle_mpz_init_set_str_256_u(rsa->priv.a, rsa_key->dp.len,
+                                  rsa_key->dp.data);
+    nettle_mpz_init_set_str_256_u(rsa->priv.b, rsa_key->dq.len,
+                                  rsa_key->dq.data);
+    nettle_mpz_init_set_str_256_u(rsa->priv.c, rsa_key->u.len, rsa_key->u.data);
+
+    if (!rsa_public_key_prepare(&rsa->pub)) {
+        goto clear;
+    }
+
+    /**
+     * Since in the kernel's unit test, the p, q, a, b, c of some
+     * private keys is 0, only the simplest length check is done here
+     */
+    if (rsa_key->p.len > 1 &&
+        rsa_key->q.len > 1 &&
+        rsa_key->dp.len > 1 &&
+        rsa_key->dq.len > 1 &&
+        rsa_key->u.len > 1) {
+        if (!rsa_private_key_prepare(&rsa->priv)) {
+            goto clear;
+        }
+    } else {
+        rsa->priv.size = rsa->pub.size;
+    }
+    qcrypto_nettle_rsa_set_akcipher_size(
+        (QCryptoAkCipher *)rsa, rsa->priv.size);
+    ret = 0;
+
+clear:
+    qcrypto_akcipher_free_rsa_key(rsa_key);
+    return ret;
+}
+
+static int qcrypt_nettle_parse_rsa_public_key(QCryptoNettleRSA *rsa,
+                                              const uint8_t *key,
+                                              size_t keylen)
+{
+    QCryptoAkCipherRSAKey *rsa_key =
+        qcrypto_akcipher_parse_rsa_public_key(key, keylen);
+    int ret = -1;
+    if (!rsa_key) {
+        return ret;
+    }
+    nettle_mpz_init_set_str_256_u(rsa->pub.n, rsa_key->n.len, rsa_key->n.data);
+    nettle_mpz_init_set_str_256_u(rsa->pub.e, rsa_key->e.len, rsa_key->e.data);
+
+    if (!rsa_public_key_prepare(&rsa->pub)) {
+        goto clear;
+    }
+    qcrypto_nettle_rsa_set_akcipher_size(
+        (QCryptoAkCipher *)rsa, rsa->pub.size);
+    ret = 0;
+
+clear:
+    qcrypto_akcipher_free_rsa_key(rsa_key);
+    return ret;
+}
+
+static void wrap_nettle_random_func(void *ctx, size_t len, uint8_t *out)
+{
+    /* TODO: check result */
+    qcrypto_random_bytes(out, len, NULL);
+}
+
+static int qcrypto_nettle_rsa_encrypt(QCryptoAkCipher *akcipher_driver,
+                                      const void *data, size_t data_len,
+                                      void *enc, size_t enc_len,
+                                      Error **errp)
+{
+
+    QCryptoNettleRSA *rsa =
+        container_of(akcipher_driver, QCryptoNettleRSA, akcipher);
+    mpz_t c;
+    int ret = -1;
+
+    if (data_len > rsa->pub.size || enc_len != rsa->pub.size) {
+        error_setg(errp, "Invalid buffer size");
+        return ret;
+    }
+
+    /* Nettle do not support RSA encryption without any padding */
+    switch (rsa->padding_alg) {
+    case QCRYPTO_RSA_PADDING_ALG_RAW:
+        error_setg(errp, "RSA with raw padding is not supported");
+        break;
+
+    case QCRYPTO_RSA_PADDING_ALG_PKCS1:
+        mpz_init(c);
+        if (rsa_encrypt(&rsa->pub, NULL, wrap_nettle_random_func,
+                          data_len, (uint8_t *)data, c) != 1) {
+            error_setg(errp, "Failed to encrypt");
+        } else {
+            nettle_mpz_get_str_256(enc_len, (uint8_t *)enc, c);
+            ret = enc_len;
+        }
+        mpz_clear(c);
+        break;
+
+    default:
+        error_setg(errp, "Unknown padding");
+    }
+
+    return ret;
+}
+
+static int qcrypto_nettle_rsa_decrypt(QCryptoAkCipher *akcipher,
+                                      const void *enc, size_t enc_len,
+                                      void *data, size_t data_len,
+                                      Error **errp)
+{
+    QCryptoNettleRSA *rsa = container_of(akcipher, QCryptoNettleRSA, akcipher);
+    mpz_t c;
+    int ret = -1;
+    if (enc_len > rsa->priv.size) {
+        error_setg(errp, "Invalid buffer size");
+        return ret;
+    }
+
+    switch (rsa->padding_alg) {
+    case QCRYPTO_RSA_PADDING_ALG_RAW:
+        error_setg(errp, "RSA with raw padding is not supported");
+        break;
+
+    case QCRYPTO_RSA_PADDING_ALG_PKCS1:
+        nettle_mpz_init_set_str_256_u(c, enc_len, enc);
+        if (!rsa_decrypt(&rsa->priv, &data_len, (uint8_t *)data, c)) {
+            error_setg(errp, "Failed to decrypt");
+        } else {
+            ret = data_len;
+        }
+
+        mpz_clear(c);
+        break;
+
+    default:
+        ret = -1;
+        error_setg(errp, "Unknown padding");
+    }
+
+    return ret;
+}
+
+static int qcrypto_nettle_rsa_sign(QCryptoAkCipher *akcipher,
+                                   const void *data, size_t data_len,
+                                   void *sig, size_t sig_len, Error **errp)
+{
+    QCryptoNettleRSA *rsa = container_of(akcipher, QCryptoNettleRSA, akcipher);
+    int ret;
+    mpz_t s;
+
+    /**
+     * The RSA algorithm cannot be used for signature/verification
+     * without padding.
+     */
+    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALG_RAW) {
+        error_setg(errp, "Try to make signature without padding");
+        return -1;
+    }
+
+    if (data_len > rsa->priv.size || sig_len != rsa->priv.size) {
+        error_setg(errp, "Invalid buffer size");
+        return -1;
+    }
+
+    mpz_init(s);
+    switch (rsa->hash_alg) {
+    case QCRYPTO_HASH_ALG_MD5:
+        ret = rsa_md5_sign_digest(&rsa->priv, data, s);
+        break;
+
+    case QCRYPTO_HASH_ALG_SHA1:
+        ret = rsa_sha1_sign_digest(&rsa->priv, data, s);
+        break;
+
+    case QCRYPTO_HASH_ALG_SHA256:
+        ret = rsa_sha256_sign_digest(&rsa->priv, data, s);
+        break;
+
+    case QCRYPTO_HASH_ALG_SHA512:
+        ret = rsa_sha512_sign_digest(&rsa->priv, data, s);
+        break;
+
+    default:
+        error_setg(errp, "Unknown hash algorithm");
+        ret = -1;
+        goto clear;
+    }
+
+    if (ret != 1) {
+        error_setg(errp, "Failed to make signature");
+        ret = -1;
+        goto clear;
+    }
+    nettle_mpz_get_str_256(sig_len, (uint8_t *)sig, s);
+    ret = sig_len;
+
+clear:
+    mpz_clear(s);
+
+    return ret;
+}
+
+static int qcrypto_nettle_rsa_verify(QCryptoAkCipher *akcipher,
+                                     const void *sig, size_t sig_len,
+                                     const void *data, size_t data_len,
+                                     Error **errp)
+{
+    QCryptoNettleRSA *rsa = container_of(akcipher, QCryptoNettleRSA, akcipher);
+
+    int ret;
+    mpz_t s;
+
+    /**
+     * The RSA algorithm cannot be used for signature/verification
+     * without padding.
+     */
+    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALG_RAW) {
+        error_setg(errp, "Operation not supported");
+        return -1;
+    }
+    if (data_len > rsa->pub.size || sig_len < rsa->pub.size) {
+        error_setg(errp, "Invalid buffer size");
+        return -1;
+    }
+
+    nettle_mpz_init_set_str_256_u(s, sig_len, sig);
+    switch (rsa->hash_alg) {
+    case QCRYPTO_HASH_ALG_MD5:
+        ret = rsa_md5_verify_digest(&rsa->pub, data, s);
+        break;
+
+    case QCRYPTO_HASH_ALG_SHA1:
+        ret = rsa_sha1_verify_digest(&rsa->pub, data, s);
+        break;
+
+    case QCRYPTO_HASH_ALG_SHA256:
+        ret = rsa_sha256_verify_digest(&rsa->pub, data, s);
+        break;
+
+    case QCRYPTO_HASH_ALG_SHA512:
+        ret = rsa_sha512_verify_digest(&rsa->pub, data, s);
+        break;
+
+    default:
+        error_setg(errp, "Unsupported hash algorithm");
+        ret = -1;
+        goto clear;
+    }
+
+    if (ret != 1) {
+        error_setg(errp, "Failed to verify");
+        ret = -1;
+        goto clear;
+    }
+    ret = 0;
+
+clear:
+    mpz_clear(s);
+
+    return ret;
+}
+
+static int qcrypto_nettle_rsa_free(QCryptoAkCipher *akcipher,
+                                   Error **errp)
+{
+    qcrypto_nettle_rsa_destroy(akcipher);
+    return 0;
+}
+
+QCryptoAkCipherDriver nettle_rsa = {
+    .encrypt = qcrypto_nettle_rsa_encrypt,
+    .decrypt = qcrypto_nettle_rsa_decrypt,
+    .sign = qcrypto_nettle_rsa_sign,
+    .verify = qcrypto_nettle_rsa_verify,
+    .free = qcrypto_nettle_rsa_free,
+};
+
+static QCryptoAkCipher *qcrypto_nettle_rsa_new(
+    const QCryptoAkCipherOptionsRSA *opt,
+    QCryptoAkCipherKeyType type,
+    const uint8_t *key, size_t keylen,
+    Error **errp)
+{
+    QCryptoNettleRSA *rsa = g_new0(QCryptoNettleRSA, 1);
+
+    rsa->padding_alg = opt->padding_alg;
+    rsa->hash_alg = opt->hash_alg;
+    rsa->akcipher.driver = &nettle_rsa;
+    rsa_public_key_init(&rsa->pub);
+    rsa_private_key_init(&rsa->priv);
+
+    switch (type) {
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE:
+        if (qcrypt_nettle_parse_rsa_private_key(rsa, key, keylen) != 0) {
+            error_setg(errp, "Failed to parse rsa private key");
+            goto err;
+        }
+        break;
+
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC:
+        if (qcrypt_nettle_parse_rsa_public_key(rsa, key, keylen) != 0) {
+            error_setg(errp, "Failed to parse rsa public rsa key");
+            goto err;
+        }
+        break;
+
+    default:
+        error_setg(errp, "Unknown akcipher key type %d", type);
+    }
+
+    return (QCryptoAkCipher *)rsa;
+
+err:
+    qcrypto_nettle_rsa_destroy(rsa);
+    return NULL;
+}
+
+
+bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
+{
+    switch (opts->algorithm) {
+    case QCRYPTO_AKCIPHER_ALG_RSA:
+        switch (opts->u.rsa.padding_alg) {
+        case QCRYPTO_RSA_PADDING_ALG_PKCS1:
+            switch (opts->u.rsa.hash_alg) {
+            case QCRYPTO_HASH_ALG_MD5:
+            case QCRYPTO_HASH_ALG_SHA1:
+            case QCRYPTO_HASH_ALG_SHA256:
+            case QCRYPTO_HASH_ALG_SHA512:
+                return true;
+
+            default:
+                return false;
+            }
+
+        case QCRYPTO_RSA_PADDING_ALG_RAW:
+        default:
+            return false;
+        }
+        break;
+
+    default:
+        return false;
+    }
+}
diff --git a/crypto/akcipher.c b/crypto/akcipher.c
index 7323a48073..dc29127bb4 100644
--- a/crypto/akcipher.c
+++ b/crypto/akcipher.c
@@ -23,6 +23,9 @@
 #include "crypto/akcipher.h"
 #include "akcipherpriv.h"
 
+#if defined(CONFIG_NETTLE) && defined(CONFIG_HOGWEED)
+#include "akcipher-nettle.c.inc"
+#else
 QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
                                       QCryptoAkCipherKeyType type,
                                       const uint8_t *key, size_t keylen,
@@ -37,6 +40,7 @@ bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
 {
     return false;
 }
+#endif
 
 int qcrypto_akcipher_encrypt(QCryptoAkCipher *akcipher,
                              const void *in, size_t in_len,
diff --git a/crypto/meson.build b/crypto/meson.build
index 57f29d6f74..43a90ef211 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -21,10 +21,14 @@ crypto_ss.add(files(
   'tlscredspsk.c',
   'tlscredsx509.c',
   'tlssession.c',
+  'rsakey.c',
 ))
 
 if nettle.found()
   crypto_ss.add(nettle, files('hash-nettle.c', 'hmac-nettle.c', 'pbkdf-nettle.c'))
+  if hogweed.found()
+    crypto_ss.add(gmp, hogweed)
+  endif
   if xts == 'private'
     crypto_ss.add(files('xts.c'))
   endif
diff --git a/crypto/rsakey-builtin.c.inc b/crypto/rsakey-builtin.c.inc
new file mode 100644
index 0000000000..d9cdae9e4b
--- /dev/null
+++ b/crypto/rsakey-builtin.c.inc
@@ -0,0 +1,150 @@
+/*
+ * QEMU Crypto akcipher algorithms
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: lei he <helei.sig11@bytedance.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "rsakey.h"
+#include "asn1_decoder.h"
+
+static int extract_mpi(void *ctx, const uint8_t *value, size_t vlen)
+{
+    QCryptoAkCipherMpi *mpi = (QCryptoAkCipherMpi *)ctx;
+    mpi->data = g_memdup2(value, vlen);
+    mpi->len = vlen;
+    return 0;
+}
+
+static int extract_version(void *ctx, const uint8_t *value, size_t vlen)
+{
+    uint8_t *version = (uint8_t *)ctx;
+    if (vlen != 1) {
+        return -1;
+    }
+    if (*value > 1) {
+        return -1;
+    }
+    *version = *value;
+    return 0;
+}
+
+static int extract_content(void *ctx, const uint8_t *value, size_t vlen)
+{
+    const uint8_t **content = (const uint8_t **)ctx;
+    *content = value;
+    return 0;
+}
+
+/**
+ *
+ *        RsaPubKey ::= SEQUENCE {
+ *             n           INTEGER
+ *             e           INTEGER
+ *         }
+ */
+QCryptoAkCipherRSAKey *qcrypto_akcipher_parse_rsa_public_key(const uint8_t *key,
+                                                             size_t keylen)
+{
+    QCryptoAkCipherRSAKey *rsa = g_new0(QCryptoAkCipherRSAKey, 1);
+    const uint8_t *seq;
+    size_t seq_length;
+    int decode_ret;
+
+    decode_ret = der_decode_seq(&key, &keylen, extract_content, &seq);
+    if (decode_ret <= 0 || keylen != 0) {
+        goto err;
+    }
+    seq_length = decode_ret;
+
+    if (der_decode_int(&seq, &seq_length, extract_mpi, &rsa->n) <= 0 ||
+        der_decode_int(&seq, &seq_length, extract_mpi, &rsa->e) <= 0 ||
+        seq_length != 0) {
+        goto err;
+    }
+
+    return rsa;
+
+err:
+    qcrypto_akcipher_free_rsa_key(rsa);
+    return NULL;
+}
+
+/**
+ *        RsaPrivKey ::= SEQUENCE {
+ *             version     INTEGER
+ *             n           INTEGER
+ *             e           INTEGER
+ *             d           INTEGER
+ *             p           INTEGER
+ *             q           INTEGER
+ *             dp          INTEGER
+ *             dq          INTEGER
+ *             u           INTEGER
+ *       otherPrimeInfos   OtherPrimeInfos OPTIONAL
+ *         }
+ */
+QCryptoAkCipherRSAKey *qcrypto_akcipher_parse_rsa_private_key(
+    const uint8_t *key, size_t keylen)
+{
+    QCryptoAkCipherRSAKey *rsa = g_new0(QCryptoAkCipherRSAKey, 1);
+    uint8_t version;
+    const uint8_t *seq;
+    int decode_ret;
+    size_t seq_length;
+
+    decode_ret = der_decode_seq(&key, &keylen, extract_content, &seq);
+    if (decode_ret <= 0 || keylen != 0) {
+        goto err;
+    }
+    seq_length = decode_ret;
+
+    if (der_decode_int(&seq, &seq_length,
+                       extract_version, &version) != sizeof(version) ||
+        version > 1) {
+        goto err;
+    }
+    if (der_decode_int(&seq, &seq_length, extract_mpi, &rsa->n) <= 0 ||
+        der_decode_int(&seq, &seq_length, extract_mpi, &rsa->e) <= 0 ||
+        der_decode_int(&seq, &seq_length, extract_mpi, &rsa->d) <= 0 ||
+        der_decode_int(&seq, &seq_length, extract_mpi, &rsa->p) <= 0 ||
+        der_decode_int(&seq, &seq_length, extract_mpi, &rsa->q) <= 0 ||
+        der_decode_int(&seq, &seq_length, extract_mpi, &rsa->dp) <= 0 ||
+        der_decode_int(&seq, &seq_length, extract_mpi, &rsa->dq) <= 0 ||
+        der_decode_int(&seq, &seq_length, extract_mpi, &rsa->u) <= 0) {
+        goto err;
+    }
+    /**
+     * According to the standard, otherPrimeInfos must be present for version 1.
+     * There is no strict verification here, this is to be compatible with
+     * the unit test of the kernel. TODO: remove this until linux kernel's
+     * unit-test is fixed.
+     */
+    if (version == 1 && seq_length != 0) {
+        if (der_decode_seq(&seq, &seq_length, NULL, NULL) <= 0) {
+            goto err;
+        }
+    }
+    if (seq_length != 0) {
+        goto err;
+    }
+    return rsa;
+
+err:
+    qcrypto_akcipher_free_rsa_key(rsa);
+    return NULL;
+}
diff --git a/crypto/rsakey-nettle.c.inc b/crypto/rsakey-nettle.c.inc
new file mode 100644
index 0000000000..3516eba69f
--- /dev/null
+++ b/crypto/rsakey-nettle.c.inc
@@ -0,0 +1,141 @@
+/*
+ * QEMU Crypto akcipher algorithms
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: lei he <helei.sig11@bytedance.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include <nettle/asn1.h>
+#include <stdbool.h>
+
+#include "rsakey.h"
+
+static bool DumpMpi(struct asn1_der_iterator *i, QCryptoAkCipherMpi *mpi)
+{
+    mpi->data = g_memdup2(i->data, i->length);
+    mpi->len = i->length;
+    return true;
+}
+
+static bool GetMpi(struct asn1_der_iterator *i, QCryptoAkCipherMpi *mpi)
+{
+    if (asn1_der_iterator_next(i) != ASN1_ITERATOR_PRIMITIVE ||
+        i->type != ASN1_INTEGER) {
+        return false;
+    }
+    return DumpMpi(i, mpi);
+}
+
+
+/**
+ *        RsaPrivKey ::= SEQUENCE {
+ *             version     INTEGER
+ *             n           INTEGER
+ *             e           INTEGER
+ *             d           INTEGER
+ *             p           INTEGER
+ *             q           INTEGER
+ *             dp          INTEGER
+ *             dq          INTEGER
+ *             u           INTEGER
+ *       otherPrimeInfos   OtherPrimeInfos OPTIONAL
+ *         }
+ */
+QCryptoAkCipherRSAKey *qcrypto_akcipher_parse_rsa_private_key(
+    const uint8_t *key, size_t keylen)
+{
+    QCryptoAkCipherRSAKey *rsa = g_new0(QCryptoAkCipherRSAKey, 1);
+    struct asn1_der_iterator i;
+    uint32_t version;
+    int tag;
+
+    /* Parse entire struct */
+    if (asn1_der_iterator_first(&i, keylen, key) != ASN1_ITERATOR_CONSTRUCTED
+        || i.type != ASN1_SEQUENCE
+        || asn1_der_decode_constructed_last(&i) != ASN1_ITERATOR_PRIMITIVE
+        || i.type != ASN1_INTEGER
+        || !asn1_der_get_uint32(&i, &version)
+        || version > 1
+        || !GetMpi(&i, &rsa->n)
+        || !GetMpi(&i, &rsa->e)
+        || !GetMpi(&i, &rsa->d)
+        || !GetMpi(&i, &rsa->p)
+        || !GetMpi(&i, &rsa->q)
+        || !GetMpi(&i, &rsa->dp)
+        || !GetMpi(&i, &rsa->dq)
+        || !GetMpi(&i, &rsa->u)) {
+        goto err;
+    }
+
+    if (version == 1) {
+        tag = asn1_der_iterator_next(&i);
+        /**
+         * According to the standard otherPrimeInfos must be present for
+         * version 1. There is no strict verification here, this is to be
+         * compatible with the unit test of the kernel. TODO: remove this
+         * until linux-kernel's unit-test is fixed;
+         */
+        if (tag == ASN1_ITERATOR_END) {
+            return rsa;
+        }
+        if (tag != ASN1_ITERATOR_CONSTRUCTED ||
+            i.type != ASN1_SEQUENCE) {
+                goto err;
+        }
+    }
+
+    if (asn1_der_iterator_next(&i) != ASN1_ITERATOR_END) {
+        goto err;
+    }
+
+    return rsa;
+
+    /* fallthrough to err */
+err:
+    qcrypto_akcipher_free_rsa_key(rsa);
+    return NULL;
+}
+
+/**
+ *
+ *        RsaPubKey ::= SEQUENCE {
+ *             n           INTEGER
+ *             e           INTEGER
+ *         }
+ */
+QCryptoAkCipherRSAKey *qcrypto_akcipher_parse_rsa_public_key(
+    const uint8_t *key, size_t keylen)
+{
+
+    QCryptoAkCipherRSAKey *rsa = g_new0(QCryptoAkCipherRSAKey, 1);
+    struct asn1_der_iterator i;
+
+    if (asn1_der_iterator_first(&i, keylen, key) != ASN1_ITERATOR_CONSTRUCTED
+        || i.type != ASN1_SEQUENCE
+        || asn1_der_decode_constructed_last(&i) != ASN1_ITERATOR_PRIMITIVE
+        || !DumpMpi(&i, &rsa->n)
+        || !GetMpi(&i, &rsa->e)
+        || asn1_der_iterator_next(&i) != ASN1_ITERATOR_END) {
+        goto err;
+    }
+
+    return rsa;
+
+err:
+    qcrypto_akcipher_free_rsa_key(rsa);
+    return NULL;
+}
diff --git a/crypto/rsakey.c b/crypto/rsakey.c
new file mode 100644
index 0000000000..24704f6b9e
--- /dev/null
+++ b/crypto/rsakey.c
@@ -0,0 +1,43 @@
+/*
+ * QEMU Crypto RSA key parser
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: lei he <helei.sig11@bytedance.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "rsakey.h"
+
+void qcrypto_akcipher_free_rsa_key(QCryptoAkCipherRSAKey *rsa_key)
+{
+    if (!rsa_key) {
+        return;
+    }
+    g_free(rsa_key->n.data);
+    g_free(rsa_key->e.data);
+    g_free(rsa_key->d.data);
+    g_free(rsa_key->p.data);
+    g_free(rsa_key->q.data);
+    g_free(rsa_key->dp.data);
+    g_free(rsa_key->dq.data);
+    g_free(rsa_key->u.data);
+}
+
+#if defined(CONFIG_NETTLE) && defined(CONFIG_HOGWEED)
+#include "rsakey-nettle.c.inc"
+#else
+#include "rsakey-builtin.c.inc"
+#endif
diff --git a/crypto/rsakey.h b/crypto/rsakey.h
new file mode 100644
index 0000000000..6345b2222f
--- /dev/null
+++ b/crypto/rsakey.h
@@ -0,0 +1,96 @@
+/*
+ * QEMU Crypto RSA key parser
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: lei he <helei.sig11@bytedance.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#ifndef QCRYPTO_RSAKEY_H
+#define QCRYPTO_RSAKEY_H
+
+#include <nettle/bignum.h>
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "crypto/akcipher.h"
+
+typedef struct QCryptoAkCipherRSAKey QCryptoAkCipherRSAKey;
+typedef struct QCryptoAkCipherMpi QCryptoAkCipherMpi;
+
+/**
+ * Multiple precious integer, encoded as two' complement,
+ * copied directly from DER encoded ASN.1 structures.
+ */
+struct QCryptoAkCipherMpi {
+    uint8_t *data;
+    size_t len;
+};
+
+/* See rfc2437: https://datatracker.ietf.org/doc/html/rfc2437 */
+struct QCryptoAkCipherRSAKey {
+    /* The modulus */
+    QCryptoAkCipherMpi n;
+    /* The public exponent */
+    QCryptoAkCipherMpi e;
+    /* The private exponent */
+    QCryptoAkCipherMpi d;
+    /* The first factor */
+    QCryptoAkCipherMpi p;
+    /* The second factor */
+    QCryptoAkCipherMpi q;
+    /* The first factor's exponent */
+    QCryptoAkCipherMpi dp;
+    /* The second factor's exponent */
+    QCryptoAkCipherMpi dq;
+    /* The CRT coefficient */
+    QCryptoAkCipherMpi u;
+};
+
+/**
+ * Parse DER encoded ASN.1 RSA private key, expected ASN.1 schema:
+ *        RsaPrivKey ::= SEQUENCE {
+ *             version     INTEGER
+ *             n           INTEGER
+ *             e           INTEGER
+ *             d           INTEGER
+ *             p           INTEGER
+ *             q           INTEGER
+ *             dp          INTEGER
+ *             dq          INTEGER
+ *             u           INTEGER
+ *         }
+ *
+ * Return: On success QCryptoAkCipherRSAKey is returned, otherwise returns NULL
+ */
+QCryptoAkCipherRSAKey *qcrypto_akcipher_parse_rsa_private_key(
+    const uint8_t *key, size_t keylen);
+
+/**
+ * Parse DER encoded ASN.1 RSA public key, expected ASN.1 schema:
+ *        RsaPubKey ::= SEQUENCE {
+ *             n           INTEGER
+ *             e           INTEGER
+ *         }
+ *
+ * Return: On success QCryptoAkCipherRSAKey is returned, otherwise returns NULL
+ */
+QCryptoAkCipherRSAKey *qcrypto_akcipher_parse_rsa_public_key(
+    const uint8_t *key, size_t keylen);
+
+void qcrypto_akcipher_free_rsa_key(QCryptoAkCipherRSAKey *key);
+
+#endif
diff --git a/meson.build b/meson.build
index aef724ad3c..c1724eb33f 100644
--- a/meson.build
+++ b/meson.build
@@ -1049,6 +1049,7 @@ endif
 # gcrypt over nettle for performance reasons.
 gcrypt = not_found
 nettle = not_found
+hogweed = not_found
 xts = 'none'
 
 if get_option('nettle').enabled() and get_option('gcrypt').enabled()
@@ -1086,6 +1087,15 @@ if not gnutls_crypto.found()
   endif
 endif
 
+gmp = dependency('gmp', required: false, method: 'pkg-config', kwargs: static_kwargs)
+if nettle.found() and gmp.found()
+  hogweed = dependency('hogweed', version: '>=3.4',
+                       method: 'pkg-config',
+                       required: get_option('nettle'),
+                       kwargs: static_kwargs)
+endif
+
+
 gtk = not_found
 gtkx11 = not_found
 vte = not_found
@@ -1567,6 +1577,7 @@ config_host_data.set('CONFIG_GNUTLS', gnutls.found())
 config_host_data.set('CONFIG_GNUTLS_CRYPTO', gnutls_crypto.found())
 config_host_data.set('CONFIG_GCRYPT', gcrypt.found())
 config_host_data.set('CONFIG_NETTLE', nettle.found())
+config_host_data.set('CONFIG_HOGWEED', hogweed.found())
 config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts == 'private')
 config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
 config_host_data.set('CONFIG_STATX', has_statx)
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
