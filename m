Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A54899A6
	for <lists.virtualization@lfdr.de>; Mon, 12 Aug 2019 11:18:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1D600C6E;
	Mon, 12 Aug 2019 09:18:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5D77FB65
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 09:18:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C20AF2C6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 09:18:49 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id q4so4956525qtp.1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 02:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=eQ6iC6FPotbDLw/yqSrmxneRMN32NSA1RVINhFfjlLs=;
	b=nb3qgtZYtolw7PE9UGQzIHzdumMJBNXqXXjOrAes/ShvQtRJIRExnRVefB28T8SM60
	fFjmrAMAGQgPAcOr9xrxner4xISJpuFMXJALdVZrNEw7vZvy/LcC8QeIEkpcVcyK7C8O
	xzxyqjxaE/83eBGsQos6eewCO1avtUAIH0XVX+mh1I7atfK2CY/jZhClGysrqbZ7kngw
	XcH5nLT8ru8bgB/moo6Z9P7XZmxSqycYWWdN+8xLM2K0yLVqqK2XzFGPGxy/12Q+s8qN
	j1kWQx3zmQK1G1hKZRgcE/YgL7lVroU/jci2zaSzPfdmi0saIzZVJXxjRwgg3Cjj65B+
	693g==
X-Gm-Message-State: APjAAAVh9u2RviWscR9ximlHkIhx93c7MSNaEIvEOlQjfismtxzbIFUr
	FX5iidoQ3QoPIpikYe7oFz8Zkw==
X-Google-Smtp-Source: APXvYqzgOdql+JK/PJhPFMelOxcGaMkTyi0NmRPnztTdE++1Jkqyr19sSEGOPDgOeu1nQnMgqKnsSQ==
X-Received: by 2002:a0c:b036:: with SMTP id k51mr30009599qvc.103.1565601528843;
	Mon, 12 Aug 2019 02:18:48 -0700 (PDT)
Received: from redhat.com ([147.234.38.29]) by smtp.gmail.com with ESMTPSA id
	h26sm60625829qta.58.2019.08.12.02.18.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 12 Aug 2019 02:18:47 -0700 (PDT)
Date: Mon, 12 Aug 2019 05:18:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pankaj Gupta <pagupta@redhat.com>
Subject: Re: [PATCH v3 1/2] virtio_console: free unused buffers with port
	delete
Message-ID: <20190812051642-mutt-send-email-mst@kernel.org>
References: <20190809064847.28918-1-pagupta@redhat.com>
	<20190809064847.28918-2-pagupta@redhat.com>
	<20190810141019-mutt-send-email-mst@kernel.org>
	<361928616.7829318.1565588208467.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <361928616.7829318.1565588208467.JavaMail.zimbra@redhat.com>
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

On Mon, Aug 12, 2019 at 01:36:48AM -0400, Pankaj Gupta wrote:
> 
> > 
> > On Fri, Aug 09, 2019 at 12:18:46PM +0530, Pankaj Gupta wrote:
> > > The commit a7a69ec0d8e4 ("virtio_console: free buffers after reset")
> > > deferred detaching of unused buffer to virtio device unplug time.
> > > This causes unplug/replug of single port in virtio device with an
> > > error "Error allocating inbufs\n". As we don't free the unused buffers
> > > attached with the port. Re-plug the same port tries to allocate new
> > > buffers in virtqueue and results in this error if queue is full.
> > 
> > So why not reuse the buffers that are already there in this case?
> > Seems quite possible.
> 
> I took this approach because reusing the buffers will involve tweaking
> the existing core functionality like managing the the virt queue indexes.

I don't see why frankly, if you keep a list of outstanding
buffers on plug you can assume they have been added.

> Compared to that deleting the buffers while hot-unplugging port is simple
> and was working fine before. It seems logically correct as well.   
> 
> I agree we need a spec change for this.
> 
> > 
> > > This patch removes the unused buffers in vq's when we unplug the port.
> > > This is the best we can do as we cannot call device_reset because virtio
> > > device is still active.
> > > 
> > > Reported-by: Xiaohui Li <xiaohli@redhat.com>
> > > Fixes: a7a69ec0d8e4 ("virtio_console: free buffers after reset")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> > 
> > This is really a revert of a7a69ec0d8e4, just tagged confusingly.
> > 
> > And the original is also supposed to be a bugfix.
> > So how will the original bug be fixed?
> 
> Yes, Even I was confused while adding this tag.
> I will remove remove 'fixes' tag completely for this patch?
> because its a revert to original behavior which also is a bugfix.
> 
> > 
> > "this is the best we can do" is rarely the case.
> > 
> > I am not necessarily against the revert. But if we go that way then what
> > we need to do is specify the behaviour in the spec, since strict spec
> > compliance is exactly what the original patch was addressing.
> 
> Agree.
> 
> > 
> > In particular, we'd document that console has a special property that
> > when port is detached virtqueue is considered stopped, device must not
> > use any buffers, and it is legal to take buffers out of the device.
> 
> Yes. This documents the exact scenario. Thanks.
> You want me to send a patch for the spec change?
> 
> Best regards,
> Pankaj

Go ahead.

> > 
> > 
> > 
> > > ---
> > >  drivers/char/virtio_console.c | 14 +++++++++++---
> > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> > > index 7270e7b69262..e8be82f1bae9 100644
> > > --- a/drivers/char/virtio_console.c
> > > +++ b/drivers/char/virtio_console.c
> > > @@ -1494,15 +1494,25 @@ static void remove_port(struct kref *kref)
> > >          kfree(port);
> > >  }
> > >  
> > > +static void remove_unused_bufs(struct virtqueue *vq)
> > > +{
> > > +        struct port_buffer *buf;
> > > +
> > > +        while ((buf = virtqueue_detach_unused_buf(vq)))
> > > +                free_buf(buf, true);
> > > +}
> > > +
> > >  static void remove_port_data(struct port *port)
> > >  {
> > >          spin_lock_irq(&port->inbuf_lock);
> > >          /* Remove unused data this port might have received. */
> > >          discard_port_data(port);
> > > +        remove_unused_bufs(port->in_vq);
> > >          spin_unlock_irq(&port->inbuf_lock);
> > >  
> > >          spin_lock_irq(&port->outvq_lock);
> > >          reclaim_consumed_buffers(port);
> > > +        remove_unused_bufs(port->out_vq);
> > >          spin_unlock_irq(&port->outvq_lock);
> > >  }
> > >  
> > > @@ -1938,11 +1948,9 @@ static void remove_vqs(struct ports_device *portdev)
> > >          struct virtqueue *vq;
> > >  
> > >          virtio_device_for_each_vq(portdev->vdev, vq) {
> > > -                struct port_buffer *buf;
> > >  
> > >                  flush_bufs(vq, true);
> > > -                while ((buf = virtqueue_detach_unused_buf(vq)))
> > > -                        free_buf(buf, true);
> > > +                remove_unused_bufs(vq);
> > >          }
> > >          portdev->vdev->config->del_vqs(portdev->vdev);
> > >          kfree(portdev->in_vqs);
> > > --
> > > 2.21.0
> > 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
