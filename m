Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B73C51BC11
	for <lists.virtualization@lfdr.de>; Thu,  5 May 2022 11:28:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E10DD4197B;
	Thu,  5 May 2022 09:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FO7_xbBw_vKN; Thu,  5 May 2022 09:28:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F1ED541981;
	Thu,  5 May 2022 09:28:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B626C0081;
	Thu,  5 May 2022 09:28:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF6ADC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 May 2022 09:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD02F60FE9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 May 2022 09:28:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qz6130lM7tMO
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 May 2022 09:28:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D831060B48
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 May 2022 09:28:14 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 202so3202817pgc.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 05 May 2022 02:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kha5ktFH5j9YquAc3ietDrMVhK0eW0VddNv6D0sYyvE=;
 b=V98Bic0hu2NUBldV7ekE34VdUHhrlBPwUitq4UWe7/sYxjALhI0kVbmpiUf8ZW0VE9
 siKGXZtKuW1VzbYGQDNiiIjxcbVPsnr0oJhNrgrC8BtyIe+KCvWEGDVs+bShUUIB/Tg1
 CcQJGTh0C49e2cBW2uf3tWPM//8MluXMyLu+W08chX3A/EK/RxES1qT10auE2l2f14uD
 1DacibloENtXfisqHQkYpLiucpByZKkEqZWI5gaa7h6eiUhsC8fFpDCzAiR/Nfi6/Y9f
 ain23H0qiSHWIRP0avXNrm8OWM2MzZz3RaElwuKQ+lL3cFl8HykapIbyyMRA82/37DZQ
 C3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kha5ktFH5j9YquAc3ietDrMVhK0eW0VddNv6D0sYyvE=;
 b=lnEyEqi3C9gi9wpK6ZEViT606mGR6O0rs5s07gwAnHdeXIRJukG7EAlul2+gocw+/S
 tLXbpqiXQaBAr8nFGaJNkmmpqbfdQZ7+1QA1xkW3u7MhEQ2teCvWmAlDojlmpYl8cbZh
 31vAxYl9R1h12N7GUyl/SipyEJf4rlxFvQsm4RjKI4805lH5FW37UbwqdoFc9wtoN9He
 QiPrykCK4VT3ZLNMKWa8kfjb5vC6mfP1wMWTOERx6su8w96a/i6t3x/nDHC0gfGXTv1A
 UB298fr70TP62H0KVmW1qck0u9/mmITs77PJu8snH0gksBenYKf56mcDs3OoluXYCYSE
 Okkg==
X-Gm-Message-State: AOAM530PLT5GZX1Dx6/E0G77gO8WIUiwBSGAqsxO8GH8KivHiFQixHc+
 WkUJfUMUtH+jYHp0u1DWhE2z2g==
X-Google-Smtp-Source: ABdhPJw9CRQvqf1FqqCnNCNL3YNHIeKUmFbg2Mzpla2kFgKmg7CtLLLMv5hzdSJRjV+HT2c6BMnalA==
X-Received: by 2002:a63:2263:0:b0:399:561e:810b with SMTP id
 t35-20020a632263000000b00399561e810bmr21109234pgm.615.1651742894147; 
 Thu, 05 May 2022 02:28:14 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.255])
 by smtp.gmail.com with ESMTPSA id
 t68-20020a625f47000000b0050dc76281dcsm884224pfb.182.2022.05.05.02.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:28:13 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com,
	mst@redhat.com
Subject: [PATCH v5 2/5] virtio-crypto: use private buffer for control request
Date: Thu,  5 May 2022 17:24:05 +0800
Message-Id: <20220505092408.53692-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505092408.53692-1-pizhenwei@bytedance.com>
References: <20220505092408.53692-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Cc: helei.sig11@bytedance.com, linux-kernel@vger.kernel.org,
 pizhenwei@bytedance.com, virtualization@lists.linux-foundation.org,
 kernel test robot <lkp@intel.com>, linux-crypto@vger.kernel.org,
 davem@davemloft.net, Dan Carpenter <dan.carpenter@oracle.com>,
 herbert@gondor.apana.org.au
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

Originally, all of the control requests share a single buffer(
ctrl & input & ctrl_status fields in struct virtio_crypto), this
allows queue depth 1 only, the performance of control queue gets
limited by this design.

In this patch, each request allocates request buffer dynamically, and
free buffer after request, so the scope protected by ctrl_lock also
get optimized here.
It's possible to optimize control queue depth in the next step.

A necessary comment is already in code, still describe it again:
/*
 * Note: there are padding fields in request, clear them to zero before
 * sending to host to avoid to divulge any information.
 * Ex, virtio_crypto_ctrl_request::ctrl::u::destroy_session::padding[48]
 */
So use kzalloc to allocate buffer of struct virtio_crypto_ctrl_request.

Potentially dereferencing uninitialized variables:
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 .../virtio/virtio_crypto_akcipher_algs.c      | 57 ++++++++++++-------
 drivers/crypto/virtio/virtio_crypto_common.h  | 17 ++++--
 .../virtio/virtio_crypto_skcipher_algs.c      | 50 ++++++++++------
 3 files changed, 79 insertions(+), 45 deletions(-)

diff --git a/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c b/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
index 20901a263fc8..698ea57e2649 100644
--- a/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
+++ b/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
@@ -108,16 +108,22 @@ static int virtio_crypto_alg_akcipher_init_session(struct virtio_crypto_akcipher
 	unsigned int num_out = 0, num_in = 0;
 	struct virtio_crypto_op_ctrl_req *ctrl;
 	struct virtio_crypto_session_input *input;
+	struct virtio_crypto_ctrl_request *vc_ctrl_req;
 
 	pkey = kmemdup(key, keylen, GFP_ATOMIC);
 	if (!pkey)
 		return -ENOMEM;
 
-	spin_lock(&vcrypto->ctrl_lock);
-	ctrl = &vcrypto->ctrl;
+	vc_ctrl_req = kzalloc(sizeof(*vc_ctrl_req), GFP_KERNEL);
+	if (!vc_ctrl_req) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	ctrl = &vc_ctrl_req->ctrl;
 	memcpy(&ctrl->header, header, sizeof(ctrl->header));
 	memcpy(&ctrl->u, para, sizeof(ctrl->u));
-	input = &vcrypto->input;
+	input = &vc_ctrl_req->input;
 	input->status = cpu_to_le32(VIRTIO_CRYPTO_ERR);
 
 	sg_init_one(&outhdr_sg, ctrl, sizeof(*ctrl));
@@ -129,16 +135,22 @@ static int virtio_crypto_alg_akcipher_init_session(struct virtio_crypto_akcipher
 	sg_init_one(&inhdr_sg, input, sizeof(*input));
 	sgs[num_out + num_in++] = &inhdr_sg;
 
+	spin_lock(&vcrypto->ctrl_lock);
 	err = virtqueue_add_sgs(vcrypto->ctrl_vq, sgs, num_out, num_in, vcrypto, GFP_ATOMIC);
-	if (err < 0)
+	if (err < 0) {
+		spin_unlock(&vcrypto->ctrl_lock);
 		goto out;
+	}
 
 	virtqueue_kick(vcrypto->ctrl_vq);
 	while (!virtqueue_get_buf(vcrypto->ctrl_vq, &inlen) &&
 	       !virtqueue_is_broken(vcrypto->ctrl_vq))
 		cpu_relax();
+	spin_unlock(&vcrypto->ctrl_lock);
 
 	if (le32_to_cpu(input->status) != VIRTIO_CRYPTO_OK) {
+		pr_err("virtio_crypto: Create session failed status: %u\n",
+			le32_to_cpu(input->status));
 		err = -EINVAL;
 		goto out;
 	}
@@ -148,13 +160,9 @@ static int virtio_crypto_alg_akcipher_init_session(struct virtio_crypto_akcipher
 	err = 0;
 
 out:
-	spin_unlock(&vcrypto->ctrl_lock);
+	kfree(vc_ctrl_req);
 	kfree_sensitive(pkey);
 
-	if (err < 0)
-		pr_err("virtio_crypto: Create session failed status: %u\n",
-			le32_to_cpu(input->status));
-
 	return err;
 }
 
@@ -167,15 +175,18 @@ static int virtio_crypto_alg_akcipher_close_session(struct virtio_crypto_akciphe
 	int err;
 	struct virtio_crypto_op_ctrl_req *ctrl;
 	struct virtio_crypto_inhdr *ctrl_status;
+	struct virtio_crypto_ctrl_request *vc_ctrl_req;
 
-	spin_lock(&vcrypto->ctrl_lock);
-	if (!ctx->session_valid) {
-		err = 0;
-		goto out;
-	}
-	ctrl_status = &vcrypto->ctrl_status;
+	if (!ctx->session_valid)
+		return 0;
+
+	vc_ctrl_req = kzalloc(sizeof(*vc_ctrl_req), GFP_KERNEL);
+	if (!vc_ctrl_req)
+		return -ENOMEM;
+
+	ctrl_status = &vc_ctrl_req->ctrl_status;
 	ctrl_status->status = VIRTIO_CRYPTO_ERR;
-	ctrl = &vcrypto->ctrl;
+	ctrl = &vc_ctrl_req->ctrl;
 	ctrl->header.opcode = cpu_to_le32(VIRTIO_CRYPTO_AKCIPHER_DESTROY_SESSION);
 	ctrl->header.queue_id = 0;
 
@@ -188,16 +199,22 @@ static int virtio_crypto_alg_akcipher_close_session(struct virtio_crypto_akciphe
 	sg_init_one(&inhdr_sg, &ctrl_status->status, sizeof(ctrl_status->status));
 	sgs[num_out + num_in++] = &inhdr_sg;
 
+	spin_lock(&vcrypto->ctrl_lock);
 	err = virtqueue_add_sgs(vcrypto->ctrl_vq, sgs, num_out, num_in, vcrypto, GFP_ATOMIC);
-	if (err < 0)
+	if (err < 0) {
+		spin_unlock(&vcrypto->ctrl_lock);
 		goto out;
+	}
 
 	virtqueue_kick(vcrypto->ctrl_vq);
 	while (!virtqueue_get_buf(vcrypto->ctrl_vq, &inlen) &&
 	       !virtqueue_is_broken(vcrypto->ctrl_vq))
 		cpu_relax();
+	spin_unlock(&vcrypto->ctrl_lock);
 
 	if (ctrl_status->status != VIRTIO_CRYPTO_OK) {
+		pr_err("virtio_crypto: Close session failed status: %u, session_id: 0x%llx\n",
+			ctrl_status->status, destroy_session->session_id);
 		err = -EINVAL;
 		goto out;
 	}
@@ -206,11 +223,7 @@ static int virtio_crypto_alg_akcipher_close_session(struct virtio_crypto_akciphe
 	ctx->session_valid = false;
 
 out:
-	spin_unlock(&vcrypto->ctrl_lock);
-	if (err < 0) {
-		pr_err("virtio_crypto: Close session failed status: %u, session_id: 0x%llx\n",
-			ctrl_status->status, destroy_session->session_id);
-	}
+	kfree(vc_ctrl_req);
 
 	return err;
 }
diff --git a/drivers/crypto/virtio/virtio_crypto_common.h b/drivers/crypto/virtio/virtio_crypto_common.h
index e693d4ee83a6..2422237ec4e6 100644
--- a/drivers/crypto/virtio/virtio_crypto_common.h
+++ b/drivers/crypto/virtio/virtio_crypto_common.h
@@ -13,6 +13,7 @@
 #include <crypto/aead.h>
 #include <crypto/aes.h>
 #include <crypto/engine.h>
+#include <uapi/linux/virtio_crypto.h>
 
 
 /* Internal representation of a data virtqueue */
@@ -65,11 +66,6 @@ struct virtio_crypto {
 	/* Maximum size of per request */
 	u64 max_size;
 
-	/* Control VQ buffers: protected by the ctrl_lock */
-	struct virtio_crypto_op_ctrl_req ctrl;
-	struct virtio_crypto_session_input input;
-	struct virtio_crypto_inhdr ctrl_status;
-
 	unsigned long status;
 	atomic_t ref_count;
 	struct list_head list;
@@ -85,6 +81,17 @@ struct virtio_crypto_sym_session_info {
 	__u64 session_id;
 };
 
+/*
+ * Note: there are padding fields in request, clear them to zero before
+ *       sending to host to avoid to divulge any information.
+ * Ex, virtio_crypto_ctrl_request::ctrl::u::destroy_session::padding[48]
+ */
+struct virtio_crypto_ctrl_request {
+	struct virtio_crypto_op_ctrl_req ctrl;
+	struct virtio_crypto_session_input input;
+	struct virtio_crypto_inhdr ctrl_status;
+};
+
 struct virtio_crypto_request;
 typedef void (*virtio_crypto_data_callback)
 		(struct virtio_crypto_request *vc_req, int len);
diff --git a/drivers/crypto/virtio/virtio_crypto_skcipher_algs.c b/drivers/crypto/virtio/virtio_crypto_skcipher_algs.c
index e3c5bc8d6112..6aaf0869b211 100644
--- a/drivers/crypto/virtio/virtio_crypto_skcipher_algs.c
+++ b/drivers/crypto/virtio/virtio_crypto_skcipher_algs.c
@@ -126,6 +126,7 @@ static int virtio_crypto_alg_skcipher_init_session(
 	struct virtio_crypto_op_ctrl_req *ctrl;
 	struct virtio_crypto_session_input *input;
 	struct virtio_crypto_sym_create_session_req *sym_create_session;
+	struct virtio_crypto_ctrl_request *vc_ctrl_req;
 
 	/*
 	 * Avoid to do DMA from the stack, switch to using
@@ -136,15 +137,20 @@ static int virtio_crypto_alg_skcipher_init_session(
 	if (!cipher_key)
 		return -ENOMEM;
 
-	spin_lock(&vcrypto->ctrl_lock);
+	vc_ctrl_req = kzalloc(sizeof(*vc_ctrl_req), GFP_KERNEL);
+	if (!vc_ctrl_req) {
+		err = -ENOMEM;
+		goto out;
+	}
+
 	/* Pad ctrl header */
-	ctrl = &vcrypto->ctrl;
+	ctrl = &vc_ctrl_req->ctrl;
 	ctrl->header.opcode = cpu_to_le32(VIRTIO_CRYPTO_CIPHER_CREATE_SESSION);
 	ctrl->header.algo = cpu_to_le32(alg);
 	/* Set the default dataqueue id to 0 */
 	ctrl->header.queue_id = 0;
 
-	input = &vcrypto->input;
+	input = &vc_ctrl_req->input;
 	input->status = cpu_to_le32(VIRTIO_CRYPTO_ERR);
 	/* Pad cipher's parameters */
 	sym_create_session = &ctrl->u.sym_create_session;
@@ -164,12 +170,12 @@ static int virtio_crypto_alg_skcipher_init_session(
 	sg_init_one(&inhdr, input, sizeof(*input));
 	sgs[num_out + num_in++] = &inhdr;
 
+	spin_lock(&vcrypto->ctrl_lock);
 	err = virtqueue_add_sgs(vcrypto->ctrl_vq, sgs, num_out,
 				num_in, vcrypto, GFP_ATOMIC);
 	if (err < 0) {
 		spin_unlock(&vcrypto->ctrl_lock);
-		kfree_sensitive(cipher_key);
-		return err;
+		goto out;
 	}
 	virtqueue_kick(vcrypto->ctrl_vq);
 
@@ -180,13 +186,13 @@ static int virtio_crypto_alg_skcipher_init_session(
 	while (!virtqueue_get_buf(vcrypto->ctrl_vq, &tmp) &&
 	       !virtqueue_is_broken(vcrypto->ctrl_vq))
 		cpu_relax();
+	spin_unlock(&vcrypto->ctrl_lock);
 
 	if (le32_to_cpu(input->status) != VIRTIO_CRYPTO_OK) {
-		spin_unlock(&vcrypto->ctrl_lock);
 		pr_err("virtio_crypto: Create session failed status: %u\n",
 			le32_to_cpu(input->status));
-		kfree_sensitive(cipher_key);
-		return -EINVAL;
+		err = -EINVAL;
+		goto out;
 	}
 
 	if (encrypt)
@@ -194,10 +200,11 @@ static int virtio_crypto_alg_skcipher_init_session(
 	else
 		ctx->dec_sess_info.session_id = le64_to_cpu(input->session_id);
 
-	spin_unlock(&vcrypto->ctrl_lock);
-
+	err = 0;
+out:
+	kfree(vc_ctrl_req);
 	kfree_sensitive(cipher_key);
-	return 0;
+	return err;
 }
 
 static int virtio_crypto_alg_skcipher_close_session(
@@ -212,12 +219,16 @@ static int virtio_crypto_alg_skcipher_close_session(
 	unsigned int num_out = 0, num_in = 0;
 	struct virtio_crypto_op_ctrl_req *ctrl;
 	struct virtio_crypto_inhdr *ctrl_status;
+	struct virtio_crypto_ctrl_request *vc_ctrl_req;
 
-	spin_lock(&vcrypto->ctrl_lock);
-	ctrl_status = &vcrypto->ctrl_status;
+	vc_ctrl_req = kzalloc(sizeof(*vc_ctrl_req), GFP_KERNEL);
+	if (!vc_ctrl_req)
+		return -ENOMEM;
+
+	ctrl_status = &vc_ctrl_req->ctrl_status;
 	ctrl_status->status = VIRTIO_CRYPTO_ERR;
 	/* Pad ctrl header */
-	ctrl = &vcrypto->ctrl;
+	ctrl = &vc_ctrl_req->ctrl;
 	ctrl->header.opcode = cpu_to_le32(VIRTIO_CRYPTO_CIPHER_DESTROY_SESSION);
 	/* Set the default virtqueue id to 0 */
 	ctrl->header.queue_id = 0;
@@ -236,28 +247,31 @@ static int virtio_crypto_alg_skcipher_close_session(
 	sg_init_one(&status_sg, &ctrl_status->status, sizeof(ctrl_status->status));
 	sgs[num_out + num_in++] = &status_sg;
 
+	spin_lock(&vcrypto->ctrl_lock);
 	err = virtqueue_add_sgs(vcrypto->ctrl_vq, sgs, num_out,
 			num_in, vcrypto, GFP_ATOMIC);
 	if (err < 0) {
 		spin_unlock(&vcrypto->ctrl_lock);
-		return err;
+		goto out;
 	}
 	virtqueue_kick(vcrypto->ctrl_vq);
 
 	while (!virtqueue_get_buf(vcrypto->ctrl_vq, &tmp) &&
 	       !virtqueue_is_broken(vcrypto->ctrl_vq))
 		cpu_relax();
+	spin_unlock(&vcrypto->ctrl_lock);
 
 	if (ctrl_status->status != VIRTIO_CRYPTO_OK) {
-		spin_unlock(&vcrypto->ctrl_lock);
 		pr_err("virtio_crypto: Close session failed status: %u, session_id: 0x%llx\n",
 			ctrl_status->status, destroy_session->session_id);
 
 		return -EINVAL;
 	}
-	spin_unlock(&vcrypto->ctrl_lock);
 
-	return 0;
+	err = 0;
+out:
+	kfree(vc_ctrl_req);
+	return err;
 }
 
 static int virtio_crypto_alg_skcipher_init_sessions(
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
