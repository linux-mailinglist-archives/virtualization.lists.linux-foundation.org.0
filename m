Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C3FD628A
	for <lists.virtualization@lfdr.de>; Mon, 14 Oct 2019 14:29:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E2FF62940;
	Mon, 14 Oct 2019 12:29:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C00662931
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 12:19:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F254F8A9
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 12:19:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j18so19456756wrq.10
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 05:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=n1CZfuSwOBWiTJLsXGGXKsTYggjtyZaieumQoTW6nsw=;
	b=WQDpJP0AB2+YAQR1rinmfn2OHo20KqKocZkKU1P4qbhMNSqnEQxDm7ujDtekTGWoKg
	iAbuFNCd7tNmXbdKJX/sQIpUbX06YbYtmwjKKZ3WZ922rxEvoe509/iRhkeFegq2XU+c
	IWfX6G9vZULPAHKXRvwYvuAq+JWfw+Cg0qn5gTclmfQd7d2jOLvBLptWubPpSGrPuJtm
	MyKVwdi30mvGTTs/ZDV4HKJRklkhKJoE5lqO9h85PuH6siyR4oBfyBHLdVyvcJMpgWSj
	wk2N1Fq9cHSSberQMlsNRrCGweZ3ZGhJUzYCN5i5C50rx1IkrHVOp1M4Y8HDMpyanxtd
	Poww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=n1CZfuSwOBWiTJLsXGGXKsTYggjtyZaieumQoTW6nsw=;
	b=WgG9MykPqyYio0Zsdmezn1Sum3r5qnQiCfGb5++53YHNOcGYUE0k2jWa9jOkVslZ9j
	3MRArQEPW5nK6DZPwZYREGxMxQLvkjzhRI/fIcjtY+xb4eflrTxqY5DTfp+lfnUekvas
	S9HCkc2ds7ZqyMg7/TFU3uM59k1CDfTvzWok7y7gZFzNU3goV4o76PVx8rWJfYVFXTul
	6xGu5tCillMLp3G2SQxpFD6dJH+oSSJd75rMijSLY2bPeAXCo3zUoX3pyPENoJ+LiXxS
	1iWXghCkBHAGpZYDhKyRdeFtvmuLeEGzB5oo5bg9Shd+X1UUhwdrgf/CMUmaMRJSMEPi
	IEtg==
X-Gm-Message-State: APjAAAWl0BCU28FCdnXjIGw/HeXc6ViV5Qj64H+zUkGG/pcdAWvM+qxe
	ctzRYilv3ovcMzbWn9Jn3OCGIQ==
X-Google-Smtp-Source: APXvYqzoEtqODKLCo2JUzVBBzE0BRowy8qYR0MKr1lrYu5U8xeIZMidm7JD1uPc3S36eCeyM0gJb8Q==
X-Received: by 2002:adf:dbcf:: with SMTP id e15mr26156311wrj.134.1571055579522;
	Mon, 14 Oct 2019 05:19:39 -0700 (PDT)
Received: from localhost.localdomain (91-167-84-221.subs.proxad.net.
	[91.167.84.221]) by smtp.gmail.com with ESMTPSA id
	i1sm20222470wmb.19.2019.10.14.05.19.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 05:19:38 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 02/25] crypto: virtio - deal with unsupported input sizes
Date: Mon, 14 Oct 2019 14:18:47 +0200
Message-Id: <20191014121910.7264-3-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191014121910.7264-1-ard.biesheuvel@linaro.org>
References: <20191014121910.7264-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"Michael S. Tsirkin" <mst@redhat.com>, Eric Biggers <ebiggers@google.com>,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Return -EINVAL for input sizes that are not a multiple of the AES
block size, since they are not supported by our CBC chaining mode.

While at it, remove the pr_err() that reports unsupported key sizes
being used: we shouldn't spam the kernel log with that.

Fixes: dbaf0624ffa5 ("crypto: add virtio-crypto driver")
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Gonglei <arei.gonglei@huawei.com>
Cc: virtualization@lists.linux-foundation.org
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/crypto/virtio/virtio_crypto_algs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/virtio/virtio_crypto_algs.c b/drivers/crypto/virtio/virtio_crypto_algs.c
index 65ec10800137..82b316b2f537 100644
--- a/drivers/crypto/virtio/virtio_crypto_algs.c
+++ b/drivers/crypto/virtio/virtio_crypto_algs.c
@@ -105,8 +105,6 @@ virtio_crypto_alg_validate_key(int key_len, uint32_t *alg)
 		*alg = VIRTIO_CRYPTO_CIPHER_AES_CBC;
 		break;
 	default:
-		pr_err("virtio_crypto: Unsupported key length: %d\n",
-			key_len);
 		return -EINVAL;
 	}
 	return 0;
@@ -489,6 +487,11 @@ static int virtio_crypto_ablkcipher_encrypt(struct ablkcipher_request *req)
 	/* Use the first data virtqueue as default */
 	struct data_queue *data_vq = &vcrypto->data_vq[0];
 
+	if (!req->nbytes)
+		return 0;
+	if (req->nbytes % AES_BLOCK_SIZE)
+		return -EINVAL;
+
 	vc_req->dataq = data_vq;
 	vc_req->alg_cb = virtio_crypto_dataq_sym_callback;
 	vc_sym_req->ablkcipher_ctx = ctx;
@@ -509,6 +512,11 @@ static int virtio_crypto_ablkcipher_decrypt(struct ablkcipher_request *req)
 	/* Use the first data virtqueue as default */
 	struct data_queue *data_vq = &vcrypto->data_vq[0];
 
+	if (!req->nbytes)
+		return 0;
+	if (req->nbytes % AES_BLOCK_SIZE)
+		return -EINVAL;
+
 	vc_req->dataq = data_vq;
 	vc_req->alg_cb = virtio_crypto_dataq_sym_callback;
 	vc_sym_req->ablkcipher_ctx = ctx;
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
