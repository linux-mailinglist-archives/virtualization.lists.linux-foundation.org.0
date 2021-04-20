Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D6436555C
	for <lists.virtualization@lfdr.de>; Tue, 20 Apr 2021 11:29:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C15A583A60;
	Tue, 20 Apr 2021 09:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSb7EQYwhf8d; Tue, 20 Apr 2021 09:29:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6552C83A82;
	Tue, 20 Apr 2021 09:29:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06DCBC000B;
	Tue, 20 Apr 2021 09:29:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C86C6C000B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 09:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AABCE83A77
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 09:29:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YeeLDiYZeI8R
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 09:28:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C962283A60
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 09:28:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r7so24847914wrm.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 02:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wROCMm76wNlr3GUjS33+liYup7xQt+ZVK0kHL95H1yo=;
 b=c6yuN29Gq5Cs3b7lLBYspvNQjvcmVJZB/+A/vm5ZEnWqVmTkt+KjwY1Kl+uvMEFG/4
 pVsuHmdhCmZjrsMJbag0ph4mrsXN/dDOy6/Oh00MTSTTuYAmAx56nxwhA+jdC2egSAvn
 v9SjsTrbmG/wvau7/MA+qAd6NtPyfdPj9jW97i/KwITwAHk5Tez/4EzDHC2cISDdIKp2
 J/sguzIhzM4JB4UswdVq8zTOkTzUqwRCzxJ5DFAnSQ/hKevYtuOcrJ64CS/O/5202/LU
 KBJDoph8uw3RE05WcyZrHKCk3Yk+vRPOwffJU21LuqpzgF1vMrqQ/SgKRpYJaY+zjKkZ
 Qonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wROCMm76wNlr3GUjS33+liYup7xQt+ZVK0kHL95H1yo=;
 b=TgVXMFspwPA+8LHUpz6ZeX498Sr3jFRP/yFZ22/SIRQWCaf4zOnDk3PejTNcVMKEsV
 zYxUpJyrl0LkvPqCJqKCjKioB/Y5Z3F/kPspkjvDSzXKLpou1SWkrAdtNMfZtRlRl/8Q
 rOSK/xPhowdwZSSmQETRlEuT4TNGN/Nb7HPqj/b+bdVNZv8OyjmoHtG60aW8sfvNwFLO
 8tGtswhb8r+PeTPCLq0691onqKg2DHNgMNnohMmqYskODj68DCp2GLbxBTGQrC5CN2at
 L/Jtyg4+Kij3LsKypmde/rnYPLFhKtvP1m0F2UbQeRL3X8XDkJYkCfCL1wq6LG0cIFPv
 AroQ==
X-Gm-Message-State: AOAM533RX/4Z+gxqKFrRsZi7RG4s+IUS5ZYUupW5VDxTmk6Y91iPQbQm
 DVvuig1BPaaAQ78W4PGqa4qtIlA7RFU=
X-Google-Smtp-Source: ABdhPJyukdY9VwVZQehtKCXhQFuOsFtqcT6SONwSNBIYV2SGIsgb6KHMjsahSwQge57HuF9DMHDRtw==
X-Received: by 2002:a5d:640a:: with SMTP id z10mr18889936wru.276.1618910935811; 
 Tue, 20 Apr 2021 02:28:55 -0700 (PDT)
Received: from [192.168.156.98] (114.199.23.93.rev.sfr.net. [93.23.199.114])
 by smtp.gmail.com with ESMTPSA id f23sm2620236wmf.37.2021.04.20.02.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 02:28:55 -0700 (PDT)
Subject: Re: [PATCH net-next v3] virtio-net: page_to_skb() use build_skb when
 there's sufficient tailroom
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org
References: <20210416091615.25198-1-xuanzhuo@linux.alibaba.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <bd5d5488-1449-d1a9-9e5a-822d97229f84@gmail.com>
Date: Tue, 20 Apr 2021 11:28:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210416091615.25198-1-xuanzhuo@linux.alibaba.com>
Content-Language: en-US
Cc: Jakub Kicinski <kuba@kernel.org>, virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>, "Michael S. Tsirkin" <mst@redhat.com>
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



On 4/16/21 11:16 AM, Xuan Zhuo wrote:
> In page_to_skb(), if we have enough tailroom to save skb_shared_info, we
> can use build_skb to create skb directly. No need to alloc for
> additional space. And it can save a 'frags slot', which is very friendly
> to GRO.
> 
> Here, if the payload of the received package is too small (less than
> GOOD_COPY_LEN), we still choose to copy it directly to the space got by
> napi_alloc_skb. So we can reuse these pages.
> 
> Testing Machine:
>     The four queues of the network card are bound to the cpu1.
> 
> Test command:
>     for ((i=0;i<5;++i)); do sockperf tp --ip 192.168.122.64 -m 1000 -t 150& done
> 
> The size of the udp package is 1000, so in the case of this patch, there
> will always be enough tailroom to use build_skb. The sent udp packet
> will be discarded because there is no port to receive it. The irqsoftd
> of the machine is 100%, we observe the received quantity displayed by
> sar -n DEV 1:
> 
> no build_skb:  956864.00 rxpck/s
> build_skb:    1158465.00 rxpck/s
> 
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Suggested-by: Jason Wang <jasowang@redhat.com>
> ---
> 
> v3: fix the truesize when headroom > 0
> 
> v2: conflict resolution
> 
>  drivers/net/virtio_net.c | 69 ++++++++++++++++++++++++++++------------
>  1 file changed, 48 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 101659cd4b87..8cd76037c724 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -379,21 +379,17 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
>  				   struct receive_queue *rq,
>  				   struct page *page, unsigned int offset,
>  				   unsigned int len, unsigned int truesize,
> -				   bool hdr_valid, unsigned int metasize)
> +				   bool hdr_valid, unsigned int metasize,
> +				   unsigned int headroom)
>  {
>  	struct sk_buff *skb;
>  	struct virtio_net_hdr_mrg_rxbuf *hdr;
>  	unsigned int copy, hdr_len, hdr_padded_len;
> -	char *p;
> +	int tailroom, shinfo_size;
> +	char *p, *hdr_p;
> 
>  	p = page_address(page) + offset;
> -
> -	/* copy small packet so we can reuse these pages for small data */
> -	skb = napi_alloc_skb(&rq->napi, GOOD_COPY_LEN);
> -	if (unlikely(!skb))
> -		return NULL;
> -
> -	hdr = skb_vnet_hdr(skb);
> +	hdr_p = p;
> 
>  	hdr_len = vi->hdr_len;
>  	if (vi->mergeable_rx_bufs)
> @@ -401,14 +397,38 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
>  	else
>  		hdr_padded_len = sizeof(struct padded_vnet_hdr);
> 
> -	/* hdr_valid means no XDP, so we can copy the vnet header */
> -	if (hdr_valid)
> -		memcpy(hdr, p, hdr_len);
> +	/* If headroom is not 0, there is an offset between the beginning of the
> +	 * data and the allocated space, otherwise the data and the allocated
> +	 * space are aligned.
> +	 */
> +	if (headroom) {
> +		/* The actual allocated space size is PAGE_SIZE. */
> +		truesize = PAGE_SIZE;
> +		tailroom = truesize - len - offset;
> +	} else {
> +		tailroom = truesize - len;
> +	}
> 
>  	len -= hdr_len;
>  	offset += hdr_padded_len;
>  	p += hdr_padded_len;
> 
> +	shinfo_size = SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
> +
> +	if (len > GOOD_COPY_LEN && tailroom >= shinfo_size) {
> +		skb = build_skb(p, truesize);
> +		if (unlikely(!skb))
> +			return NULL;
> +
> +		skb_put(skb, len);
> +		goto ok;
> +	}
> +
> +	/* copy small packet so we can reuse these pages for small data */
> +	skb = napi_alloc_skb(&rq->napi, GOOD_COPY_LEN);
> +	if (unlikely(!skb))
> +		return NULL;
> +
>  	/* Copy all frame if it fits skb->head, otherwise
>  	 * we let virtio_net_hdr_to_skb() and GRO pull headers as needed.
>  	 */
> @@ -418,11 +438,6 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
>  		copy = ETH_HLEN + metasize;
>  	skb_put_data(skb, p, copy);
> 
> -	if (metasize) {
> -		__skb_pull(skb, metasize);
> -		skb_metadata_set(skb, metasize);
> -	}
> -
>  	len -= copy;
>  	offset += copy;
> 
> @@ -431,7 +446,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
>  			skb_add_rx_frag(skb, 0, page, offset, len, truesize);
>  		else
>  			put_page(page);

Here the struct page has been freed..

> -		return skb;
> +		goto ok;
>  	}
> 
>  	/*
> @@ -458,6 +473,18 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
>  	if (page)
>  		give_pages(rq, page);
> 
> +ok:
> +	/* hdr_valid means no XDP, so we can copy the vnet header */
> +	if (hdr_valid) {
> +		hdr = skb_vnet_hdr(skb);
> +		memcpy(hdr, hdr_p, hdr_len);

But here you are reading its content.

This is a use-after-free.

> +	}
> +

I will test something like :


diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 8cd76037c72481200ea3e8429e9fdfec005dad85..2e28c04aa6351d2b4016f7d277ce104c4970069d 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -385,6 +385,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
        struct sk_buff *skb;
        struct virtio_net_hdr_mrg_rxbuf *hdr;
        unsigned int copy, hdr_len, hdr_padded_len;
+       struct page *page_to_free = NULL;
        int tailroom, shinfo_size;
        char *p, *hdr_p;
 
@@ -445,7 +446,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
                if (len)
                        skb_add_rx_frag(skb, 0, page, offset, len, truesize);
                else
-                       put_page(page);
+                       page_to_free = page;
                goto ok;
        }
 
@@ -479,6 +480,8 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
                hdr = skb_vnet_hdr(skb);
                memcpy(hdr, hdr_p, hdr_len);
        }
+       if (page_to_free)
+               put_page(page_to_free);
 
        if (metasize) {
                __skb_pull(skb, metasize);




_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
