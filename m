Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 432A430C0D3
	for <lists.virtualization@lfdr.de>; Tue,  2 Feb 2021 15:08:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BC42A20387;
	Tue,  2 Feb 2021 14:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGV9K+WfVO61; Tue,  2 Feb 2021 14:08:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 918EC2037A;
	Tue,  2 Feb 2021 14:08:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60942C013A;
	Tue,  2 Feb 2021 14:08:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EF82C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 14:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 50A052037A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 14:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id foaYwlrLhnJ1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 14:08:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 1DD722038D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 14:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612274915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mirZa3yUEq++3JqI3oR6Gzaq1R19rjhpMm3CizTMdhM=;
 b=iSmy2nU4fKTL4XjvRaktj/PxYx5WZnxPDsfMPEcM9Use0x/3YO/4acx0MAqKCc7ePsxatO
 U3zOvM0M9C/LzIU2t0H+qnHDbbzhEYe4JMwvwva/nE2ZDYwHmj4A6bQVyIJtXQyXPGRDhj
 Xqthzjau0bLXrt1XO7DHnVrGzdTcMTM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-Q0--T42vMBeQcvLo4iQzvw-1; Tue, 02 Feb 2021 09:08:32 -0500
X-MC-Unique: Q0--T42vMBeQcvLo4iQzvw-1
Received: by mail-wr1-f72.google.com with SMTP id h18so12658436wrr.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Feb 2021 06:08:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mirZa3yUEq++3JqI3oR6Gzaq1R19rjhpMm3CizTMdhM=;
 b=Gw18wyAb8JUb8Un7UhuXemQ/h0i+A7osnhl/t2kHpxoksEFx9kdAXT4exYoM/p89oZ
 AqrDzcp2eHMauJQsPm350byqD8fofBH7V8hoduXa7TtyaFbUyCnvRPdxsASJmgMzTOFr
 No8kDwzUe/pt+9FC9jbYKhIdkcROnN+SH/+o44tecsc33LBeV5xvbysr9/nu3HIztDoC
 6S7XPNl62EAKfyK0WHd8+nm87J+3uID5knz9eh+01Y25hsvPJs5TGriZqz80aF/ixVX2
 ho79RqM5Gs4XOufJgfCQaxXrUtu5cvG7F7ICZDiR16pvAdRZITnoLdt0hfbr4YB39yn4
 xsjA==
X-Gm-Message-State: AOAM530MurScsApKYJR5joNo4kFZmK0CatsFnrdtgToOpXHx/BGuyDAe
 PlNrmHMEjNTglCMg1h4tdTIDvofkaOm7IymB2Sl3yoAbK2yte7m8FSVfMrFVCsUW2bZvWakpa8o
 SIByz8+NV/iH6ep1XmvnEEPe2IlPFwW3pXfufdqXecg==
X-Received: by 2002:adf:ef03:: with SMTP id e3mr24504229wro.98.1612274911068; 
 Tue, 02 Feb 2021 06:08:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZRkxiviUbtukpHiXMaZugKQ5wX+jo3TqMX5lDlVQwa7h3bPyo3TcCw4rmgquEI1Yqy1k4hw==
X-Received: by 2002:adf:ef03:: with SMTP id e3mr24504206wro.98.1612274910855; 
 Tue, 02 Feb 2021 06:08:30 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id p18sm3197717wmc.31.2021.02.02.06.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 06:08:29 -0800 (PST)
Date: Tue, 2 Feb 2021 09:08:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH rfc 2/3] virtio-net: support receive timestamp
Message-ID: <20210202090724-mutt-send-email-mst@kernel.org>
References: <20201228162233.2032571-1-willemdebruijn.kernel@gmail.com>
 <20201228162233.2032571-3-willemdebruijn.kernel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201228162233.2032571-3-willemdebruijn.kernel@gmail.com>
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

On Mon, Dec 28, 2020 at 11:22:32AM -0500, Willem de Bruijn wrote:
> From: Willem de Bruijn <willemb@google.com>
> 
> Add optional PTP hardware timestamp offload for virtio-net.
> 
> Accurate RTT measurement requires timestamps close to the wire.
> Introduce virtio feature VIRTIO_NET_F_RX_TSTAMP. If negotiated, the
> virtio-net header is expanded with room for a timestamp. A host may
> pass receive timestamps for all or some packets. A timestamp is valid
> if non-zero.
> 
> The timestamp straddles (virtual) hardware domains. Like PTP, use
> international atomic time (CLOCK_TAI) as global clock base. It is
> guest responsibility to sync with host, e.g., through kvm-clock.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> ---
>  drivers/net/virtio_net.c        | 20 +++++++++++++++++++-
>  include/uapi/linux/virtio_net.h | 12 ++++++++++++
>  2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index b917b7333928..57744bb6a141 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -204,6 +204,9 @@ struct virtnet_info {
>  	/* Guest will pass tx path info to the host */
>  	bool has_tx_hash;
>  
> +	/* Host will pass CLOCK_TAI receive time to the guest */
> +	bool has_rx_tstamp;
> +
>  	/* Has control virtqueue */
>  	bool has_cvq;
>  
> @@ -292,6 +295,13 @@ static inline struct virtio_net_hdr_mrg_rxbuf *skb_vnet_hdr(struct sk_buff *skb)
>  	return (struct virtio_net_hdr_mrg_rxbuf *)skb->cb;
>  }
>  
> +static inline struct virtio_net_hdr_v12 *skb_vnet_hdr_12(struct sk_buff *skb)
> +{
> +	BUILD_BUG_ON(sizeof(struct virtio_net_hdr_v12) > sizeof(skb->cb));
> +
> +	return (void *)skb->cb;
> +}
> +
>  /*
>   * private is used to chain pages for big packets, put the whole
>   * most recent used list in the beginning for reuse
> @@ -1082,6 +1092,9 @@ static void receive_buf(struct virtnet_info *vi, struct receive_queue *rq,
>  		goto frame_err;
>  	}
>  
> +	if (vi->has_rx_tstamp)
> +		skb_hwtstamps(skb)->hwtstamp = ns_to_ktime(skb_vnet_hdr_12(skb)->tstamp);
> +
>  	skb_record_rx_queue(skb, vq2rxq(rq->vq));
>  	skb->protocol = eth_type_trans(skb, dev);
>  	pr_debug("Receiving skb proto 0x%04x len %i type %i\n",
> @@ -3071,6 +3084,11 @@ static int virtnet_probe(struct virtio_device *vdev)
>  		vi->hdr_len = sizeof(struct virtio_net_hdr_v1_hash);
>  	}
>  
> +	if (virtio_has_feature(vdev, VIRTIO_NET_F_RX_TSTAMP)) {
> +		vi->has_rx_tstamp = true;
> +		vi->hdr_len = sizeof(struct virtio_net_hdr_v12);
> +	}
> +
>  	if (virtio_has_feature(vdev, VIRTIO_F_ANY_LAYOUT) ||
>  	    virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
>  		vi->any_header_sg = true;
> @@ -3261,7 +3279,7 @@ static struct virtio_device_id id_table[] = {
>  	VIRTIO_NET_F_CTRL_MAC_ADDR, \
>  	VIRTIO_NET_F_MTU, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, \
>  	VIRTIO_NET_F_SPEED_DUPLEX, VIRTIO_NET_F_STANDBY, \
> -	VIRTIO_NET_F_TX_HASH
> +	VIRTIO_NET_F_TX_HASH, VIRTIO_NET_F_RX_TSTAMP
>  
>  static unsigned int features[] = {
>  	VIRTNET_FEATURES,
> diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> index f6881b5b77ee..0ffe2eeebd4a 100644
> --- a/include/uapi/linux/virtio_net.h
> +++ b/include/uapi/linux/virtio_net.h
> @@ -57,6 +57,7 @@
>  					 * Steering */
>  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
>  
> +#define VIRTIO_NET_F_RX_TSTAMP	  55	/* Host sends TAI receive time */
>  #define VIRTIO_NET_F_TX_HASH	  56	/* Guest sends hash report */
>  #define VIRTIO_NET_F_HASH_REPORT  57	/* Supports hash report */
>  #define VIRTIO_NET_F_RSS	  60	/* Supports RSS RX steering */
> @@ -182,6 +183,17 @@ struct virtio_net_hdr_v1_hash {
>  	};
>  };
>  
> +struct virtio_net_hdr_v12 {
> +	struct virtio_net_hdr_v1 hdr;
> +	struct {
> +		__le32 value;
> +		__le16 report;
> +		__le16 flow_state;
> +	} hash;
> +	__virtio32 reserved;


Does endian-ness matter? If not - just u32?

> +	__virtio64 tstamp;
> +};
> +

Given it's only available in modern devices, I think we
can make this __le64 tstamp.

>  #ifndef VIRTIO_NET_NO_LEGACY
>  /* This header comes first in the scatter-gather list.
>   * For legacy virtio, if VIRTIO_F_ANY_LAYOUT is not negotiated, it must
> -- 
> 2.29.2.729.g45daf8777d-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
