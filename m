Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3534F3ACB1C
	for <lists.virtualization@lfdr.de>; Fri, 18 Jun 2021 14:38:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D295A400DF;
	Fri, 18 Jun 2021 12:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PFDBKI-k6ey; Fri, 18 Jun 2021 12:38:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 92F64400DB;
	Fri, 18 Jun 2021 12:38:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 229FBC0022;
	Fri, 18 Jun 2021 12:38:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02BA5C000B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 12:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBA6D415A4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 12:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fi6OMAkTP_t1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 12:38:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F32864159E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 12:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624019898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8BPRFSs4ZDIzsU3WeQFolZqPnT6BylD3v05yUAKiC4I=;
 b=AhGKUxu0ffCzsgG696WX6ysaRLgQLrcEvATcClIZeJux4zPSEWmvIJpjaas+dGZjyV7CKl
 bic6oY7Q0fGtFR8dn06zUzvt9dJZMlUEuOwrWbIzYgemy5+AUvjxTfEjo+6ULZaI28MGDq
 5MyFIoBtbBnLPlNnpQMwLMAn2BDZjC0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-EXKasVjCPNa7aYAR72SfJw-1; Fri, 18 Jun 2021 08:38:17 -0400
X-MC-Unique: EXKasVjCPNa7aYAR72SfJw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z62-20020a1c65410000b0290179bd585ef9so946372wmb.7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 05:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8BPRFSs4ZDIzsU3WeQFolZqPnT6BylD3v05yUAKiC4I=;
 b=sb3jQvE9JMlSdrgO1NmnekRNxl/hFCB4RnW37E4CLvohhOkPg+JH+vBbsHbMcxHQ/d
 R2xe12LzgoqgKWVaA5/7g5izgIJX8lerbsNH/7mGgcMD01AtUZ31dyZbVsT+YpLNJaut
 DVjMSMkOtkSuombfw8qhjywu9OE3zh56GQqVLiuLNQ1+cAp2PlnxL1+0Jm61Q7eEhAZv
 6Si5nyvQEj4OoHV4DNFiBhRALoIa7IwdoHl6krvcCYABLXSH7q+atxF0RCiwefeA6FQ+
 5oadgCooXInoWSlT3vOJHAZ1zeWJIQJM4wm/SA8K/PLMYH9yl7MwoM5yh6E3npUWUzMe
 FLSA==
X-Gm-Message-State: AOAM533cbSg47MZgn74FVUlilIivVTefmGyYdPdRC3qpBr2Q6EDYHdnR
 NW4ml520P5K7rUK+1UU70u2DwjKhRbJpan50iGZs03hGG4xnPdLDeRWF9j1mg4FplCBmQvWC6hO
 UMNPk8WtqNmRXt9Yy+ujVWSxFvkZdohEljFsZJuuDqg==
X-Received: by 2002:a5d:5983:: with SMTP id n3mr12218319wri.241.1624019896285; 
 Fri, 18 Jun 2021 05:38:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6buMSygSMET2HRRFto0utYr5pHmbiCUKzswQXXbWqPi3keYL8lMRIvXzbPyrGGaftLze7cQ==
X-Received: by 2002:a5d:5983:: with SMTP id n3mr12218290wri.241.1624019896020; 
 Fri, 18 Jun 2021 05:38:16 -0700 (PDT)
Received: from redhat.com ([77.126.22.11])
 by smtp.gmail.com with ESMTPSA id b71sm2236262wmb.2.2021.06.18.05.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 05:38:14 -0700 (PDT)
Date: Fri, 18 Jun 2021 08:38:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Keiichi Watanabe <keiichiw@chromium.org>
Subject: Re: [PATCH] virtio_net: Enable MSI-X vector for ctrl queue
Message-ID: <20210618083650-mutt-send-email-mst@kernel.org>
References: <20210618072625.957837-1-keiichiw@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210618072625.957837-1-keiichiw@chromium.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: chirantan@chromium.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 "David S . Miller" <davem@davemloft.net>
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

On Fri, Jun 18, 2021 at 04:26:25PM +0900, Keiichi Watanabe wrote:
> When we use vhost-user backend on the host, MSI-X vector should be set
> so that the vmm can get an irq FD and send it to the backend device
> process with vhost-user protocol.
> Since whether the vector is set for a queue is determined depending on
> the queue has a callback, this commit sets an empty callback for
> virtio-net's control queue.
> 
> Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>

I'm confused by this explanation. If the vmm wants to get
an interrupt it can do so - why change the guest driver?

> ---
>  drivers/net/virtio_net.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 11f722460513..002e3695d4b3 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2696,6 +2696,11 @@ static void virtnet_del_vqs(struct virtnet_info *vi)
>  	virtnet_free_queues(vi);
>  }
>  
> +static void virtnet_ctrlq_done(struct virtqueue *rvq)
> +{
> +	/* Do nothing */
> +}
> +
>  /* How large should a single buffer be so a queue full of these can fit at
>   * least one full packet?
>   * Logic below assumes the mergeable buffer header is used.
> @@ -2748,7 +2753,7 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
>  
>  	/* Parameters for control virtqueue, if any */
>  	if (vi->has_cvq) {
> -		callbacks[total_vqs - 1] = NULL;
> +		callbacks[total_vqs - 1] = virtnet_ctrlq_done;
>  		names[total_vqs - 1] = "control";
>  	}
>  
> -- 
> 2.32.0.288.g62a8d224e6-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
