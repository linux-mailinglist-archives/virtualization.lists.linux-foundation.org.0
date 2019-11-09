Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDE8F5D9E
	for <lists.virtualization@lfdr.de>; Sat,  9 Nov 2019 06:49:27 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 23FFCCAB;
	Sat,  9 Nov 2019 05:49:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A1F8CB49
	for <virtualization@lists.linux-foundation.org>;
	Sat,  9 Nov 2019 05:49:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 21E99102
	for <virtualization@lists.linux-foundation.org>;
	Sat,  9 Nov 2019 05:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	Mime-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2daBl1XqJHk3doN2SvcFAh4NuQLq3rWMCItDmKsEpzQ=;
	b=GSiXKZ4u85elUSwsSft5FIB1p
	q9yCf7onnjBGMgM7WYIrqGrdrwzWSxmg3IIl8nptckvkl0R7Qt522bYRbtJEm+SHghqLgs+1CP67/
	LmowD8XwIY6ZpDsa7j7UUZmPF8EdXJGeK60ZgJ2bLybbkXE38lFhea9GBvfJacV8yahAQCesjWcGK
	vOy50BYEvutu86hMJfPnrhSseYanJlMaOg1Tv7P4LqOFjM5TUfyoARmhRRh5dOqyO/jDGoxY3Tl//
	XqCryecRHT8N1PBPrzj9+o4iOufriu5iYnbbwM69ZtVqlw8MLZL5ue+86f4moULSYE7eTgZ88khC2
	urB5dwqYA==;
Received: from [95.90.212.9] (helo=u601e653ff81a58.ant.amazon.com)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTJcZ-0000Xq-Gl; Sat, 09 Nov 2019 05:49:15 +0000
Message-ID: <46cc3d4a8d4b2279ce8b3cba5e061ac14b2a0c84.camel@infradead.org>
Subject: Re: [PATCH] virtio_console: allocate inbufs in add_port() only if
	it is needed
From: Amit Shah <amit@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Date: Sat, 09 Nov 2019 06:49:12 +0100
In-Reply-To: <20191106095707-mutt-send-email-mst@kernel.org>
References: <20191018164718.15999-1-lvivier@redhat.com>
	<20191106085548-mutt-send-email-mst@kernel.org>
	<83d88904-1626-8dd6-9e5c-7abcee27bcd0@redhat.com>
	<20191106095707-mutt-send-email-mst@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
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

On Wed, 2019-11-06 at 10:03 -0500, Michael S. Tsirkin wrote:
> On Wed, Nov 06, 2019 at 03:02:25PM +0100, Laurent Vivier wrote:
> > On 06/11/2019 14:56, Michael S. Tsirkin wrote:
> > > On Fri, Oct 18, 2019 at 06:47:18PM +0200, Laurent Vivier wrote:
> > > > When we hot unplug a virtserialport and then try to hot plug
> > > > again,
> > > > it fails:
> > > > 
> > > > (qemu) chardev-add
> > > > socket,id=serial0,path=/tmp/serial0,server,nowait
> > > > (qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
> > > >                   chardev=serial0,id=serial0,name=serial0
> > > > (qemu) device_del serial0
> > > > (qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
> > > >                   chardev=serial0,id=serial0,name=serial0
> > > > kernel error:
> > > >   virtio-ports vport2p2: Error allocating inbufs
> > > > qemu error:
> > > >   virtio-serial-bus: Guest failure in adding port 2 for device
> > > > \
> > > >                      virtio-serial0.0
> > > > 
> > > > This happens because buffers for the in_vq are allocated when
> > > > the port is
> > > > added but are not released when the port is unplugged.
> > > > 
> > > > They are only released when virtconsole is removed (see
> > > > a7a69ec0d8e4)
> > > > 
> > > > To avoid the problem and to be symmetric, we could allocate all
> > > > the buffers
> > > > in init_vqs() as they are released in remove_vqs(), but it
> > > > sounds like
> > > > a waste of memory.
> > > > 
> > > > Rather than that, this patch changes add_port() logic to only
> > > > allocate the
> > > > buffers if the in_vq has available free slots.
> > > > 
> > > > Fixes: a7a69ec0d8e4 ("virtio_console: free buffers after
> > > > reset")
> > > > Cc: mst@redhat.com
> > > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > > > ---
> > > >  drivers/char/virtio_console.c | 17 +++++++++++------
> > > >  1 file changed, 11 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/char/virtio_console.c
> > > > b/drivers/char/virtio_console.c
> > > > index 7270e7b69262..77105166fe01 100644
> > > > --- a/drivers/char/virtio_console.c
> > > > +++ b/drivers/char/virtio_console.c
> > > > @@ -1421,12 +1421,17 @@ static int add_port(struct ports_device
> > > > *portdev, u32 id)
> > > >  	spin_lock_init(&port->outvq_lock);
> > > >  	init_waitqueue_head(&port->waitqueue);
> > > >  
> > > > -	/* Fill the in_vq with buffers so the host can send us
> > > > data. */
> > > > -	nr_added_bufs = fill_queue(port->in_vq, &port-
> > > > >inbuf_lock);
> > > > -	if (!nr_added_bufs) {
> > > > -		dev_err(port->dev, "Error allocating
> > > > inbufs\n");
> > > > -		err = -ENOMEM;
> > > > -		goto free_device;
> > > > +	/* if the in_vq has not already been filled (the port
> > > > has already been
> > > > +	 * used and unplugged), fill the in_vq with buffers so
> > > > the host can
> > > > +	 * send us data.
> > > > +	 */
> > > > +	if (port->in_vq->num_free != 0) {
> > > > +		nr_added_bufs = fill_queue(port->in_vq, &port-
> > > > >inbuf_lock);
> > > > +		if (!nr_added_bufs) {
> > > > +			dev_err(port->dev, "Error allocating
> > > > inbufs\n");
> > > > +			err = -ENOMEM;
> > > > +			goto free_device;
> > > > +		}
> > > >  	}
> > > >  
> > > >  	if (is_rproc_serial(port->portdev->vdev))
> > > 
> > > Well fill_queue will just add slots as long as it can.
> > > So on a full queue it does nothing. How does this patch help?
> > 
> > Yes, but in this case it returns 0 and so add_port() fails and
> > exits
> > with -ENOMEM and the device is freed. It's what this patch tries to
> > avoid.
> > 
> > Thanks,
> > Laurent
> 
> Oh I see. However it's a bit asymmetrical to special case ring full.
> How about making fill_queue return int and testing return code for
> -ENOSPC instead? Will also help propagate errors correctly.

Yes, I like this better too.

Can you call out which commit introduced this behaviour / regression?

> 
> And I guess CC stable?
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
