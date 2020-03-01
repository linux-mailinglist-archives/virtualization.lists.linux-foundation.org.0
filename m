Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 43433174C4B
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 09:43:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C0D2D89CA0;
	Sun,  1 Mar 2020 08:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrMGt166qjah; Sun,  1 Mar 2020 08:43:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E7F0189CA3;
	Sun,  1 Mar 2020 08:43:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1B40C1D89;
	Sun,  1 Mar 2020 08:43:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3826C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 08:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DF35B2284F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 08:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aeqUog8j4ltL
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 08:43:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id B23302284A
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 08:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583052216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z4wTuSY/YLFqa4TR/y7uU0KCTqcGFfatFFzWHxU3S9Q=;
 b=JJn5T42U/1yDOATo1ZyTce20lhnHB0YmbX4kudgLE7g0lUTqYYeJcFCAiMJw1AK/R9xIBo
 zQHG4LinndnQI2eNq2IGjbCmBVeSZ6d/S35MluaBugt7Jheizim1A42N1/fVpe9Ba22Gtg
 TK7EPUuMyzvd3gEUozqcrjF9eBG6D40=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-V1Ny0aGEMB6Ez3rVKuZpkw-1; Sun, 01 Mar 2020 03:43:34 -0500
X-MC-Unique: V1Ny0aGEMB6Ez3rVKuZpkw-1
Received: by mail-qt1-f200.google.com with SMTP id i6so298940qtw.2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 00:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z4wTuSY/YLFqa4TR/y7uU0KCTqcGFfatFFzWHxU3S9Q=;
 b=TLxYBozQDn6gg0ZeC2MwAfyThwL0MqEkBLliZ93Lb/3ogSuCtVCWu0bLMDgktfweIE
 J9J7d2I2Ws/jFyvbM+qhR3Po7RXy+j5/jtyjOgu/vIPPu0DDcO9po1fNoCsmWkVF7rvE
 ARjnVp/v7g+1qQiNMZA2JnJEwQbhXjzy/clK0ZCvEeUKnvd10lchT+Dnk0y5aUxej0B1
 BnesQeRQC7NzItD+iptrN+6bKQ93cSe3hKsxLTtQMdFxvZmqNJgrnaF3yycFHzerAJ5A
 hJoIYDyOHZ0KC73QdMXfdfrw9rYQGABq4P2zmTeAksLFHINarqEk+m36Vuh7xIBFwg4q
 Fx5Q==
X-Gm-Message-State: APjAAAW5xCXUSmE6SF9mnFJj5ob+p07J+0Y0LR0cEthDwbg385uI9cI7
 CIBHc60yudiXK1TUBXl9O0lSMZSM+Qqwa/Cm2ywGk/4e/BQNZd4B9WvlgILek853/Nr1i2E5ReX
 c3U3NMGdeOVl4BCV6CjcgNZzKj4fvKPkANu1ydyIKew==
X-Received: by 2002:ac8:425a:: with SMTP id r26mr11076777qtm.138.1583052214393; 
 Sun, 01 Mar 2020 00:43:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzMYTqQtgFiyqEUCgJ67xL8NB+j4+rHKqXYLk2efsRK+7kOAVel5jQPLrgg19sJ2BFDuEog/g==
X-Received: by 2002:ac8:425a:: with SMTP id r26mr11076767qtm.138.1583052214119; 
 Sun, 01 Mar 2020 00:43:34 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id a141sm8249950qkb.50.2020.03.01.00.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 00:43:33 -0800 (PST)
Date: Sun, 1 Mar 2020 03:43:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH 3/3] virtio-net: Introduce hash report feature
Message-ID: <20200301033900-mutt-send-email-mst@kernel.org>
References: <20200229171301.15234-1-yuri.benditovich@daynix.com>
 <20200229171301.15234-4-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20200229171301.15234-4-yuri.benditovich@daynix.com>
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

On Sat, Feb 29, 2020 at 07:13:01PM +0200, Yuri Benditovich wrote:
> The feature VIRTIO_NET_F_HASH_REPORT extends the
> layout of the packet and requests the device to
> calculate hash on incoming packets and report it
> in the packet header.
> 
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> ---
>  include/uapi/linux/virtio_net.h | 36 +++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> index 7a342657fb6c..6d7230469c57 100644
> --- a/include/uapi/linux/virtio_net.h
> +++ b/include/uapi/linux/virtio_net.h
> @@ -57,6 +57,7 @@
>  					 * Steering */
>  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
>  
> +#define VIRTIO_NET_F_HASH_REPORT  57	/* Supports hash report */
>  #define VIRTIO_NET_F_RSS	  60	/* Supports RSS RX steering */
>  #define VIRTIO_NET_F_RSC_EXT	  61	/* extended coalescing info */
>  #define VIRTIO_NET_F_STANDBY	  62	/* Act as standby for another device
> @@ -144,6 +145,23 @@ struct virtio_net_hdr_v1 {
>  	__virtio16 num_buffers;	/* Number of merged rx buffers */
>  };
>  
> +struct virtio_net_hdr_v1_hash {
> +	struct virtio_net_hdr_v1 hdr;
> +	__virtio32 hash_value;
> +#define VIRTIO_NET_HASH_REPORT_NONE            0
> +#define VIRTIO_NET_HASH_REPORT_IPv4            1
> +#define VIRTIO_NET_HASH_REPORT_TCPv4           2
> +#define VIRTIO_NET_HASH_REPORT_UDPv4           3
> +#define VIRTIO_NET_HASH_REPORT_IPv6            4
> +#define VIRTIO_NET_HASH_REPORT_TCPv6           5
> +#define VIRTIO_NET_HASH_REPORT_UDPv6           6
> +#define VIRTIO_NET_HASH_REPORT_IPv6_EX         7
> +#define VIRTIO_NET_HASH_REPORT_TCPv6_EX        8
> +#define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
> +	__virtio16 hash_report;
> +	__virtio16 padding;
> +};
> +
>  #ifndef VIRTIO_NET_NO_LEGACY
>  /* This header comes first in the scatter-gather list.
>   * For legacy virtio, if VIRTIO_F_ANY_LAYOUT is not negotiated, it must
> @@ -292,6 +310,24 @@ struct virtio_net_rss_config {
>  
>   #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
>  
> +/*
> + * The command VIRTIO_NET_CTRL_MQ_HASH_CONFIG requests the device
> + * to include in the virtio header of the packet the value of the
> + * calculated hash and the report type of hash. It also provides
> + * parameters for hash calculation. The command requires feature
> + * VIRTIO_NET_F_HASH_REPORT to be negotiated to extend the
> + * layout of virtio header as defined in virtio_net_hdr_v1_hash.
> + */
> +struct virtio_net_hash_config {
> +	__virtio32 hash_types;
> +	/* for compatibility with virtio_net_rss_config */
> +	__virtio16 reserved[4];

I expect these should all be le32/le16 respectively.

> +	__u8 hash_key_length;
> +	__u8 hash_key_data[/*hash_key_length*/];
> +};

Should be /* hash_key_length */ as per coding style.

> +
> + #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2
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
