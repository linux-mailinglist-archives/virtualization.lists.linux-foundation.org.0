Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ADE10AED5
	for <lists.virtualization@lfdr.de>; Wed, 27 Nov 2019 12:41:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5EA7C87659;
	Wed, 27 Nov 2019 11:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGU+AVZiCVUO; Wed, 27 Nov 2019 11:41:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A723187618;
	Wed, 27 Nov 2019 11:41:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93C69C0881;
	Wed, 27 Nov 2019 11:41:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE779C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EAA9687618
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mj1td1g7wcAS
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:41:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9D3DE86ACB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574854896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nejIEfbAtCMgHuhLkvTXhMe+eNdHihPZTW9qlGkrNow=;
 b=AWYfo6M85hUuU9/0gIxtM3tBKiGhpxAtbQiLFSJtYh617fbDxndNpmWLs+rIPZEhzXeKXi
 aXxs9i0dUEL6NH98G1Ly87vf0++7igKQb82Ju/wyXi98KP4E/ogI6Z65Gp0zYlmOr8rup3
 xKKcQeqohbat8ssBRdX/+ljPNrHD7AY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-b_UeU-44NwiJv-EseY6RmQ-1; Wed, 27 Nov 2019 06:41:34 -0500
Received: by mail-wm1-f69.google.com with SMTP id m68so2388745wme.7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 03:41:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P1cJjKji0So6B4thGa/LNar9QXxaswq3VKsI91/tugQ=;
 b=VoLjIXRYgOW5ua2ukcYiPVxpPS0zjWf+woa8ZAJDov8uk1kohYG2GRg8MlbLzTPfca
 dmZPQNBXsqLzQr+u10sxtG8CyB7r0ENY9zSonKpiSo+b4VIKNIS6Ig+QZdn8a++TPVke
 Iv/kTOipvRioO1rqOYVlTKfLCqnH8Y6rkpRaz26ubE3+DE7+xrKNWKkAeKxvVupgx4IR
 H3lMdMCBTrCDWgnjqhXxxBivqyza+eQbZwu49wfIsm2bxgHFO+Etb6bhfk0A5H2iuqz0
 +jmDlKj7DtlA7o77Poej0KLbQbyvAQav1awV6cwGpDFmPKA7nQO7Nnjig7PqdwkTUttj
 KQow==
X-Gm-Message-State: APjAAAWLYflMKP3vFP4ZzqCDK/A7ubKaotv4LVUEDgEwP05n54m+hwHl
 C/3hcIv1p4qNxbQYclwSHMSShBISgyiudeVPIUayNeIJ0sn83MQ/e4ZoWVRjIxg0niKlpBLei2f
 hcX/tebmKqGA2VqPaIEv4ek1ACus9pF5JPN16MoFwTQ==
X-Received: by 2002:adf:ef51:: with SMTP id c17mr45551486wrp.266.1574854893247; 
 Wed, 27 Nov 2019 03:41:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxCq1WvaUvbIvb7/I9iTJLdg/VE1Ls2kgut0WZHM3mD7pgrXN73I2d4jZpdtQWwh9IqoT6Czg==
X-Received: by 2002:adf:ef51:: with SMTP id c17mr45551466wrp.266.1574854892956; 
 Wed, 27 Nov 2019 03:41:32 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id l204sm5143703wmf.2.2019.11.27.03.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 03:41:32 -0800 (PST)
Date: Wed, 27 Nov 2019 06:41:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julio Faracco <jcfaracco@gmail.com>
Subject: Re: [net-next V3 2/2] drivers: net: virtio_net: Implement a
 dev_watchdog handler
Message-ID: <20191127063939-mutt-send-email-mst@kernel.org>
References: <20191126200628.22251-1-jcfaracco@gmail.com>
 <20191126200628.22251-3-jcfaracco@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191126200628.22251-3-jcfaracco@gmail.com>
X-MC-Unique: b_UeU-44NwiJv-EseY6RmQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: dnmendes76@gmail.com, netdev@vger.kernel.org, davem@davemloft.net,
 virtualization@lists.linux-foundation.org
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

On Tue, Nov 26, 2019 at 05:06:28PM -0300, Julio Faracco wrote:
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
> reset all queues, including RX (because we don't have control of this).
> 
> Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
> Signed-off-by: Daiane Mendes <dnmendes76@gmail.com>
> Cc: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/net/virtio_net.c | 83 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 4d7d5434cc5d..fbe1dfde3a4b 100644
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
> +	{ "tx_timeouts",        VIRTNET_SQ_STAT(tx_timeouts) },
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
> @@ -2578,6 +2585,21 @@ static int virtnet_set_features(struct net_device *dev,
>  	return 0;
>  }
>  
> +static void virtnet_tx_timeout(struct net_device *dev, unsigned int txqueue)
> +{
> +	struct virtnet_info *vi = netdev_priv(dev);
> +	struct send_queue *sq = &vi->sq[txqueue];
> +
> +	netdev_warn(dev, "TX timeout on queue: %d, sq: %s, vq: %d, name: %s\n",
> +		    txqueue, sq->name, sq->vq->index, sq->vq->name);
> +
> +	u64_stats_update_begin(&sq->stats.syncp);
> +	sq->stats.tx_timeouts++;
> +	u64_stats_update_end(&sq->stats.syncp);
> +
> +	schedule_work(&vi->reset_work);
> +}
> +
>  static const struct net_device_ops virtnet_netdev = {
>  	.ndo_open            = virtnet_open,
>  	.ndo_stop   	     = virtnet_close,
> @@ -2593,6 +2615,7 @@ static const struct net_device_ops virtnet_netdev = {
>  	.ndo_features_check	= passthru_features_check,
>  	.ndo_get_phys_port_name	= virtnet_get_phys_port_name,
>  	.ndo_set_features	= virtnet_set_features,
> +	.ndo_tx_timeout         = virtnet_tx_timeout,
>  };
>  
>  static void virtnet_config_changed_work(struct work_struct *work)
> @@ -2982,6 +3005,62 @@ static int virtnet_validate(struct virtio_device *vdev)
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
> +	return 0;
> +err:
> +	virtio_add_status(vdev, VIRTIO_CONFIG_S_FAILED);
> +	return ret;


So here, what restores the rest of the device state,
including offloads, RX mode, mac/vlan filters etc?

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
> @@ -3011,6 +3090,7 @@ static int virtnet_probe(struct virtio_device *vdev)
>  	dev->netdev_ops = &virtnet_netdev;
>  	dev->features = NETIF_F_HIGHDMA;
>  
> +	dev->watchdog_timeo = 5 * HZ;
>  	dev->ethtool_ops = &virtnet_ethtool_ops;
>  	SET_NETDEV_DEV(dev, &vdev->dev);
>  
> @@ -3068,6 +3148,7 @@ static int virtnet_probe(struct virtio_device *vdev)
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
