Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D3C526DAD
	for <lists.virtualization@lfdr.de>; Sat, 14 May 2022 02:59:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D49C860E46;
	Sat, 14 May 2022 00:59:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jwvd_vgau_WV; Sat, 14 May 2022 00:59:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A52D760DE5;
	Sat, 14 May 2022 00:59:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21A5EC002D;
	Sat, 14 May 2022 00:59:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 766FCC002D
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 May 2022 00:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ED1040528
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 May 2022 00:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u0gbgCejGljY
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 May 2022 00:59:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B10F40586
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 May 2022 00:59:36 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id x12so8945901pgj.7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 May 2022 17:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4wKHvsZdlcUOAB8OYLSmGi+FUUX/vTDariGg8ZGhdrA=;
 b=DFk1fb3ZwxVODS5cwFG83yUCW4af3Gl53t1Rbo19vYBXWhNJCnigVBnXJ4aW1yq4Rx
 JaQC1x1Xn6vQapfwQyPfpP46Q6N/chd6uGHU86XDJHXtNq0DXqSz3pzzDeTqqjs51Ryz
 N0Wqfhy7uxve9nIfsanHfJkkDuWieL9F9MvCCLyIav5fKlRv2AcXVqHcThB7Vxs6HD+9
 +CwOGGlF8IPbx+zxkNzKkLvVoiEp82NGFy6GwoxMjWwnbIyJ1IdCAD5tHrnumwbEwsEE
 7CHRsD2jOHPYCg19Q5fnk3VdbEi0Rv6J8BXGJV37fUkyCF3RklFj40vTR4T6bKji8PIa
 dNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4wKHvsZdlcUOAB8OYLSmGi+FUUX/vTDariGg8ZGhdrA=;
 b=P+7QvL8o4mqmy/FEhstrqySfmNLnx5FSgEBxKVTC1fqnF5dpDI7b5xvNobMY0ejUfD
 q5MrbMPDMjaphVcERYcCd3TKBkm9xIKqb3YtONRkWbGOXHwCpm3FImijGS8obIUofwLO
 iY/srC4mj5CQdL/YXtRpsc7KH0gFW+ufsAlKrreqti4VZxiAez6gbBPBRXYMkUtRlZvt
 E+1Ech2N3IbX2/yWHWzAw9cYC9rK7I6JIwTNHr/QryX3J9dc0oKrngnpIMGHBTfcBItD
 WqINHUxPfkqRRkKA0SoSP3XHUjFRTFkek6rs2uBOtM5qeKKXN7coIJx5wEqHHZurPtnP
 KvBw==
X-Gm-Message-State: AOAM530clQCop4pWkw2RR2WGkBOpYKtYAA1cBe1HSYVgrlGI0/gExluV
 TmlpdDPvKWGFEfnGb0jWYGWpVw==
X-Google-Smtp-Source: ABdhPJyH4xv4tV756D/j9qjUY6ouuY49Z5kmA0lIlmrIXXSYzIl7HQICnfM3TQoK+Sz4aAIJglav3A==
X-Received: by 2002:a63:fa4b:0:b0:3db:b85:c080 with SMTP id
 g11-20020a63fa4b000000b003db0b85c080mr6073805pgk.465.1652489975590; 
 Fri, 13 May 2022 17:59:35 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.239])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a170902b21800b0015e8d4eb1dbsm2466125plr.37.2022.05.13.17.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 17:59:35 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Subject: [PATCH v6 4/9] crypto: add ASN.1 DER decoder
Date: Sat, 14 May 2022 08:54:59 +0800
Message-Id: <20220514005504.1042884-5-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220514005504.1042884-1-pizhenwei@bytedance.com>
References: <20220514005504.1042884-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Cc: helei.sig11@bytedance.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pizhenwei@bytedance.com, virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org
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

Add an ANS.1 DER decoder which is used to parse asymmetric
cipher keys

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Signed-off-by: lei he <helei.sig11@bytedance.com>
---
 crypto/der.c                 | 189 +++++++++++++++++++++++
 crypto/der.h                 |  81 ++++++++++
 crypto/meson.build           |   1 +
 tests/unit/meson.build       |   1 +
 tests/unit/test-crypto-der.c | 290 +++++++++++++++++++++++++++++++++++
 5 files changed, 562 insertions(+)
 create mode 100644 crypto/der.c
 create mode 100644 crypto/der.h
 create mode 100644 tests/unit/test-crypto-der.c

diff --git a/crypto/der.c b/crypto/der.c
new file mode 100644
index 0000000000..721bbb3317
--- /dev/null
+++ b/crypto/der.c
@@ -0,0 +1,189 @@
+/*
+ * QEMU Crypto ASN.1 DER decoder
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
+#include "qemu/osdep.h"
+#include "crypto/der.h"
+
+enum QCryptoDERTypeTag {
+    QCRYPTO_DER_TYPE_TAG_BOOL = 0x1,
+    QCRYPTO_DER_TYPE_TAG_INT = 0x2,
+    QCRYPTO_DER_TYPE_TAG_BIT_STR = 0x3,
+    QCRYPTO_DER_TYPE_TAG_OCT_STR = 0x4,
+    QCRYPTO_DER_TYPE_TAG_OCT_NULL = 0x5,
+    QCRYPTO_DER_TYPE_TAG_OCT_OID = 0x6,
+    QCRYPTO_DER_TYPE_TAG_SEQ = 0x10,
+    QCRYPTO_DER_TYPE_TAG_SET = 0x11,
+};
+
+#define QCRYPTO_DER_CONSTRUCTED_MASK 0x20
+#define QCRYPTO_DER_SHORT_LEN_MASK 0x80
+
+static uint8_t qcrypto_der_peek_byte(const uint8_t **data, size_t *dlen)
+{
+    return **data;
+}
+
+static void qcrypto_der_cut_nbytes(const uint8_t **data,
+                                   size_t *dlen,
+                                   size_t nbytes)
+{
+    *data += nbytes;
+    *dlen -= nbytes;
+}
+
+static uint8_t qcrypto_der_cut_byte(const uint8_t **data, size_t *dlen)
+{
+    uint8_t val = qcrypto_der_peek_byte(data, dlen);
+
+    qcrypto_der_cut_nbytes(data, dlen, 1);
+
+    return val;
+}
+
+static int qcrypto_der_invoke_callback(QCryptoDERDecodeCb cb, void *ctx,
+                                       const uint8_t *value, size_t vlen,
+                                       Error **errp)
+{
+    if (!cb) {
+        return 0;
+    }
+
+    return cb(ctx, value, vlen, errp);
+}
+
+static int qcrypto_der_extract_definite_data(const uint8_t **data, size_t *dlen,
+                                             QCryptoDERDecodeCb cb, void *ctx,
+                                             Error **errp)
+{
+    const uint8_t *value;
+    size_t vlen = 0;
+    uint8_t byte_count = qcrypto_der_cut_byte(data, dlen);
+
+    /* short format of definite-length */
+    if (!(byte_count & QCRYPTO_DER_SHORT_LEN_MASK)) {
+        if (byte_count > *dlen) {
+            error_setg(errp, "Invalid content length: %u", byte_count);
+            return -1;
+        }
+
+        value = *data;
+        vlen = byte_count;
+        qcrypto_der_cut_nbytes(data, dlen, vlen);
+
+        if (qcrypto_der_invoke_callback(cb, ctx, value, vlen, errp) != 0) {
+            return -1;
+        }
+        return vlen;
+    }
+
+    /* Ignore highest bit */
+    byte_count &= ~QCRYPTO_DER_SHORT_LEN_MASK;
+
+    /*
+     * size_t is enough to store the value of length, although the DER
+     * encoding standard supports larger length.
+     */
+    if (byte_count > sizeof(size_t)) {
+        error_setg(errp, "Invalid byte count of content length: %u",
+                   byte_count);
+        return -1;
+    }
+
+    if (byte_count > *dlen) {
+        error_setg(errp, "Invalid content length: %u", byte_count);
+        return -1;
+    }
+    while (byte_count--) {
+        vlen <<= 8;
+        vlen += qcrypto_der_cut_byte(data, dlen);
+    }
+
+    if (vlen > *dlen) {
+        error_setg(errp, "Invalid content length: %lu", vlen);
+        return -1;
+    }
+
+    value = *data;
+    qcrypto_der_cut_nbytes(data, dlen, vlen);
+
+    if (qcrypto_der_invoke_callback(cb, ctx, value, vlen, errp) != 0) {
+        return -1;
+    }
+    return vlen;
+}
+
+static int qcrypto_der_extract_data(const uint8_t **data, size_t *dlen,
+                                    QCryptoDERDecodeCb cb, void *ctx,
+                                    Error **errp)
+{
+    uint8_t val;
+    if (*dlen < 1) {
+        error_setg(errp, "Need more data");
+        return -1;
+    }
+    val = qcrypto_der_peek_byte(data, dlen);
+
+    /* must use definite length format */
+    if (val == QCRYPTO_DER_SHORT_LEN_MASK) {
+        error_setg(errp, "Only definite length format is allowed");
+        return -1;
+    }
+
+    return qcrypto_der_extract_definite_data(data, dlen, cb, ctx, errp);
+}
+
+int qcrypto_der_decode_int(const uint8_t **data, size_t *dlen,
+                           QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+{
+    uint8_t tag;
+    if (*dlen < 1) {
+        error_setg(errp, "Need more data");
+        return -1;
+    }
+    tag = qcrypto_der_cut_byte(data, dlen);
+
+    /* INTEGER must encoded in primitive-form */
+    if (tag != QCRYPTO_DER_TYPE_TAG_INT) {
+        error_setg(errp, "Invalid integer type tag: %u", tag);
+        return -1;
+    }
+
+    return qcrypto_der_extract_data(data, dlen, cb, ctx, errp);
+}
+
+int qcrypto_der_decode_seq(const uint8_t **data, size_t *dlen,
+                           QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+{
+    uint8_t tag;
+    if (*dlen < 1) {
+        error_setg(errp, "Need more data");
+        return -1;
+    }
+    tag = qcrypto_der_cut_byte(data, dlen);
+
+    /* SEQUENCE must use constructed form */
+    if (tag != (QCRYPTO_DER_TYPE_TAG_SEQ | QCRYPTO_DER_CONSTRUCTED_MASK)) {
+        error_setg(errp, "Invalid type sequence tag: %u", tag);
+        return -1;
+    }
+
+    return qcrypto_der_extract_data(data, dlen, cb, ctx, errp);
+}
diff --git a/crypto/der.h b/crypto/der.h
new file mode 100644
index 0000000000..e3d3aeacdc
--- /dev/null
+++ b/crypto/der.h
@@ -0,0 +1,81 @@
+/*
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
+#ifndef QCRYPTO_ASN1_DECODER_H
+#define QCRYPTO_ASN1_DECODER_H
+
+#include "qapi/error.h"
+
+/* Simple decoder used to parse DER encoded rsa keys. */
+
+/**
+ *  @opaque: user context.
+ *  @value: the starting address of |value| part of 'Tag-Length-Value' pattern.
+ *  @vlen: length of the |value|.
+ *  Returns: 0 for success, any other value is considered an error.
+ */
+typedef int (*QCryptoDERDecodeCb) (void *opaque, const uint8_t *value,
+                                   size_t vlen, Error **errp);
+
+/**
+ * qcrypto_der_decode_int:
+ * @data: pointer to address of input data
+ * @dlen: pointer to length of input data
+ * @cb: callback invoked when decode succeed, if cb equals NULL, no
+ * callback will be invoked
+ * @opaque: parameter passed to cb
+ *
+ * Decode integer from DER-encoded data.
+ *
+ * Returns: On success, *data points to rest data, and *dlen
+ * will be set to the rest length of data, if cb is not NULL, must
+ * return 0 to make decode success, at last, the length of the data
+ * part of the decoded INTEGER will be returned. Otherwise, -1 is
+ * returned.
+ */
+int qcrypto_der_decode_int(const uint8_t **data,
+                           size_t *dlen,
+                           QCryptoDERDecodeCb cb,
+                           void *opaque,
+                           Error **errp);
+
+/**
+ * qcrypto_der_decode_seq:
+ *
+ * Decode sequence from DER-encoded data, similar with der_decode_int.
+ *
+ * @data: pointer to address of input data
+ * @dlen: pointer to length of input data
+ * @cb: callback invoked when decode succeed, if cb equals NULL, no
+ * callback will be invoked
+ * @opaque: parameter passed to cb
+ *
+ * Returns: On success, *data points to rest data, and *dlen
+ * will be set to the rest length of data, if cb is not NULL, must
+ * return 0 to make decode success, at last, the length of the data
+ * part of the decoded SEQUENCE will be returned. Otherwise, -1 is
+ * returned.
+ */
+int qcrypto_der_decode_seq(const uint8_t **data,
+                           size_t *dlen,
+                           QCryptoDERDecodeCb cb,
+                           void *opaque,
+                           Error **errp);
+
+#endif  /* QCRYPTO_ASN1_DECODER_H */
diff --git a/crypto/meson.build b/crypto/meson.build
index 313f935f27..b8152ae7cb 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -6,6 +6,7 @@ crypto_ss.add(files(
   'block-qcow.c',
   'block.c',
   'cipher.c',
+  'der.c',
   'hash.c',
   'hmac.c',
   'ivgen-essiv.c',
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 264f2bc0c8..a8af85128d 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -47,6 +47,7 @@ tests = {
   'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
   'test-qapi-util': [],
   'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
+  'test-crypto-der': [crypto],
 }
 
 if have_system or have_tools
diff --git a/tests/unit/test-crypto-der.c b/tests/unit/test-crypto-der.c
new file mode 100644
index 0000000000..aed0f28d68
--- /dev/null
+++ b/tests/unit/test-crypto-der.c
@@ -0,0 +1,290 @@
+/*
+ * QEMU Crypto akcipher algorithms
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: lei he <helei@bytedance.com>
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
+#include "qemu/osdep.h"
+#include "crypto/der.h"
+
+/* rsa(512) private key, generated by openssl */
+static const uint8_t test_rsa512_priv_key[] =
+    "\x30\x82\x01\x39"      /* SEQUENCE, offset: 0, length: 313 */
+    "\x02\x01\x00"          /* INTEGER, offset: 4, length: 1 */
+    "\x02\x41"              /* INTEGER, offset: 7, length: 65 */
+    "\x00\xb9\xe1\x22\xdb\x56\x2f\xb6\xf7\xf0\x0a\x87\x43\x07\x12\xdb"
+    "\x6d\xb6\x2b\x41\x8d\x2c\x3c\xa5\xdd\x78\x9a\x8f\xab\x8e\xf2\x4a"
+    "\xc8\x34\x0c\x12\x4f\x11\x90\xc6\xc2\xa5\xd0\xcd\xfb\xfc\x2c\x95"
+    "\x56\x82\xdf\x39\xf3\x3b\x1d\x62\x26\x97\xb7\x93\x25\xc7\xec\x7e"
+    "\xf7"
+    "\x02\x03\x01\x00\x01"  /* INTEGER, offset: 74, length: 3 */
+    "\x02\x40"              /* INTEGER, offset: 79, length: 64 */
+    "\x1e\x80\xfe\xda\x65\xdb\x70\xb8\x61\x91\x28\xbf\x6c\x32\xc1\x05"
+    "\xd1\x26\x6a\x1c\x83\xcc\xf4\x1f\x53\x42\x72\x1f\x62\x57\x0a\xc4"
+    "\x66\x76\x30\x87\xb9\xb1\xb9\x6a\x63\xfd\x8f\x3e\xfc\x35\x3f\xd6"
+    "\x2e\x6c\xc8\x70\x8a\x17\xc1\x28\x6a\xfe\x51\x56\xb3\x92\x6f\x09"
+    "\x02\x21"              /* INTEGER, offset: 145, length: 33 */
+    "\x00\xe3\x2e\x2d\x8d\xba\x1c\x34\x4c\x49\x9f\xc1\xa6\xdd\xd7\x13"
+    "\x8d\x05\x48\xdd\xff\x5c\x30\xbc\x6b\xc4\x18\x9d\xfc\xa2\xd0\x9b"
+    "\x4d"
+    "\x02\x21"             /* INTEGER, offset: 180, length: 33 */
+    "\x00\xd1\x75\xaf\x4b\xc6\x1a\xb0\x98\x14\x42\xae\x33\xf3\x44\xde"
+    "\x21\xcb\x04\xda\xfb\x1e\x35\x92\xcd\x69\xc0\x83\x06\x83\x8e\x39"
+    "\x53"
+    "\x02\x20"             /* INTEGER, offset: 215, length: 32 */
+    "\x68\x8d\x2a\xf7\xcb\xcc\x09\x21\x86\xcc\x98\x21\xc4\x7c\xa4\x09"
+    "\xc5\x81\xd8\x71\x1a\x2b\x6f\xbb\xa4\xde\xb3\x6e\xbe\x3b\x85\x0d"
+    "\x02\x20"             /* INTEGER, offset: 249, length: 32 */
+    "\x64\x06\x0e\xef\xe0\x6a\x5e\x6a\x41\x42\x96\x6d\xb8\x7d\xea\x95"
+    "\xb8\x9d\x58\xf5\x12\x38\x03\x22\x94\x9d\x99\xf4\x42\x5e\x68\x81"
+    "\x02\x20"             /* INTEGER, offset: 283, length: 32 */
+    "\x7f\x1d\x87\xe8\x55\x30\x75\xc7\x29\xec\xc9\x65\x76\x5a\x6a\xa3"
+    "\x4a\x6e\xe1\x26\x65\xd1\x76\xd5\xb9\xd1\x8b\xa8\x73\xe2\x6a\x9e";
+
+static const uint8_t test_rsa2048_priv_key[] =
+    "\x30\x82\x04\xa6"          /* SEQUENCE, offset: 0, length 1190 */
+    "\x02\x01\x00"              /* INTEGER, offset: 4, length: 1 */
+    "\x02\x82\x01\x01"          /* INTEGER, offset: 7, length: 257 */
+    "\x00\xd1\x48\xc2\xc1\x1d\x4f\x94\xf2\xbb\x9b\xe2\x2d\xe1\xea\x4c"
+    "\xce\x41\x72\xe3\x41\x7e\x9d\x91\x85\xa3\x4e\xe1\x2c\xf6\x52\x6d"
+    "\xf9\x84\x64\xdf\x87\x28\x4a\xc9\x9d\x78\x93\x47\xc8\xd9\x66\x2e"
+    "\xf4\xc6\xf0\x32\x15\x1a\xe8\xaf\x5a\xca\x3a\xd3\x3e\xf6\xde\x86"
+    "\xdd\x9b\xa6\x4d\x74\x58\xf0\x11\x7f\x66\xd5\x1c\xd8\xde\xa3\xf8"
+    "\xa3\xfc\x33\x55\x89\xa9\xc3\xea\x5b\x2e\x31\x06\xf8\xcb\x9e\x6e"
+    "\xb2\x68\x0d\xe6\xc3\x5c\x2d\xf8\xa2\xbd\x00\x1a\xf6\xb6\xdd\x14"
+    "\x8d\x11\x6d\x2d\xc6\x0c\x09\xe6\xf6\xb9\x8b\x87\x4c\x9f\x4d\x63"
+    "\xd3\x94\xf4\x32\xca\xcf\x5e\xbf\xe2\x7f\x73\x5a\x65\xec\x82\x0d"
+    "\x7f\x30\x25\x03\xd4\x3a\xff\xa2\xe8\xd6\xb5\x1f\x4f\x36\x64\x61"
+    "\xc3\x5f\xb2\x9e\x0c\x53\x04\x19\x34\x99\xe8\xe3\xe6\xd3\x2f\x45"
+    "\x58\x8e\x5d\x54\x5a\xa0\xc0\x5e\x51\x9b\x22\x15\xec\x26\x6f\x72"
+    "\x68\xe9\xbf\x5d\x1d\xb5\xd9\xe4\x81\x1a\x92\x66\xa8\xcb\x73\x46"
+    "\xab\x96\x7b\xf8\x9c\xf5\xb5\x9e\x2b\x13\x71\xe0\x01\x0c\x59\x1b"
+    "\x63\x9f\xb7\xd1\xcd\x47\x8e\xc7\x3a\xbe\xcb\x47\xa7\x23\x43\xa7"
+    "\x7d\xbd\x2c\x4e\x22\x37\xcc\xf9\x1b\x1b\xbb\xed\xec\xf0\x47\x92"
+    "\x43"
+    "\x02\x03\x01\x00\x01"      /* INTEGER, offset 268, length 3 */
+    "\x02\x82\x01\x01"          /* INTEGER, offset 273, length 257 */
+    "\x00\x8d\x21\x97\x0c\x29\x9a\xf8\x23\xf4\x76\x3b\xc1\x9b\x3e\xa8"
+    "\x8a\xd2\xc2\x0a\x14\xa9\xb0\xd2\x68\x9f\x67\x5b\x1c\x3a\x03\xfe"
+    "\x5b\xac\x77\x65\xf1\xbc\x2f\x2a\xe5\x01\x61\xb8\x9f\xee\x53\x25"
+    "\x49\x36\x3a\xd6\x5b\x3b\x29\x3c\xcf\x69\xde\xdf\x83\xef\x70\xc2"
+    "\xdc\x00\xd1\xd6\x1b\xa6\xba\x45\xe2\x77\x53\x31\xbf\xe1\xec\x0b"
+    "\x89\x72\x52\x9f\xd5\x54\xe1\x64\x52\x16\xc5\x43\x21\x56\x16\xc2"
+    "\x29\x97\x58\x00\x8d\x2f\xc5\x64\x8d\x42\x0d\x27\x21\xc6\xd1\x31"
+    "\xc1\xab\xc5\xc7\x7f\x6d\xb0\xe3\xca\xef\xf6\xf2\xc7\xae\x09\xbf"
+    "\x4d\xc0\x4e\x90\x2c\x28\xb9\xcc\x22\x74\xf2\xd5\xff\x4d\x86\xf6"
+    "\xec\x45\x1f\xbf\x25\x4c\x30\x26\x76\x4f\x09\x13\x83\xef\x35\x73"
+    "\xa3\xa2\xb1\x40\xcf\x07\x7a\x83\xae\xea\x00\xea\x74\xc7\x54\x6a"
+    "\x88\x19\xed\x35\xd3\x7e\x5e\xac\x51\xc1\x1e\x5e\x2c\x57\x72\x20"
+    "\x10\x6a\x0c\x47\xe1\xf0\x36\x70\xd2\xa7\x57\x64\x47\x46\x9f\xca"
+    "\x23\x8a\x48\x50\x1d\x33\x6a\x86\x46\x69\xed\x54\x65\x6b\x9e\xab"
+    "\x1f\x84\x87\xf4\x92\x8a\x6c\x44\x20\xaa\x8d\xd8\x50\xde\x45\x74"
+    "\xe0\xa8\xc7\xb9\x38\x74\x24\x51\x33\xf0\x39\x54\x6c\x11\xae\xc2"
+    "\x29"
+    "\x02\x81\x81"              /* INTEGER, offset 534, length 129 */
+    "\x00\xe8\x26\xd1\xf9\xa0\xd3\x0e\x3f\x2f\x89\x9b\x94\x16\x12\xd1"
+    "\xae\x3c\x53\x9c\xcf\xc6\xf7\x03\xf5\xdf\x39\xdc\x25\x5d\xcb\xb8"
+    "\xb9\x74\x3e\x3b\x36\xf6\xa0\x8d\xb1\x0e\xd8\xfe\x8c\xcd\x01\x13"
+    "\x77\x73\x08\x0f\x32\xbd\xe6\x95\xdc\xd0\x14\x7d\x44\xdc\x3e\xd9"
+    "\xaa\x8a\x32\xe6\x0e\x76\xb6\x05\xc5\x6b\x87\x78\x9a\x32\xe2\xf8"
+    "\x78\xba\x58\x75\x58\xd5\x26\x9d\x9a\x0f\xb6\xca\xb5\x27\xd8\x58"
+    "\xae\x3f\x49\x54\xd2\x2b\xac\x28\x39\x88\x31\x42\x12\x08\xea\x0b"
+    "\x39\x58\xae\xf3\x82\xa0\xe2\x75\x7c\x96\xa9\xb8\x57\x29\x6d\xd7"
+    "\x37"
+    "\x02\x81\x81"              /* INTEGER, offset 666, length 129 */
+    "\x00\xe6\xc8\x91\x50\x49\x97\x56\x70\x6e\x25\xf5\x77\x25\xa5\x41"
+    "\xfe\xd7\x25\x1b\xc1\x4a\xff\x37\x44\x2b\x46\xa0\xdf\xe8\x02\x09"
+    "\xdd\xa8\x41\xa1\x12\x84\x3c\xf8\xc2\x13\x3e\xb8\x4b\x22\x01\xac"
+    "\xa6\x09\xb2\xe9\xcd\xc8\x51\xee\xde\xa3\x1e\x6b\xfe\xb1\xf8\xb6"
+    "\x9e\x48\x36\x62\x0b\x05\xfa\x38\xc1\x06\x04\x58\x95\x4d\x25\x13"
+    "\x6d\x0b\x12\x0b\xc9\x6d\x59\xfc\x33\x03\x36\x01\x12\x09\x72\x74"
+    "\x5e\x98\x65\x66\x2f\x3a\xde\xd8\xd4\xee\x6f\x82\xe6\x36\x49\x12"
+    "\x6a\x94\x28\xe9\x28\x9e\xef\x29\xdc\xdf\xab\x94\x65\x02\x4e\x4b"
+    "\x55"
+    "\x02\x81\x81"              /* INTEGER, offset 798, length 129 */
+    "\x00\xc9\xda\xb7\x48\x6e\x66\x15\x45\x2b\x78\x63\x26\x67\xeb\x05"
+    "\x16\x92\xad\xc0\xf3\x88\xf4\xcf\x24\xc2\x6b\xf4\xd7\x28\xaf\x32"
+    "\x77\x4e\x73\xad\xd9\x24\xa8\x85\x8b\x26\x75\xd7\x1f\x66\x41\x41"
+    "\x43\xe3\x69\x66\x8d\xa0\x41\x16\x9d\x60\xef\xef\xdc\x28\x05\x1e"
+    "\x0e\x03\x0c\x2e\xac\xf4\xdb\x60\x39\x40\x3e\x12\xc7\x40\xe7\xc9"
+    "\x54\x6f\xf2\xea\x55\xcb\x40\x40\x58\xec\xc0\xeb\x90\x88\x8c\xbc"
+    "\xcf\x05\x88\x25\x90\x79\x18\xc0\x01\x06\x42\x8e\x48\x50\x27\xf0"
+    "\x8a\x74\x69\xea\xa1\xf2\x71\xf5\xe5\xd6\xba\xcb\xe6\x3d\xc7\x9c"
+    "\x11"
+     "\x02\x81\x81"              /* INTEGER, offset 930, length 129 */
+    "\x00\xc9\xf5\x04\xad\x34\xe9\x39\xdc\x83\x97\xb6\x3a\x40\xf8\x60"
+    "\x4b\x69\xec\xf0\x5f\xf3\x88\x69\xcd\xbe\xed\x3c\xc5\x14\x5c\x0c"
+    "\x54\x2b\xf4\xda\xc6\xc0\x70\x36\xe4\x67\x41\x00\xb7\xc7\x17\x9e"
+    "\x05\x63\x01\x6d\x77\x06\x71\x24\xcf\x32\x01\xe2\x51\xed\x5e\x90"
+    "\x38\xed\x4a\xa1\xfb\xb1\x8c\x69\xf4\x08\x96\xef\x0a\x20\x8b\x6c"
+    "\x77\x85\x33\x92\x9a\xff\x95\xba\x8c\xcd\xa7\x89\xc2\x46\x00\x21"
+    "\xf3\xd1\xfb\x12\x34\x0c\x99\x8d\x38\xb1\x3b\x66\x5a\x9d\x70\xce"
+    "\xab\xf3\xe1\xe5\x40\x05\xed\x97\x3d\xd1\x82\x6e\x07\x02\xc0\x8f"
+    "\x4d"
+    "\x02\x81\x81"              /* INTEGER, offset 1062, length 129 */
+    "\x00\xe4\x96\x79\xa8\x6a\x70\xdd\x67\x42\xff\x15\x11\x9e\x01\x71"
+    "\xac\xf1\x70\x7d\x87\xe2\x6e\x0c\x4d\xbb\x21\x15\xbb\xa7\x4e\x0c"
+    "\x09\x7e\x82\xca\x91\xbe\xd0\xdd\x9c\x8c\xb0\x77\x64\x30\x1b\x7e"
+    "\xbb\x69\xcb\x4c\xde\xd6\x6a\xb9\x72\x15\x79\xdc\x05\x99\x69\x8b"
+    "\x24\xa1\xad\x13\x35\x31\xc0\x0b\xf1\xd2\x06\x7c\x94\x1a\x21\x2f"
+    "\x02\xb9\xf0\xd0\xbb\xf7\xb7\x78\xf9\x3d\x76\x60\xd6\x6b\x5f\x35"
+    "\x88\x14\x33\xe6\xbc\xca\x6b\x88\x90\x57\x3b\x0c\xa3\x6e\x47\xdf"
+    "\x4e\x2f\x4c\xf9\xab\x97\x38\xe4\x20\x32\x32\x96\xc8\x9e\x79\xd3"
+    "\x12";
+
+#define MAX_CHECKER_COUNT 32
+
+typedef struct QCryptoAns1DecoderResultChecker QCryptoAns1DecoderResultChecker;
+struct QCryptoAns1DecoderResultChecker {
+    int (*action) (const uint8_t **data, size_t *dlen,
+                   QCryptoDERDecodeCb cb, void *opaque, Error **errp);
+    QCryptoDERDecodeCb cb;
+    const uint8_t *exp_value;
+    size_t exp_vlen;
+};
+
+typedef struct QCryptoAns1DecoderTestData QCryptoAns1DecoderTestData;
+struct QCryptoAns1DecoderTestData {
+    const char *path;
+    const uint8_t *test_data;
+    size_t test_data_len;
+    QCryptoAns1DecoderResultChecker checker[MAX_CHECKER_COUNT];
+};
+
+typedef struct QCryptoAns1DecoderTestContext QCryptoAns1DecoderTestContext;
+struct QCryptoAns1DecoderTestContext {
+    const uint8_t *data;
+    size_t dlen;
+};
+
+static int checker_callback(void *opaque, const uint8_t *value,
+                            size_t vlen, Error **errp)
+{
+    QCryptoAns1DecoderResultChecker *checker =
+        (QCryptoAns1DecoderResultChecker *)opaque;
+
+    g_assert(value == checker->exp_value);
+    g_assert(vlen == checker->exp_vlen);
+    return 0;
+}
+
+static void test_ans1(const void *opaque)
+{
+    const QCryptoAns1DecoderTestData *test_data =
+        (QCryptoAns1DecoderTestData *)opaque;
+    QCryptoAns1DecoderTestContext ctx[MAX_CHECKER_COUNT];
+    int seq_depth = 0, checker_idx = 0;
+    ctx[seq_depth].data = test_data->test_data;
+    ctx[seq_depth].dlen = test_data->test_data_len;
+    bool all_checker_completed = false;
+
+    do {
+        const QCryptoAns1DecoderResultChecker *checker =
+            &test_data->checker[checker_idx++];
+        QCryptoAns1DecoderTestContext *c = &ctx[seq_depth];
+        if (!checker->action) {
+            all_checker_completed = true;
+            break;
+        }
+        g_assert(checker->action(&c->data, &c->dlen, checker_callback,
+                                 (void *)checker, &error_abort)
+            == checker->exp_vlen);
+        if (checker->action == qcrypto_der_decode_seq) {
+            ++seq_depth;
+            ctx[seq_depth].data = checker->exp_value;
+            ctx[seq_depth].dlen = checker->exp_vlen;
+        }
+        while (seq_depth != 0 && ctx[seq_depth].dlen == 0) {
+            --seq_depth;
+        }
+
+    } while (true);
+    g_assert(seq_depth == 0);
+    g_assert(ctx[seq_depth].dlen == 0);
+    g_assert(all_checker_completed);
+}
+
+static QCryptoAns1DecoderTestData test_data[] = {
+{
+    .path = "/crypto/der/parse-rsa512-priv-key",
+    .test_data = test_rsa512_priv_key,
+    .test_data_len = sizeof(test_rsa512_priv_key) - 1,
+    .checker = {
+        { qcrypto_der_decode_seq, checker_callback,
+          test_rsa512_priv_key + 4, 313 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa512_priv_key + 4 + 2, 1 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa512_priv_key + 7 + 2, 65 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa512_priv_key + 74 + 2, 3 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa512_priv_key + 79 + 2, 64 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa512_priv_key + 145 + 2, 33 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa512_priv_key + 180 + 2, 33 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa512_priv_key + 215 + 2, 32 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa512_priv_key + 249 + 2, 32 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa512_priv_key + 283 + 2, 32 },
+    },
+},
+{
+    .path = "/crypto/der/parse-rsa2048-priv-key",
+    .test_data = test_rsa2048_priv_key,
+    .test_data_len = sizeof(test_rsa2048_priv_key) - 1,
+    .checker = {
+        { qcrypto_der_decode_seq, checker_callback,
+          test_rsa2048_priv_key + 4, 1190 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa2048_priv_key + 4 + 2, 1 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa2048_priv_key + 7 + 4, 257 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa2048_priv_key + 268 + 2, 3 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa2048_priv_key + 273 + 4, 257 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa2048_priv_key + 534 + 3, 129 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa2048_priv_key + 666 + 3, 129 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa2048_priv_key + 798 + 3, 129 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa2048_priv_key + 930 + 3, 129 },
+        { qcrypto_der_decode_int, checker_callback,
+          test_rsa2048_priv_key + 1062 + 3, 129 },
+    },
+},
+
+};
+
+int main(int argc, char **argv)
+{
+    size_t i;
+    g_test_init(&argc, &argv, NULL);
+
+    for (i = 0; i < G_N_ELEMENTS(test_data); i++) {
+        g_test_add_data_func(test_data[i].path, &test_data[i], test_ans1);
+    }
+
+    return g_test_run();
+}
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
