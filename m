Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F271E2183
	for <lists.virtualization@lfdr.de>; Tue, 26 May 2020 14:00:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A99D185F6C;
	Tue, 26 May 2020 12:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8wTUHFoh6AlX; Tue, 26 May 2020 12:00:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0BFA3851C0;
	Tue, 26 May 2020 12:00:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBE29C016F;
	Tue, 26 May 2020 12:00:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13536C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 12:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0061A87D0B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 12:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kp1zL2x72L1A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 12:00:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 53DC487C0D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 12:00:44 +0000 (UTC)
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 8CC2A219BB824B1F228F;
 Tue, 26 May 2020 20:00:40 +0800 (CST)
Received: from DGGEML531-MBS.china.huawei.com ([169.254.5.130]) by
 DGGEML401-HUB.china.huawei.com ([fe80::89ed:853e:30a9:2a79%31]) with mapi id
 14.03.0487.000; Tue, 26 May 2020 20:00:34 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>, "linux-crypto@vger.kernel.org"
 <linux-crypto@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] crypto: virtio: Fix use-after-free in
 virtio_crypto_skcipher_finalize_req()
Thread-Topic: [PATCH v2 2/2] crypto: virtio: Fix use-after-free in
 virtio_crypto_skcipher_finalize_req()
Thread-Index: AQHWMwyZcHiP+r3rKk+F0nYZAiiWqKi6Qu8g
Date: Tue, 26 May 2020 12:00:33 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020DF5EA250@dggeml531-mbs.china.huawei.com>
References: <20200526031956.1897-1-longpeng2@huawei.com>
 <20200526031956.1897-3-longpeng2@huawei.com>
In-Reply-To: <20200526031956.1897-3-longpeng2@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.133.225.234]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Markus Elfring <Markus.Elfring@web.de>, LABBE Corentin <clabbe@baylibre.com>,
 "David S. Miller" <davem@davemloft.net>
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


> -----Original Message-----
> From: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> Sent: Tuesday, May 26, 2020 11:20 AM
> To: linux-crypto@vger.kernel.org
> Cc: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>; LABBE Corentin <clabbe@baylibre.com>; Gonglei
> (Arei) <arei.gonglei@huawei.com>; Herbert Xu
> <herbert@gondor.apana.org.au>; Michael S. Tsirkin <mst@redhat.com>; Jason
> Wang <jasowang@redhat.com>; David S. Miller <davem@davemloft.net>;
> Markus Elfring <Markus.Elfring@web.de>;
> virtualization@lists.linux-foundation.org; linux-kernel@vger.kernel.org;
> stable@vger.kernel.org
> Subject: [PATCH v2 2/2] crypto: virtio: Fix use-after-free in
> virtio_crypto_skcipher_finalize_req()
> 
> The system'll crash when the users insmod crypto/tcrypto.ko with mode=155
> ( testing "authenc(hmac(sha1),cbc(aes))" ). It's caused by reuse the memory of
> request structure.
> 
> In crypto_authenc_init_tfm(), the reqsize is set to:
>   [PART 1] sizeof(authenc_request_ctx) +
>   [PART 2] ictx->reqoff +
>   [PART 3] MAX(ahash part, skcipher part) and the 'PART 3' is used by both
> ahash and skcipher in turn.
> 
> When the virtio_crypto driver finish skcipher req, it'll call ->complete callback(in
> crypto_finalize_skcipher_request) and then free its resources whose pointers
> are recorded in 'skcipher parts'.
> 
> However, the ->complete is 'crypto_authenc_encrypt_done' in this case, it will
> use the 'ahash part' of the request and change its content, so virtio_crypto
> driver will get the wrong pointer after ->complete finish and mistakenly free
> some other's memory. So the system will crash when these memory will be used
> again.
> 
> The resources which need to be cleaned up are not used any more. But the
> pointers of these resources may be changed in the function
> "crypto_finalize_skcipher_request". Thus release specific resources before
> calling this function.
> 
> Fixes: dbaf0624ffa5 ("crypto: add virtio-crypto driver")
> Reported-by: LABBE Corentin <clabbe@baylibre.com>
> Cc: Gonglei <arei.gonglei@huawei.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Markus Elfring <Markus.Elfring@web.de>
> Cc: virtualization@lists.linux-foundation.org
> Cc: linux-kernel@vger.kernel.org
> Cc: stable@vger.kernel.org
> Message-Id: <20200123101000.GB24255@Red>
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---

Acked-by: Gonglei <arei.gonglei@huawei.com>

Regards,
-Gonglei

>  drivers/crypto/virtio/virtio_crypto_algs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/virtio/virtio_crypto_algs.c
> b/drivers/crypto/virtio/virtio_crypto_algs.c
> index 5f8243563009..52261b6c247e 100644
> --- a/drivers/crypto/virtio/virtio_crypto_algs.c
> +++ b/drivers/crypto/virtio/virtio_crypto_algs.c
> @@ -582,10 +582,11 @@ static void virtio_crypto_skcipher_finalize_req(
>  		scatterwalk_map_and_copy(req->iv, req->dst,
>  					 req->cryptlen - AES_BLOCK_SIZE,
>  					 AES_BLOCK_SIZE, 0);
> -	crypto_finalize_skcipher_request(vc_sym_req->base.dataq->engine,
> -					   req, err);
>  	kzfree(vc_sym_req->iv);
>  	virtcrypto_clear_request(&vc_sym_req->base);
> +
> +	crypto_finalize_skcipher_request(vc_sym_req->base.dataq->engine,
> +					   req, err);
>  }
> 
>  static struct virtio_crypto_algo virtio_crypto_algs[] = { {
> --
> 2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
