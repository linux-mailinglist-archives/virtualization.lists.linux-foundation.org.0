Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7180D6E3E45
	for <lists.virtualization@lfdr.de>; Mon, 17 Apr 2023 05:36:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1856D404D4;
	Mon, 17 Apr 2023 03:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1856D404D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVSwkBgS15Ay; Mon, 17 Apr 2023 03:36:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8BFB1401AE;
	Mon, 17 Apr 2023 03:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BFB1401AE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9AE9C0089;
	Mon, 17 Apr 2023 03:36:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AA09C002A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 03:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67CD2404D4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 03:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67CD2404D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8z4Vp2MfQOws
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 03:36:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4C83401AE
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4C83401AE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 03:36:15 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VgBuM4g_1681702569; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VgBuM4g_1681702569) by smtp.aliyun-inc.com;
 Mon, 17 Apr 2023 11:36:09 +0800
Message-ID: <1681702472.8904283-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net] virtio-net: reject small vring sizes
Date: Mon, 17 Apr 2023 11:34:32 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
References: <20230416074607.292616-1-alvaro.karsz@solid-run.com>
In-Reply-To: <20230416074607.292616-1-alvaro.karsz@solid-run.com>
Cc: mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net
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

On Sun, 16 Apr 2023 10:46:07 +0300, Alvaro Karsz <alvaro.karsz@solid-run.com> wrote:
> Check vring size and fail probe if a transmit/receive vring size is
> smaller than MAX_SKB_FRAGS + 2.
>
> At the moment, any vring size is accepted. This is problematic because
> it may result in attempting to transmit a packet with more fragments
> than there are descriptors in the ring.
>
> Furthermore, it leads to an immediate bug:
>
> The condition: (sq->vq->num_free >= 2 + MAX_SKB_FRAGS) in
> virtnet_poll_cleantx and virtnet_poll_tx always evaluates to false,
> so netif_tx_wake_queue is not called, leading to TX timeouts.
>
> Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> ---
>  drivers/net/virtio_net.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 2396c28c012..59676252c5c 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -3745,6 +3745,26 @@ static int init_vqs(struct virtnet_info *vi)
>  	return ret;
>  }
>
> +static int virtnet_validate_vqs(struct virtnet_info *vi)
> +{
> +	u32 i, min_size = roundup_pow_of_two(MAX_SKB_FRAGS + 2);
> +
> +	/* Transmit/Receive vring size must be at least MAX_SKB_FRAGS + 2
> +	 * (fragments + linear part + virtio header)
> +	 */
> +	for (i = 0; i < vi->max_queue_pairs; i++) {
> +		if (virtqueue_get_vring_size(vi->sq[i].vq) < min_size ||
> +		    virtqueue_get_vring_size(vi->rq[i].vq) < min_size) {
> +			dev_warn(&vi->vdev->dev,
> +				 "Transmit/Receive virtqueue vring size must be at least %u\n",
> +				 min_size);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_SYSFS
>  static ssize_t mergeable_rx_buffer_size_show(struct netdev_rx_queue *queue,
>  		char *buf)
> @@ -4056,6 +4076,10 @@ static int virtnet_probe(struct virtio_device *vdev)
>  	if (err)
>  		goto free;
>
> +	err = virtnet_validate_vqs(vi);
> +	if (err)
> +		goto free_vqs;
> +

I wonder whether is better moving this to virtnet_find_vqs?

Thanks

>  #ifdef CONFIG_SYSFS
>  	if (vi->mergeable_rx_bufs)
>  		dev->sysfs_rx_queue_group = &virtio_net_mrg_rx_group;
> --
> 2.34.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
