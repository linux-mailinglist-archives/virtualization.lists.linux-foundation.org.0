Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E22016A849
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 15:25:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B10B886FBB;
	Mon, 24 Feb 2020 14:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxnYffNkb5Tr; Mon, 24 Feb 2020 14:25:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88CC286FF8;
	Mon, 24 Feb 2020 14:25:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6925CC0177;
	Mon, 24 Feb 2020 14:25:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A580C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 14:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 870DE859E3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 14:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nBaCicHRTxWo
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 14:25:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C317684AC5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582554341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TB7sUf2pFHZ1gfff7bVBVaPbnW5iGaEMa9gLQVlWv7I=;
 b=SZyKbdoU2qqKqf7ErNqMMpe8nZCOaJ5ZpGL27HjhJJUSUXw8h4fvXrOq4ksIFYHxGGV8j0
 n1GB5PatGDqHppeCNhDu20Mdc8dlQnTypB/CjnIf8I17lu0OEiheGmP9jRDlaYdp5eaOmX
 /C98OSaT1fGdKBEugctU0siFkH/m+xc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-dyp_qW7SPw6clB5rdqYdrA-1; Mon, 24 Feb 2020 09:25:37 -0500
X-MC-Unique: dyp_qW7SPw6clB5rdqYdrA-1
Received: by mail-qv1-f70.google.com with SMTP id cn2so9112002qvb.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 06:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TB7sUf2pFHZ1gfff7bVBVaPbnW5iGaEMa9gLQVlWv7I=;
 b=pDJ9qdkcnkCU4LXgAApQIJ9H9mBkmK1u0pxjjqqOClF+qxgK4TuyJXyzRfgcfDH0Oh
 rfpREX3kuJIxvzTGeP8gU+yYSQYjJefA0FuEOdOhuQyKrcsQNB8qkwxLmEY5w7+5iB0n
 Rl+qRrZ/ukEmsugcwA9x6wl0uBUXkL2pg3NWmhODICiBB9MLzacSB1824I8wxvt/8s4J
 x5Bdn3ynWoKcq1w54FyWWg20iREFj/A/Ipk1jwrTBVBAMmXgicAKzCWg6kT8sF34Y+9x
 fHQIi9KdJPddz/oYqw+6NoxiB2kGT/qOzGvCX3V8rp//HleaYBjG2TYcfA6tn/YCAdCg
 /umA==
X-Gm-Message-State: APjAAAV0MFjYPOTCB8QxKJRue4vIgmg2C66DcSAIsdjpXU4Vi8X9ffS6
 dqA6pbi7pyeNFUdLlMcqAWA4l1FXjJyOxfzCVnK9Lk3tKswCBMorM8Pr1eHIigZm5Zhmb0a43uS
 qIQuzN7LBdWktOPhTRYUivn0r823E5M154JYLyzoVdg==
X-Received: by 2002:ac8:7657:: with SMTP id i23mr48528798qtr.197.1582554337426; 
 Mon, 24 Feb 2020 06:25:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqznUlCcqXeerYYf+szsmuv/Ph5idwuFaPaAFKrIhkobzWbc5eRNhdpX5HexMXIGUCrH38q8gw==
X-Received: by 2002:ac8:7657:: with SMTP id i23mr48528784qtr.197.1582554337178; 
 Mon, 24 Feb 2020 06:25:37 -0800 (PST)
Received: from redhat.com (bzq-79-178-2-214.red.bezeqint.net. [79.178.2.214])
 by smtp.gmail.com with ESMTPSA id
 g26sm5921357qkk.68.2020.02.24.06.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:25:36 -0800 (PST)
Date: Mon, 24 Feb 2020 09:25:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: anton.ivanov@cambridgegreys.com
Subject: Re: [PATCH v3] virtio: Work around frames incorrectly marked as gso
Message-ID: <20200224092526-mutt-send-email-mst@kernel.org>
References: <20200224132550.2083-1-anton.ivanov@cambridgegreys.com>
MIME-Version: 1.0
In-Reply-To: <20200224132550.2083-1-anton.ivanov@cambridgegreys.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-um@lists.infradead.org,
 eric.dumazet@gmail.com, virtualization@lists.linux-foundation.org
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

On Mon, Feb 24, 2020 at 01:25:50PM +0000, anton.ivanov@cambridgegreys.com wrote:
> From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> 
> Some of the locally generated frames marked as GSO which
> arrive at virtio_net_hdr_from_skb() have no GSO_TYPE, no
> fragments (data_len = 0) and length significantly shorter
> than the MTU (752 in my experiments).
> 
> This is observed on raw sockets reading off vEth interfaces
> in all 4.x and 5.x kernels. The frames are reported as
> invalid, while they are in fact gso-less frames.
> 
> The easiest way to reproduce is to connect a User Mode
> Linux instance to the host using the vector raw transport
> and a vEth interface. Vector raw uses recvmmsg/sendmmsg
> with virtio headers on af_packet sockets. When running iperf
> between the UML and the host, UML regularly complains about
> EINVAL return from recvmmsg.
> 
> This patch marks the vnet header as non-GSO instead of
> reporting it as invalid.
> 
> Signed-off-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  include/linux/virtio_net.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> index 0d1fe9297ac6..2c99c752cb20 100644
> --- a/include/linux/virtio_net.h
> +++ b/include/linux/virtio_net.h
> @@ -98,10 +98,11 @@ static inline int virtio_net_hdr_from_skb(const struct sk_buff *skb,
>  					  bool has_data_valid,
>  					  int vlan_hlen)
>  {
> +	struct skb_shared_info *sinfo = skb_shinfo(skb);
> +
>  	memset(hdr, 0, sizeof(*hdr));   /* no info leak */
>  
> -	if (skb_is_gso(skb)) {
> -		struct skb_shared_info *sinfo = skb_shinfo(skb);
> +	if (skb_is_gso(skb) && sinfo->gso_type) {
>  
>  		/* This is a hint as to how much should be linear. */
>  		hdr->hdr_len = __cpu_to_virtio16(little_endian,
> -- 
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
