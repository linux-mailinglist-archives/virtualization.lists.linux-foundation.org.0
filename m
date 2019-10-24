Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F2866E33EC
	for <lists.virtualization@lfdr.de>; Thu, 24 Oct 2019 15:24:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1F5281630;
	Thu, 24 Oct 2019 13:23:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 907DE162B
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 13:23:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DD07E831
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 13:23:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t16so20941746wrr.1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TNWJxh1AFEyP6kvtb+pRqQQilO6T6qX/8rJmhhrHLY0=;
	b=S2eThVk83dKO5Bwg3yDm/gzVGNto7qsth4WMLLOmiYJINz7Qibs5lDhZH4pMHelfff
	UI55mx/5I/os0vKVwqaNYzvodYmhm3q7elBYzBwxmPBD/GiwrKVqX7DFhWZBhSZqTfDb
	KjuRWogf+5wecIavxAAFgv75+yn7OshRyOO5VWsaZJg6YRdu/S6wV2oaeWIGvn7xkyT2
	GYlxYl4QmaiC54ujOPw1nrH935qPBMI4BffDjb+GHywDtacfw4evwSNKQ7ue/25jsr1U
	TWuU7+hKvJpl0M+XfxDx5PBJ128PVg0jtARNCF0ugFpEeUzQLDYVTl90UMFXe0QRcLoa
	i6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TNWJxh1AFEyP6kvtb+pRqQQilO6T6qX/8rJmhhrHLY0=;
	b=iFSqwCa79q/FNfnsZh/KG2kyhce0+Uc6vcde9PQibXn9dgot3x+qhmbIu32M+LSYbB
	vwBzIiboHF6JzDH0XeCHN3ogD3SlynxUTxghZvqP/o1xw6TmxUW0PjPzBCwyphbHqK3/
	nGVOeDmUctAVIM3mnSgVOrofcEuXUP7ki89J2GOA9lSyNBnVaVskgEhImUGhhyEXzKEl
	AS53MzG+qWXLR61JX8Xl6VHhsSARVWhpbTMhF4cktrApSpeWhtGIjttKJJil0uw+H67A
	FinMajoO+IqkKIP0ySlCYpYqmIZh3neoNfJfTjBflrC4gELbd9+xtEHJELl0zHGyMC3v
	vHMg==
X-Gm-Message-State: APjAAAVS5xrS6avpuyUASPVMrNeJjrsPjA9NI8VUPyfVJqgqi9kGjaPY
	UIby5sF47QuunmqSSpQVyihJAw==
X-Google-Smtp-Source: APXvYqyc+CLRulk3KGzezXZq5tnbXiDOqAyJFEZa5vrUyaKiixpSFHdiZydqrTrm/pESPS4zfHYTfQ==
X-Received: by 2002:adf:e886:: with SMTP id d6mr4021372wrm.188.1571923435313; 
	Thu, 24 Oct 2019 06:23:55 -0700 (PDT)
Received: from localhost.localdomain
	(laubervilliers-657-1-83-120.w92-154.abo.wanadoo.fr. [92.154.90.120])
	by smtp.gmail.com with ESMTPSA id e3sm2346310wme.36.2019.10.24.06.23.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 06:23:54 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 01/27] crypto: virtio - implement missing support for
	output IVs
Date: Thu, 24 Oct 2019 15:23:19 +0200
Message-Id: <20191024132345.5236-2-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024132345.5236-1-ard.biesheuvel@linaro.org>
References: <20191024132345.5236-1-ard.biesheuvel@linaro.org>
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

In order to allow for CBC to be chained, which is something that the
CTS template relies upon, implementations of CBC need to pass the
IV to be used for subsequent invocations via the IV buffer. This was
not implemented yet for virtio-crypto so implement it now.

Fixes: dbaf0624ffa5 ("crypto: add virtio-crypto driver")
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Gonglei <arei.gonglei@huawei.com>
Cc: virtualization@lists.linux-foundation.org
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/crypto/virtio/virtio_crypto_algs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/crypto/virtio/virtio_crypto_algs.c b/drivers/crypto/virtio/virtio_crypto_algs.c
index 42d19205166b..65ec10800137 100644
--- a/drivers/crypto/virtio/virtio_crypto_algs.c
+++ b/drivers/crypto/virtio/virtio_crypto_algs.c
@@ -437,6 +437,11 @@ __virtio_crypto_ablkcipher_do_req(struct virtio_crypto_sym_request *vc_sym_req,
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
@@ -563,6 +568,10 @@ static void virtio_crypto_ablkcipher_finalize_req(
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
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
