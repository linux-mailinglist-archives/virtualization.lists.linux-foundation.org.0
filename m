Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2BD6F291F
	for <lists.virtualization@lfdr.de>; Sun, 30 Apr 2023 16:05:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA72C404D3;
	Sun, 30 Apr 2023 14:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA72C404D3
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tebme2ve
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iby7F1mHCH-q; Sun, 30 Apr 2023 14:05:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2FC48404C9;
	Sun, 30 Apr 2023 14:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FC48404C9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58299C0089;
	Sun, 30 Apr 2023 14:05:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3FC6C002A
 for <virtualization@lists.linux-foundation.org>;
 Sun, 30 Apr 2023 14:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 715FD81FE3
 for <virtualization@lists.linux-foundation.org>;
 Sun, 30 Apr 2023 14:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 715FD81FE3
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tebme2ve
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ckNjq-j3SsvC
 for <virtualization@lists.linux-foundation.org>;
 Sun, 30 Apr 2023 14:05:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B1EA81FD8
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B1EA81FD8
 for <virtualization@lists.linux-foundation.org>;
 Sun, 30 Apr 2023 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682863519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mp3jACiwxoY5N/0Brk2jQcRGmxIELN2blO1EhxFhJ3c=;
 b=Tebme2ve2APmiojqwcjF2T21+TcXhG78YGudqnyOMWbGiCn/CNNXzjfFeM//lSIUal+iVv
 3ss3+lzzgmJ85W5VQ/Q4n+AkoDGC0jkUIRDhCRHroWpxI/WUmqzK9Zjh9+eSUscacyXRx0
 PDu/jLw0LKT+FWKsR/VMt/xXGbxu0Xg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-TxCMx9fLMUihHoe28MFuQQ-1; Sun, 30 Apr 2023 10:05:17 -0400
X-MC-Unique: TxCMx9fLMUihHoe28MFuQQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-306281812d6so242087f8f.2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 30 Apr 2023 07:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682863516; x=1685455516;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mp3jACiwxoY5N/0Brk2jQcRGmxIELN2blO1EhxFhJ3c=;
 b=ZJNdzyWF/rGz7hGn+Am4cJk95apeBoShJtx19J0IKb9QEQInwK1npFLQ9rmaRrHVyR
 OYx9Vg8HwEmiWljx4R3RTFMWjpqFGepjdtuyjKCB7YK/X5ngoYOHhpXM946J7VflaYLD
 xRhUWSnVbraYo0wVkvnnPjnFhQABSCIiTxh1ZbIdzAQvXQwORBUdBiQLwW08/r6raCac
 icYSsWP56aIALcRQEzVwVVZLn1rSW9zuKinhrtYa9snmONPlifw3Xvl6GmibMO56CowY
 JkigMJCBFlBJX1+afLIipvyTTABCPd1ADgqRGoWrimxy5EqIahjkMAvBGd40gAjPXVMt
 Mzrg==
X-Gm-Message-State: AC+VfDz5EC3HYEe3bBLUa0Pq3XBg5YOzSxLeMvmvq4lWdIJAZDYpBDw1
 WOXeE54bzpPPG3vqfV4hKogADZR38+6Q23DPy9Mg2kTc0Y9sN1Ar3HqR+7emxsI0Y0H6Sj95rz4
 x/RVqL6kTVaM8VJfyLkzhJAW9TbPD75nwKersmfSUuw==
X-Received: by 2002:a5d:6dca:0:b0:306:29b6:b389 with SMTP id
 d10-20020a5d6dca000000b0030629b6b389mr1598363wrz.64.1682863516540; 
 Sun, 30 Apr 2023 07:05:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7qJnEP/dZeQKFHQE3+kznXVt6V2fOEt2VXg9BwyAJoQelyowluTXLgbdw67YKCAyWybkxF5w==
X-Received: by 2002:a5d:6dca:0:b0:306:29b6:b389 with SMTP id
 d10-20020a5d6dca000000b0030629b6b389mr1598347wrz.64.1682863516134; 
 Sun, 30 Apr 2023 07:05:16 -0700 (PDT)
Received: from redhat.com ([2.52.139.131]) by smtp.gmail.com with ESMTPSA id
 b2-20020adff902000000b00304aba2cfcbsm9629042wrr.7.2023.04.30.07.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 07:05:15 -0700 (PDT)
Date: Sun, 30 Apr 2023 10:05:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Subject: Re: [RFC PATCH net 2/3] virtio-net: allow usage of vrings smaller
 than MAX_SKB_FRAGS + 2
Message-ID: <20230430093009-mutt-send-email-mst@kernel.org>
References: <20230430131518.2708471-1-alvaro.karsz@solid-run.com>
 <20230430131518.2708471-3-alvaro.karsz@solid-run.com>
MIME-Version: 1.0
In-Reply-To: <20230430131518.2708471-3-alvaro.karsz@solid-run.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: xuanzhuo@linux.alibaba.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net
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

On Sun, Apr 30, 2023 at 04:15:17PM +0300, Alvaro Karsz wrote:
> At the moment, if a network device uses vrings with less than
> MAX_SKB_FRAGS + 2 entries, the device won't be functional.
> 
> The following condition vq->num_free >= 2 + MAX_SKB_FRAGS will always
> evaluate to false, leading to TX timeouts.
> 
> This patch introduces a new variable, single_pkt_max_descs, that holds
> the max number of descriptors we may need to handle a single packet.
> 
> This patch also detects the small vring during probe, blocks some
> features that can't be used with small vrings, and fails probe,
> leading to a reset and features re-negotiation.
> 
> Features that can't be used with small vrings:
> GRO features (VIRTIO_NET_F_GUEST_*):
> When we use small vrings, we may not have enough entries in the ring to
> chain page size buffers and form a 64K buffer.
> So we may need to allocate 64k of continuous memory, which may be too
> much when the system is stressed.
> 
> This patch also fixes the MTU size in small vring cases to be up to the
> default one, 1500B.

and then it should clear VIRTIO_NET_F_MTU?

> Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>




> ---
>  drivers/net/virtio_net.c | 149 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 144 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 8d8038538fc..b4441d63890 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -103,6 +103,8 @@ struct virtnet_rq_stats {
>  #define VIRTNET_SQ_STAT(m)	offsetof(struct virtnet_sq_stats, m)
>  #define VIRTNET_RQ_STAT(m)	offsetof(struct virtnet_rq_stats, m)
>  
> +#define IS_SMALL_VRING(size)	((size) < MAX_SKB_FRAGS + 2)
> +
>  static const struct virtnet_stat_desc virtnet_sq_stats_desc[] = {
>  	{ "packets",		VIRTNET_SQ_STAT(packets) },
>  	{ "bytes",		VIRTNET_SQ_STAT(bytes) },
> @@ -268,6 +270,12 @@ struct virtnet_info {
>  	/* Does the affinity hint is set for virtqueues? */
>  	bool affinity_hint_set;
>  
> +	/* How many ring descriptors we may need to transmit a single packet */
> +	u16 single_pkt_max_descs;
> +
> +	/* Do we have virtqueues with small vrings? */
> +	bool svring;
> +
>  	/* CPU hotplug instances for online & dead */
>  	struct hlist_node node;
>  	struct hlist_node node_dead;

worth checking that all these layout changes don't push useful things to
a different cache line. can you add that analysis?

I see confusiong here wrt whether some rings are "small"? all of them?
some rx rings? some tx rings? names should make it clear.
also do we really need bool svring? can't we just check single_pkt_max_descs
all the time?

> @@ -455,6 +463,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
>  	unsigned int copy, hdr_len, hdr_padded_len;
>  	struct page *page_to_free = NULL;
>  	int tailroom, shinfo_size;
> +	u16 max_frags = MAX_SKB_FRAGS;
>  	char *p, *hdr_p, *buf;
>  
>  	p = page_address(page) + offset;
> @@ -520,7 +529,10 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
>  	 * tries to receive more than is possible. This is usually
>  	 * the case of a broken device.
>  	 */
> -	if (unlikely(len > MAX_SKB_FRAGS * PAGE_SIZE)) {
> +	if (unlikely(vi->svring))
> +		max_frags = 1;
> +
> +	if (unlikely(len > max_frags * PAGE_SIZE)) {
>  		net_dbg_ratelimited("%s: too much data\n", skb->dev->name);
>  		dev_kfree_skb(skb);
>  		return NULL;
> @@ -612,7 +624,7 @@ static void check_sq_full_and_disable(struct virtnet_info *vi,
>  	 * Since most packets only take 1 or 2 ring slots, stopping the queue
>  	 * early means 16 slots are typically wasted.
>  	 */
> -	if (sq->vq->num_free < 2+MAX_SKB_FRAGS) {
> +	if (sq->vq->num_free < vi->single_pkt_max_descs) {
>  		netif_stop_subqueue(dev, qnum);
>  		if (use_napi) {
>  			if (unlikely(!virtqueue_enable_cb_delayed(sq->vq)))
> @@ -620,7 +632,7 @@ static void check_sq_full_and_disable(struct virtnet_info *vi,
>  		} else if (unlikely(!virtqueue_enable_cb_delayed(sq->vq))) {
>  			/* More just got used, free them then recheck. */
>  			free_old_xmit_skbs(sq, false);
> -			if (sq->vq->num_free >= 2+MAX_SKB_FRAGS) {
> +			if (sq->vq->num_free >= vi->single_pkt_max_descs) {
>  				netif_start_subqueue(dev, qnum);
>  				virtqueue_disable_cb(sq->vq);
>  			}
> @@ -1108,6 +1120,10 @@ static int virtnet_build_xdp_buff_mrg(struct net_device *dev,
>  		return 0;
>  
>  	if (*num_buf > 1) {
> +		/* Small vring - can't be more than 1 buffer */
> +		if (unlikely(vi->svring))
> +			return -EINVAL;
> +
>  		/* If we want to build multi-buffer xdp, we need
>  		 * to specify that the flags of xdp_buff have the
>  		 * XDP_FLAGS_HAS_FRAG bit.
> @@ -1828,7 +1844,7 @@ static void virtnet_poll_cleantx(struct receive_queue *rq)
>  			free_old_xmit_skbs(sq, true);
>  		} while (unlikely(!virtqueue_enable_cb_delayed(sq->vq)));
>  
> -		if (sq->vq->num_free >= 2 + MAX_SKB_FRAGS)
> +		if (sq->vq->num_free >= vi->single_pkt_max_descs)
>  			netif_tx_wake_queue(txq);
>  
>  		__netif_tx_unlock(txq);
> @@ -1919,7 +1935,7 @@ static int virtnet_poll_tx(struct napi_struct *napi, int budget)
>  	virtqueue_disable_cb(sq->vq);
>  	free_old_xmit_skbs(sq, true);
>  
> -	if (sq->vq->num_free >= 2 + MAX_SKB_FRAGS)
> +	if (sq->vq->num_free >= vi->single_pkt_max_descs)
>  		netif_tx_wake_queue(txq);
>  
>  	opaque = virtqueue_enable_cb_prepare(sq->vq);
> @@ -3862,6 +3878,15 @@ static bool virtnet_check_guest_gso(const struct virtnet_info *vi)
>  		virtio_has_feature(vi->vdev, VIRTIO_NET_F_GUEST_USO6));
>  }
>  
> +static bool virtnet_check_host_gso(const struct virtnet_info *vi)
> +{
> +	return virtio_has_feature(vi->vdev, VIRTIO_NET_F_HOST_TSO4) ||
> +		virtio_has_feature(vi->vdev, VIRTIO_NET_F_HOST_TSO6) ||
> +		virtio_has_feature(vi->vdev, VIRTIO_NET_F_HOST_ECN) ||
> +		virtio_has_feature(vi->vdev, VIRTIO_NET_F_HOST_UFO) ||
> +		virtio_has_feature(vi->vdev, VIRTIO_NET_F_HOST_USO);
> +}
> +
>  static void virtnet_set_big_packets(struct virtnet_info *vi, const int mtu)
>  {
>  	bool guest_gso = virtnet_check_guest_gso(vi);
> @@ -3876,6 +3901,112 @@ static void virtnet_set_big_packets(struct virtnet_info *vi, const int mtu)
>  	}
>  }
>  
> +static u16 virtnet_calc_max_descs(struct virtnet_info *vi)
> +{
> +	if (vi->svring) {
> +		if (virtnet_check_host_gso(vi))
> +			return 4; /* 1 fragment + linear part + virtio header + GSO header */
> +		else
> +			return 3; /* 1 fragment + linear part + virtio header */
> +	} else {
> +		return MAX_SKB_FRAGS + 2;
> +	}
> +}
> +
> +static bool virtnet_uses_svring(struct virtnet_info *vi)
> +{
> +	u32 i;
> +
> +	/* If a transmit/receive virtqueue is small,
> +	 * we cannot handle fragmented packets.
> +	 */
> +	for (i = 0; i < vi->max_queue_pairs; i++) {
> +		if (IS_SMALL_VRING(virtqueue_get_vring_size(vi->sq[i].vq)) ||
> +		    IS_SMALL_VRING(virtqueue_get_vring_size(vi->rq[i].vq)))
> +			return true;
> +	}
> +
> +	return false;
> +}

I see even if only some rings are too small we force everything to use
small ones. Wouldn't it be better to just disable small ones in this
case? That would not need a reset.


> +
> +/* Function returns the number of features it blocked */

We don't need the # though. Make it bool?

> +static int virtnet_block_svring_unsupported(struct virtio_device *vdev)
> +{
> +	int cnt = 0;
> +	/* Block Virtio guest GRO features.
> +	 * Asking Linux to allocate 64k of continuous memory is too much,
> +	 * specially when the system is stressed.
> +	 *
> +	 * If VIRTIO_NET_F_MRG_RXBUF is negotiated we can allcoate smaller
> +	 * buffers, but since the ring is small, the buffers can be quite big.
> +	 *
> +	 */
> +	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4)) {
> +		virtio_block_feature(vdev, VIRTIO_NET_F_GUEST_TSO4);
> +		cnt++;
> +	}
> +	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6)) {
> +		virtio_block_feature(vdev, VIRTIO_NET_F_GUEST_TSO6);
> +		cnt++;
> +	}
> +	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_ECN)) {
> +		virtio_block_feature(vdev, VIRTIO_NET_F_GUEST_ECN);
> +		cnt++;
> +	}
> +	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_UFO)) {
> +		virtio_block_feature(vdev, VIRTIO_NET_F_GUEST_UFO);
> +		cnt++;
> +	}
> +	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_USO4)) {
> +		virtio_block_feature(vdev, VIRTIO_NET_F_GUEST_USO4);
> +		cnt++;
> +	}
> +	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_USO6)) {
> +		virtio_block_feature(vdev, VIRTIO_NET_F_GUEST_USO6);
> +		cnt++;
> +	}
> +
> +	return cnt;
> +}
> +
> +static int virtnet_fixup_svring(struct virtnet_info *vi)
> +{
> +	int i;
> +	/* Do we use small vrings?
> +	 * If not, nothing we need to do.
> +	 */
> +	vi->svring = virtnet_uses_svring(vi);
> +	if (!vi->svring)
> +		return 0;
> +
> +	/* Some features can't be used with small vrings.
> +	 * Block those and return an error.
> +	 * This will trigger a reprobe without the blocked
> +	 * features.
> +	 */
> +	if (virtnet_block_svring_unsupported(vi->vdev))
> +		return -EOPNOTSUPP;
> +
> +	/* Disable NETIF_F_SG */
> +	vi->dev->hw_features &= ~NETIF_F_SG;
> +
> +	/* Don't use MTU bigger than default */
> +	if (vi->dev->max_mtu > ETH_DATA_LEN)
> +		vi->dev->max_mtu = ETH_DATA_LEN;
> +	if (vi->dev->mtu > ETH_DATA_LEN)
> +		vi->dev->mtu = ETH_DATA_LEN;
> +
> +	/* Don't use big packets */
> +	vi->big_packets = false;
> +	vi->big_packets_num_skbfrags = 1;
> +
> +	/* Fix min_buf_len for receive virtqueues */
> +	for (i = 0; i < vi->max_queue_pairs; i++)
> +		vi->rq[i].min_buf_len = mergeable_min_buf_len(vi, vi->rq[i].vq);
> +
> +	return 0;
> +}
> +
>  static int virtnet_probe(struct virtio_device *vdev)
>  {
>  	int i, err = -ENOMEM;
> @@ -4061,6 +4192,14 @@ static int virtnet_probe(struct virtio_device *vdev)
>  	if (err)
>  		goto free;
>  
> +	/* Do required fixups in case we are using small vrings */
> +	err = virtnet_fixup_svring(vi);
> +	if (err)
> +		goto free_vqs;
> +
> +	/* Calculate the max. number of descriptors we may need to transmit a single packet */
> +	vi->single_pkt_max_descs = virtnet_calc_max_descs(vi);
> +
>  #ifdef CONFIG_SYSFS
>  	if (vi->mergeable_rx_bufs)
>  		dev->sysfs_rx_queue_group = &virtio_net_mrg_rx_group;
> -- 
> 2.34.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
