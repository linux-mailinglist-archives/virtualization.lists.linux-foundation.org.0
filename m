Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD49106A0F
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:31:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 28777880CB;
	Fri, 22 Nov 2019 10:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlIUY+2yWZIW; Fri, 22 Nov 2019 10:31:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C07B388164;
	Fri, 22 Nov 2019 10:31:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD572C18DA;
	Fri, 22 Nov 2019 10:31:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D14EC18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 17B0825D78
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QI72dXlARLdf
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:31:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id CC3EC21526
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574418686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FlOZ5zqkxPswmHPOY4akzRfmqrkgFo/O2Djc8eOm0Q8=;
 b=Au7OZzg95qfKtqheCwo/zJZNNZ5xyi9mnwRdqFkO1USGwpzsFxWWMa52DopGZPt3bKO89m
 DKsJ5JaODzEr4HOqgwvy4Q4niJjr7A9BhbRdBJxH8kWnNTbC3kgJ6WBaNnMuJkBgAwExXm
 Y+WrIVIOzaGallbikuVAxbvSvNUOdcY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-GtSTQfFzOIycSFh_DFLhhg-1; Fri, 22 Nov 2019 05:31:25 -0500
Received: by mail-qt1-f199.google.com with SMTP id f14so4363871qto.2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 02:31:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jUNfNcFYrnFo3vyliVS23hPPWffkd+zA0rWCMO8GM2A=;
 b=RL5BK3jjJfBRZ+m2YPQSuyxPovJePQmtjNLwvdw5xVVMS7ldDxRegRkwtoiLPDHziK
 xFr+KWxlbAAhdZb25ZVxk/D6o6/VxV0mYONgM0qIugGMzhJ38yXNlsaKolNPgJecPMgG
 L0Fei7wuH+Y/Fs12fW40aAn1rw0MNQuDMlNr9zgzY4LUV8NfN6CVQP4RHERooFyirqa/
 Khd1yaEiokn1rBJZlH9AstR0hoPXBRWVqJFl+j4aOGU+/046uqiF+cMVdTzVUuQsgLgh
 +o93y0q0Q54JPMC4aCQHnfcOLYTpx9XC7jxJrrJ60MggB9k9RaC3i3YCcAVlTWcuGpLp
 sVAw==
X-Gm-Message-State: APjAAAWkJmfslB/+XsUkZ2HzTL1nzYLX+kgsY3Ztx0D7dbEsbcwBTzUh
 f7kCAjgo8zJPBDFzQ1sFpE9VAcv6I7Od61mY5kJ7QKc0DUhHR1/gZImbLRhMCSqNkZaEurJt+Wk
 iyVQkBEuxqVvA/bFt6mnee0CrLmBBIGW98djywPXcJA==
X-Received: by 2002:ac8:ccf:: with SMTP id o15mr13578819qti.380.1574418684932; 
 Fri, 22 Nov 2019 02:31:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqzqWjQYE0JViMErwUJLyP31KaReAxhSG7SzcnEEeUUZg6KiYptY1y7iF0uI6KQLrQqeTSBM5A==
X-Received: by 2002:ac8:ccf:: with SMTP id o15mr13578801qti.380.1574418684642; 
 Fri, 22 Nov 2019 02:31:24 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
 by smtp.gmail.com with ESMTPSA id g7sm2775765qkl.20.2019.11.22.02.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:31:23 -0800 (PST)
Date: Fri, 22 Nov 2019 05:31:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julio Faracco <jcfaracco@gmail.com>
Subject: Re: [PATCH net-next v2] drivers: net: virtio_net: Implement a
 dev_watchdog handler
Message-ID: <20191122052506-mutt-send-email-mst@kernel.org>
References: <20191122013636.1041-1-jcfaracco@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191122013636.1041-1-jcfaracco@gmail.com>
X-MC-Unique: GtSTQfFzOIycSFh_DFLhhg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: dnmendes76@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
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

On Thu, Nov 21, 2019 at 10:36:36PM -0300, Julio Faracco wrote:
> Driver virtio_net is not handling error events for TX provided by
> dev_watchdog. This event is reached when transmission queue is having
> problems to transmit packets. This could happen for any reason. To
> enable it, driver should have .ndo_tx_timeout implemented.
> 
> This commit brings back virtnet_reset method to recover TX queues from a
> error state. That function is called by schedule_work method and it puts
> the reset function into work queue.
> 
> As the error cause is unknown at this moment, it would be better to
> reset all queues.
> 
> Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
> Signed-off-by: Daiane Mendes <dnmendes76@gmail.com>
> Cc: Jason Wang <jasowang@redhat.com>
> ---
> v1-v2: Tag `net-next` was included to indentify where patch would be
> applied.
> ---
>  drivers/net/virtio_net.c | 95 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 94 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 4d7d5434cc5d..31890d77eaf2 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -75,6 +75,7 @@ struct virtnet_sq_stats {
>  	u64 xdp_tx;
>  	u64 xdp_tx_drops;
>  	u64 kicks;
> +	u64 tx_timeouts;
>  };
>  
>  struct virtnet_rq_stats {
> @@ -98,6 +99,7 @@ static const struct virtnet_stat_desc virtnet_sq_stats_desc[] = {
>  	{ "xdp_tx",		VIRTNET_SQ_STAT(xdp_tx) },
>  	{ "xdp_tx_drops",	VIRTNET_SQ_STAT(xdp_tx_drops) },
>  	{ "kicks",		VIRTNET_SQ_STAT(kicks) },
> +	{ "tx_timeouts",	VIRTNET_SQ_STAT(tx_timeouts) },
>  };
>  
>  static const struct virtnet_stat_desc virtnet_rq_stats_desc[] = {
> @@ -211,6 +213,9 @@ struct virtnet_info {
>  	/* Work struct for config space updates */
>  	struct work_struct config_work;
>  
> +	/* Work struct for resetting the virtio-net driver. */
> +	struct work_struct reset_work;
> +
>  	/* Does the affinity hint is set for virtqueues? */
>  	bool affinity_hint_set;
>  
> @@ -1721,7 +1726,7 @@ static void virtnet_stats(struct net_device *dev,
>  	int i;
>  
>  	for (i = 0; i < vi->max_queue_pairs; i++) {
> -		u64 tpackets, tbytes, rpackets, rbytes, rdrops;
> +		u64 tpackets, tbytes, terrors, rpackets, rbytes, rdrops;
>  		struct receive_queue *rq = &vi->rq[i];
>  		struct send_queue *sq = &vi->sq[i];
>  
> @@ -1729,6 +1734,7 @@ static void virtnet_stats(struct net_device *dev,
>  			start = u64_stats_fetch_begin_irq(&sq->stats.syncp);
>  			tpackets = sq->stats.packets;
>  			tbytes   = sq->stats.bytes;
> +			terrors  = sq->stats.tx_timeouts;
>  		} while (u64_stats_fetch_retry_irq(&sq->stats.syncp, start));
>  
>  		do {
> @@ -1743,6 +1749,7 @@ static void virtnet_stats(struct net_device *dev,
>  		tot->rx_bytes   += rbytes;
>  		tot->tx_bytes   += tbytes;
>  		tot->rx_dropped += rdrops;
> +		tot->tx_errors  += terrors;
>  	}
>  
>  	tot->tx_dropped = dev->stats.tx_dropped;
> @@ -2578,6 +2585,33 @@ static int virtnet_set_features(struct net_device *dev,
>  	return 0;
>  }
>  
> +static void virtnet_tx_timeout(struct net_device *dev)
> +{
> +	struct virtnet_info *vi = netdev_priv(dev);
> +	u32 i;
> +
> +	netdev_warn(dev, "TX timeout stats:\n");
> +	/* find the stopped queue the same way dev_watchdog() does */
> +	for (i = 0; i < vi->curr_queue_pairs; i++) {
> +		struct send_queue *sq = &vi->sq[i];
> +
> +		if (!netif_xmit_stopped(netdev_get_tx_queue(dev, i))) {
> +			netdev_warn(dev, " Available send queue: %d, sq: %s, vq: %d, name: %s\n",
> +				    i, sq->name, sq->vq->index, sq->vq->name);

What does this mean?

> +			continue;
> +		}
> +
> +		u64_stats_update_begin(&sq->stats.syncp);
> +		sq->stats.tx_timeouts++;
> +		u64_stats_update_end(&sq->stats.syncp);
> +
> +		netdev_warn(dev, " Unavailable send queue: %d, sq: %s, vq: %d, name: %s\n",
> +			    i, sq->name, sq->vq->index, sq->vq->name);
> +	}

Can we make the warning less cryptic?
I wonder why don't we get the sq from timeout directly?
Would seem cleaner.

> +
> +	schedule_work(&vi->reset_work);
> +}
> +
>  static const struct net_device_ops virtnet_netdev = {
>  	.ndo_open            = virtnet_open,
>  	.ndo_stop   	     = virtnet_close,
> @@ -2593,6 +2627,7 @@ static const struct net_device_ops virtnet_netdev = {
>  	.ndo_features_check	= passthru_features_check,
>  	.ndo_get_phys_port_name	= virtnet_get_phys_port_name,
>  	.ndo_set_features	= virtnet_set_features,
> +	.ndo_tx_timeout		= virtnet_tx_timeout,
>  };
>  
>  static void virtnet_config_changed_work(struct work_struct *work)
> @@ -2982,6 +3017,62 @@ static int virtnet_validate(struct virtio_device *vdev)
>  	return 0;
>  }
>  
> +static void _remove_vq_common(struct virtnet_info *vi)
> +{
> +	vi->vdev->config->reset(vi->vdev);
> +
> +	/* Free unused buffers in both send and recv, if any. */
> +	free_unused_bufs(vi);
> +
> +	_free_receive_bufs(vi);
> +
> +	free_receive_page_frags(vi);
> +
> +	virtnet_del_vqs(vi);
> +}
> +
> +static int _virtnet_reset(struct virtnet_info *vi)
> +{
> +	struct virtio_device *vdev = vi->vdev;
> +	int ret;
> +
> +	virtio_config_disable(vdev);
> +	vdev->failed = vdev->config->get_status(vdev) & VIRTIO_CONFIG_S_FAILED;
> +
> +	virtnet_freeze_down(vdev);
> +	_remove_vq_common(vi);
> +
> +	virtio_add_status(vdev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
> +	virtio_add_status(vdev, VIRTIO_CONFIG_S_DRIVER);
> +
> +	ret = virtio_finalize_features(vdev);
> +	if (ret)
> +		goto err;
> +
> +	ret = virtnet_restore_up(vdev);
> +	if (ret)
> +		goto err;
> +
> +	ret = _virtnet_set_queues(vi, vi->curr_queue_pairs);
> +	if (ret)
> +		goto err;
> +
> +	virtio_add_status(vdev, VIRTIO_CONFIG_S_DRIVER_OK);
> +	virtio_config_enable(vdev);


Is this enough? E.g. all RX mode programming has been lost.



> +	return 0;
> +err:
> +	virtio_add_status(vdev, VIRTIO_CONFIG_S_FAILED);
> +	return ret;
> +}
> +
> +static void virtnet_reset(struct work_struct *work)
> +{
> +	struct virtnet_info *vi =
> +		container_of(work, struct virtnet_info, reset_work);
> +
> +	_virtnet_reset(vi);
> +}
> +
>  static int virtnet_probe(struct virtio_device *vdev)
>  {
>  	int i, err = -ENOMEM;
> @@ -3011,6 +3102,7 @@ static int virtnet_probe(struct virtio_device *vdev)
>  	dev->netdev_ops = &virtnet_netdev;
>  	dev->features = NETIF_F_HIGHDMA;
>  
> +	dev->watchdog_timeo = 5 * HZ;
>  	dev->ethtool_ops = &virtnet_ethtool_ops;
>  	SET_NETDEV_DEV(dev, &vdev->dev);
>

Is there a way to make this tuneable from ethtool?
  
> @@ -3068,6 +3160,7 @@ static int virtnet_probe(struct virtio_device *vdev)
>  	vdev->priv = vi;
>  
>  	INIT_WORK(&vi->config_work, virtnet_config_changed_work);
> +	INIT_WORK(&vi->reset_work, virtnet_reset);
>  
>  	/* If we can receive ANY GSO packets, we must allocate large ones. */
>  	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
