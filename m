Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E381051D45D
	for <lists.virtualization@lfdr.de>; Fri,  6 May 2022 11:28:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 939DB60BFE;
	Fri,  6 May 2022 09:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id trO8Lec1C313; Fri,  6 May 2022 09:28:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6394C60D94;
	Fri,  6 May 2022 09:28:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC841C002D;
	Fri,  6 May 2022 09:28:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA9FDC002D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 May 2022 09:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B893183FBB
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 May 2022 09:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TnYUToO6zqZ3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 May 2022 09:28:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B86AC840A4
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 May 2022 09:28:05 +0000 (UTC)
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KvlZS3bvfz1JBmX;
 Fri,  6 May 2022 17:26:56 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 kwepemi500011.china.huawei.com (7.221.188.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 6 May 2022 17:28:01 +0800
Received: from dggpemm500006.china.huawei.com ([7.185.36.236]) by
 dggpemm500006.china.huawei.com ([7.185.36.236]) with mapi id 15.01.2375.024;
 Fri, 6 May 2022 17:28:01 +0800
To: zhenwei pi <pizhenwei@bytedance.com>, "mst@redhat.com" <mst@redhat.com>
Subject: RE: [PATCH v5 4/5] virtio-crypto: adjust dst_len at ops callback
Thread-Topic: [PATCH v5 4/5] virtio-crypto: adjust dst_len at ops callback
Thread-Index: AQHYYGJ6/Z4WULmv0kCZX8LJqZ7zXa0Rlkkg
Date: Fri, 6 May 2022 09:28:01 +0000
Message-ID: <f2addf5602254e2c81b52c30cb2c8180@huawei.com>
References: <20220505092408.53692-1-pizhenwei@bytedance.com>
 <20220505092408.53692-5-pizhenwei@bytedance.com>
In-Reply-To: <20220505092408.53692-5-pizhenwei@bytedance.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.11]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>
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
From: "Gonglei \(Arei\) via Virtualization"
 <virtualization@lists.linux-foundation.org>
Reply-To: "Gonglei \(Arei\)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



> -----Original Message-----
> From: zhenwei pi [mailto:pizhenwei@bytedance.com]
> Sent: Thursday, May 5, 2022 5:24 PM
> To: Gonglei (Arei) <arei.gonglei@huawei.com>; mst@redhat.com
> Cc: jasowang@redhat.com; herbert@gondor.apana.org.au;
> linux-kernel@vger.kernel.org; virtualization@lists.linux-foundation.org;
> linux-crypto@vger.kernel.org; helei.sig11@bytedance.com;
> pizhenwei@bytedance.com; davem@davemloft.net
> Subject: [PATCH v5 4/5] virtio-crypto: adjust dst_len at ops callback
> 
> From: lei he <helei.sig11@bytedance.com>
> 
> For some akcipher operations(eg, decryption of pkcs1pad(rsa)), the length of
> returned result maybe less than akcipher_req->dst_len, we need to recalculate
> the actual dst_len through the virt-queue protocol.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Gonglei <arei.gonglei@huawei.com>
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  drivers/crypto/virtio/virtio_crypto_akcipher_algs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gonglei <arei.gonglei@huawei.com>

Regards,
-Gonglei


> diff --git a/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
> b/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
> index 382ccec9ab12..2a60d0525cde 100644
> --- a/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
> +++ b/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
> @@ -90,9 +90,12 @@ static void
> virtio_crypto_dataq_akcipher_callback(struct virtio_crypto_request *
>  	}
> 
>  	akcipher_req = vc_akcipher_req->akcipher_req;
> -	if (vc_akcipher_req->opcode != VIRTIO_CRYPTO_AKCIPHER_VERIFY)
> +	if (vc_akcipher_req->opcode != VIRTIO_CRYPTO_AKCIPHER_VERIFY) {
> +		/* actuall length maybe less than dst buffer */
> +		akcipher_req->dst_len = len - sizeof(vc_req->status);
>  		sg_copy_from_buffer(akcipher_req->dst,
> sg_nents(akcipher_req->dst),
>  				    vc_akcipher_req->dst_buf, akcipher_req->dst_len);
> +	}
>  	virtio_crypto_akcipher_finalize_req(vc_akcipher_req, akcipher_req,
> error);  }
> 
> --
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
