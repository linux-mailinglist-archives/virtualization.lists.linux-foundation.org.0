Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5984B06E4
	for <lists.virtualization@lfdr.de>; Thu, 10 Feb 2022 08:22:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 788934047C;
	Thu, 10 Feb 2022 07:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_q6d_UcR7q7; Thu, 10 Feb 2022 07:22:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E810D40127;
	Thu, 10 Feb 2022 07:22:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 525A4C0073;
	Thu, 10 Feb 2022 07:22:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47AABC000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Feb 2022 07:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FD874037C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Feb 2022 07:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oS0y0tixHHO6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Feb 2022 07:22:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA3BD40127
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Feb 2022 07:22:30 +0000 (UTC)
Received: from dggeme760-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JvSl73RbrzZfRY;
 Thu, 10 Feb 2022 15:18:11 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggeme760-chm.china.huawei.com (10.3.19.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Thu, 10 Feb 2022 15:22:25 +0800
Received: from dggpemm500006.china.huawei.com ([7.185.36.236]) by
 dggpemm500006.china.huawei.com ([7.185.36.236]) with mapi id 15.01.2308.021;
 Thu, 10 Feb 2022 15:22:25 +0800
To: zhenwei pi <pizhenwei@bytedance.com>, "mst@redhat.com" <mst@redhat.com>
Subject: RE: [PATCH 1/3] virtio_crypto: Introduce VIRTIO_CRYPTO_NOSPC
Thread-Topic: [PATCH 1/3] virtio_crypto: Introduce VIRTIO_CRYPTO_NOSPC
Thread-Index: AQHYDm44Bq+fl173Z0edEmaWVexeY6yMgIDQ
Date: Thu, 10 Feb 2022 07:22:24 +0000
Message-ID: <fac2cfd89f3f4fff9e5c5d29c8c4ed8a@huawei.com>
References: <20220121022438.1042547-1-pizhenwei@bytedance.com>
 <20220121022438.1042547-2-pizhenwei@bytedance.com>
In-Reply-To: <20220121022438.1042547-2-pizhenwei@bytedance.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.11]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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
> Sent: Friday, January 21, 2022 10:25 AM
> To: mst@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>
> Cc: jasowang@redhat.com; virtualization@lists.linux-foundation.org;
> linux-crypto@vger.kernel.org; linux-kernel@vger.kernel.org;
> helei.sig11@bytedance.com; zhenwei pi <pizhenwei@bytedance.com>
> Subject: [PATCH 1/3] virtio_crypto: Introduce VIRTIO_CRYPTO_NOSPC
> 
> Base on the lastest virtio crypto spec, define VIRTIO_CRYPTO_NOSPC.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  include/uapi/linux/virtio_crypto.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/virtio_crypto.h
> b/include/uapi/linux/virtio_crypto.h
> index a03932f10565..1166a49084b0 100644
> --- a/include/uapi/linux/virtio_crypto.h
> +++ b/include/uapi/linux/virtio_crypto.h
> @@ -408,6 +408,7 @@ struct virtio_crypto_op_data_req {
>  #define VIRTIO_CRYPTO_BADMSG    2
>  #define VIRTIO_CRYPTO_NOTSUPP   3
>  #define VIRTIO_CRYPTO_INVSESS   4 /* Invalid session id */
> +#define VIRTIO_CRYPTO_NOSPC     5 /* no free session ID */
> 
>  /* The accelerator hardware is ready */  #define
> VIRTIO_CRYPTO_S_HW_READY  (1 << 0)
> --
> 2.25.1

Reviewed-by: Gonglei <arei.gonglei@huawei.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
