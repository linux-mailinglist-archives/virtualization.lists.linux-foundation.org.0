Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5AF174F6A
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 21:07:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 30A2182074;
	Sun,  1 Mar 2020 20:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uxrcy1vQ7Ero; Sun,  1 Mar 2020 20:06:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A78D87554;
	Sun,  1 Mar 2020 20:06:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E81FC013E;
	Sun,  1 Mar 2020 20:06:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8248CC013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6946685725
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 20:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJ1IHDOhu40y
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 20:06:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 09CCF85721
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 20:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583093167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ILXO2eXZPASOoI7MkLPdupz0F1Xu1tLIw+lHAxhsHxE=;
 b=YtyLSmRSoqEEXkHz8SiPxyIxfI40RqJYDnEW0y9hWSog2gFXPX1u6qSwzLBZQEhDytW18/
 hZwLwspx+TevNiTNTxE7GYEzDcKCop8mZQbyoST83PcJ4J/Yk7h0Dt3bX3zuT1ZWBibnuN
 H504GIk6R66TIF0e7/Tp6xt3f10t/4g=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-yxEX6wmCNwyw1-G3OcwJag-1; Sun, 01 Mar 2020 15:06:06 -0500
X-MC-Unique: yxEX6wmCNwyw1-G3OcwJag-1
Received: by mail-qk1-f198.google.com with SMTP id h6so7611655qkj.14
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 12:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ILXO2eXZPASOoI7MkLPdupz0F1Xu1tLIw+lHAxhsHxE=;
 b=dL1VcMJLom9WrqROybYkUtVjxLPtKCa9Pk+XTlmTeGLtn3vvJw0w26akADYAwXU+Zk
 OUOmZxfM4Af7UucjGsXtMwPxVUTQqRKd6unrye/qjoReLIZnrnP7G8vLd6DrGjCjtCFA
 578YZbgSrSWwpPG5HxCvyRaLXWsCH0feJWTRplSqJZyoOVRMLrXtJdKMumzHuOkJo0/G
 z7InAR17ArbW34Peq3Q/X/3QJB/cpxpT3w7HoWhLuto5UFlkMPnHDXjlt4RUPfEio5RU
 qOCK/8Upjx8W12U4PxlUjscUXkxRUKk7g5ZExgugH9yIIpbelARWdmXPQIslsN7ekjIT
 78nQ==
X-Gm-Message-State: ANhLgQ22tZUnE67d2SsY/pmihN4DQs9ilflAqmF6CcwbOLzlpFGg0CDb
 hWvgWDG8rASWpgd2gc9g7q0pXtuX0nUnHHzeVJfroc1zy7rORyqEK5A8NdUh1JLUu944EAYQ54l
 /Z498NNaNjWhOT1P0ZArTwj9GIBMOXuDusLkTtsfLSw==
X-Received: by 2002:a0c:cdc7:: with SMTP id a7mr3159172qvn.33.1583093166037;
 Sun, 01 Mar 2020 12:06:06 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtGqdq15wkvnSqxM2yybu5grrNXTMhrlBqJgAsLezYpWNDwvB4n42onnk2g6v6fgEux8vlQpQ==
X-Received: by 2002:a0c:cdc7:: with SMTP id a7mr3159160qvn.33.1583093165836;
 Sun, 01 Mar 2020 12:06:05 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id x34sm4591428qta.82.2020.03.01.12.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 12:06:04 -0800 (PST)
Date: Sun, 1 Mar 2020 15:06:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v3 1/3] virtio-net: Introduce extended RSC feature
Message-ID: <20200301145828-mutt-send-email-mst@kernel.org>
References: <20200301143302.8556-1-yuri.benditovich@daynix.com>
 <20200301143302.8556-2-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20200301143302.8556-2-yuri.benditovich@daynix.com>
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

On Sun, Mar 01, 2020 at 04:33:00PM +0200, Yuri Benditovich wrote:
> VIRTIO_NET_F_RSC_EXT feature bit indicates that the device
> is able to provide extended RSC information. When the feature
> is negotiatede and 'gso_type' field in received packet is not
> GSO_NONE, the device reports number of coalesced packets in
> 'csum_start' field and number of duplicated acks in 'csum_offset'
> field and sets VIRTIO_NET_HDR_F_RSC_INFO in 'flags' field.
> 
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> ---
>  include/uapi/linux/virtio_net.h | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> index a3715a3224c1..19e76b3e3a64 100644
> --- a/include/uapi/linux/virtio_net.h
> +++ b/include/uapi/linux/virtio_net.h
> @@ -57,6 +57,7 @@
>  					 * Steering */
>  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
>  
> +#define VIRTIO_NET_F_RSC_EXT	  61	/* extended coalescing info */
>  #define VIRTIO_NET_F_STANDBY	  62	/* Act as standby for another device
>  					 * with the same MAC.
>  					 */
> @@ -104,6 +105,7 @@ struct virtio_net_config {
>  struct virtio_net_hdr_v1 {
>  #define VIRTIO_NET_HDR_F_NEEDS_CSUM	1	/* Use csum_start, csum_offset */
>  #define VIRTIO_NET_HDR_F_DATA_VALID	2	/* Csum is valid */
> +#define VIRTIO_NET_HDR_F_RSC_INFO	4	/* rsc info in csum_ fields */
>  	__u8 flags;
>  #define VIRTIO_NET_HDR_GSO_NONE		0	/* Not a GSO frame */
>  #define VIRTIO_NET_HDR_GSO_TCPV4	1	/* GSO frame, IPv4 TCP (TSO) */
> @@ -113,8 +115,24 @@ struct virtio_net_hdr_v1 {
>  	__u8 gso_type;
>  	__virtio16 hdr_len;	/* Ethernet + IP + tcp/udp hdrs */
>  	__virtio16 gso_size;	/* Bytes to append to hdr_len per frame */
> -	__virtio16 csum_start;	/* Position to start checksumming from */
> -	__virtio16 csum_offset;	/* Offset after that to place checksum */
> +	union {
> +		struct {
> +			__virtio16 csum_start;
> +			__virtio16 csum_offset;
> +		};


Pls add comments for this one as well.

> +		struct {
> +			/* Position to start checksumming from */
> +			__virtio16 start;
> +			/* Offset after that to place checksum */
> +			__virtio16 offset;
> +		} csum;

Can we add a comment for csum field pls? E.g.
	/* Checksum calculation */

> +		struct {
> +			/* num of coalesced packets */


num -> Number? Don't abbreviate and upper case for consistency.

> +			__le16 packets;

packets -> coalesced_packets? Or is coalesced segments in fact better?

> +			/* num of duplicated acks */

num -> Number? Don't abbreviate and upper case for consistency.


> +			__le16 dup_acks;
> +		} rsc;

/* Receive Segment Coalescing report */

> +	};
>  	__virtio16 num_buffers;	/* Number of merged rx buffers */
>  };
>  
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
