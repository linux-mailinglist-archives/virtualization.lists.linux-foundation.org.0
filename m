Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E74CB88CBD
	for <lists.virtualization@lfdr.de>; Sat, 10 Aug 2019 20:19:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D5563B8E;
	Sat, 10 Aug 2019 18:18:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 829D0B50
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 18:18:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 005FD7D2
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 18:18:54 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id m2so344256qki.12
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 11:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=zrZ1MFWBUD8XpJlN1HdMmxALzKrZiqQ/CZQqHhvjihk=;
	b=PN3Qyok7PX/0dYq/0f1AG+LtVbsPXT3Cw3OULvDYwo8r8ctaC7EeqIloalZqTm8zJz
	L7jEa1oGZod+F0/zf0GeLbVkVrtTRnljmZoDhhPJF9msPUpZ3/GpBzzvix9bjekRk18W
	ev6iH0bW8Q6H9RJffXda5xV8YZ8DEEDzIIbu6mVVmXAqP3eVKsLq2cfyR4dPAtBPK48F
	2p9alUTtJNX0JbtJ4TZ7jUb9ghbkx4gBhO94P3wDLvHTpolS9D3XdU5eh/NloqGhEePC
	YDJJc8UNEPfpK822UnM+BgTwMvJtLgwerzVgYzwc7QRoHE6EYshhHSyyTgsfPe/sN6mK
	gwDQ==
X-Gm-Message-State: APjAAAWIDOI6s2M+OiZ5X3pdiwnyAPlefRXgUTDbm4I+yyjhEtsvTmkl
	VxfGh/5KQYEwJxwP/U8GzeTKTw==
X-Google-Smtp-Source: APXvYqxQg0u/NQTm7d1bARb/j41E1mdpTfaO2VyPaTxGh/hPAt/cL+vAJQTT2RzTO83w5xAmYimPfA==
X-Received: by 2002:a37:5f82:: with SMTP id
	t124mr22052496qkb.180.1565461134184; 
	Sat, 10 Aug 2019 11:18:54 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	b18sm40602281qkc.112.2019.08.10.11.18.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 10 Aug 2019 11:18:53 -0700 (PDT)
Date: Sat, 10 Aug 2019 14:18:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pankaj Gupta <pagupta@redhat.com>
Subject: Re: [PATCH v3 1/2] virtio_console: free unused buffers with port
	delete
Message-ID: <20190810141019-mutt-send-email-mst@kernel.org>
References: <20190809064847.28918-1-pagupta@redhat.com>
	<20190809064847.28918-2-pagupta@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809064847.28918-2-pagupta@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: arnd@arndb.de, amit@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, xiaohli@redhat.com
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

On Fri, Aug 09, 2019 at 12:18:46PM +0530, Pankaj Gupta wrote:
> The commit a7a69ec0d8e4 ("virtio_console: free buffers after reset")
> deferred detaching of unused buffer to virtio device unplug time.
> This causes unplug/replug of single port in virtio device with an
> error "Error allocating inbufs\n". As we don't free the unused buffers
> attached with the port. Re-plug the same port tries to allocate new
> buffers in virtqueue and results in this error if queue is full.

So why not reuse the buffers that are already there in this case?
Seems quite possible.

> This patch removes the unused buffers in vq's when we unplug the port.
> This is the best we can do as we cannot call device_reset because virtio
> device is still active.
> 
> Reported-by: Xiaohui Li <xiaohli@redhat.com>
> Fixes: a7a69ec0d8e4 ("virtio_console: free buffers after reset")
> Cc: stable@vger.kernel.org
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>

This is really a revert of a7a69ec0d8e4, just tagged confusingly.

And the original is also supposed to be a bugfix.
So how will the original bug be fixed?

"this is the best we can do" is rarely the case.

I am not necessarily against the revert. But if we go that way then what
we need to do is specify the behaviour in the spec, since strict spec
compliance is exactly what the original patch was addressing.

In particular, we'd document that console has a special property that
when port is detached virtqueue is considered stopped, device must not
use any buffers, and it is legal to take buffers out of the device.



> ---
>  drivers/char/virtio_console.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> index 7270e7b69262..e8be82f1bae9 100644
> --- a/drivers/char/virtio_console.c
> +++ b/drivers/char/virtio_console.c
> @@ -1494,15 +1494,25 @@ static void remove_port(struct kref *kref)
>  	kfree(port);
>  }
>  
> +static void remove_unused_bufs(struct virtqueue *vq)
> +{
> +	struct port_buffer *buf;
> +
> +	while ((buf = virtqueue_detach_unused_buf(vq)))
> +		free_buf(buf, true);
> +}
> +
>  static void remove_port_data(struct port *port)
>  {
>  	spin_lock_irq(&port->inbuf_lock);
>  	/* Remove unused data this port might have received. */
>  	discard_port_data(port);
> +	remove_unused_bufs(port->in_vq);
>  	spin_unlock_irq(&port->inbuf_lock);
>  
>  	spin_lock_irq(&port->outvq_lock);
>  	reclaim_consumed_buffers(port);
> +	remove_unused_bufs(port->out_vq);
>  	spin_unlock_irq(&port->outvq_lock);
>  }
>  
> @@ -1938,11 +1948,9 @@ static void remove_vqs(struct ports_device *portdev)
>  	struct virtqueue *vq;
>  
>  	virtio_device_for_each_vq(portdev->vdev, vq) {
> -		struct port_buffer *buf;
>  
>  		flush_bufs(vq, true);
> -		while ((buf = virtqueue_detach_unused_buf(vq)))
> -			free_buf(buf, true);
> +		remove_unused_bufs(vq);
>  	}
>  	portdev->vdev->config->del_vqs(portdev->vdev);
>  	kfree(portdev->in_vqs);
> -- 
> 2.21.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
