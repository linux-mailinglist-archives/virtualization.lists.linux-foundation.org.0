Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B88875EC93
	for <lists.virtualization@lfdr.de>; Mon, 24 Jul 2023 09:33:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7FE74018F;
	Mon, 24 Jul 2023 07:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7FE74018F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=isgWf84n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4oJlaI3eeMe; Mon, 24 Jul 2023 07:33:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D007940191;
	Mon, 24 Jul 2023 07:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D007940191
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E0A9C008D;
	Mon, 24 Jul 2023 07:33:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 996C0C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Jul 2023 07:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FFFD81E3C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Jul 2023 07:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FFFD81E3C
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=isgWf84n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yF0TkmMX641Z
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Jul 2023 07:33:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E93E81E0A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Jul 2023 07:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E93E81E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690183978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=obJKEr7PPFK0pLw7ZGOQfDHbqPEfj1yDCcKlqGnAfNY=;
 b=isgWf84nq2zW75OZo68IreQZ1lFD9rId/lj5Ehw7+Xuc/z7NEWb847Ea3hmcSAekp1gT31
 WmRy7zOKcgb0Ys0DwX6w4Zco9KLd1ZNdqSySfozA1RHLwsQjFEkYx67s3y1owonI7lJHJL
 QRL2xT5555RB9cwJjDmG40WwYmnkJng=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-cHqVFRbFMw66So-0SKa02g-1; Mon, 24 Jul 2023 03:32:57 -0400
X-MC-Unique: cHqVFRbFMw66So-0SKa02g-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b70c44b5fdso36140251fa.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Jul 2023 00:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690183975; x=1690788775;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=obJKEr7PPFK0pLw7ZGOQfDHbqPEfj1yDCcKlqGnAfNY=;
 b=KCzK1SvXmCdicOQykSjnS9PTB4+s2MINE8weu/GEGLfxm2qIBxOF0vV4Z1IFAhO47Q
 QBEuS7kLv/kwTwPvKl9ps/ApsJ0yNVbCqOKgnfXnYl9HVqJ0/Z4pfZZj5ldtFCzVxJyb
 q0J1W3QjhyJCCHwOMdw5IoMfCeVeQAJCRqFVc1oHE0cqV/Acukk6bVQ5OleUtFCSgwsB
 FrHSTzse6tZGfqqDV3k+CgWY9g6uRt3ra2guDFb3rh/SprUVPfXrKhs/3mE655Y+97F/
 YW7w6gXRyTi18JD5H5sm3wkXN/AbFblhEIXBQYOUB0dBDTUOwdW7pfd6wEzP2TzyEz6T
 bPow==
X-Gm-Message-State: ABy/qLYxxy4hEcJJkVUvjpsfji2CSrjoWKAXYKWjHNAY5RZWytZFX9GS
 12qLUxpPlLLKZgqJaX64eatgHx+Ku3adQM4WpZc/jPFfHv/31EmBMy9cVZGIHcZB4BClgqVI2Gm
 IfRTeYIwwhqBW3fgBPgjwrXi5y5fYonfg5vGAex/bKg==
X-Received: by 2002:a2e:988d:0:b0:2b6:fa92:479e with SMTP id
 b13-20020a2e988d000000b002b6fa92479emr5540275ljj.42.1690183975469; 
 Mon, 24 Jul 2023 00:32:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFha0kr3za1tiulXuUUpmLoGr/15/UKVQHTMghA8BLPnDMFKNbxFPtb4c1QICku3M6nKSRLrA==
X-Received: by 2002:a2e:988d:0:b0:2b6:fa92:479e with SMTP id
 b13-20020a2e988d000000b002b6fa92479emr5540249ljj.42.1690183975012; 
 Mon, 24 Jul 2023 00:32:55 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73e0:3800:a16e:b2a0:7d06:58aa])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a1ccc13000000b003fbcdba1a63sm4012097wmb.12.2023.07.24.00.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 00:32:54 -0700 (PDT)
Date: Mon, 24 Jul 2023 03:32:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Li <gavinl@nvidia.com>
Subject: Re: [PATCH net-next V3 3/4] virtio_net: support per queue interrupt
 coalesce command
Message-ID: <20230724032451-mutt-send-email-mst@kernel.org>
References: <20230724034048.51482-1-gavinl@nvidia.com>
 <20230724034048.51482-4-gavinl@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230724034048.51482-4-gavinl@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: xuanzhuo@linux.alibaba.com, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, john.fastabend@gmail.com, ast@kernel.org,
 gavi@nvidia.com, edumazet@google.com, jiri@nvidia.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com,
 virtualization@lists.linux-foundation.org, davem@davemloft.net,
 linux-kernel@vger.kernel.org
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

On Mon, Jul 24, 2023 at 06:40:47AM +0300, Gavin Li wrote:
> Add interrupt_coalesce config in send_queue and receive_queue to cache user
> config.
> 
> Send per virtqueue interrupt moderation config to underline device in order
> to have more efficient interrupt moderation and cpu utilization of guest
> VM.
> 
> Signed-off-by: Gavin Li <gavinl@nvidia.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/net/virtio_net.c        | 120 ++++++++++++++++++++++++++++----
>  include/uapi/linux/virtio_net.h |  14 ++++
>  2 files changed, 122 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 802ed21453f5..0c3ee1e26ece 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -144,6 +144,8 @@ struct send_queue {
>  
>  	struct virtnet_sq_stats stats;
>  
> +	struct virtnet_interrupt_coalesce intr_coal;
> +
>  	struct napi_struct napi;
>  
>  	/* Record whether sq is in reset state. */
> @@ -161,6 +163,8 @@ struct receive_queue {
>  
>  	struct virtnet_rq_stats stats;
>  
> +	struct virtnet_interrupt_coalesce intr_coal;
> +
>  	/* Chain pages by the private ptr. */
>  	struct page *pages;
>  
> @@ -212,6 +216,7 @@ struct control_buf {
>  	struct virtio_net_ctrl_rss rss;
>  	struct virtio_net_ctrl_coal_tx coal_tx;
>  	struct virtio_net_ctrl_coal_rx coal_rx;
> +	struct virtio_net_ctrl_coal_vq coal_vq;
>  };
>  
>  struct virtnet_info {
> @@ -3078,6 +3083,55 @@ static int virtnet_send_notf_coal_cmds(struct virtnet_info *vi,
>  	return 0;
>  }
>  
> +static int virtnet_send_ctrl_coal_vq_cmd(struct virtnet_info *vi,
> +					 u16 vqn, u32 max_usecs, u32 max_packets)
> +{
> +	struct scatterlist sgs;
> +
> +	vi->ctrl->coal_vq.vqn = cpu_to_le16(vqn);
> +	vi->ctrl->coal_vq.coal.max_usecs = cpu_to_le32(max_usecs);
> +	vi->ctrl->coal_vq.coal.max_packets = cpu_to_le32(max_packets);
> +	sg_init_one(&sgs, &vi->ctrl->coal_vq, sizeof(vi->ctrl->coal_vq));
> +
> +	if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_NOTF_COAL,
> +				  VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET,
> +				  &sgs))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int virtnet_send_notf_coal_vq_cmds(struct virtnet_info *vi,
> +					  struct ethtool_coalesce *ec,
> +					  u16 queue)
> +{
> +	int err;
> +
> +	if (ec->rx_coalesce_usecs || ec->rx_max_coalesced_frames) {
> +		err = virtnet_send_ctrl_coal_vq_cmd(vi, rxq2vq(queue),
> +						    ec->rx_coalesce_usecs,
> +						    ec->rx_max_coalesced_frames);
> +		if (err)
> +			return err;
> +		/* Save parameters */
> +		vi->rq[queue].intr_coal.max_usecs = ec->rx_coalesce_usecs;
> +		vi->rq[queue].intr_coal.max_packets = ec->rx_max_coalesced_frames;
> +	}
> +
> +	if (ec->tx_coalesce_usecs || ec->tx_max_coalesced_frames) {
> +		err = virtnet_send_ctrl_coal_vq_cmd(vi, txq2vq(queue),
> +						    ec->tx_coalesce_usecs,
> +						    ec->tx_max_coalesced_frames);
> +		if (err)
> +			return err;
> +		/* Save parameters */
> +		vi->sq[queue].intr_coal.max_usecs = ec->tx_coalesce_usecs;
> +		vi->sq[queue].intr_coal.max_packets = ec->tx_max_coalesced_frames;
> +	}
> +
> +	return 0;
> +}
> +
>  static int virtnet_coal_params_supported(struct ethtool_coalesce *ec)
>  {
>  	/* usecs coalescing is supported only if VIRTIO_NET_F_NOTF_COAL
> @@ -3094,23 +3148,39 @@ static int virtnet_coal_params_supported(struct ethtool_coalesce *ec)
>  }
>  
>  static int virtnet_set_coalesce_one(struct net_device *dev,
> -				    struct ethtool_coalesce *ec)
> +				    struct ethtool_coalesce *ec,
> +				    bool per_queue,
> +				    u32 queue)
>  {
>  	struct virtnet_info *vi = netdev_priv(dev);
> -	int ret, i, napi_weight;
> +	int queue_count = per_queue ? 1 : vi->max_queue_pairs;
> +	int queue_number = per_queue ? queue : 0;

Actually can't we refactor this? This whole function is littered
with if/else branches. just code it separately - the only
common part is:

        napi_weight = ec->tx_max_coalesced_frames ? NAPI_POLL_WEIGHT : 0;
        if (napi_weight ^ vi->sq[0].napi.weight) {
                if (dev->flags & IFF_UP)
                        return -EBUSY;
                else
                        update_napi = true;
        }

so just move this to a helper and have two functions - global and
per queue.



>  	bool update_napi = false;
> +	int ret, i, napi_weight;
> +
> +	if (queue >= vi->max_queue_pairs)
> +		return -EINVAL;
>  
>  	/* Can't change NAPI weight if the link is up */
>  	napi_weight = ec->tx_max_coalesced_frames ? NAPI_POLL_WEIGHT : 0;
> -	if (napi_weight ^ vi->sq[0].napi.weight) {
> -		if (dev->flags & IFF_UP)
> -			return -EBUSY;
> -		else
> +	for (i = queue_number; i < queue_count; i++) {
> +		if (napi_weight ^ vi->sq[i].napi.weight) {
> +			if (dev->flags & IFF_UP)
> +				return -EBUSY;
> +
>  			update_napi = true;
> +			/* All queues that belong to [queue_number, queue_count] will be
> +			 * updated for the sake of simplicity, which might not be necessary
> +			 */
> +			queue_number = i;
> +			break;
> +		}
>  	}
>  
> -	if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_NOTF_COAL))
> +	if (!per_queue && virtio_has_feature(vi->vdev, VIRTIO_NET_F_NOTF_COAL))
>  		ret = virtnet_send_notf_coal_cmds(vi, ec);
> +	else if (per_queue && virtio_has_feature(vi->vdev, VIRTIO_NET_F_VQ_NOTF_COAL))
> +		ret = virtnet_send_notf_coal_vq_cmds(vi, ec, queue);
>  	else
>  		ret = virtnet_coal_params_supported(ec);
>  
> @@ -3118,7 +3188,7 @@ static int virtnet_set_coalesce_one(struct net_device *dev,
>  		return ret;
>  
>  	if (update_napi) {
> -		for (i = 0; i < vi->max_queue_pairs; i++)
> +		for (i = queue_number; i < queue_count; i++)
>  			vi->sq[i].napi.weight = napi_weight;
>  	}
>  
> @@ -3130,19 +3200,29 @@ static int virtnet_set_coalesce(struct net_device *dev,
>  				struct kernel_ethtool_coalesce *kernel_coal,
>  				struct netlink_ext_ack *extack)
>  {
> -	return virtnet_set_coalesce_one(dev, ec);
> +	return virtnet_set_coalesce_one(dev, ec, false, 0);
>  }
>  
>  static int virtnet_get_coalesce_one(struct net_device *dev,
> -				    struct ethtool_coalesce *ec)
> +				    struct ethtool_coalesce *ec,
> +				    bool per_queue,
> +				    u32 queue)
>  {
>  	struct virtnet_info *vi = netdev_priv(dev);
>  
> -	if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_NOTF_COAL)) {
> +	if (queue >= vi->max_queue_pairs)
> +		return -EINVAL;
> +
> +	if (!per_queue && virtio_has_feature(vi->vdev, VIRTIO_NET_F_NOTF_COAL)) {
>  		ec->rx_coalesce_usecs = vi->intr_coal_rx.max_usecs;
>  		ec->tx_coalesce_usecs = vi->intr_coal_tx.max_usecs;
>  		ec->tx_max_coalesced_frames = vi->intr_coal_tx.max_packets;
>  		ec->rx_max_coalesced_frames = vi->intr_coal_rx.max_packets;
> +	} else if (per_queue && virtio_has_feature(vi->vdev, VIRTIO_NET_F_VQ_NOTF_COAL)) {
> +		ec->rx_coalesce_usecs = vi->rq[queue].intr_coal.max_usecs;
> +		ec->tx_coalesce_usecs = vi->sq[queue].intr_coal.max_usecs;
> +		ec->tx_max_coalesced_frames = vi->sq[queue].intr_coal.max_packets;
> +		ec->rx_max_coalesced_frames = vi->rq[queue].intr_coal.max_packets;
>  	} else {
>  		ec->rx_max_coalesced_frames = 1;
>  
> @@ -3158,7 +3238,21 @@ static int virtnet_get_coalesce(struct net_device *dev,
>  				struct kernel_ethtool_coalesce *kernel_coal,
>  				struct netlink_ext_ack *extack)
>  {
> -	return virtnet_get_coalesce_one(dev, ec);
> +	return virtnet_get_coalesce_one(dev, ec, false, 0);
> +}
> +
> +static int virtnet_set_per_queue_coalesce(struct net_device *dev,
> +					  u32 queue,
> +					  struct ethtool_coalesce *ec)
> +{
> +	return virtnet_set_coalesce_one(dev, ec, true, queue);
> +}
> +
> +static int virtnet_get_per_queue_coalesce(struct net_device *dev,
> +					  u32 queue,
> +					  struct ethtool_coalesce *ec)
> +{
> +	return virtnet_get_coalesce_one(dev, ec, true, queue);
>  }
>  
>  static void virtnet_init_settings(struct net_device *dev)
> @@ -3291,6 +3385,8 @@ static const struct ethtool_ops virtnet_ethtool_ops = {
>  	.set_link_ksettings = virtnet_set_link_ksettings,
>  	.set_coalesce = virtnet_set_coalesce,
>  	.get_coalesce = virtnet_get_coalesce,
> +	.set_per_queue_coalesce = virtnet_set_per_queue_coalesce,
> +	.get_per_queue_coalesce = virtnet_get_per_queue_coalesce,
>  	.get_rxfh_key_size = virtnet_get_rxfh_key_size,
>  	.get_rxfh_indir_size = virtnet_get_rxfh_indir_size,
>  	.get_rxfh = virtnet_get_rxfh,
> diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> index 12c1c9699935..cc65ef0f3c3e 100644
> --- a/include/uapi/linux/virtio_net.h
> +++ b/include/uapi/linux/virtio_net.h
> @@ -56,6 +56,7 @@
>  #define VIRTIO_NET_F_MQ	22	/* Device supports Receive Flow
>  					 * Steering */
>  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
> +#define VIRTIO_NET_F_VQ_NOTF_COAL 52	/* Device supports virtqueue notification coalescing */
>  #define VIRTIO_NET_F_NOTF_COAL	53	/* Device supports notifications coalescing */
>  #define VIRTIO_NET_F_GUEST_USO4	54	/* Guest can handle USOv4 in. */
>  #define VIRTIO_NET_F_GUEST_USO6	55	/* Guest can handle USOv6 in. */
> @@ -391,5 +392,18 @@ struct virtio_net_ctrl_coal_rx {
>  };
>  
>  #define VIRTIO_NET_CTRL_NOTF_COAL_RX_SET		1
> +#define VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET		2
> +#define VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET		3
> +
> +struct virtio_net_ctrl_coal {
> +	__le32 max_packets;
> +	__le32 max_usecs;
> +};
> +
> +struct  virtio_net_ctrl_coal_vq {
> +	__le16 vqn;
> +	__le16 reserved;
> +	struct virtio_net_ctrl_coal coal;
> +};
>  
>  #endif /* _UAPI_LINUX_VIRTIO_NET_H */
> -- 
> 2.39.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
