Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD3B5026E2
	for <lists.virtualization@lfdr.de>; Fri, 15 Apr 2022 10:41:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 479B640B7A;
	Fri, 15 Apr 2022 08:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hV1mt1fEltj; Fri, 15 Apr 2022 08:41:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5F67740B3C;
	Fri, 15 Apr 2022 08:41:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC0B2C0088;
	Fri, 15 Apr 2022 08:41:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B740C002C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 08:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59CF2831AC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 08:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XX1AUoK2VPl3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 08:41:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF79F83196
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650012074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QumqRglehhTe5uUY14GbE+ssWXrl4Lu2Z3dRrOJNNk4=;
 b=LG00jk5EV7HeL/p6v31vKOOMaczQu/vJHirwx37lR/TyVfRZBvNqcOTSOjWoTMNyVwX5OG
 s+aABdenymOMRzvMPyaXX2b9nNDHsiXokUSoDvxLunE4Mmx49XoCnw+shlInioIBCFD7m1
 LyCfC9tLF8X5nRwtWwyU6CyhMwYjrb8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-F-GXLVW2O4ydt4GuVOMV9A-1; Fri, 15 Apr 2022 04:41:13 -0400
X-MC-Unique: F-GXLVW2O4ydt4GuVOMV9A-1
Received: by mail-ej1-f70.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so2988686ejw.9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 01:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QumqRglehhTe5uUY14GbE+ssWXrl4Lu2Z3dRrOJNNk4=;
 b=2YjKib2sFKrhpyorFTFtSqjhvQ2tb85c4JlagpfzTSLYfeqeWfWDl5H2q9Go7BfWe8
 fpouhNDhhAg+sj5IXUzM3Ao6ADafk3ECL1bUJVJjaLen2fX9RyWQm62r2HHv/CDn2XUA
 mKj7s4D5lHBKY43aj7EZr2l5bfNd7sTewRFfv+zDuNKClsjHpr0uSwwGULO02fycO8Bk
 bS71FCPP62D56uoNOXVge1dbGX+eDWDg44IVWwZ7kCGzGrNGTqPBniN9NQY7r0Bi7t3q
 UXphh0wCRO48YbP7I6+o+JzPcqTvb/YrFoclQvWxqcP3seRYNb8mWf3oqEDfFsC8n/lV
 lo0w==
X-Gm-Message-State: AOAM530fyqt+c/vqEf6AfxTJDsMapa9+dVpeWax6BqtNJ0JlNYoZK16z
 1I2tLy8kfueitcqW0SAo9PTQAcbkJ1pf8yF7btQHeoFgLusSQfxdJ+SSWwWlMBA3ThqlJx/0U+S
 cW+CfUvY5DBlni2XIk7hwMPJpsWE1fKEH13qBYUS+yQ==
X-Received: by 2002:a17:906:6a1c:b0:6eb:d76c:e835 with SMTP id
 qw28-20020a1709066a1c00b006ebd76ce835mr5387527ejc.15.1650012072016; 
 Fri, 15 Apr 2022 01:41:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzvpQ1klTgyxQ3tgpTaREuZ8XZMdSx6yNkvXirWULkcvPmQQ/D/OM2lCQqfCobPSe1LRLrEw==
X-Received: by 2002:a17:906:6a1c:b0:6eb:d76c:e835 with SMTP id
 qw28-20020a1709066a1c00b006ebd76ce835mr5387507ejc.15.1650012071632; 
 Fri, 15 Apr 2022 01:41:11 -0700 (PDT)
Received: from redhat.com ([2.53.138.98]) by smtp.gmail.com with ESMTPSA id
 d2-20020a1709067a0200b006df8c996b36sm1452852ejo.26.2022.04.15.01.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 01:41:10 -0700 (PDT)
Date: Fri, 15 Apr 2022 04:41:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH 1/4] virtio-crypto: wait ctrl queue instead of busy polling
Message-ID: <20220415042555-mutt-send-email-mst@kernel.org>
References: <20220415064136.304661-1-pizhenwei@bytedance.com>
 <20220415064136.304661-2-pizhenwei@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20220415064136.304661-2-pizhenwei@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: herbert@gondor.apana.org.au, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 davem@davemloft.net, helei.sig11@bytedance.com
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

On Fri, Apr 15, 2022 at 02:41:33PM +0800, zhenwei pi wrote:
> Originally, after submitting request into virtio crypto control
> queue, the guest side polls the result from the virt queue. There
> are two problems:
> 1, The queue depth is always 1, the performance of a virtio crypto
>    device gets limited. Multi user processes share a single control
>    queue, and hit spin lock race from control queue. Test on Intel
>    Platinum 8260, a single worker gets ~35K/s create/close session
>    operations, and 8 workers get ~40K/s operations with 800% CPU
>    utilization.
> 2, The control request is supposed to get handled immediately, but
>    in the current implementation of QEMU(v6.2), the vCPU thread kicks
>    another thread to do this work, the latency also gets unstable.
>    Tracking latency of virtio_crypto_alg_akcipher_close_session in 5s:
>         usecs               : count     distribution
>          0 -> 1          : 0        |                        |
>          2 -> 3          : 7        |                        |
>          4 -> 7          : 72       |                        |
>          8 -> 15         : 186485   |************************|
>         16 -> 31         : 687      |                        |
>         32 -> 63         : 5        |                        |
>         64 -> 127        : 3        |                        |
>        128 -> 255        : 1        |                        |
>        256 -> 511        : 0        |                        |
>        512 -> 1023       : 0        |                        |
>       1024 -> 2047       : 0        |                        |
>       2048 -> 4095       : 0        |                        |
>       4096 -> 8191       : 0        |                        |
>       8192 -> 16383      : 2        |                        |
> 
> To improve the performance of control queue, wait completion instead
> of busy polling without lock race, and get completed by control queue
> callback. Test this patch, the guest side get ~200K/s operations with
> 300% CPU utilization.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  drivers/crypto/virtio/Makefile                |   1 +
>  .../virtio/virtio_crypto_akcipher_algs.c      |  87 ++++++------
>  drivers/crypto/virtio/virtio_crypto_common.c  |  61 ++++++++
>  drivers/crypto/virtio/virtio_crypto_common.h  |  23 ++-
>  drivers/crypto/virtio/virtio_crypto_core.c    |   2 +-
>  .../virtio/virtio_crypto_skcipher_algs.c      | 134 ++++++++----------
>  6 files changed, 183 insertions(+), 125 deletions(-)
>  create mode 100644 drivers/crypto/virtio/virtio_crypto_common.c
> 
> diff --git a/drivers/crypto/virtio/Makefile b/drivers/crypto/virtio/Makefile
> index bfa6cbae342e..49c1fa80e465 100644
> --- a/drivers/crypto/virtio/Makefile
> +++ b/drivers/crypto/virtio/Makefile
> @@ -3,5 +3,6 @@ obj-$(CONFIG_CRYPTO_DEV_VIRTIO) += virtio_crypto.o
>  virtio_crypto-objs := \
>  	virtio_crypto_skcipher_algs.o \
>  	virtio_crypto_akcipher_algs.o \
> +	virtio_crypto_common.o \
>  	virtio_crypto_mgr.o \
>  	virtio_crypto_core.o
> diff --git a/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c b/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
> index f3ec9420215e..bf7c1aa4be37 100644
> --- a/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
> +++ b/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
> @@ -102,107 +102,100 @@ static int virtio_crypto_alg_akcipher_init_session(struct virtio_crypto_akcipher
>  {
>  	struct scatterlist outhdr_sg, key_sg, inhdr_sg, *sgs[3];
>  	struct virtio_crypto *vcrypto = ctx->vcrypto;
> +	struct virtio_crypto_ctrl_request *vc_ctrl_req = NULL;

this is initialized down the road, I think you can skip = NULL here.

>  	uint8_t *pkey;
> -	unsigned int inlen;
> -	int err;
> +	int err = -ENOMEM;

I would assign this in the single case where this value is used.

>  	unsigned int num_out = 0, num_in = 0;
> +	int node = dev_to_node(&vcrypto->vdev->dev);
>  
are you sure it is
better to allocate close to device and not to current node
which is the default?


>  	pkey = kmemdup(key, keylen, GFP_ATOMIC);
>  	if (!pkey)
>  		return -ENOMEM;
>  
> -	spin_lock(&vcrypto->ctrl_lock);
> -	memcpy(&vcrypto->ctrl.header, header, sizeof(vcrypto->ctrl.header));
> -	memcpy(&vcrypto->ctrl.u, para, sizeof(vcrypto->ctrl.u));
> -	vcrypto->input.status = cpu_to_le32(VIRTIO_CRYPTO_ERR);
> +	vc_ctrl_req = kzalloc_node(sizeof(*vc_ctrl_req), GFP_KERNEL, node);
> +	if (!vc_ctrl_req)
> +		goto out;

do you need to allocate it with kzalloc?
is anything wrong with just keeping it part of device?
even if yes this change is better split in a separate patch, would make the patch smaller.



>  
> -	sg_init_one(&outhdr_sg, &vcrypto->ctrl, sizeof(vcrypto->ctrl));
> +	memcpy(&vc_ctrl_req->ctrl.header, header, sizeof(vc_ctrl_req->ctrl.header));
> +	memcpy(&vc_ctrl_req->ctrl.u, para, sizeof(vc_ctrl_req->ctrl.u));
> +	sg_init_one(&outhdr_sg, &vc_ctrl_req->ctrl, sizeof(vc_ctrl_req->ctrl));
>  	sgs[num_out++] = &outhdr_sg;
>  
>  	sg_init_one(&key_sg, pkey, keylen);
>  	sgs[num_out++] = &key_sg;
>  
> -	sg_init_one(&inhdr_sg, &vcrypto->input, sizeof(vcrypto->input));
> +	vc_ctrl_req->input.status = cpu_to_le32(VIRTIO_CRYPTO_ERR);
> +	sg_init_one(&inhdr_sg, &vc_ctrl_req->input, sizeof(vc_ctrl_req->input));
>  	sgs[num_out + num_in++] = &inhdr_sg;
>  
> -	err = virtqueue_add_sgs(vcrypto->ctrl_vq, sgs, num_out, num_in, vcrypto, GFP_ATOMIC);
> +	err = virtio_crypto_ctrl_vq_request(vcrypto, sgs, num_out, num_in, vc_ctrl_req);
>  	if (err < 0)
>  		goto out;
>  
> -	virtqueue_kick(vcrypto->ctrl_vq);
> -	while (!virtqueue_get_buf(vcrypto->ctrl_vq, &inlen) &&
> -	       !virtqueue_is_broken(vcrypto->ctrl_vq))
> -		cpu_relax();
> -
> -	if (le32_to_cpu(vcrypto->input.status) != VIRTIO_CRYPTO_OK) {
> +	if (le32_to_cpu(vc_ctrl_req->input.status) != VIRTIO_CRYPTO_OK) {
> +		pr_err("virtio_crypto: Create session failed status: %u\n",
> +			le32_to_cpu(vc_ctrl_req->input.status));
>  		err = -EINVAL;
>  		goto out;
>  	}
>  
> -	ctx->session_id = le64_to_cpu(vcrypto->input.session_id);
> +	ctx->session_id = le64_to_cpu(vc_ctrl_req->input.session_id);
>  	ctx->session_valid = true;
>  	err = 0;
>  
>  out:
> -	spin_unlock(&vcrypto->ctrl_lock);
> +	kfree_sensitive(vc_ctrl_req);
>  	kfree_sensitive(pkey);
>  
> -	if (err < 0)
> -		pr_err("virtio_crypto: Create session failed status: %u\n",
> -			le32_to_cpu(vcrypto->input.status));
> -
>  	return err;
>  }
>  
>  static int virtio_crypto_alg_akcipher_close_session(struct virtio_crypto_akcipher_ctx *ctx)
>  {


same comments apply to this function.

>  	struct scatterlist outhdr_sg, inhdr_sg, *sgs[2];
> +	struct virtio_crypto_ctrl_request *vc_ctrl_req = NULL;
>  	struct virtio_crypto_destroy_session_req *destroy_session;
>  	struct virtio_crypto *vcrypto = ctx->vcrypto;
> -	unsigned int num_out = 0, num_in = 0, inlen;
> +	unsigned int num_out = 0, num_in = 0;
>  	int err;
> +	int node = dev_to_node(&vcrypto->vdev->dev);
>  
> -	spin_lock(&vcrypto->ctrl_lock);
> -	if (!ctx->session_valid) {
> -		err = 0;
> -		goto out;
> -	}
> -	vcrypto->ctrl_status.status = VIRTIO_CRYPTO_ERR;
> -	vcrypto->ctrl.header.opcode = cpu_to_le32(VIRTIO_CRYPTO_AKCIPHER_DESTROY_SESSION);
> -	vcrypto->ctrl.header.queue_id = 0;
> +	if (!ctx->session_valid)
> +		return 0;
> +
> +	vc_ctrl_req = kzalloc_node(sizeof(*vc_ctrl_req), GFP_KERNEL, node);
> +	if (!vc_ctrl_req)
> +		return -ENOMEM;
>  
> -	destroy_session = &vcrypto->ctrl.u.destroy_session;
> +	vc_ctrl_req->ctrl.header.opcode = cpu_to_le32(VIRTIO_CRYPTO_AKCIPHER_DESTROY_SESSION);
> +	vc_ctrl_req->ctrl.header.queue_id = 0;
> +
> +	destroy_session = &vc_ctrl_req->ctrl.u.destroy_session;
>  	destroy_session->session_id = cpu_to_le64(ctx->session_id);
>  
> -	sg_init_one(&outhdr_sg, &vcrypto->ctrl, sizeof(vcrypto->ctrl));
> +	sg_init_one(&outhdr_sg, &vc_ctrl_req->ctrl, sizeof(vc_ctrl_req->ctrl));
>  	sgs[num_out++] = &outhdr_sg;
>  
> -	sg_init_one(&inhdr_sg, &vcrypto->ctrl_status.status, sizeof(vcrypto->ctrl_status.status));
> +	vc_ctrl_req->ctrl_status.status = VIRTIO_CRYPTO_ERR;
> +	sg_init_one(&inhdr_sg, &vc_ctrl_req->ctrl_status.status,
> +		sizeof(vc_ctrl_req->ctrl_status.status));
>  	sgs[num_out + num_in++] = &inhdr_sg;
>  
> -	err = virtqueue_add_sgs(vcrypto->ctrl_vq, sgs, num_out, num_in, vcrypto, GFP_ATOMIC);
> +	err = virtio_crypto_ctrl_vq_request(vcrypto, sgs, num_out, num_in, vc_ctrl_req);
>  	if (err < 0)
>  		goto out;
>  
> -	virtqueue_kick(vcrypto->ctrl_vq);
> -	while (!virtqueue_get_buf(vcrypto->ctrl_vq, &inlen) &&
> -	       !virtqueue_is_broken(vcrypto->ctrl_vq))
> -		cpu_relax();
> -
> -	if (vcrypto->ctrl_status.status != VIRTIO_CRYPTO_OK) {
> +	if (vc_ctrl_req->ctrl_status.status != VIRTIO_CRYPTO_OK) {
>  		err = -EINVAL;
> +		pr_err("virtio_crypto: Close session failed status: %u, session_id: 0x%llx\n",
> +			vc_ctrl_req->ctrl_status.status, destroy_session->session_id);
>  		goto out;
>  	}
>  
> -	err = 0;
>  	ctx->session_valid = false;
> -
> +	err = 0;
>  out:
> -	spin_unlock(&vcrypto->ctrl_lock);
> -	if (err < 0) {
> -		pr_err("virtio_crypto: Close session failed status: %u, session_id: 0x%llx\n",
> -			vcrypto->ctrl_status.status, destroy_session->session_id);
> -	}
> +	kfree_sensitive(vc_ctrl_req);
>  
>  	return err;
>  }
> diff --git a/drivers/crypto/virtio/virtio_crypto_common.c b/drivers/crypto/virtio/virtio_crypto_common.c
> new file mode 100644
> index 000000000000..93df73c40dd3
> --- /dev/null
> +++ b/drivers/crypto/virtio/virtio_crypto_common.c
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* Common functions and helpers
> + *
> + * Authors: zhenwei pi <pizhenwei@bytedance.com>
> + *
> + * Copyright 2022 Bytedance CO., LTD.
> + */
> +
> +#include "virtio_crypto_common.h"
> +
> +static void virtio_crypto_ctrlq_callback(struct virtio_crypto_ctrl_request *vc_ctrl_req)
> +{
> +	complete(&vc_ctrl_req->compl);
> +}
> +
> +int virtio_crypto_ctrl_vq_request(struct virtio_crypto *vcrypto, struct scatterlist *sgs[],
> +				  unsigned int out_sgs, unsigned int in_sgs,
> +				  struct virtio_crypto_ctrl_request *vc_ctrl_req)
> +{
> +	int err;
> +	unsigned long flags;
> +
> +	init_completion(&vc_ctrl_req->compl);
> +	vc_ctrl_req->ctrl_cb =  virtio_crypto_ctrlq_callback;
> +
> +	spin_lock_irqsave(&vcrypto->ctrl_lock, flags);
> +	err = virtqueue_add_sgs(vcrypto->ctrl_vq, sgs, out_sgs, in_sgs, vc_ctrl_req, GFP_ATOMIC);
> +	if (err < 0) {
> +		spin_unlock_irqrestore(&vcrypto->ctrl_lock, flags);
> +		return err;
> +	}
> +
> +	virtqueue_kick(vcrypto->ctrl_vq);
> +	spin_unlock_irqrestore(&vcrypto->ctrl_lock, flags);
> +
> +	wait_for_completion(&vc_ctrl_req->compl);
> +
> +	return 0;
> +}
> +
> +void virtcrypto_ctrlq_callback(struct virtqueue *vq)
> +{
> +	struct virtio_crypto *vcrypto = vq->vdev->priv;
> +	struct virtio_crypto_ctrl_request *vc_ctrl_req;
> +	unsigned long flags;
> +	unsigned int len;
> +
> +	spin_lock_irqsave(&vcrypto->ctrl_lock, flags);
> +	do {
> +		virtqueue_disable_cb(vq);
> +		while ((vc_ctrl_req = virtqueue_get_buf(vq, &len)) != NULL) {


you really need to break out of this loop if vq is broken,
virtqueue_get_buf will keep returning NULL in this case.


> +			spin_unlock_irqrestore(&vcrypto->ctrl_lock, flags);
> +			if (vc_ctrl_req->ctrl_cb)
> +				vc_ctrl_req->ctrl_cb(vc_ctrl_req);
> +			spin_lock_irqsave(&vcrypto->ctrl_lock, flags);
> +		}
> +		if (unlikely(virtqueue_is_broken(vq)))
> +			break;
> +	} while (!virtqueue_enable_cb(vq));
> +	spin_unlock_irqrestore(&vcrypto->ctrl_lock, flags);

speaking of which existing code does not handle vq broken case
all that well but it looks like this patch makes it a bit worse.
want to try fixing? basically report an error ...


> +}
> diff --git a/drivers/crypto/virtio/virtio_crypto_common.h b/drivers/crypto/virtio/virtio_crypto_common.h
> index e693d4ee83a6..125ad2300b83 100644
> --- a/drivers/crypto/virtio/virtio_crypto_common.h
> +++ b/drivers/crypto/virtio/virtio_crypto_common.h
> @@ -13,6 +13,7 @@
>  #include <crypto/aead.h>
>  #include <crypto/aes.h>
>  #include <crypto/engine.h>
> +#include <uapi/linux/virtio_crypto.h>
>  
>  
>  /* Internal representation of a data virtqueue */
> @@ -65,11 +66,6 @@ struct virtio_crypto {
>  	/* Maximum size of per request */
>  	u64 max_size;
>  
> -	/* Control VQ buffers: protected by the ctrl_lock */
> -	struct virtio_crypto_op_ctrl_req ctrl;
> -	struct virtio_crypto_session_input input;
> -	struct virtio_crypto_inhdr ctrl_status;
> -
>  	unsigned long status;
>  	atomic_t ref_count;
>  	struct list_head list;

which is ok as far as it goes but seems unrelated to what
the patch is trying to do ...

> @@ -85,6 +81,18 @@ struct virtio_crypto_sym_session_info {
>  	__u64 session_id;
>  };
>  
> +struct virtio_crypto_ctrl_request;
> +typedef void (*virtio_crypto_ctrl_callback)
> +		(struct virtio_crypto_ctrl_request *vc_ctrl_req);
> +
> +struct virtio_crypto_ctrl_request {
> +	struct virtio_crypto_op_ctrl_req ctrl;
> +	struct virtio_crypto_session_input input;
> +	struct virtio_crypto_inhdr ctrl_status;
> +	virtio_crypto_ctrl_callback ctrl_cb;
> +	struct completion compl;
> +};
> +
>  struct virtio_crypto_request;
>  typedef void (*virtio_crypto_data_callback)
>  		(struct virtio_crypto_request *vc_req, int len);
> @@ -135,4 +143,9 @@ void virtio_crypto_skcipher_algs_unregister(struct virtio_crypto *vcrypto);
>  int virtio_crypto_akcipher_algs_register(struct virtio_crypto *vcrypto);
>  void virtio_crypto_akcipher_algs_unregister(struct virtio_crypto *vcrypto);
>  
> +void virtcrypto_ctrlq_callback(struct virtqueue *vq);
> +int virtio_crypto_ctrl_vq_request(struct virtio_crypto *vcrypto, struct scatterlist *sgs[],
> +				  unsigned int out_sgs, unsigned int in_sgs,
> +				  struct virtio_crypto_ctrl_request *vc_ctrl_req);
> +
>  #endif /* _VIRTIO_CRYPTO_COMMON_H */
> diff --git a/drivers/crypto/virtio/virtio_crypto_core.c b/drivers/crypto/virtio/virtio_crypto_core.c
> index c6f482db0bc0..e668d4b1bc6a 100644
> --- a/drivers/crypto/virtio/virtio_crypto_core.c
> +++ b/drivers/crypto/virtio/virtio_crypto_core.c
> @@ -73,7 +73,7 @@ static int virtcrypto_find_vqs(struct virtio_crypto *vi)
>  		goto err_names;
>  
>  	/* Parameters for control virtqueue */
> -	callbacks[total_vqs - 1] = NULL;
> +	callbacks[total_vqs - 1] = virtcrypto_ctrlq_callback;
>  	names[total_vqs - 1] = "controlq";
>  
>  	/* Allocate/initialize parameters for data virtqueues */
> diff --git a/drivers/crypto/virtio/virtio_crypto_skcipher_algs.c b/drivers/crypto/virtio/virtio_crypto_skcipher_algs.c
> index a618c46a52b8..b8999dab3e66 100644
> --- a/drivers/crypto/virtio/virtio_crypto_skcipher_algs.c
> +++ b/drivers/crypto/virtio/virtio_crypto_skcipher_algs.c
> @@ -118,11 +118,14 @@ static int virtio_crypto_alg_skcipher_init_session(
>  		int encrypt)
>  {
>  	struct scatterlist outhdr, key_sg, inhdr, *sgs[3];
> -	unsigned int tmp;
>  	struct virtio_crypto *vcrypto = ctx->vcrypto;
>  	int op = encrypt ? VIRTIO_CRYPTO_OP_ENCRYPT : VIRTIO_CRYPTO_OP_DECRYPT;
> -	int err;
> +	int err = -ENOMEM;
>  	unsigned int num_out = 0, num_in = 0;
> +	struct virtio_crypto_ctrl_request *vc_ctrl_req = NULL;
> +	struct virtio_crypto_ctrl_header *header;
> +	struct virtio_crypto_sym_create_session_req *sym_create_session;
> +	int node = dev_to_node(&vcrypto->vdev->dev);
>  
>  	/*
>  	 * Avoid to do DMA from the stack, switch to using
> @@ -133,26 +136,25 @@ static int virtio_crypto_alg_skcipher_init_session(
>  	if (!cipher_key)
>  		return -ENOMEM;
>  
> -	spin_lock(&vcrypto->ctrl_lock);
> +	vc_ctrl_req = kzalloc_node(sizeof(*vc_ctrl_req), GFP_KERNEL, node);
> +	if (!vc_ctrl_req)
> +		goto out;
> +
>  	/* Pad ctrl header */
> -	vcrypto->ctrl.header.opcode =
> -		cpu_to_le32(VIRTIO_CRYPTO_CIPHER_CREATE_SESSION);
> -	vcrypto->ctrl.header.algo = cpu_to_le32(alg);
> +	header = &vc_ctrl_req->ctrl.header;
> +	header->opcode = cpu_to_le32(VIRTIO_CRYPTO_CIPHER_CREATE_SESSION);
> +	header->algo = cpu_to_le32(alg);
>  	/* Set the default dataqueue id to 0 */
> -	vcrypto->ctrl.header.queue_id = 0;
> +	header->queue_id = 0;
>  
> -	vcrypto->input.status = cpu_to_le32(VIRTIO_CRYPTO_ERR);
>  	/* Pad cipher's parameters */
> -	vcrypto->ctrl.u.sym_create_session.op_type =
> -		cpu_to_le32(VIRTIO_CRYPTO_SYM_OP_CIPHER);
> -	vcrypto->ctrl.u.sym_create_session.u.cipher.para.algo =
> -		vcrypto->ctrl.header.algo;
> -	vcrypto->ctrl.u.sym_create_session.u.cipher.para.keylen =
> -		cpu_to_le32(keylen);
> -	vcrypto->ctrl.u.sym_create_session.u.cipher.para.op =
> -		cpu_to_le32(op);
> -
> -	sg_init_one(&outhdr, &vcrypto->ctrl, sizeof(vcrypto->ctrl));
> +	sym_create_session = &vc_ctrl_req->ctrl.u.sym_create_session;
> +	sym_create_session->op_type = cpu_to_le32(VIRTIO_CRYPTO_SYM_OP_CIPHER);
> +	sym_create_session->u.cipher.para.algo = header->algo;
> +	sym_create_session->u.cipher.para.keylen = cpu_to_le32(keylen);
> +	sym_create_session->u.cipher.para.op = cpu_to_le32(op);
> +
> +	sg_init_one(&outhdr, &vc_ctrl_req->ctrl, sizeof(vc_ctrl_req->ctrl));
>  	sgs[num_out++] = &outhdr;
>  
>  	/* Set key */
> @@ -160,45 +162,34 @@ static int virtio_crypto_alg_skcipher_init_session(
>  	sgs[num_out++] = &key_sg;
>  
>  	/* Return status and session id back */
> -	sg_init_one(&inhdr, &vcrypto->input, sizeof(vcrypto->input));
> +	vc_ctrl_req->input.status = cpu_to_le32(VIRTIO_CRYPTO_ERR);
> +	sg_init_one(&inhdr, &vc_ctrl_req->input, sizeof(vc_ctrl_req->input));
>  	sgs[num_out + num_in++] = &inhdr;
>  
> -	err = virtqueue_add_sgs(vcrypto->ctrl_vq, sgs, num_out,
> -				num_in, vcrypto, GFP_ATOMIC);
> -	if (err < 0) {
> -		spin_unlock(&vcrypto->ctrl_lock);
> -		kfree_sensitive(cipher_key);
> -		return err;
> -	}
> -	virtqueue_kick(vcrypto->ctrl_vq);
> +	err = virtio_crypto_ctrl_vq_request(vcrypto, sgs, num_out, num_in, vc_ctrl_req);
> +	if (err < 0)
> +		goto out;
>  
> -	/*
> -	 * Trapping into the hypervisor, so the request should be
> -	 * handled immediately.
> -	 */
> -	while (!virtqueue_get_buf(vcrypto->ctrl_vq, &tmp) &&
> -	       !virtqueue_is_broken(vcrypto->ctrl_vq))
> -		cpu_relax();
> -
> -	if (le32_to_cpu(vcrypto->input.status) != VIRTIO_CRYPTO_OK) {
> -		spin_unlock(&vcrypto->ctrl_lock);
> +	if (le32_to_cpu(vc_ctrl_req->input.status) != VIRTIO_CRYPTO_OK) {
>  		pr_err("virtio_crypto: Create session failed status: %u\n",
> -			le32_to_cpu(vcrypto->input.status));
> -		kfree_sensitive(cipher_key);
> -		return -EINVAL;
> +			le32_to_cpu(vc_ctrl_req->input.status));
> +		err = -EINVAL;
> +		goto out;
>  	}
>  
>  	if (encrypt)
>  		ctx->enc_sess_info.session_id =
> -			le64_to_cpu(vcrypto->input.session_id);
> +			le64_to_cpu(vc_ctrl_req->input.session_id);
>  	else
>  		ctx->dec_sess_info.session_id =
> -			le64_to_cpu(vcrypto->input.session_id);
> -
> -	spin_unlock(&vcrypto->ctrl_lock);
> +			le64_to_cpu(vc_ctrl_req->input.session_id);
>  
> +	err = 0;
> +out:
> +	kfree_sensitive(vc_ctrl_req);

it is interesting that you use kfree_sensitive here. why is that?
is there in fact anything sensitive here? if yes this is a security
improvement and might need its own patch, or at least documentation.

>  	kfree_sensitive(cipher_key);
> -	return 0;
> +
> +	return err;
>  }
>  
>  static int virtio_crypto_alg_skcipher_close_session(
> @@ -206,21 +197,25 @@ static int virtio_crypto_alg_skcipher_close_session(
>  		int encrypt)
>  {
>  	struct scatterlist outhdr, status_sg, *sgs[2];
> -	unsigned int tmp;
>  	struct virtio_crypto_destroy_session_req *destroy_session;
>  	struct virtio_crypto *vcrypto = ctx->vcrypto;
>  	int err;
>  	unsigned int num_out = 0, num_in = 0;
> +	struct virtio_crypto_ctrl_request *vc_ctrl_req = NULL;
> +	struct virtio_crypto_ctrl_header *header;
> +	int node = dev_to_node(&vcrypto->vdev->dev);
> +
> +	vc_ctrl_req = kzalloc_node(sizeof(*vc_ctrl_req), GFP_KERNEL, node);
> +	if (!vc_ctrl_req)
> +		return -ENOMEM;
>  
> -	spin_lock(&vcrypto->ctrl_lock);
> -	vcrypto->ctrl_status.status = VIRTIO_CRYPTO_ERR;
>  	/* Pad ctrl header */
> -	vcrypto->ctrl.header.opcode =
> -		cpu_to_le32(VIRTIO_CRYPTO_CIPHER_DESTROY_SESSION);
> +	header = &vc_ctrl_req->ctrl.header;
> +	header->opcode = cpu_to_le32(VIRTIO_CRYPTO_CIPHER_DESTROY_SESSION);
>  	/* Set the default virtqueue id to 0 */
> -	vcrypto->ctrl.header.queue_id = 0;
> +	header->queue_id = 0;
>  
> -	destroy_session = &vcrypto->ctrl.u.destroy_session;
> +	destroy_session = &vc_ctrl_req->ctrl.u.destroy_session;
>  
>  	if (encrypt)
>  		destroy_session->session_id =
> @@ -229,37 +224,32 @@ static int virtio_crypto_alg_skcipher_close_session(
>  		destroy_session->session_id =
>  			cpu_to_le64(ctx->dec_sess_info.session_id);
>  
> -	sg_init_one(&outhdr, &vcrypto->ctrl, sizeof(vcrypto->ctrl));
> +	sg_init_one(&outhdr, &vc_ctrl_req->ctrl, sizeof(vc_ctrl_req->ctrl));
>  	sgs[num_out++] = &outhdr;
>  
>  	/* Return status and session id back */
> -	sg_init_one(&status_sg, &vcrypto->ctrl_status.status,
> -		sizeof(vcrypto->ctrl_status.status));
> +	vc_ctrl_req->ctrl_status.status = VIRTIO_CRYPTO_ERR;
> +	sg_init_one(&status_sg, &vc_ctrl_req->ctrl_status.status,
> +		sizeof(vc_ctrl_req->ctrl_status.status));
>  	sgs[num_out + num_in++] = &status_sg;
>  
> -	err = virtqueue_add_sgs(vcrypto->ctrl_vq, sgs, num_out,
> -			num_in, vcrypto, GFP_ATOMIC);
> -	if (err < 0) {
> -		spin_unlock(&vcrypto->ctrl_lock);
> -		return err;
> -	}
> -	virtqueue_kick(vcrypto->ctrl_vq);
> -
> -	while (!virtqueue_get_buf(vcrypto->ctrl_vq, &tmp) &&
> -	       !virtqueue_is_broken(vcrypto->ctrl_vq))
> -		cpu_relax();
> +	err = virtio_crypto_ctrl_vq_request(vcrypto, sgs, num_out, num_in, vc_ctrl_req);
> +	if (err < 0)
> +		goto out;
>  
> -	if (vcrypto->ctrl_status.status != VIRTIO_CRYPTO_OK) {
> -		spin_unlock(&vcrypto->ctrl_lock);
> +	if (vc_ctrl_req->ctrl_status.status != VIRTIO_CRYPTO_OK) {
>  		pr_err("virtio_crypto: Close session failed status: %u, session_id: 0x%llx\n",
> -			vcrypto->ctrl_status.status,
> +			vc_ctrl_req->ctrl_status.status,
>  			destroy_session->session_id);
>  
> -		return -EINVAL;
> +		err = -EINVAL;
>  	}
> -	spin_unlock(&vcrypto->ctrl_lock);
>  
> -	return 0;
> +	err = 0;
> +out:
> +	kfree_sensitive(vc_ctrl_req);
> +
> +	return err;


same comments apply to this function.

>  }
>  
>  static int virtio_crypto_alg_skcipher_init_sessions(
> -- 
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
