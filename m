Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F047B1C6A29
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 09:37:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AF04686A75;
	Wed,  6 May 2020 07:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1M1b_l5ga6Q4; Wed,  6 May 2020 07:37:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8AE6E869D9;
	Wed,  6 May 2020 07:37:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 760FBC0859;
	Wed,  6 May 2020 07:37:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28192C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 07:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1C26988574
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 07:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mb7xyelq6Aos
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 07:37:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E7C25884D6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 07:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588750668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1DqHn9dPlmj80heFjYayVPfLacQlouJrbO3+dn30g+Y=;
 b=IGosKOOhtur924OsjKmcDnLD1Co+WRdGMjZjU8XKvleAKVOpDZBRqnAZs4cYKveWm5PGRL
 wYoC6n/164dbOuenEzD+SF6nSPP+y+AgjRygzhX8ZYBRAKxW8dI8/N6Y5JSEleZch8dNJS
 6oz35GaK5vnBLxwzgSADBIpUq99+fu0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-KIwuOQLNPi6_amtzl0CpqA-1; Wed, 06 May 2020 03:37:47 -0400
X-MC-Unique: KIwuOQLNPi6_amtzl0CpqA-1
Received: by mail-wr1-f69.google.com with SMTP id 30so864191wrq.15
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 00:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1DqHn9dPlmj80heFjYayVPfLacQlouJrbO3+dn30g+Y=;
 b=nHOkagKW7eoABKZUeY2Fw1lRnNX+Pprlk++zPi2/FilDDAbf9gQDELIZsRkwx+z512
 UbQfqqZlCq71ssJZU1RK49PWO8PEyTC2zYnRBaSBYtg5fFjFh593AsmypI2uzk+k0gMq
 y7kZbgU8Fmx6qxzjX3P/Iwp35thVfCZHDVmDrlb0ydMofTaOdsO+chokbC5J6WfPpwMf
 IaVXaklRhmZuXUIn0AJb7ndInJQPFBfWw13L/xUy7nP33EjePWClCdB1qD82XImvbx1K
 zlhMb3ufCJgtH2i4CHUKpspRJbMQUkMFZSyE8O8A/SpIY6GWVAnlntdFZBkk3t3S/4ar
 q0Jg==
X-Gm-Message-State: AGi0PuYqiwllIZpbqai+HcyAFAIQ6fZghiBzo7xjtNuS2T4O+2RbWjR3
 aWzTrT6wRGBMKnqlRuY9b8d/AZ8faxps8Cw2j8AMLf0FPqvOwE0wkxZo2NXYHyL2/h10ovbBEYq
 wQnpP7b7/JvXqRCSFj2hwlWpCQMok4EumrEC7qGlG2w==
X-Received: by 2002:adf:ce10:: with SMTP id p16mr7691545wrn.144.1588750665672; 
 Wed, 06 May 2020 00:37:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypLylGfrIQvy8pwm2otNVLPO1o3cMHW4JbPm3GLxsqO+x+n/Q0pR35QnHj4F0DC4IEX6mTgYDA==
X-Received: by 2002:adf:ce10:: with SMTP id p16mr7691526wrn.144.1588750665498; 
 Wed, 06 May 2020 00:37:45 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 19sm1655337wmo.3.2020.05.06.00.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 00:37:45 -0700 (PDT)
Date: Wed, 6 May 2020 03:37:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net-next 2/2] virtio-net: fix the XDP truesize
 calculation for mergeable buffers
Message-ID: <20200506033259-mutt-send-email-mst@kernel.org>
References: <20200506061633.16327-1-jasowang@redhat.com>
 <20200506061633.16327-2-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200506061633.16327-2-jasowang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, linux-kernel@vger.kernel.org,
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

On Wed, May 06, 2020 at 02:16:33PM +0800, Jason Wang wrote:
> We should not exclude headroom and tailroom when XDP is set. So this
> patch fixes this by initializing the truesize from PAGE_SIZE when XDP
> is set.
> 
> Cc: Jesper Dangaard Brouer <brouer@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Seems too aggressive, we do not use up the whole page for the size.



> ---
>  drivers/net/virtio_net.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 98dd75b665a5..3f3aa8308918 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -1184,7 +1184,7 @@ static int add_recvbuf_mergeable(struct virtnet_info *vi,
>  	char *buf;
>  	void *ctx;
>  	int err;
> -	unsigned int len, hole;
> +	unsigned int len, hole, truesize;
>  
>  	/* Extra tailroom is needed to satisfy XDP's assumption. This
>  	 * means rx frags coalescing won't work, but consider we've
> @@ -1194,6 +1194,7 @@ static int add_recvbuf_mergeable(struct virtnet_info *vi,
>  	if (unlikely(!skb_page_frag_refill(len + room, alloc_frag, gfp)))
>  		return -ENOMEM;
>  
> +	truesize = headroom ? PAGE_SIZE : len;
>  	buf = (char *)page_address(alloc_frag->page) + alloc_frag->offset;
>  	buf += headroom; /* advance address leaving hole at front of pkt */
>  	get_page(alloc_frag->page);

Is this really just on the XDP path? Looks like a confusing way to
detect that.


> @@ -1205,11 +1206,12 @@ static int add_recvbuf_mergeable(struct virtnet_info *vi,
>  		 * the current buffer.
>  		 */
>  		len += hole;
> +		truesize += hole;
>  		alloc_frag->offset += hole;
>  	}
>  
>  	sg_init_one(rq->sg, buf, len);
> -	ctx = mergeable_len_to_ctx(len, headroom);
> +	ctx = mergeable_len_to_ctx(truesize, headroom);
>  	err = virtqueue_add_inbuf_ctx(rq->vq, rq->sg, 1, buf, ctx, gfp);
>  	if (err < 0)
>  		put_page(virt_to_head_page(buf));
> -- 
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
