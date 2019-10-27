Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 23841E61F3
	for <lists.virtualization@lfdr.de>; Sun, 27 Oct 2019 11:04:25 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 43288907;
	Sun, 27 Oct 2019 10:04:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E02E349F
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 10:04:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8CFD163D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 10:04:17 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E42724E832
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 10:04:16 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id v143so7291162qka.21
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 03:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=DIl+XjLva0/Mm7Hs+GCeYJOa+yDwPi8Nqp5nHz6nVLQ=;
	b=HJAID8SczYgZ10Itq6Ddenjj5e9bg298j0TLCmfGSKml9vfCd3VkbkvM33WpRi62C8
	ZcPoreZXAUIRo/nrB1OGlbVJrBk/iHazqExLigOmdl9QGNkOWjUCU97/7YZbZW1odSic
	x6UX7GnkFS8LcRV8NQyRMkFFKN8tdYjoOc42gpTKgIJmy/9Zy1yc9mHkNbQJiYZI92Tm
	udMWn0MNaQDpGYIWrzvkiHcMHQEqiPOEu6TAnObmK4hMGVwJUhsBEuxO00SYV6hGK4w2
	apj8oXy2PwCJwQ3bV2SWoYgwQA/EzLIq0WHCH7BJbqLkPGFjvUIwE/xp85JLvGR6eDZ8
	z7Zw==
X-Gm-Message-State: APjAAAVDu2EcRcPCoUbMU9kenFDHwtYtTkP97VImXjxT/f62Zzf7H5Gv
	pESoeHIdSm7UOFw/GiFKrbmj5lQiOUp+1k4FOyj/WHnRGiZfqp0W8+kb32qz7U4t6v7D5pIYuja
	xyXhh/LMMRFRZSIMiIysq41NRuxGMIDVUVXYVUFra2Q==
X-Received: by 2002:ac8:18eb:: with SMTP id o40mr12230185qtk.304.1572170656209;
	Sun, 27 Oct 2019 03:04:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGQTCutbRGwG/hqehf3CeyndAKewdMdeoJOADviHDVuig69eSpbDhlBsX3tnjDPNRXLTAZiA==
X-Received: by 2002:ac8:18eb:: with SMTP id o40mr12230171qtk.304.1572170655989;
	Sun, 27 Oct 2019 03:04:15 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	b185sm5051949qkg.45.2019.10.27.03.04.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 03:04:14 -0700 (PDT)
Date: Sun, 27 Oct 2019 06:04:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net-next] vringh: fix copy direction of
	vringh_iov_push_kern()
Message-ID: <20191027060328-mutt-send-email-mst@kernel.org>
References: <20191024035718.7690-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024035718.7690-1-jasowang@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Thu, Oct 24, 2019 at 11:57:18AM +0800, Jason Wang wrote:
> We want to copy from iov to buf, so the direction was wrong.
> 
> Note: no real user for the helper, but it will be used by future
> features.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

I'm still inclined to merge it now, incorrect code tends to
proliferate.

> ---
>  drivers/vhost/vringh.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
> index 08ad0d1f0476..a0a2d74967ef 100644
> --- a/drivers/vhost/vringh.c
> +++ b/drivers/vhost/vringh.c
> @@ -852,6 +852,12 @@ static inline int xfer_kern(void *src, void *dst, size_t len)
>  	return 0;
>  }
>  
> +static inline int kern_xfer(void *dst, void *src, size_t len)
> +{
> +	memcpy(dst, src, len);
> +	return 0;
> +}
> +
>  /**
>   * vringh_init_kern - initialize a vringh for a kernelspace vring.
>   * @vrh: the vringh to initialize.
> @@ -958,7 +964,7 @@ EXPORT_SYMBOL(vringh_iov_pull_kern);
>  ssize_t vringh_iov_push_kern(struct vringh_kiov *wiov,
>  			     const void *src, size_t len)
>  {
> -	return vringh_iov_xfer(wiov, (void *)src, len, xfer_kern);
> +	return vringh_iov_xfer(wiov, (void *)src, len, kern_xfer);
>  }
>  EXPORT_SYMBOL(vringh_iov_push_kern);
>  
> -- 
> 2.19.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
