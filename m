Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D0174C53
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 09:49:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A93B289CB8;
	Sun,  1 Mar 2020 08:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2xp7BnngQBX5; Sun,  1 Mar 2020 08:49:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D624589CBC;
	Sun,  1 Mar 2020 08:49:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFDA2C013E;
	Sun,  1 Mar 2020 08:49:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56ADBC013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 08:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 49A8622865
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 08:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JvlCM-UPhXRa
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 08:49:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 1431122855
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 08:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583052569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PpMXUuCEusmBp5p4Be+qaN8/mGgM9hkv0auM9sJUxy8=;
 b=FLfsgvIrUPa1qicYuILb3qATfO+AuKYlLesMi6xucv7OtubklPOU+XOln3HijLKHbYBpt9
 GjlD/a1UocqgF9wkc4U4hwANSiApLzXEsA53Pn10gbOfeWsMSOOeInUXPwyc3d74dhjKSK
 naq6fO6IVqLyQN+I56l77W70rLY9j30=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-FC-sONq7OwGJlSzBJdWqPw-1; Sun, 01 Mar 2020 03:49:25 -0500
X-MC-Unique: FC-sONq7OwGJlSzBJdWqPw-1
Received: by mail-qv1-f69.google.com with SMTP id dc2so6452723qvb.7
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 00:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PpMXUuCEusmBp5p4Be+qaN8/mGgM9hkv0auM9sJUxy8=;
 b=uT5iWcw/dFLxKjeHHDNbU9fLlYZky4Z4LJP2k166alnofpODiz2ZuxGVSflzdg2xkm
 923F1ijCzoIUb/d0ivmxkjD2qmAGxooTbpYZWYueS72Wu4JTXvLx34dqu72RuWI6FHaE
 8kkgI2Tg2+7ZkVehxZ3E5xyj6baLsEfgMeIPyV6d6qoF+LIKRei/dlydGGY/1J1m1Bhj
 wXTIr/r79yOiZXtbgfRffeaoDb6FRFj1DAtfwvpUcqeE4LdrRGD+RxTY2f/JS67K+h12
 /pXfnLwTyahR5FcpBQhTdnSaN4k7jqqVTJHMJzKf1V6AF4JJysFu99k2/qwFbJ6eL/6W
 SHZw==
X-Gm-Message-State: APjAAAXlIRuIIF7sI76rLKd+b+y2bcI9m61Q1f1FlXXa101WSaPEgbbh
 bieTtB3Uqj9FDyrVRBYckX4H3OCAZN8eOpHZYK8u6lMtHLoOleNdcIYqMVoqoOkEfxinloeY5DJ
 Oto1uLNMAUj8P+r/YHasdL6GI/PHdHQBohuw6O+tacA==
X-Received: by 2002:a37:b4c5:: with SMTP id d188mr11102794qkf.27.1583052565499; 
 Sun, 01 Mar 2020 00:49:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqyT5tnpzAk6rh1bz+ewje7fgHhLTiqcVEVL7qiAadXPfxOeOPRbcHVosMdabNJgyx1vqnIYDQ==
X-Received: by 2002:a37:b4c5:: with SMTP id d188mr11102783qkf.27.1583052565250; 
 Sun, 01 Mar 2020 00:49:25 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id y62sm8072235qka.19.2020.03.01.00.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 00:49:24 -0800 (PST)
Date: Sun, 1 Mar 2020 03:49:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH 2/3] virtio-net: Introduce RSS receive steering feature
Message-ID: <20200301034703-mutt-send-email-mst@kernel.org>
References: <20200229171301.15234-1-yuri.benditovich@daynix.com>
 <20200229171301.15234-3-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20200229171301.15234-3-yuri.benditovich@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: yan@daynix.com, linux-kernel@vger.kernel.org,
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

On Sat, Feb 29, 2020 at 07:13:00PM +0200, Yuri Benditovich wrote:
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
> index 6e26a2cc6ad0..7a342657fb6c 100644
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
> +	/* maximal size of RSS key */
> +	__u8 rss_max_key_size;
> +	/* maximal number of indirection table entries */
> +	__u16 rss_max_indirection_table_length;

This mirrors spec language. However I just stumbled upon this:

https://en.wikipedia.org/wiki/Maximal_and_minimal_elements

which seems to say maximal means "local maximum".
So I think we should fix both the spec and this header to
say "maximum" instead of "maximal".

Thanks!



> +	/* bitmask of supported VIRTIO_NET_RSS_HASH_ types */
> +	__u32 supported_hash_types;
>  } __attribute__((packed));
>  
>  /*
> @@ -236,7 +254,9 @@ struct virtio_net_ctrl_mac {
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
> @@ -249,11 +269,29 @@ struct virtio_net_ctrl_mq {
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
> +	__virtio32 hash_types;
> +	__virtio16 indirection_table_mask;
> +	__virtio16 unclassified_queue;
> +	__virtio16 indirection_table[1/* + indirection_table_mask*/];
> +	__virtio16 max_tx_vq;
> +	__u8 hash_key_length;
> +	__u8 hash_key_data[/*hash_key_length*/];
> +};


Should use __le and not __virtio.
__virtio is for legacy types which sometimes have variable endian-ness.


> +
> + #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
> +
>  /*
>   * Control network offloads
>   *
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
