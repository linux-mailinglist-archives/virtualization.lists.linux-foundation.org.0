Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC865EBFD
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 20:52:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 091E2E55;
	Wed,  3 Jul 2019 18:51:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D87E3E50
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 18:51:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6E26B87B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 18:51:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 751483E2B7;
	Wed,  3 Jul 2019 18:51:48 +0000 (UTC)
Received: from redhat.com (ovpn-123-166.rdu2.redhat.com [10.10.123.166])
	by smtp.corp.redhat.com (Postfix) with SMTP id 39A3D3795;
	Wed,  3 Jul 2019 18:51:43 +0000 (UTC)
Date: Wed, 3 Jul 2019 14:51:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: Re: [PATCH v2 06/35] crypto: Use kmemdup rather than duplicating its
	implementation
Message-ID: <20190703145109-mutt-send-email-mst@kernel.org>
References: <20190703162708.32137-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703162708.32137-1-huangfq.daxian@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 03 Jul 2019 18:51:53 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
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

On Thu, Jul 04, 2019 at 12:27:08AM +0800, Fuqian Huang wrote:
> kmemdup is introduced to duplicate a region of memory in a neat way.
> Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
> write the size twice (sometimes lead to mistakes), kmemdup improves
> readability, leads to smaller code and also reduce the chances of mistakes.
> Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>

virtio part:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
> Changes in v2:
>   - Fix a typo in commit message (memset -> memcpy)
> 
>  drivers/crypto/caam/caampkc.c              | 11 +++--------
>  drivers/crypto/virtio/virtio_crypto_algs.c |  4 +---
>  2 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/crypto/caam/caampkc.c b/drivers/crypto/caam/caampkc.c
> index fe24485274e1..a03464b4c019 100644
> --- a/drivers/crypto/caam/caampkc.c
> +++ b/drivers/crypto/caam/caampkc.c
> @@ -816,7 +816,7 @@ static int caam_rsa_set_pub_key(struct crypto_akcipher *tfm, const void *key,
>  		return ret;
>  
>  	/* Copy key in DMA zone */
> -	rsa_key->e = kzalloc(raw_key.e_sz, GFP_DMA | GFP_KERNEL);
> +	rsa_key->e = kmemdup(raw_key.e, raw_key.e_sz, GFP_DMA | GFP_KERNEL);
>  	if (!rsa_key->e)
>  		goto err;
>  
> @@ -838,8 +838,6 @@ static int caam_rsa_set_pub_key(struct crypto_akcipher *tfm, const void *key,
>  	rsa_key->e_sz = raw_key.e_sz;
>  	rsa_key->n_sz = raw_key.n_sz;
>  
> -	memcpy(rsa_key->e, raw_key.e, raw_key.e_sz);
> -
>  	return 0;
>  err:
>  	caam_rsa_free_key(rsa_key);
> @@ -920,11 +918,11 @@ static int caam_rsa_set_priv_key(struct crypto_akcipher *tfm, const void *key,
>  		return ret;
>  
>  	/* Copy key in DMA zone */
> -	rsa_key->d = kzalloc(raw_key.d_sz, GFP_DMA | GFP_KERNEL);
> +	rsa_key->d = kmemdup(raw_key.d, raw_key.d_sz, GFP_DMA | GFP_KERNEL);
>  	if (!rsa_key->d)
>  		goto err;
>  
> -	rsa_key->e = kzalloc(raw_key.e_sz, GFP_DMA | GFP_KERNEL);
> +	rsa_key->e = kmemdup(raw_key.e, raw_key.e_sz, GFP_DMA | GFP_KERNEL);
>  	if (!rsa_key->e)
>  		goto err;
>  
> @@ -947,9 +945,6 @@ static int caam_rsa_set_priv_key(struct crypto_akcipher *tfm, const void *key,
>  	rsa_key->e_sz = raw_key.e_sz;
>  	rsa_key->n_sz = raw_key.n_sz;
>  
> -	memcpy(rsa_key->d, raw_key.d, raw_key.d_sz);
> -	memcpy(rsa_key->e, raw_key.e, raw_key.e_sz);
> -
>  	caam_rsa_set_priv_key_form(ctx, &raw_key);
>  
>  	return 0;
> diff --git a/drivers/crypto/virtio/virtio_crypto_algs.c b/drivers/crypto/virtio/virtio_crypto_algs.c
> index 10f266d462d6..42d19205166b 100644
> --- a/drivers/crypto/virtio/virtio_crypto_algs.c
> +++ b/drivers/crypto/virtio/virtio_crypto_algs.c
> @@ -129,13 +129,11 @@ static int virtio_crypto_alg_ablkcipher_init_session(
>  	 * Avoid to do DMA from the stack, switch to using
>  	 * dynamically-allocated for the key
>  	 */
> -	uint8_t *cipher_key = kmalloc(keylen, GFP_ATOMIC);
> +	uint8_t *cipher_key = kmemdup(key, keylen, GFP_ATOMIC);
>  
>  	if (!cipher_key)
>  		return -ENOMEM;
>  
> -	memcpy(cipher_key, key, keylen);
> -
>  	spin_lock(&vcrypto->ctrl_lock);
>  	/* Pad ctrl header */
>  	vcrypto->ctrl.header.opcode =
> -- 
> 2.11.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
