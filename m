Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E6A6F8E25
	for <lists.virtualization@lfdr.de>; Sat,  6 May 2023 04:54:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19B8340874;
	Sat,  6 May 2023 02:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19B8340874
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 48TgEzwVti5T; Sat,  6 May 2023 02:54:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 93442406E0;
	Sat,  6 May 2023 02:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93442406E0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5D52C0089;
	Sat,  6 May 2023 02:54:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 295EDC002A
 for <virtualization@lists.linux-foundation.org>;
 Sat,  6 May 2023 02:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E765883CE3
 for <virtualization@lists.linux-foundation.org>;
 Sat,  6 May 2023 02:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E765883CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KtKM8VvOoyrU
 for <virtualization@lists.linux-foundation.org>;
 Sat,  6 May 2023 02:54:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 120BF83CBA
Received: from out30-97.freemail.mail.aliyun.com
 (out30-97.freemail.mail.aliyun.com [115.124.30.97])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 120BF83CBA
 for <virtualization@lists.linux-foundation.org>;
 Sat,  6 May 2023 02:54:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VhrbjLx_1683341652; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VhrbjLx_1683341652) by smtp.aliyun-inc.com;
 Sat, 06 May 2023 10:54:13 +0800
Message-ID: <1683341417.0965195-4-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio_net: set default mtu to 1500 when 'Device maximum
 MTU' bigger than 1500
Date: Sat, 6 May 2023 10:50:17 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Hao Chen <chenh@yusur.tech>
References: <20230506021529.396812-1-chenh@yusur.tech>
In-Reply-To: <20230506021529.396812-1-chenh@yusur.tech>
Cc: zy@yusur.tech, "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>,
 Eric Dumazet <edumazet@google.com>, huangml@yusur.tech,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Sat,  6 May 2023 10:15:29 +0800, Hao Chen <chenh@yusur.tech> wrote:
> When VIRTIO_NET_F_MTU(3) Device maximum MTU reporting is supported.
> If offered by the device, device advises driver about the value of its
> maximum MTU. If negotiated, the driver uses mtu as the maximum
> MTU value. But there the driver also uses it as default mtu,
> some devices may have a maximum MTU greater than 1500, this may
> cause some large packages to be discarded,

You mean tx packet?

If yes, I do not think this is the problem of driver.

Maybe you should give more details about the discard.

> so I changed the MTU to a more
> general 1500 when 'Device maximum MTU' bigger than 1500.
>
> Signed-off-by: Hao Chen <chenh@yusur.tech>
> ---
>  drivers/net/virtio_net.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 8d8038538fc4..e71c7d1b5f29 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -4040,7 +4040,10 @@ static int virtnet_probe(struct virtio_device *vdev)
>  			goto free;
>  		}
>
> -		dev->mtu = mtu;
> +		if (mtu > 1500)

s/1500/ETH_DATA_LEN/

Thanks.

> +			dev->mtu = 1500;
> +		else
> +			dev->mtu = mtu;
>  		dev->max_mtu = mtu;
>  	}
>
> --
> 2.27.0
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
