Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D09D628C
	for <lists.virtualization@lfdr.de>; Mon, 14 Oct 2019 14:29:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6E6D32933;
	Mon, 14 Oct 2019 12:29:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0138F2931
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 12:19:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D16F58B1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 12:19:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p14so19471637wro.4
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 05:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TNWJxh1AFEyP6kvtb+pRqQQilO6T6qX/8rJmhhrHLY0=;
	b=RGejKaLhilxSPep1T8GKNwd/Q7C8PjNrda8JoEtErLf7kvnBTwZv6MAI6dLz7PtSfH
	Xc0ZbIH4yCgnqQF/QZ8kRKM1M9TlpkV7h9fuLbnZtRfjgp1zFtS7HhezB+ejfsfcd/ih
	Qc8kssabtPem2XldE14kn5hRxH1jWbl5rCbr//QNr6RXDHGwxoFk4uTvKhI/i4zKT21e
	n2tN07fsRM4ujN5KvVN44S8MhsHdWSXcqVRQ3qW8zlxl0l1E3Mh9ai+PDNQQQB8jnKob
	b4w1isX5e8XtW8yn9hwPDMsxD6N5vMOQDu84Ikr17EIgPRBXdz5Uz2hqvpUCq8YB2xBv
	NDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TNWJxh1AFEyP6kvtb+pRqQQilO6T6qX/8rJmhhrHLY0=;
	b=qp85A/6I4XyzMEQtvgZu6OOrMUnsafdExmkX7ypuTIpxyqZykgzTUuEmras/IFA08Q
	wzdpJSseKRIAhWOLB3WA17ElaKoslS7xgLBzof98dFYz+q5hkvJ/E3DZgcme40fua2gs
	DYMAobK4AYp489lUXetJxcGmrEfFkH0G9htQciwao0zuMsC3bxmJ4oiaXr7dSMroiVq9
	LMF1BiZJ4HueIj1WCQOqELhB/LV9N4QWMuZZjRQ90WelLe58N6h3/y/RCt6ACIAC/6Qx
	FzrpAJOPyOEC0ani5m8zEqDm11K6e/rSZJcXHpvyS0+7zL+wUDHBNCLvRJRcZOZ/XX5c
	yYNg==
X-Gm-Message-State: APjAAAW6Enq10nLLalfXnsGJSySD55YoOelbtop6aB+rc2dNrX40lN9P
	QHnBXmK2Ow5JdyAXdeiNFVHX8g==
X-Google-Smtp-Source: APXvYqzdHoaIj/OJ0cTfxhnuBYveQ6+FMY9yHkd5B79vGinI43FDRZSmVS9GILkDgWfdRJaVncgH/A==
X-Received: by 2002:adf:bd93:: with SMTP id l19mr25110646wrh.1.1571055578363; 
	Mon, 14 Oct 2019 05:19:38 -0700 (PDT)
Received: from localhost.localdomain (91-167-84-221.subs.proxad.net.
	[91.167.84.221]) by smtp.gmail.com with ESMTPSA id
	i1sm20222470wmb.19.2019.10.14.05.19.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 05:19:37 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 01/25] crypto: virtio - implement missing support for output
	IVs
Date: Mon, 14 Oct 2019 14:18:46 +0200
Message-Id: <20191014121910.7264-2-ard.biesheuvel@linaro.org>
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
