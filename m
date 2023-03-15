Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9246BBEF1
	for <lists.virtualization@lfdr.de>; Wed, 15 Mar 2023 22:23:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E5FA80FAB;
	Wed, 15 Mar 2023 21:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E5FA80FAB
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UJmHQHeC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 66YPXDiJKpv3; Wed, 15 Mar 2023 21:23:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4AD8A812C5;
	Wed, 15 Mar 2023 21:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AD8A812C5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB80EC008C;
	Wed, 15 Mar 2023 21:23:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E42A6C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 21:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0F9860797
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 21:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0F9860797
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UJmHQHeC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1EgrLL4p9QE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 21:23:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F17A960774
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F17A960774
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 21:23:20 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 k18-20020a17090a591200b0023d36e30cb5so3297005pji.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 14:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678915400;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpKNq1jPFRcrzw5GmHq4U9XoqgkDIbRL0krA5AsHags=;
 b=UJmHQHeCJ5Tfm9cYNpn+6q5FwjDmaZrArfaXw0UDkphx3LjtOyHbqdakpkAo2Hxklk
 dtmPJumnskFBmjSIwC2VjCbr5khJ94Kc3DA5nEXSoZCxgVBeTLoFZstc2jhTf+8N3lLL
 BjTbcXdEIlgESGl1AsgI99OUv3uWLxRCzL5JvQuGMIEG4x35srCHWN+9+9YKS08qmCUM
 0dY9DDMzmCTZpFPW0+g/q8OX6jPr3RNumGvruI+1lPKdDu/fT6/zxLxx7hgcXGM9GLuW
 KbTRxQvc66JG/d/HntJ6p7yFR92e99kfNlaPGCRgAyo1FYOSfYAGY8qCB0CypTF1tQkj
 wFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678915400;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kpKNq1jPFRcrzw5GmHq4U9XoqgkDIbRL0krA5AsHags=;
 b=UgSG4iTvT6+WmIN1puG6jhRIxW/1QEm+zePOmc5w/OYZoSuzj2Rwf4CsGjLYQkfU0L
 rs9ZkZtFlnCQ9FG2IAgtROu/cLGk9JSietcQ30A9KwVhBpFEHP57LLyZgtGgpVhcHzx0
 yK86Oj9wK8KVA7J9aiDqcv7Jfit/bOhpRKQQSKwJlbBLaADYxOUsJ69YHqBhvf83YAGb
 x2qy/yWcewCMCgEeP9apdT31r38ua80YHC64ClwZIrvUaofKUYdgusriZfrud/oiq8NY
 V/OLkjgPnEpNJH0yeDv2txSRmpmeWhoqB1K2sCEpNH5As6uCErtfxfA1XdSlOz27s+Tk
 r2bg==
X-Gm-Message-State: AO0yUKWcpuENoQoI9V7CwUbEjKGNwdFipyqx+ebaXjXDpHZgFfB/2zKr
 W5lWOEtTp+VYLf80o3xRUK8=
X-Google-Smtp-Source: AK7set8JWNfawHmhD7QMbyFbUqc0eQMajqXNs7oBCS5kGrbPAgdcKs7dYXc4moXtIYe5XhhGpETEPg==
X-Received: by 2002:a17:903:11cd:b0:19c:e842:a9e0 with SMTP id
 q13-20020a17090311cd00b0019ce842a9e0mr1063192plh.16.1678915400327; 
 Wed, 15 Mar 2023 14:23:20 -0700 (PDT)
Received: from localhost ([98.97.36.54]) by smtp.gmail.com with ESMTPSA id
 jw24-20020a170903279800b001a072aedec7sm2594699plb.75.2023.03.15.14.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 14:23:19 -0700 (PDT)
Date: Wed, 15 Mar 2023 14:23:18 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 netdev@vger.kernel.org
Message-ID: <641237468971a_63dce2081d@john.notmuch>
In-Reply-To: <20230314083901.40521-3-xuanzhuo@linux.alibaba.com>
References: <20230314083901.40521-1-xuanzhuo@linux.alibaba.com>
 <20230314083901.40521-3-xuanzhuo@linux.alibaba.com>
Subject: RE: [PATCH net 2/2] virtio_net: free xdp shinfo frags when
 build_skb_from_xdp_buff() fails
Mime-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Heng Qi <hengqi@linux.alibaba.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
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

Xuan Zhuo wrote:
> build_skb_from_xdp_buff() may return NULL, on this
> scene we need to free the frags of xdp shinfo.
> 
> Fixes: fab89bafa95b ("virtio-net: support multi-buffer xdp")
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  drivers/net/virtio_net.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 8ecf7a341d54..d36183be0481 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -1273,9 +1273,12 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
>  
>  		switch (act) {
>  		case XDP_PASS:
> +			head_skb = build_skb_from_xdp_buff(dev, vi, &xdp, xdp_frags_truesz);
> +			if (!head_skb)
> +				goto err_xdp_frags;
> +
>  			if (unlikely(xdp_page != page))
>  				put_page(page);
> -			head_skb = build_skb_from_xdp_buff(dev, vi, &xdp, xdp_frags_truesz);
>  			rcu_read_unlock();
>  			return head_skb;
>  		case XDP_TX:
> -- 
> 2.32.0.3.g01195cf9f
> 

Acked-by: John Fastabend <john.fastabend@gmail.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
