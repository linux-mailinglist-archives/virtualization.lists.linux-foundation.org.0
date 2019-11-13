Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A4929FB39A
	for <lists.virtualization@lfdr.de>; Wed, 13 Nov 2019 16:22:55 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 34A1DE7F;
	Wed, 13 Nov 2019 15:22:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0C95640B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 15:22:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 605BD8A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573658567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=+KjRbhhvO4WTOEFUUtwtXRdJpE9UQrQjjvF4ERtS2uw=;
	b=QtpTHZU4gGAaEP+LLvlagWmzfBngIImUBw5+YjcoWKy0D8iY0IOmRvt0cGElepqBDVaak/
	5Kgv5I55TF/oDtR15lWYy/FzIfioUEkCXX/vqgJmgfubYUPMwi+Hol38o8NS8booA4F8Zr
	L2BsdG3Hihnhia6QNl+FJ7ckJHtW1ZA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-74-wlNUtF9MO5C3L1Uz_fkQYA-1; Wed, 13 Nov 2019 10:22:44 -0500
Received: by mail-qt1-f198.google.com with SMTP id h15so1578585qtn.6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 07:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=TNn6X1eMJfWx1OiYq82nWJkqpXSkmJOrNr++Bx8M3rs=;
	b=aURLBN5xQpHA9UWCmx2gSNR8eThR7cOwHdEWlbrRb/+odVuN/6LVgQ6v/QJdTti0C2
	35JooJCMc72+gFSfb6vzv9cOall9MuMMs42gtzPwWw90Ubr7WJ2STYS9Mc5TBgw3IBKQ
	W9W+VXEvaS7d1M4o6PfZaeIwNvJ1dOlmD08hi9DICP0DtM/jCBbVE1MqsHZOezbY3S9W
	IuZHPi3iZMok6ZNR/9Tok8e4SPol/zQDidueJkWXc3vYMcAAB1b8xnMfmk/7PQvWdcAN
	a/DXxRAshGsjiLFC6v1OZFRhty36t/OFVjG814OJBx86KpBbrppwhhZV5iZ5uMduAjm2
	shDg==
X-Gm-Message-State: APjAAAWzhjGC3mV6YPErjVT9rgtK1BC9rv/3brxcc3yO+w2IrU7+9KGc
	r9mHqDga9Ky9/9JqdAPmFRPT3f3HlCo64eX3OBbNido4HMIjkkkdbG0QlAd+d7AfSPMEVANapIn
	o6GMjRTlcuOlKC903pjhGsxrmxIsuwGuA4Oqs+7SKOA==
X-Received: by 2002:ac8:30cd:: with SMTP id w13mr3108609qta.201.1573658563601; 
	Wed, 13 Nov 2019 07:22:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqyJYlUkuzt9TKxbm/vUL5Cx0VmcBgc+mJVbsJqr9tWWJslBsLr3PHUo5IeNhBnqNA5u6IsuWA==
X-Received: by 2002:ac8:30cd:: with SMTP id w13mr3108569qta.201.1573658563335; 
	Wed, 13 Nov 2019 07:22:43 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
	by smtp.gmail.com with ESMTPSA id j7sm1100327qkd.46.2019.11.13.07.22.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 07:22:42 -0800 (PST)
Date: Wed, 13 Nov 2019 10:22:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2] virtio_console: allocate inbufs in add_port() only if
	it is needed
Message-ID: <20191113102126-mutt-send-email-mst@kernel.org>
References: <20191113150056.9990-1-lvivier@redhat.com>
	<20191113101929-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191113101929-mutt-send-email-mst@kernel.org>
X-MC-Unique: wlNUtF9MO5C3L1Uz_fkQYA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Arnd Bergmann <arnd@arndb.de>, Amit Shah <amit@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
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

On Wed, Nov 13, 2019 at 10:21:11AM -0500, Michael S. Tsirkin wrote:
> On Wed, Nov 13, 2019 at 04:00:56PM +0100, Laurent Vivier wrote:
> > When we hot unplug a virtserialport and then try to hot plug again,
> > it fails:
> > 
> > (qemu) chardev-add socket,id=serial0,path=/tmp/serial0,server,nowait
> > (qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
> >                   chardev=serial0,id=serial0,name=serial0
> > (qemu) device_del serial0
> > (qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
> >                   chardev=serial0,id=serial0,name=serial0
> > kernel error:
> >   virtio-ports vport2p2: Error allocating inbufs
> > qemu error:
> >   virtio-serial-bus: Guest failure in adding port 2 for device \
> >                      virtio-serial0.0
> > 
> > This happens because buffers for the in_vq are allocated when the port is
> > added but are not released when the port is unplugged.
> > 
> > They are only released when virtconsole is removed (see a7a69ec0d8e4)
> > 
> > To avoid the problem and to be symmetric, we could allocate all the buffers
> > in init_vqs() as they are released in remove_vqs(), but it sounds like
> > a waste of memory.
> > 
> > Rather than that, this patch changes add_port() logic to ignore ENOSPC
> > error in fill_queue(), which means queue has already been filled.
> > 
> > Fixes: a7a69ec0d8e4 ("virtio_console: free buffers after reset")
> > Cc: mst@redhat.com
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > ---
> > 
> > Notes:
> >     v2: making fill_queue return int and testing return code for -ENOSPC
> > 
> >  drivers/char/virtio_console.c | 24 +++++++++---------------
> >  1 file changed, 9 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> > index 7270e7b69262..9e6534fd1aa4 100644
> > --- a/drivers/char/virtio_console.c
> > +++ b/drivers/char/virtio_console.c
> > @@ -1325,24 +1325,24 @@ static void set_console_size(struct port *port, u16 rows, u16 cols)
> >  	port->cons.ws.ws_col = cols;
> >  }
> >  
> > -static unsigned int fill_queue(struct virtqueue *vq, spinlock_t *lock)
> > +static int fill_queue(struct virtqueue *vq, spinlock_t *lock)
> >  {
> >  	struct port_buffer *buf;
> > -	unsigned int nr_added_bufs;
> > +	int nr_added_bufs;
> >  	int ret;
> >  
> >  	nr_added_bufs = 0;
> >  	do {
> >  		buf = alloc_buf(vq->vdev, PAGE_SIZE, 0);
> >  		if (!buf)
> > -			break;
> > +			return -ENOMEM;
> >  
> >  		spin_lock_irq(lock);
> >  		ret = add_inbuf(vq, buf);
> >  		if (ret < 0) {
> >  			spin_unlock_irq(lock);
> >  			free_buf(buf, true);
> > -			break;
> > +			return ret;
> >  		}
> >  		nr_added_bufs++;
> >  		spin_unlock_irq(lock);

So actually, how about handling ENOSPC specially here, and
returning success? After all queue is full as requested ...


> > @@ -1362,7 +1362,6 @@ static int add_port(struct ports_device *portdev, u32 id)
> >  	char debugfs_name[16];
> >  	struct port *port;
> >  	dev_t devt;
> > -	unsigned int nr_added_bufs;
> >  	int err;
> >  
> >  	port = kmalloc(sizeof(*port), GFP_KERNEL);
> > @@ -1421,11 +1420,9 @@ static int add_port(struct ports_device *portdev, u32 id)
> >  	spin_lock_init(&port->outvq_lock);
> >  	init_waitqueue_head(&port->waitqueue);
> >  
> > -	/* Fill the in_vq with buffers so the host can send us data. */
> > -	nr_added_bufs = fill_queue(port->in_vq, &port->inbuf_lock);
> > -	if (!nr_added_bufs) {
> > +	err = fill_queue(port->in_vq, &port->inbuf_lock);
> > +	if (err < 0 && err != -ENOSPC) {
> >  		dev_err(port->dev, "Error allocating inbufs\n");
> > -		err = -ENOMEM;
> >  		goto free_device;
> >  	}
> >  
> 
> Pls add a comment explaining that -ENOSPC happens when
> queue already has buffers (e.g. from previous detach).
> 
> 
> > @@ -2059,14 +2056,11 @@ static int virtcons_probe(struct virtio_device *vdev)
> >  	INIT_WORK(&portdev->control_work, &control_work_handler);
> >  
> >  	if (multiport) {
> > -		unsigned int nr_added_bufs;
> > -
> >  		spin_lock_init(&portdev->c_ivq_lock);
> >  		spin_lock_init(&portdev->c_ovq_lock);
> >  
> > -		nr_added_bufs = fill_queue(portdev->c_ivq,
> > -					   &portdev->c_ivq_lock);
> > -		if (!nr_added_bufs) {
> > +		err = fill_queue(portdev->c_ivq, &portdev->c_ivq_lock);
> > +		if (err < 0) {
> >  			dev_err(&vdev->dev,
> >  				"Error allocating buffers for control queue\n");
> >  			/*
> > @@ -2077,7 +2071,7 @@ static int virtcons_probe(struct virtio_device *vdev)
> >  					   VIRTIO_CONSOLE_DEVICE_READY, 0);
> >  			/* Device was functional: we need full cleanup. */
> >  			virtcons_remove(vdev);
> > -			return -ENOMEM;
> > +			return err;
> >  		}
> >  	} else {
> >  		/*
> > -- 
> > 2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
