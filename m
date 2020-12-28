Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6C22E67BA
	for <lists.virtualization@lfdr.de>; Mon, 28 Dec 2020 17:28:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A6296868B6;
	Mon, 28 Dec 2020 16:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6K6SGunnYdG; Mon, 28 Dec 2020 16:28:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B7DB686A31;
	Mon, 28 Dec 2020 16:28:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 926FAC1787;
	Mon, 28 Dec 2020 16:28:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA273C0891
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Dec 2020 16:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A9C2020C41
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Dec 2020 16:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oKywhiuPoOGY
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Dec 2020 16:28:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id E97941FEDF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Dec 2020 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609172927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EX8zpfUQk7Rup3MMOqoo0EmXDK7wjCoLKs8Ru+6fdOs=;
 b=O6FETzFh5ieRvp5Q29ImDPrRTvDriIqJlQJ3YLdFsg0ukZKW6Q5oxhyC2yvvFG8YknNgBL
 OR9X7iLYKl9ZjtLM5AZucjsz1c714/IolRNIWysLO4XVzy2fuq2bgTrTNZ9kuEo4mVvQ0m
 GDaoBLk0RUGUDgxeR4w2IkwDuimP/Pg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-OLJo5iuPPj2M50ND5y2-Bw-1; Mon, 28 Dec 2020 11:28:45 -0500
X-MC-Unique: OLJo5iuPPj2M50ND5y2-Bw-1
Received: by mail-wm1-f71.google.com with SMTP id h21so2072945wmq.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Dec 2020 08:28:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EX8zpfUQk7Rup3MMOqoo0EmXDK7wjCoLKs8Ru+6fdOs=;
 b=F3MXSuf85y5IBTFXny12JX/H2grwTESkh4YdAQHcPVv0f45FdiSbbwgjHFlgXqEWOj
 +CX3LWtX1FOkq9dnWq3GEEb9WD5MwIieJ+PgqGW7Dse7uYTN/sqV4YplSxPGCDK4bF2o
 GrCdN4cQmCyY6vMk3P2MkdKuefaXsZ/rGVFnXqB9pB6vfianO3yAApqQLHKq9tecoI35
 qHtQkWv2GZwNLELgGnx9eIDw3jnaOy3ju2VfZxkRDmMdCYJFSe9F6Jcpit8sCx8XUuSa
 a++n4aSenlJ+QBqddDKmwJ01sXhfoZnWlgXyBHQ4Ok6oHTbcr3GxqL4EZLtyxEdiuILH
 X1Qw==
X-Gm-Message-State: AOAM533g7bMF6xLRbWizC6xN+IGTLV8HBFtuHoXk+NPwCieRe8rMOQ1c
 6GLw644+7z/15+mGhR4XCgDgs9tdRe1yU6qEMFj7dmM7sYCZGXACHQzMPFnJHfbgYBZM6d3Du0K
 uUgLa8BqgkL0gglfMa874ADFsRBume36Apunt+s7STA==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr20738971wmd.20.1609172924320; 
 Mon, 28 Dec 2020 08:28:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuouIOd00vr/KbAWxTXHKAeAUiUHa397WMRxnI4/qurY/HOzDwksiuf0M6zAwuqyFgzRRXTQ==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr20738963wmd.20.1609172924170; 
 Mon, 28 Dec 2020 08:28:44 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id n189sm20036670wmf.20.2020.12.28.08.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 08:28:43 -0800 (PST)
Date: Mon, 28 Dec 2020 11:28:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH rfc 1/3] virtio-net: support transmit hash report
Message-ID: <20201228112657-mutt-send-email-mst@kernel.org>
References: <20201228162233.2032571-1-willemdebruijn.kernel@gmail.com>
 <20201228162233.2032571-2-willemdebruijn.kernel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201228162233.2032571-2-willemdebruijn.kernel@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Willem de Bruijn <willemb@google.com>,
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

On Mon, Dec 28, 2020 at 11:22:31AM -0500, Willem de Bruijn wrote:
> From: Willem de Bruijn <willemb@google.com>
> 
> Virtio-net supports sharing the flow hash from host to guest on rx.
> Do the same on transmit, to allow the host to infer connection state
> for more robust routing and telemetry.
> 
> Linux derives ipv6 flowlabel and ECMP multipath from sk->sk_txhash,
> and updates these fields on error with sk_rethink_txhash. This feature
> allows the host to make similar decisions.
> 
> Besides the raw hash, optionally also convey connection state for
> this hash. Specifically, the hash rotates on transmit timeout. To
> avoid having to keep a stateful table in the host to detect flow
> changes, explicitly notify when a hash changed due to timeout.

I don't actually see code using VIRTIO_NET_HASH_STATE_TIMEOUT_BIT
in this series. Want to split out that part to a separate patch?


> Signed-off-by: Willem de Bruijn <willemb@google.com>
> ---
>  drivers/net/virtio_net.c        | 24 +++++++++++++++++++++---
>  include/uapi/linux/virtio_net.h | 10 +++++++++-
>  2 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 21b71148c532..b917b7333928 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -201,6 +201,9 @@ struct virtnet_info {
>  	/* Host will merge rx buffers for big packets (shake it! shake it!) */
>  	bool mergeable_rx_bufs;
>  
> +	/* Guest will pass tx path info to the host */
> +	bool has_tx_hash;
> +
>  	/* Has control virtqueue */
>  	bool has_cvq;
>  
> @@ -394,9 +397,9 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
>  
>  	hdr_len = vi->hdr_len;
>  	if (vi->mergeable_rx_bufs)
> -		hdr_padded_len = sizeof(*hdr);
> +		hdr_padded_len = max_t(unsigned int, hdr_len, sizeof(*hdr));
>  	else
> -		hdr_padded_len = sizeof(struct padded_vnet_hdr);
> +		hdr_padded_len = ALIGN(hdr_len, 16);
>  
>  	/* hdr_valid means no XDP, so we can copy the vnet header */
>  	if (hdr_valid)
> @@ -1534,6 +1537,7 @@ static int xmit_skb(struct send_queue *sq, struct sk_buff *skb)
>  	struct virtio_net_hdr_mrg_rxbuf *hdr;
>  	const unsigned char *dest = ((struct ethhdr *)skb->data)->h_dest;
>  	struct virtnet_info *vi = sq->vq->vdev->priv;
> +	struct virtio_net_hdr_v1_hash *ht;
>  	int num_sg;
>  	unsigned hdr_len = vi->hdr_len;
>  	bool can_push;
> @@ -1558,6 +1562,14 @@ static int xmit_skb(struct send_queue *sq, struct sk_buff *skb)
>  	if (vi->mergeable_rx_bufs)
>  		hdr->num_buffers = 0;
>  
> +	ht = (void *)hdr;
> +	if (vi->has_tx_hash) {
> +		ht->hash_value = cpu_to_virtio32(vi->vdev, skb->hash);
> +		ht->hash_report = skb->l4_hash ? VIRTIO_NET_HASH_REPORT_L4 :
> +						 VIRTIO_NET_HASH_REPORT_OTHER;
> +		ht->hash_state = VIRTIO_NET_HASH_STATE_DEFAULT;
> +	}
> +
>  	sg_init_table(sq->sg, skb_shinfo(skb)->nr_frags + (can_push ? 1 : 2));
>  	if (can_push) {
>  		__skb_push(skb, hdr_len);
> @@ -3054,6 +3066,11 @@ static int virtnet_probe(struct virtio_device *vdev)
>  	else
>  		vi->hdr_len = sizeof(struct virtio_net_hdr);
>  
> +	if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_TX_HASH)) {
> +		vi->has_tx_hash = true;
> +		vi->hdr_len = sizeof(struct virtio_net_hdr_v1_hash);
> +	}
> +
>  	if (virtio_has_feature(vdev, VIRTIO_F_ANY_LAYOUT) ||
>  	    virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
>  		vi->any_header_sg = true;
> @@ -3243,7 +3260,8 @@ static struct virtio_device_id id_table[] = {
>  	VIRTIO_NET_F_GUEST_ANNOUNCE, VIRTIO_NET_F_MQ, \
>  	VIRTIO_NET_F_CTRL_MAC_ADDR, \
>  	VIRTIO_NET_F_MTU, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, \
> -	VIRTIO_NET_F_SPEED_DUPLEX, VIRTIO_NET_F_STANDBY
> +	VIRTIO_NET_F_SPEED_DUPLEX, VIRTIO_NET_F_STANDBY, \
> +	VIRTIO_NET_F_TX_HASH
>  
>  static unsigned int features[] = {
>  	VIRTNET_FEATURES,
> diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> index 3f55a4215f11..f6881b5b77ee 100644
> --- a/include/uapi/linux/virtio_net.h
> +++ b/include/uapi/linux/virtio_net.h
> @@ -57,6 +57,7 @@
>  					 * Steering */
>  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
>  
> +#define VIRTIO_NET_F_TX_HASH	  56	/* Guest sends hash report */


Guest -> Driver

>  #define VIRTIO_NET_F_HASH_REPORT  57	/* Supports hash report */
>  #define VIRTIO_NET_F_RSS	  60	/* Supports RSS RX steering */
>  #define VIRTIO_NET_F_RSC_EXT	  61	/* extended coalescing info */
> @@ -170,8 +171,15 @@ struct virtio_net_hdr_v1_hash {
>  #define VIRTIO_NET_HASH_REPORT_IPv6_EX         7
>  #define VIRTIO_NET_HASH_REPORT_TCPv6_EX        8
>  #define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
> +#define VIRTIO_NET_HASH_REPORT_L4              10
> +#define VIRTIO_NET_HASH_REPORT_OTHER           11
>  	__le16 hash_report;
> -	__le16 padding;
> +	union {
> +		__le16 padding;
> +#define VIRTIO_NET_HASH_STATE_DEFAULT          0
> +#define VIRTIO_NET_HASH_STATE_TIMEOUT_BIT      0x1
> +		__le16 hash_state;
> +	};
>  };
>  
>  #ifndef VIRTIO_NET_NO_LEGACY
> -- 
> 2.29.2.729.g45daf8777d-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
