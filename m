Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEED4CE35E
	for <lists.virtualization@lfdr.de>; Sat,  5 Mar 2022 08:11:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A965B40986;
	Sat,  5 Mar 2022 07:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZe6xVTKPnZj; Sat,  5 Mar 2022 07:11:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 449FB408BF;
	Sat,  5 Mar 2022 07:11:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BDF0C0070;
	Sat,  5 Mar 2022 07:11:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D8E4C000B
 for <virtualization@lists.linux-foundation.org>;
 Sat,  5 Mar 2022 07:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F19D082718
 for <virtualization@lists.linux-foundation.org>;
 Sat,  5 Mar 2022 07:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJh4E5fh606K
 for <virtualization@lists.linux-foundation.org>;
 Sat,  5 Mar 2022 07:11:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50A5C826A4
 for <virtualization@lists.linux-foundation.org>;
 Sat,  5 Mar 2022 07:11:41 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4K9bQn0KV3z9sH3;
 Sat,  5 Mar 2022 15:08:01 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 5 Mar 2022 15:11:37 +0800
Received: from dggpemm500006.china.huawei.com ([7.185.36.236]) by
 dggpemm500006.china.huawei.com ([7.185.36.236]) with mapi id 15.01.2308.021;
 Sat, 5 Mar 2022 15:11:37 +0800
To: zhenwei pi <pizhenwei@bytedance.com>, "mst@redhat.com" <mst@redhat.com>
Subject: RE: [PATCH v3 2/4] virtio-crypto: introduce akcipher service
Thread-Topic: [PATCH v3 2/4] virtio-crypto: introduce akcipher service
Thread-Index: AQHYLeeMUc1GsWuz90i/NBDHup0cZaywZIOw
Date: Sat, 5 Mar 2022 07:11:37 +0000
Message-ID: <fb80509cfc6e4658bdda886ca3405101@huawei.com>
References: <20220302033917.1295334-1-pizhenwei@bytedance.com>
 <20220302033917.1295334-3-pizhenwei@bytedance.com>
In-Reply-To: <20220302033917.1295334-3-pizhenwei@bytedance.com>
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
> Sent: Wednesday, March 2, 2022 11:39 AM
> To: Gonglei (Arei) <arei.gonglei@huawei.com>; mst@redhat.com
> Cc: jasowang@redhat.com; virtualization@lists.linux-foundation.org;
> linux-crypto@vger.kernel.org; linux-kernel@vger.kernel.org;
> herbert@gondor.apana.org.au; helei.sig11@bytedance.com; zhenwei pi
> <pizhenwei@bytedance.com>
> Subject: [PATCH v3 2/4] virtio-crypto: introduce akcipher service
> 
> Introduce asymmetric service definition, asymmetric operations and several
> well known algorithms.
> 
> Co-developed-by: lei he <helei.sig11@bytedance.com>
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  include/uapi/linux/virtio_crypto.h | 81 +++++++++++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gonglei <arei.gonglei@huawei.com>

Regards,
-Gonglei

> diff --git a/include/uapi/linux/virtio_crypto.h
> b/include/uapi/linux/virtio_crypto.h
> index 1166a49084b0..71a54a6849ca 100644
> --- a/include/uapi/linux/virtio_crypto.h
> +++ b/include/uapi/linux/virtio_crypto.h
> @@ -37,6 +37,7 @@
>  #define VIRTIO_CRYPTO_SERVICE_HASH   1
>  #define VIRTIO_CRYPTO_SERVICE_MAC    2
>  #define VIRTIO_CRYPTO_SERVICE_AEAD   3
> +#define VIRTIO_CRYPTO_SERVICE_AKCIPHER 4
> 
>  #define VIRTIO_CRYPTO_OPCODE(service, op)   (((service) << 8) | (op))
> 
> @@ -57,6 +58,10 @@ struct virtio_crypto_ctrl_header {
>  	   VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x02)
> #define VIRTIO_CRYPTO_AEAD_DESTROY_SESSION \
>  	   VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x03)
> +#define VIRTIO_CRYPTO_AKCIPHER_CREATE_SESSION \
> +	   VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x04)
> #define
> +VIRTIO_CRYPTO_AKCIPHER_DESTROY_SESSION \
> +	   VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER,
> 0x05)
>  	__le32 opcode;
>  	__le32 algo;
>  	__le32 flag;
> @@ -180,6 +185,58 @@ struct virtio_crypto_aead_create_session_req {
>  	__u8 padding[32];
>  };
> 
> +struct virtio_crypto_rsa_session_para {
> +#define VIRTIO_CRYPTO_RSA_RAW_PADDING   0
> +#define VIRTIO_CRYPTO_RSA_PKCS1_PADDING 1
> +	__le32 padding_algo;
> +
> +#define VIRTIO_CRYPTO_RSA_NO_HASH   0
> +#define VIRTIO_CRYPTO_RSA_MD2       1
> +#define VIRTIO_CRYPTO_RSA_MD3       2
> +#define VIRTIO_CRYPTO_RSA_MD4       3
> +#define VIRTIO_CRYPTO_RSA_MD5       4
> +#define VIRTIO_CRYPTO_RSA_SHA1      5
> +#define VIRTIO_CRYPTO_RSA_SHA256    6
> +#define VIRTIO_CRYPTO_RSA_SHA384    7
> +#define VIRTIO_CRYPTO_RSA_SHA512    8
> +#define VIRTIO_CRYPTO_RSA_SHA224    9
> +	__le32 hash_algo;
> +};
> +
> +struct virtio_crypto_ecdsa_session_para {
> +#define VIRTIO_CRYPTO_CURVE_UNKNOWN   0
> +#define VIRTIO_CRYPTO_CURVE_NIST_P192 1 #define
> +VIRTIO_CRYPTO_CURVE_NIST_P224 2 #define
> VIRTIO_CRYPTO_CURVE_NIST_P256 3
> +#define VIRTIO_CRYPTO_CURVE_NIST_P384 4 #define
> +VIRTIO_CRYPTO_CURVE_NIST_P521 5
> +	__le32 curve_id;
> +	__le32 padding;
> +};
> +
> +struct virtio_crypto_akcipher_session_para {
> +#define VIRTIO_CRYPTO_NO_AKCIPHER    0
> +#define VIRTIO_CRYPTO_AKCIPHER_RSA   1
> +#define VIRTIO_CRYPTO_AKCIPHER_DSA   2
> +#define VIRTIO_CRYPTO_AKCIPHER_ECDSA 3
> +	__le32 algo;
> +
> +#define VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PUBLIC  1 #define
> +VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PRIVATE 2
> +	__le32 keytype;
> +	__le32 keylen;
> +
> +	union {
> +		struct virtio_crypto_rsa_session_para rsa;
> +		struct virtio_crypto_ecdsa_session_para ecdsa;
> +	} u;
> +};
> +
> +struct virtio_crypto_akcipher_create_session_req {
> +	struct virtio_crypto_akcipher_session_para para;
> +	__u8 padding[36];
> +};
> +
>  struct virtio_crypto_alg_chain_session_para {  #define
> VIRTIO_CRYPTO_SYM_ALG_CHAIN_ORDER_HASH_THEN_CIPHER  1
> #define VIRTIO_CRYPTO_SYM_ALG_CHAIN_ORDER_CIPHER_THEN_HASH  2
> @@ -247,6 +304,8 @@ struct virtio_crypto_op_ctrl_req {
>  			mac_create_session;
>  		struct virtio_crypto_aead_create_session_req
>  			aead_create_session;
> +		struct virtio_crypto_akcipher_create_session_req
> +			akcipher_create_session;
>  		struct virtio_crypto_destroy_session_req
>  			destroy_session;
>  		__u8 padding[56];
> @@ -266,6 +325,14 @@ struct virtio_crypto_op_header {
>  	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x00)
> #define VIRTIO_CRYPTO_AEAD_DECRYPT \
>  	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x01)
> +#define VIRTIO_CRYPTO_AKCIPHER_ENCRYPT \
> +	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x00)
> #define
> +VIRTIO_CRYPTO_AKCIPHER_DECRYPT \
> +	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x01)
> #define
> +VIRTIO_CRYPTO_AKCIPHER_SIGN \
> +	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x02)
> #define
> +VIRTIO_CRYPTO_AKCIPHER_VERIFY \
> +	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x03)
>  	__le32 opcode;
>  	/* algo should be service-specific algorithms */
>  	__le32 algo;
> @@ -390,6 +457,16 @@ struct virtio_crypto_aead_data_req {
>  	__u8 padding[32];
>  };
> 
> +struct virtio_crypto_akcipher_para {
> +	__le32 src_data_len;
> +	__le32 dst_data_len;
> +};
> +
> +struct virtio_crypto_akcipher_data_req {
> +	struct virtio_crypto_akcipher_para para;
> +	__u8 padding[40];
> +};
> +
>  /* The request of the data virtqueue's packet */  struct
> virtio_crypto_op_data_req {
>  	struct virtio_crypto_op_header header; @@ -399,6 +476,7 @@ struct
> virtio_crypto_op_data_req {
>  		struct virtio_crypto_hash_data_req hash_req;
>  		struct virtio_crypto_mac_data_req mac_req;
>  		struct virtio_crypto_aead_data_req aead_req;
> +		struct virtio_crypto_akcipher_data_req akcipher_req;
>  		__u8 padding[48];
>  	} u;
>  };
> @@ -409,6 +487,7 @@ struct virtio_crypto_op_data_req {
>  #define VIRTIO_CRYPTO_NOTSUPP   3
>  #define VIRTIO_CRYPTO_INVSESS   4 /* Invalid session id */
>  #define VIRTIO_CRYPTO_NOSPC     5 /* no free session ID */
> +#define VIRTIO_CRYPTO_KEY_REJECTED 6 /* Signature verification failed
> +*/
> 
>  /* The accelerator hardware is ready */  #define
> VIRTIO_CRYPTO_S_HW_READY  (1 << 0) @@ -439,7 +518,7 @@ struct
> virtio_crypto_config {
>  	__le32 max_cipher_key_len;
>  	/* Maximum length of authenticated key */
>  	__le32 max_auth_key_len;
> -	__le32 reserve;
> +	__le32 akcipher_algo;
>  	/* Maximum size of each crypto request's content */
>  	__le64 max_size;
>  };
> --
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
