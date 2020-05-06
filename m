Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EB78A1C6A7F
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 09:53:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 963B486B08;
	Wed,  6 May 2020 07:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvBY6UYSuild; Wed,  6 May 2020 07:53:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A548686AF8;
	Wed,  6 May 2020 07:53:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81F0EC088B;
	Wed,  6 May 2020 07:53:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44C57C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 07:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 40B0D885FD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 07:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4G37wmyLheg
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 07:53:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ADC0F885DD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588751619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8W0xSmvUlYVndDM8MoTsGUiUlHlecuHz50ZkJqJ3zCY=;
 b=Blpzrd2Wm0O93KkVoSr1gHv6p+sBFkuXSXZOtue0JcgVJj5D4vrnSn0Md2XvG5gsoDvf4z
 rRBUyUEu+fgKB0LTd61nNmnA8rD+0HldQIVjWnFdL4x0xfYrYtuh7TIwd1zsHFf25jy41R
 h+CLBr6obYatALYAFJaZb2dOZV4F93g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-BCWX1ylaOtu5O2wlXLbSyw-1; Wed, 06 May 2020 03:53:35 -0400
X-MC-Unique: BCWX1ylaOtu5O2wlXLbSyw-1
Received: by mail-wr1-f72.google.com with SMTP id h12so879675wrr.19
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 00:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8W0xSmvUlYVndDM8MoTsGUiUlHlecuHz50ZkJqJ3zCY=;
 b=IWU+9sxzUmXVbxxBJoO05qE+ErKFuppuv9t3hxRHaKQm1b4JZd5httFFd05jgLgJtM
 deUY8IHwAVwJNxgQ14cjMQamSEDBB3019X4+wlQOwMzXzTMFOk8R8y+TsmQqjVZnzL8J
 XSwfxFd9LqJumah3BMjRww+IwrDqUhcEc/5jEb5KxGO6xP0aNInWRkg8DTZLQzdn5663
 8r7ttek6z6ZD2r0bkaabcvQsyWjZK4M/BGGyhHEJvra36/tNDiJBi5hEcCnbSMSTR52v
 Cs7NVULUAjCPvk/MKgAYrYlYeLylxQ7K3xnXSWbAZcAlavRFDCXtmhxrOY8QUYcp6muM
 38VA==
X-Gm-Message-State: AGi0PuZ3HVLrAh24fCokUSkCDX9LtmfG3mJZfZtmU0eFq6mVYxEe+vHR
 h8qGgxIo3yatAU+3TZdqznDOkoCs3JUfH7PbsSZw46MS/sEuuuS4cnmG1NBXhQtTA5WFpQHgd7b
 7OzXhst5urqMtw20gU/dfY5RSk8TIeEaqVlWcvb7NVQ==
X-Received: by 2002:a5d:6692:: with SMTP id l18mr8511146wru.423.1588751614939; 
 Wed, 06 May 2020 00:53:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypI/1wp+em/vQpb50Bo7ALnQIlQcctHrYO0O4kec4Eg43lHoV1FZjHRLjxj87amFb1+gASDZpQ==
X-Received: by 2002:a5d:6692:: with SMTP id l18mr8511130wru.423.1588751614751; 
 Wed, 06 May 2020 00:53:34 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 p190sm1710263wmp.38.2020.05.06.00.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 00:53:34 -0700 (PDT)
Date: Wed, 6 May 2020 03:53:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net-next 1/2] virtio-net: don't reserve space for vnet
 header for XDP
Message-ID: <20200506033834-mutt-send-email-mst@kernel.org>
References: <20200506061633.16327-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200506061633.16327-1-jasowang@redhat.com>
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

On Wed, May 06, 2020 at 02:16:32PM +0800, Jason Wang wrote:
> We tried to reserve space for vnet header before
> xdp.data_hard_start. But this is useless since the packet could be
> modified by XDP which may invalidate the information stored in the
> header and there's no way for XDP to know the existence of the vnet
> header currently.

What do you mean? Doesn't XDP_PASS use the header in the buffer?

> So let's just not reserve space for vnet header in this case.

In any case, we can find out XDP does head adjustments
if we need to.


> Cc: Jesper Dangaard Brouer <brouer@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/net/virtio_net.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 11f722460513..98dd75b665a5 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -684,8 +684,8 @@ static struct sk_buff *receive_small(struct net_device *dev,
>  			page = xdp_page;
>  		}
>  
> -		xdp.data_hard_start = buf + VIRTNET_RX_PAD + vi->hdr_len;
> -		xdp.data = xdp.data_hard_start + xdp_headroom;
> +		xdp.data_hard_start = buf + VIRTNET_RX_PAD;
> +		xdp.data = xdp.data_hard_start + xdp_headroom + vi->hdr_len;
>  		xdp.data_end = xdp.data + len;
>  		xdp.data_meta = xdp.data;
>  		xdp.rxq = &rq->xdp_rxq;
> @@ -845,7 +845,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
>  		 * the descriptor on if we get an XDP_TX return code.
>  		 */
>  		data = page_address(xdp_page) + offset;
> -		xdp.data_hard_start = data - VIRTIO_XDP_HEADROOM + vi->hdr_len;
> +		xdp.data_hard_start = data - VIRTIO_XDP_HEADROOM;
>  		xdp.data = data + vi->hdr_len;
>  		xdp.data_end = xdp.data + (len - vi->hdr_len);
>  		xdp.data_meta = xdp.data;
> -- 
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
