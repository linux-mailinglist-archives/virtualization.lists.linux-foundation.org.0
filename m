Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 98167110171
	for <lists.virtualization@lfdr.de>; Tue,  3 Dec 2019 16:43:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 35E2784AE2;
	Tue,  3 Dec 2019 15:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WExetgUME0HS; Tue,  3 Dec 2019 15:43:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 87C7284E15;
	Tue,  3 Dec 2019 15:43:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71B0FC087F;
	Tue,  3 Dec 2019 15:43:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1713C087F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 15:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ED93784B91
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 15:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5bKpZTVRvo3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 15:43:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E38F284AE2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575387780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwIie4f/cRbrQG5a7iYXir2IBzgVvgbaZEb5jJx1d6Y=;
 b=JqOTal9DhtpzeP94VdzmsNLDCrgshRt22fcIPgF4s/QERcp7a8oXwAmlPCy1vLEwkqu3OV
 WaIT/lqQYY7+UoA46iECD+9AI5qxLJWdWq1Yr1SQwZOUcag9IRLCqPoMNIWEWCbjzvHAed
 Nx1jxy3ZUX1zzHQKAYUohsHN1LdeQzY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-iFUMAO2KNMuekNqgSLrRpw-1; Tue, 03 Dec 2019 10:42:59 -0500
Received: by mail-qk1-f200.google.com with SMTP id a1so2446667qkn.15
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Dec 2019 07:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U0dQFMzS2rXCEeOJP1XOszx/oJ4UEFVvA3Pxp6Rvtd0=;
 b=t+ujPN+XMWiguGpss95ewQPwxTUhtp0b/aKfjP9FMSAZ0SPgsKyC2ebf6jPTkwgRzC
 G3UJNgZYhHv/P6rjX45o4DiO02Wtf0ZxnXSP+pbp2F0LL3+VxhIn96bJJtg2Fab4Vgj+
 OSPAOwB4qHAs8RhpPIYrFlkqihz7JE7o2fcT4IIqau9er9euKhkzJVvwUdc2SkvhlxmG
 8xkY3gZk05aWJnIcB+NHd6bB/vBk7GeLLdg1ZnojWfbYuQqWn0BCob6lReFwTbOLRWqK
 ZpzrTqvr3I9LKarBuIwOCVTY0KolNqoxMiogHfFMh5pWGQq8JrNd8QHIs7x0vJ/BsJtr
 zJPg==
X-Gm-Message-State: APjAAAW1iZav4JqrMefHgqshcaIdffVEHk562PifQdGf2DEfEvxWSR+y
 txAtfyjvwxQ6hQiaT7UUItw2ibRYuomaA+C3JIU2Hls/wZhr35X/tO9X9dUoAzNOP1MCzd4QATf
 zdbZORIgJqDySBPhB4X2+naG98aQWU4mCtm09nLUMyQ==
X-Received: by 2002:ac8:4645:: with SMTP id f5mr5640956qto.38.1575387779010;
 Tue, 03 Dec 2019 07:42:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxp9lC/Jp/2dE/7mPrFm8Zdh/X3yaI1ji1wcvv4uxOgmr6DGkywI8tk4Ps6zBeos0vlMFEIrQ==
X-Received: by 2002:ac8:4645:: with SMTP id f5mr5640925qto.38.1575387778733;
 Tue, 03 Dec 2019 07:42:58 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id m29sm2013564qtf.1.2019.12.03.07.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 07:42:57 -0800 (PST)
Date: Tue, 3 Dec 2019 10:42:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Amit Shah <amit@infradead.org>
Subject: Re: [PATCH v3] virtio_console: allocate inbufs in add_port() only if
 it is needed
Message-ID: <20191203103840-mutt-send-email-mst@kernel.org>
References: <20191114122548.24364-1-lvivier@redhat.com>
 <ae3451423c18f2e408245d745d1f28e311a2845c.camel@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ae3451423c18f2e408245d745d1f28e311a2845c.camel@infradead.org>
X-MC-Unique: iFUMAO2KNMuekNqgSLrRpw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Laurent Vivier <lvivier@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Amit Shah <amit@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
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

On Tue, Dec 03, 2019 at 03:46:50PM +0100, Amit Shah wrote:
> On Thu, 2019-11-14 at 13:25 +0100, Laurent Vivier wrote:
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
> > This happens because buffers for the in_vq are allocated when the
> > port is
> > added but are not released when the port is unplugged.
> > 
> > They are only released when virtconsole is removed (see a7a69ec0d8e4)
> > 
> > To avoid the problem and to be symmetric, we could allocate all the
> > buffers
> > in init_vqs() as they are released in remove_vqs(), but it sounds
> > like
> > a waste of memory.
> > 
> > Rather than that, this patch changes add_port() logic to ignore
> > ENOSPC
> > error in fill_queue(), which means queue has already been filled.
> > 
> > Fixes: a7a69ec0d8e4 ("virtio_console: free buffers after reset")
> > Cc: mst@redhat.com
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> Reviewed-by: Amit Shah <amit@kernel.org>
> 
> Thanks!


Thanks, however this has already been merged by Linus.
I can't add the tag retroactively, sorry about that.

For bugfix patches like that, I think we can reasonably
target a turn around of a couple of days, these
shouldn't really need to wait weeks for review.

> > ---
> > 
> > Notes:
> >     v3: add a comment about ENOSPC error
> >     v2: making fill_queue return int and testing return code for
> > -ENOSPC
> > 
> >  drivers/char/virtio_console.c | 28 +++++++++++++---------------
> >  1 file changed, 13 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/char/virtio_console.c
> > b/drivers/char/virtio_console.c
> > index 7270e7b69262..3259426f01dc 100644
> > --- a/drivers/char/virtio_console.c
> > +++ b/drivers/char/virtio_console.c
> > @@ -1325,24 +1325,24 @@ static void set_console_size(struct port
> > *port, u16 rows, u16 cols)
> >  	port->cons.ws.ws_col = cols;
> >  }
> >  
> > -static unsigned int fill_queue(struct virtqueue *vq, spinlock_t
> > *lock)
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
> > @@ -1362,7 +1362,6 @@ static int add_port(struct ports_device
> > *portdev, u32 id)
> >  	char debugfs_name[16];
> >  	struct port *port;
> >  	dev_t devt;
> > -	unsigned int nr_added_bufs;
> >  	int err;
> >  
> >  	port = kmalloc(sizeof(*port), GFP_KERNEL);
> > @@ -1421,11 +1420,13 @@ static int add_port(struct ports_device
> > *portdev, u32 id)
> >  	spin_lock_init(&port->outvq_lock);
> >  	init_waitqueue_head(&port->waitqueue);
> >  
> > -	/* Fill the in_vq with buffers so the host can send us data. */
> > -	nr_added_bufs = fill_queue(port->in_vq, &port->inbuf_lock);
> > -	if (!nr_added_bufs) {
> > +	/* We can safely ignore ENOSPC because it means
> > +	 * the queue already has buffers. Buffers are removed
> > +	 * only by virtcons_remove(), not by unplug_port()
> > +	 */
> > +	err = fill_queue(port->in_vq, &port->inbuf_lock);
> > +	if (err < 0 && err != -ENOSPC) {
> >  		dev_err(port->dev, "Error allocating inbufs\n");
> > -		err = -ENOMEM;
> >  		goto free_device;
> >  	}
> >  
> > @@ -2059,14 +2060,11 @@ static int virtcons_probe(struct
> > virtio_device *vdev)
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
> >  				"Error allocating buffers for control
> > queue\n");
> >  			/*
> > @@ -2077,7 +2075,7 @@ static int virtcons_probe(struct virtio_device
> > *vdev)
> >  					   VIRTIO_CONSOLE_DEVICE_READY,
> > 0);
> >  			/* Device was functional: we need full cleanup.
> > */
> >  			virtcons_remove(vdev);
> > -			return -ENOMEM;
> > +			return err;
> >  		}
> >  	} else {
> >  		/*

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
