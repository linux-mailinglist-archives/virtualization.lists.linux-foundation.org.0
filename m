Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFDEFB8D0
	for <lists.virtualization@lfdr.de>; Wed, 13 Nov 2019 20:29:00 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D5BD3DD6;
	Wed, 13 Nov 2019 19:28:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AE1E2CD4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 19:28:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 22EFC8B6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573673331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=8DO2hwiHu3pgkopyWQopR93a48RM5O8XuzUQ/v4W2kE=;
	b=iA0KoYZF9dMtsh2OoyB9Za6Mx4hS40Xl5Fr3czIhT+9WpH97pkebhZ0BKbQERIupcZP/T6
	FopgBQbcb/dl9nt0KzRHJfAFp5iwsftjcI2WpXM+0bA/hmT9HMoD6D1qxat3fV2wMd9Glx
	Qk9MTR4BQTDeRiScFT5uKvxLPk8g4+I=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
	[209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-296-g4ug8kEIN_e_buSjoljsGQ-1; Wed, 13 Nov 2019 14:28:49 -0500
Received: by mail-qv1-f69.google.com with SMTP id k11so2286967qvw.19
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 11:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=CoUlcMFhYrKHjvPh5qnAfb7ZB6jVrV1NCGIqlkgFJ7Q=;
	b=qvgHVL0J82wIFyBvgU3Y+ulihu+nTuNDCVUjNyLKLS00/2vd+OoGk03xnAobmzW475
	+lMdghd9+5NWAgWj1rD6Fxo3LTIgro8j2fHPxB8X2i6p8HaIPZ2pznxe4xLSctamebkU
	3vXCYYhhait5AcQWwTWZ6BOTqnOOXarsBJWId/u8wYqsRVxKIYItOLIg4/PYabBsezdX
	YQmfsJNDr7gxwHtzeH74prHx4/LZJfJ1NFdiFoF9sNvOy9VmKrU+grz83+FaR4YygN/k
	4ZbCVUuy8WuFy38ZsIZ7A6sXdfZHZbT/g8qX5iQaEtjXCcXN310XTH5AEQTWWNFfyhCL
	0ZpQ==
X-Gm-Message-State: APjAAAXyxLAlHF0NtzqSrVdGNvIOzvpp2JealWCqTTLMaqK/CWeegLth
	crUpVHKp/MJv4BF7tQUu/eYB4qBR7l0U6tlIaIS+0sTa7JRWRpW3z5SE+NoyvubgIdv4Ml02oNw
	D1ntbQYCryNA+qfbnEzUeGg4ohDjZqXUXz2ibWIfKYg==
X-Received: by 2002:ac8:7085:: with SMTP id y5mr4307324qto.76.1573673329298;
	Wed, 13 Nov 2019 11:28:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqx0ClAjjDvl9GSwMYMpNSj/1YP4wP59jyAYjjbPHC57IJ0tL8dPnQYy8A4DXBH9pQa2yR53Lw==
X-Received: by 2002:ac8:7085:: with SMTP id y5mr4307296qto.76.1573673329049;
	Wed, 13 Nov 2019 11:28:49 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
	by smtp.gmail.com with ESMTPSA id i4sm1621727qtp.57.2019.11.13.11.28.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 11:28:47 -0800 (PST)
Date: Wed, 13 Nov 2019 14:28:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2] virtio_console: allocate inbufs in add_port() only if
	it is needed
Message-ID: <20191113142757-mutt-send-email-mst@kernel.org>
References: <20191113150056.9990-1-lvivier@redhat.com>
	<20191113101929-mutt-send-email-mst@kernel.org>
	<20191113102126-mutt-send-email-mst@kernel.org>
	<7bd34d61-146f-8edb-d82d-7285a83437b4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7bd34d61-146f-8edb-d82d-7285a83437b4@redhat.com>
X-MC-Unique: g4ug8kEIN_e_buSjoljsGQ-1
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

On Wed, Nov 13, 2019 at 05:37:34PM +0100, Laurent Vivier wrote:
> On 13/11/2019 16:22, Michael S. Tsirkin wrote:
> > On Wed, Nov 13, 2019 at 10:21:11AM -0500, Michael S. Tsirkin wrote:
> >> On Wed, Nov 13, 2019 at 04:00:56PM +0100, Laurent Vivier wrote:
> >>> When we hot unplug a virtserialport and then try to hot plug again,
> >>> it fails:
> >>>
> >>> (qemu) chardev-add socket,id=serial0,path=/tmp/serial0,server,nowait
> >>> (qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
> >>>                   chardev=serial0,id=serial0,name=serial0
> >>> (qemu) device_del serial0
> >>> (qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
> >>>                   chardev=serial0,id=serial0,name=serial0
> >>> kernel error:
> >>>   virtio-ports vport2p2: Error allocating inbufs
> >>> qemu error:
> >>>   virtio-serial-bus: Guest failure in adding port 2 for device \
> >>>                      virtio-serial0.0
> >>>
> >>> This happens because buffers for the in_vq are allocated when the port is
> >>> added but are not released when the port is unplugged.
> >>>
> >>> They are only released when virtconsole is removed (see a7a69ec0d8e4)
> >>>
> >>> To avoid the problem and to be symmetric, we could allocate all the buffers
> >>> in init_vqs() as they are released in remove_vqs(), but it sounds like
> >>> a waste of memory.
> >>>
> >>> Rather than that, this patch changes add_port() logic to ignore ENOSPC
> >>> error in fill_queue(), which means queue has already been filled.
> >>>
> >>> Fixes: a7a69ec0d8e4 ("virtio_console: free buffers after reset")
> >>> Cc: mst@redhat.com
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >>> ---
> >>>
> >>> Notes:
> >>>     v2: making fill_queue return int and testing return code for -ENOSPC
> >>>
> >>>  drivers/char/virtio_console.c | 24 +++++++++---------------
> >>>  1 file changed, 9 insertions(+), 15 deletions(-)
> >>>
> >>> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> >>> index 7270e7b69262..9e6534fd1aa4 100644
> >>> --- a/drivers/char/virtio_console.c
> >>> +++ b/drivers/char/virtio_console.c
> >>> @@ -1325,24 +1325,24 @@ static void set_console_size(struct port *port, u16 rows, u16 cols)
> >>>  	port->cons.ws.ws_col = cols;
> >>>  }
> >>>  
> >>> -static unsigned int fill_queue(struct virtqueue *vq, spinlock_t *lock)
> >>> +static int fill_queue(struct virtqueue *vq, spinlock_t *lock)
> >>>  {
> >>>  	struct port_buffer *buf;
> >>> -	unsigned int nr_added_bufs;
> >>> +	int nr_added_bufs;
> >>>  	int ret;
> >>>  
> >>>  	nr_added_bufs = 0;
> >>>  	do {
> >>>  		buf = alloc_buf(vq->vdev, PAGE_SIZE, 0);
> >>>  		if (!buf)
> >>> -			break;
> >>> +			return -ENOMEM;
> >>>  
> >>>  		spin_lock_irq(lock);
> >>>  		ret = add_inbuf(vq, buf);
> >>>  		if (ret < 0) {
> >>>  			spin_unlock_irq(lock);
> >>>  			free_buf(buf, true);
> >>> -			break;
> >>> +			return ret;
> >>>  		}
> >>>  		nr_added_bufs++;
> >>>  		spin_unlock_irq(lock);
> > 
> > So actually, how about handling ENOSPC specially here, and
> > returning success? After all queue is full as requested ...
> 
> I think it's interesting to return -ENOSPC to manage it as a real error
> in virtcons_probe() as in this function the queue should not be already
> full (is this right?) and to return the real error code.
> 
> Thanks,
> Laurent

OK then. Pls add comments.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
