Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 073EDCDC94
	for <lists.virtualization@lfdr.de>; Mon,  7 Oct 2019 09:51:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A24D4949;
	Mon,  7 Oct 2019 07:51:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BCF4E41C
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 07:51:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A6F2C5F4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 07:51:47 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 203CC4E919
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 07:51:47 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id m20so14446765qtq.16
	for <virtualization@lists.linux-foundation.org>;
	Mon, 07 Oct 2019 00:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=GOVJSTkP47ZzAOUaYmHijXMX3bsulzwv44tnyeETKMc=;
	b=spfWIwezbzlS04OCLeoL6XAKDyQIKF4p52MHSOtL929MY1cMuOEwYgzoacLvAKu2bf
	frtouEI398d9+bQ6UW+aKm08sWtdPCS1KQtSn0lwSjx2XjXzYFK4ZahssRo0D9bHGus0
	tIStA1HXz2/KO+mzw6pmX/7e7CD+nozRgh81GYh4OZ8EbWmMNZB7pk3dmIgsc6wIPRXS
	ctqG188LS8KTPeSDzlRZW3RRy83BKbw4BBJw3a8K1OQAtsElnVTX60ZvwI7p0PEgN6f+
	S7PFpeLxksi+091fnStrDs9yWEp3UylA4DseZYwhdvFjX8PHQKe5R11maBZOPF4FSRNM
	f2vA==
X-Gm-Message-State: APjAAAXShc3gBZVj9X9YmcIkcdfWDLrJXx6GOxBzj7ZeUX6cML8lwfpf
	vBFVdff0jUGpSNJzPUfNl9vhDhUoSL+75xjWC6wMQhFcUV5zGvz3ZYa6Nkz2vy46WX/wPslrxJ2
	ya5mIAzRZ42ZNNb6NyWrLIODfVDLfaUNsUaZ56bhPvw==
X-Received: by 2002:ad4:44e2:: with SMTP id p2mr26157633qvt.126.1570434706378; 
	Mon, 07 Oct 2019 00:51:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyh5wy9dVPoxCeQZme5V03ZIT8bKMQdLE9hxrwP4ww6u5ZVWq39NvDUn0/7YafSrKQswir0+A==
X-Received: by 2002:ad4:44e2:: with SMTP id p2mr26157623qvt.126.1570434706087; 
	Mon, 07 Oct 2019 00:51:46 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	f27sm6665058qkh.42.2019.10.07.00.51.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 00:51:45 -0700 (PDT)
Date: Mon, 7 Oct 2019 03:51:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: jcfaracco@gmail.com
Subject: Re: [PATCH RFC net-next 2/2] drivers: net: virtio_net: Add
	tx_timeout function
Message-ID: <20191007034402-mutt-send-email-mst@kernel.org>
References: <20191006184515.23048-1-jcfaracco@gmail.com>
	<20191006184515.23048-3-jcfaracco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191006184515.23048-3-jcfaracco@gmail.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dnmendes76@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, davem@davemloft.net
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

On Sun, Oct 06, 2019 at 03:45:15PM -0300, jcfaracco@gmail.com wrote:
> From: Julio Faracco <jcfaracco@gmail.com>
> 
> To enable dev_watchdog, virtio_net should have a tx_timeout defined 
> (.ndo_tx_timeout). This is only a skeleton to throw a warn message. It 
> notifies the event in some specific queue of device. This function 
> still counts tx_timeout statistic and consider this event as an error 
> (one error per queue), reporting it.
> 
> Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
> Signed-off-by: Daiane Mendes <dnmendes76@gmail.com>
> Cc: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/net/virtio_net.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 27f9b212c9f5..4b703b4b9441 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2585,6 +2585,29 @@ static int virtnet_set_features(struct net_device *dev,
>  	return 0;
>  }
>  
> +static void virtnet_tx_timeout(struct net_device *dev)
> +{
> +	struct virtnet_info *vi = netdev_priv(dev);
> +	u32 i;
> +
> +	/* find the stopped queue the same way dev_watchdog() does */

not really - the watchdog actually looks at trans_start.

> +	for (i = 0; i < vi->curr_queue_pairs; i++) {
> +		struct send_queue *sq = &vi->sq[i];
> +
> +		if (!netif_xmit_stopped(netdev_get_tx_queue(dev, i)))
> +			continue;
> +
> +		u64_stats_update_begin(&sq->stats.syncp);
> +		sq->stats.tx_timeouts++;
> +		u64_stats_update_end(&sq->stats.syncp);
> +
> +		netdev_warn(dev, "TX timeout on send queue: %d, sq: %s, vq: %d, name: %s\n",
> +			    i, sq->name, sq->vq->index, sq->vq->name);

this seems to assume any running queue is timed out.
doesn't look right.

also - there's already a warning in this case in the core. do we need another one?

> +		dev->stats.tx_errors++;



> +	}
> +}
> +
>  static const struct net_device_ops virtnet_netdev = {
>  	.ndo_open            = virtnet_open,
>  	.ndo_stop   	     = virtnet_close,
> @@ -2600,6 +2623,7 @@ static const struct net_device_ops virtnet_netdev = {
>  	.ndo_features_check	= passthru_features_check,
>  	.ndo_get_phys_port_name	= virtnet_get_phys_port_name,
>  	.ndo_set_features	= virtnet_set_features,
> +	.ndo_tx_timeout		= virtnet_tx_timeout,
>  };
>  
>  static void virtnet_config_changed_work(struct work_struct *work)
> @@ -3018,6 +3042,9 @@ static int virtnet_probe(struct virtio_device *vdev)
>  	dev->netdev_ops = &virtnet_netdev;
>  	dev->features = NETIF_F_HIGHDMA;
>  
> +	/* Set up dev_watchdog cycle. */
> +	dev->watchdog_timeo = 5 * HZ;
> +

Seems to be still broken with napi_tx = false.

>  	dev->ethtool_ops = &virtnet_ethtool_ops;
>  	SET_NETDEV_DEV(dev, &vdev->dev);
>  
> -- 
> 2.21.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
