Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7A0174F5D
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 20:58:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E96F854AF;
	Sun,  1 Mar 2020 19:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9agaBmwZxzdT; Sun,  1 Mar 2020 19:58:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A84AD854AD;
	Sun,  1 Mar 2020 19:58:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AD3DC013E;
	Sun,  1 Mar 2020 19:58:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFB3FC013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 19:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C79D9854AD
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 19:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCVeCz1Ma2bM
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 19:58:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A0B3084F24
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 19:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583092708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rcjko7dGicYuc4H1pc5fh3ajPyPhlRFezJ328nwLSZw=;
 b=ANf4KscvL+SZ8QaxXZLR9PeDy0x9VURE6I/GJTRQjUjmjr0+3UwqUZlIulhEs5JlOXxZSX
 x8wlQL9I/WacKWgKYxUqZCoQ3P6wgLp59AXFuA3YEpaDRvk6ZQ9hudtFCmpRHxaIGSsyj0
 FITncyMD/IXqZRrRgQYAKLt3LMXhj8s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-pxeydhqCNmuVcyT3G8ZLZg-1; Sun, 01 Mar 2020 14:58:26 -0500
X-MC-Unique: pxeydhqCNmuVcyT3G8ZLZg-1
Received: by mail-qv1-f72.google.com with SMTP id g11so5887865qvl.3
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 11:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rcjko7dGicYuc4H1pc5fh3ajPyPhlRFezJ328nwLSZw=;
 b=F5zGj5xB0RMM696HAsj0QC159pDb7UIj6iR90LR6bj+3pkyNnvxPAZJ+P4m1eu5XcA
 tyhh8qwIv+s02G2sQnn7M19gbTznoLhWQThNV3Gfiv3FbceCi6+s1RtybJtGSIzBR/on
 6eCpmuC2bcppbmvbxEA41lvhGb4/46rUFgICmc5W1fZMIz9pxQ4ApUfByTqyWMkofgyZ
 RHL9/nmnRwuQfV0bIoAtRyF40Fa8gM31Sz42EPk2mUx/5LPPhazR8/jVVZEhSi9H04ZB
 XRdvqJwGp0+LrXEzxTthv887nBqHEa82ZDROQNMZnh6StHCdLUvk0nFPYUi5oELQpQKB
 pppA==
X-Gm-Message-State: APjAAAWTPFCgM5TDjyq8vUhCRIQB4W+7t37QNOsRRehMuWfgbyBNmKIA
 KEeVapIOYpqJEG4gQ+hYmHsgTHiopm+nT93HquJEXZwimbdk6tqEyYvXOBcy7SwfIFYmSAhevHd
 x2rjQ6Yvx+M7Z7H0WO0aewkE27v2v9MViXCT/rs+F4w==
X-Received: by 2002:ad4:4f47:: with SMTP id eu7mr12303444qvb.69.1583092705768; 
 Sun, 01 Mar 2020 11:58:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqwXrQGv3bBrObwtPqn+kKYqGLtVs9FDBgQfagcgmNj36YA9iidB7EomiUjDi11v7/laoEZkBQ==
X-Received: by 2002:ad4:4f47:: with SMTP id eu7mr12303431qvb.69.1583092705563; 
 Sun, 01 Mar 2020 11:58:25 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id x44sm7508250qtc.88.2020.03.01.11.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 11:58:24 -0800 (PST)
Date: Sun, 1 Mar 2020 14:58:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v3 2/3] virtio-net: Introduce RSS receive steering feature
Message-ID: <20200301145811-mutt-send-email-mst@kernel.org>
References: <20200301143302.8556-1-yuri.benditovich@daynix.com>
 <20200301143302.8556-3-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20200301143302.8556-3-yuri.benditovich@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: yan@daynix.com, virtio-dev@lists.oasis-open.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Sun, Mar 01, 2020 at 04:33:01PM +0200, Yuri Benditovich wrote:
> RSS (Receive-side scaling) defines hash calculation
> rules and decision on receive virtqueue according to
> the calculated hash, provided mask to apply and
> provided indirection table containing indices of
> receive virqueues. The driver sends the control
> command to enable multiqueue and provide parameters
> for receive steering.
> 
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> ---
>  include/uapi/linux/virtio_net.h | 42 +++++++++++++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> index 19e76b3e3a64..188ad3eecdc8 100644
> --- a/include/uapi/linux/virtio_net.h
> +++ b/include/uapi/linux/virtio_net.h
> @@ -57,6 +57,7 @@
>  					 * Steering */
>  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
>  
> +#define VIRTIO_NET_F_RSS	  60	/* Supports RSS RX steering */
>  #define VIRTIO_NET_F_RSC_EXT	  61	/* extended coalescing info */
>  #define VIRTIO_NET_F_STANDBY	  62	/* Act as standby for another device
>  					 * with the same MAC.
> @@ -70,6 +71,17 @@
>  #define VIRTIO_NET_S_LINK_UP	1	/* Link is up */
>  #define VIRTIO_NET_S_ANNOUNCE	2	/* Announcement is needed */
>  
> +/* supported/enabled hash types */
> +#define VIRTIO_NET_RSS_HASH_TYPE_IPv4          (1 << 0)
> +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4         (1 << 1)
> +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4         (1 << 2)
> +#define VIRTIO_NET_RSS_HASH_TYPE_IPv6          (1 << 3)
> +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6         (1 << 4)
> +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6         (1 << 5)
> +#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX         (1 << 6)
> +#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX        (1 << 7)
> +#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX        (1 << 8)
> +
>  struct virtio_net_config {
>  	/* The config defining mac address (if VIRTIO_NET_F_MAC) */
>  	__u8 mac[ETH_ALEN];
> @@ -93,6 +105,12 @@ struct virtio_net_config {
>  	 * Any other value stands for unknown.
>  	 */
>  	__u8 duplex;
> +	/* maximum size of RSS key */
> +	__u8 rss_max_key_size;
> +	/* maximum number of indirection table entries */
> +	__le16 rss_max_indirection_table_length;
> +	/* bitmask of supported VIRTIO_NET_RSS_HASH_ types */
> +	__le32 supported_hash_types;
>  } __attribute__((packed));
>  
>  /*
> @@ -246,7 +264,9 @@ struct virtio_net_ctrl_mac {
>  
>  /*
>   * Control Receive Flow Steering
> - *
> + */
> +#define VIRTIO_NET_CTRL_MQ   4
> +/*
>   * The command VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
>   * enables Receive Flow Steering, specifying the number of the transmit and
>   * receive queues that will be used. After the command is consumed and acked by
> @@ -259,11 +279,29 @@ struct virtio_net_ctrl_mq {
>  	__virtio16 virtqueue_pairs;
>  };
>  
> -#define VIRTIO_NET_CTRL_MQ   4
>   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0
>   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN        1
>   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX        0x8000
>  
> +/*
> + * The command VIRTIO_NET_CTRL_MQ_RSS_CONFIG has the same effect as
> + * VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET does and additionally configures
> + * the receive steering to use a hash calculated for incoming packet
> + * to decide on receive virtqueue to place the packet. The command
> + * also provides parameters to calculate a hash and receive virtqueue.
> + */
> +struct virtio_net_rss_config {
> +	__le32 hash_types;
> +	__le16 indirection_table_mask;
> +	__le16 unclassified_queue;
> +	__le16 indirection_table[1/* + indirection_table_mask */];
> +	__le16 max_tx_vq;
> +	__u8 hash_key_length;
> +	__u8 hash_key_data[/* hash_key_length */];
> +};
> +
> + #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
> +


Extra space here.

>  /*
>   * Control network offloads
>   *
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
