Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F03AAF17BB
	for <lists.virtualization@lfdr.de>; Wed,  6 Nov 2019 14:56:45 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A4DF5CDE;
	Wed,  6 Nov 2019 13:56:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A8935CD1
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 13:56:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3E8F0196
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 13:56:39 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F9597C089
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 13:56:38 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id b26so22491988qtr.23
	for <virtualization@lists.linux-foundation.org>;
	Wed, 06 Nov 2019 05:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=SCXJzDQ3S1J55XHzsdL+WUuToZbSMLgz9CT94p+WM4w=;
	b=IlNgb05s+eO9oYFpD0NI67FrwaeighenakeFpaZC7hsj1R8TjgVk0SJBkcuenb44pt
	utlwVudxh/EjdVTJvkbEm8qitYeoEa+L+XzY9BDtcKKrvwmbzVYiJsPMo0SvMltSECzh
	uVQFHl1GOLnY12CjfOytU7sLvY1Z23uENQbHj88mHNWVrvOC6JV/E+xqTAlSQXGHgijd
	y1AT21LJ3dDgS1t+jsmudlkCxp+CZIqcw+ejnO47ZqoqRAoz+j1VkHpBKoMStAfZ2Oi9
	Jx94NWFKslvp27WZ5U9XH6w4rjVe4m5U/p7Gyc2vqIx2bVKPRkTvYgoPa3H4UBsioDu5
	f9/w==
X-Gm-Message-State: APjAAAUcUrKnMvu4KT6IvxZ9oT9HIVaeK0ZWpl00yB8zc+MWWqBaFK0i
	MAmvpTqAJZ/SxilSyn2Ve99D1403cwACXQQmhs1BtbqJM0x4hu/DDzUqIx+uSkyiMBdBkFR706T
	DhYUldEvii4/Ar1y3EAlRKlE2tFVeijg1DWT8GnK6WQ==
X-Received: by 2002:a0c:804c:: with SMTP id 70mr2339447qva.81.1573048597868;
	Wed, 06 Nov 2019 05:56:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwmsdeYDDJG6NETb2Q5jlxvfBzx4zCSOo1XZ7jQ39L1/ECKWtQ9HTRT3m5f069tRgGpgyf7xA==
X-Received: by 2002:a0c:804c:: with SMTP id 70mr2339424qva.81.1573048597552;
	Wed, 06 Nov 2019 05:56:37 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
	by smtp.gmail.com with ESMTPSA id
	h44sm11726023qtc.1.2019.11.06.05.56.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 05:56:36 -0800 (PST)
Date: Wed, 6 Nov 2019 08:56:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] virtio_console: allocate inbufs in add_port() only if it
	is needed
Message-ID: <20191106085548-mutt-send-email-mst@kernel.org>
References: <20191018164718.15999-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018164718.15999-1-lvivier@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Amit Shah <amit@kernel.org>
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

On Fri, Oct 18, 2019 at 06:47:18PM +0200, Laurent Vivier wrote:
> When we hot unplug a virtserialport and then try to hot plug again,
> it fails:
> 
> (qemu) chardev-add socket,id=serial0,path=/tmp/serial0,server,nowait
> (qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
>                   chardev=serial0,id=serial0,name=serial0
> (qemu) device_del serial0
> (qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
>                   chardev=serial0,id=serial0,name=serial0
> kernel error:
>   virtio-ports vport2p2: Error allocating inbufs
> qemu error:
>   virtio-serial-bus: Guest failure in adding port 2 for device \
>                      virtio-serial0.0
> 
> This happens because buffers for the in_vq are allocated when the port is
> added but are not released when the port is unplugged.
> 
> They are only released when virtconsole is removed (see a7a69ec0d8e4)
> 
> To avoid the problem and to be symmetric, we could allocate all the buffers
> in init_vqs() as they are released in remove_vqs(), but it sounds like
> a waste of memory.
> 
> Rather than that, this patch changes add_port() logic to only allocate the
> buffers if the in_vq has available free slots.
> 
> Fixes: a7a69ec0d8e4 ("virtio_console: free buffers after reset")
> Cc: mst@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  drivers/char/virtio_console.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> index 7270e7b69262..77105166fe01 100644
> --- a/drivers/char/virtio_console.c
> +++ b/drivers/char/virtio_console.c
> @@ -1421,12 +1421,17 @@ static int add_port(struct ports_device *portdev, u32 id)
>  	spin_lock_init(&port->outvq_lock);
>  	init_waitqueue_head(&port->waitqueue);
>  
> -	/* Fill the in_vq with buffers so the host can send us data. */
> -	nr_added_bufs = fill_queue(port->in_vq, &port->inbuf_lock);
> -	if (!nr_added_bufs) {
> -		dev_err(port->dev, "Error allocating inbufs\n");
> -		err = -ENOMEM;
> -		goto free_device;
> +	/* if the in_vq has not already been filled (the port has already been
> +	 * used and unplugged), fill the in_vq with buffers so the host can
> +	 * send us data.
> +	 */
> +	if (port->in_vq->num_free != 0) {
> +		nr_added_bufs = fill_queue(port->in_vq, &port->inbuf_lock);
> +		if (!nr_added_bufs) {
> +			dev_err(port->dev, "Error allocating inbufs\n");
> +			err = -ENOMEM;
> +			goto free_device;
> +		}
>  	}
>  
>  	if (is_rproc_serial(port->portdev->vdev))

Well fill_queue will just add slots as long as it can.
So on a full queue it does nothing. How does this patch help?

> -- 
> 2.21.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
