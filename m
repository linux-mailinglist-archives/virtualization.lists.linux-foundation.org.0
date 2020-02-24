Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC1016A658
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 13:46:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 09D0A86133;
	Mon, 24 Feb 2020 12:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLyavc9YWVeC; Mon, 24 Feb 2020 12:46:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6ED6E86117;
	Mon, 24 Feb 2020 12:46:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45AD0C0177;
	Mon, 24 Feb 2020 12:46:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9778C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B24258702A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3LxlKOGj+SWC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9C78C8657C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582548395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N1w/bpq1E0DR8ffozDoEv3Gfr6ireSQ41Zmo6iO9ZL4=;
 b=Y1ocdN3UtTLrrSnj0Sl6covafFgxUNL/y/1B5Muce3KTCVpV+fSyfr8rbvx1l3qzYMjWsg
 LAtDApWJvJ5F1erEV2zNvOTX3WFtWCF4O216eapg0OuEfR1FQkvmx50Vm9XFJ8gEZcmI4d
 3AIkj6xAFUvDI0/fcAu1PTVpU60LChs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-j-HA50yKNcWaau4uQLlapw-1; Mon, 24 Feb 2020 07:46:33 -0500
X-MC-Unique: j-HA50yKNcWaau4uQLlapw-1
Received: by mail-qk1-f197.google.com with SMTP id 133so5454702qkn.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 04:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N1w/bpq1E0DR8ffozDoEv3Gfr6ireSQ41Zmo6iO9ZL4=;
 b=uJXcric3sXk+Bcs/BaV6HCNA2xPF+2FexhgYxfEOJbY2l12L+CtmhyUkdEdgYFrcli
 QTt4GU+2W/k6vFRZLMNJXvZ81tk/hnUztndJbjhcJqiNHZKpa0UJC3djQ4grTL3oX8Hj
 KzEpl+YGGBDvycU111DpT/MoK3SsRH6fdaYpEeYEysEYbeMvYSnOVjNHF/NKjET0hETj
 tJnbF19SEzAevtXMi98ViqIKGUkk9y+f9HQ5ZLCvy1+8ft8aHFor/AQPHb/A36hyTh7s
 6lykVfPPKcOmYESLnUrztC5KjHssFaIM271wtTJzj7EKbsXt95SUcCr3I1jo8pHgo0om
 +xlQ==
X-Gm-Message-State: APjAAAUHR3LAO1wlTRcf6GO1XMuzQPoMEpZbtC0AgSnna4V02NmjxEmn
 UOb3VbVjxMpuScSJX78WrcN3BNjYaBTx27S3ZQRcjXCuvFUlp8OIkVH68t0F5zQTFENqKABSJaC
 La6hJhnbkfc7TLwSd6nO0othknVJte1fEVODCrwFosw==
X-Received: by 2002:a05:6214:1090:: with SMTP id
 o16mr44417573qvr.105.1582548393301; 
 Mon, 24 Feb 2020 04:46:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqywnGbl/kPjS/h+s1WqKt4dmZfLt2m7GCCSOkmteYbtnbiK/9cmHGbGiMVk/z3Scpi+g6NOrg==
X-Received: by 2002:a05:6214:1090:: with SMTP id
 o16mr44417557qvr.105.1582548393075; 
 Mon, 24 Feb 2020 04:46:33 -0800 (PST)
Received: from redhat.com (bzq-79-178-2-214.red.bezeqint.net. [79.178.2.214])
 by smtp.gmail.com with ESMTPSA id
 202sm3046131qkg.132.2020.02.24.04.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 04:46:32 -0800 (PST)
Date: Mon, 24 Feb 2020 07:46:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: anton.ivanov@cambridgegreys.com
Subject: Re: [PATCH v2] virtio: Work around frames incorrectly marked as gso
Message-ID: <20200224074516-mutt-send-email-mst@kernel.org>
References: <20200224101912.14074-1-anton.ivanov@cambridgegreys.com>
MIME-Version: 1.0
In-Reply-To: <20200224101912.14074-1-anton.ivanov@cambridgegreys.com>
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

On Mon, Feb 24, 2020 at 10:19:12AM +0000, anton.ivanov@cambridgegreys.com wrote:
> From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> 
> Some of the locally generated frames marked as GSO which
> arrive at virtio_net_hdr_from_skb() have no GSO_TYPE, no
> fragments (data_len = 0) and length significantly shorter
> than the MTU (752 in my experiments).
> 
> This is observed on raw sockets reading off vEth interfaces
> in all 4.x and 5.x kernels I tested.

A bit more info on how to reproduce couldn't hurt here.

> 
> These frames are reported as invalid while they are in fact
> gso-less frames.
> 
> This patch marks the vnet header as no-GSO for them instead
> of reporting it as invalid.
> 
> Signed-off-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Eric - as you looked at this in the past, would you mind acking please?

> ---
>  include/linux/virtio_net.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> index 0d1fe9297ac6..94fb78c3a2ab 100644
> --- a/include/linux/virtio_net.h
> +++ b/include/linux/virtio_net.h
> @@ -100,8 +100,8 @@ static inline int virtio_net_hdr_from_skb(const struct sk_buff *skb,
>  {
>  	memset(hdr, 0, sizeof(*hdr));   /* no info leak */
>  
> -	if (skb_is_gso(skb)) {
> -		struct skb_shared_info *sinfo = skb_shinfo(skb);
> +	struct skb_shared_info *sinfo = skb_shinfo(skb);
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
