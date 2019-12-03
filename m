Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7170A110156
	for <lists.virtualization@lfdr.de>; Tue,  3 Dec 2019 16:33:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67B3B85116;
	Tue,  3 Dec 2019 15:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FHcyxQX6ga_e; Tue,  3 Dec 2019 15:33:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CAC3E85087;
	Tue,  3 Dec 2019 15:33:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A607CC087F;
	Tue,  3 Dec 2019 15:33:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80561C087F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 15:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7BDD122785
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 15:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVnNpayP+QEB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 15:33:07 +0000 (UTC)
X-Greylist: delayed 00:46:08 by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by silver.osuosl.org (Postfix) with ESMTPS id E811822730
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 15:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Mime-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Df/63bTiz0MbvffoTq5LGNY0f3lhFWeKO2rB4GEICME=; b=PWrO0iJZ5Jov8iCg1pPsVunCpH
 VKIXG5NVaIwAyuk9qs+FtWWaqb8GHI5HIot4d4zS3l6ToeM4RJ9C9bKwkp4Bq7bScIXW/DnbH4CAM
 yX7WpR5Rv2X15OcVcVeilludvtzlx7C2WNs1b9A/WXTpW2K1+4qASeNrpmeCIvfBnuzi3prBumKoL
 1d43Blr5eVn4L+04HYdlwEE6sDS2n1DiK04Ik3SKuX7a2ZpX7F3YDx9RfxvPzwchv65B5056Jwzg9
 0mGFcU35sYGU5ydUEAQ4yMoYJV8mpZDrykj1RVEwaTNPitrVywJ5mMupy42gvs6mZnOLLA784MBjp
 lfjSKxTw==;
Received: from [54.239.6.185] (helo=u0c626add9cce5a.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic9S1-0000q1-9o; Tue, 03 Dec 2019 14:46:53 +0000
Message-ID: <ae3451423c18f2e408245d745d1f28e311a2845c.camel@infradead.org>
Subject: Re: [PATCH v3] virtio_console: allocate inbufs in add_port() only
 if it is needed
From: Amit Shah <amit@infradead.org>
To: Laurent Vivier <lvivier@redhat.com>, linux-kernel@vger.kernel.org
Date: Tue, 03 Dec 2019 15:46:50 +0100
In-Reply-To: <20191114122548.24364-1-lvivier@redhat.com>
References: <20191114122548.24364-1-lvivier@redhat.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, Amit Shah <amit@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, stable@vger.kernel.org,
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

On Thu, 2019-11-14 at 13:25 +0100, Laurent Vivier wrote:
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
> This happens because buffers for the in_vq are allocated when the
> port is
> added but are not released when the port is unplugged.
> 
> They are only released when virtconsole is removed (see a7a69ec0d8e4)
> 
> To avoid the problem and to be symmetric, we could allocate all the
> buffers
> in init_vqs() as they are released in remove_vqs(), but it sounds
> like
> a waste of memory.
> 
> Rather than that, this patch changes add_port() logic to ignore
> ENOSPC
> error in fill_queue(), which means queue has already been filled.
> 
> Fixes: a7a69ec0d8e4 ("virtio_console: free buffers after reset")
> Cc: mst@redhat.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Amit Shah <amit@kernel.org>

Thanks!

> ---
> 
> Notes:
>     v3: add a comment about ENOSPC error
>     v2: making fill_queue return int and testing return code for
> -ENOSPC
> 
>  drivers/char/virtio_console.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/char/virtio_console.c
> b/drivers/char/virtio_console.c
> index 7270e7b69262..3259426f01dc 100644
> --- a/drivers/char/virtio_console.c
> +++ b/drivers/char/virtio_console.c
> @@ -1325,24 +1325,24 @@ static void set_console_size(struct port
> *port, u16 rows, u16 cols)
>  	port->cons.ws.ws_col = cols;
>  }
>  
> -static unsigned int fill_queue(struct virtqueue *vq, spinlock_t
> *lock)
> +static int fill_queue(struct virtqueue *vq, spinlock_t *lock)
>  {
>  	struct port_buffer *buf;
> -	unsigned int nr_added_bufs;
> +	int nr_added_bufs;
>  	int ret;
>  
>  	nr_added_bufs = 0;
>  	do {
>  		buf = alloc_buf(vq->vdev, PAGE_SIZE, 0);
>  		if (!buf)
> -			break;
> +			return -ENOMEM;
>  
>  		spin_lock_irq(lock);
>  		ret = add_inbuf(vq, buf);
>  		if (ret < 0) {
>  			spin_unlock_irq(lock);
>  			free_buf(buf, true);
> -			break;
> +			return ret;
>  		}
>  		nr_added_bufs++;
>  		spin_unlock_irq(lock);
> @@ -1362,7 +1362,6 @@ static int add_port(struct ports_device
> *portdev, u32 id)
>  	char debugfs_name[16];
>  	struct port *port;
>  	dev_t devt;
> -	unsigned int nr_added_bufs;
>  	int err;
>  
>  	port = kmalloc(sizeof(*port), GFP_KERNEL);
> @@ -1421,11 +1420,13 @@ static int add_port(struct ports_device
> *portdev, u32 id)
>  	spin_lock_init(&port->outvq_lock);
>  	init_waitqueue_head(&port->waitqueue);
>  
> -	/* Fill the in_vq with buffers so the host can send us data. */
> -	nr_added_bufs = fill_queue(port->in_vq, &port->inbuf_lock);
> -	if (!nr_added_bufs) {
> +	/* We can safely ignore ENOSPC because it means
> +	 * the queue already has buffers. Buffers are removed
> +	 * only by virtcons_remove(), not by unplug_port()
> +	 */
> +	err = fill_queue(port->in_vq, &port->inbuf_lock);
> +	if (err < 0 && err != -ENOSPC) {
>  		dev_err(port->dev, "Error allocating inbufs\n");
> -		err = -ENOMEM;
>  		goto free_device;
>  	}
>  
> @@ -2059,14 +2060,11 @@ static int virtcons_probe(struct
> virtio_device *vdev)
>  	INIT_WORK(&portdev->control_work, &control_work_handler);
>  
>  	if (multiport) {
> -		unsigned int nr_added_bufs;
> -
>  		spin_lock_init(&portdev->c_ivq_lock);
>  		spin_lock_init(&portdev->c_ovq_lock);
>  
> -		nr_added_bufs = fill_queue(portdev->c_ivq,
> -					   &portdev->c_ivq_lock);
> -		if (!nr_added_bufs) {
> +		err = fill_queue(portdev->c_ivq, &portdev->c_ivq_lock);
> +		if (err < 0) {
>  			dev_err(&vdev->dev,
>  				"Error allocating buffers for control
> queue\n");
>  			/*
> @@ -2077,7 +2075,7 @@ static int virtcons_probe(struct virtio_device
> *vdev)
>  					   VIRTIO_CONSOLE_DEVICE_READY,
> 0);
>  			/* Device was functional: we need full cleanup.
> */
>  			virtcons_remove(vdev);
> -			return -ENOMEM;
> +			return err;
>  		}
>  	} else {
>  		/*

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
