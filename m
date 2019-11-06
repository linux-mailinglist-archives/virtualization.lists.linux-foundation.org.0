Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C44F1960
	for <lists.virtualization@lfdr.de>; Wed,  6 Nov 2019 16:03:19 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C1D50CAB;
	Wed,  6 Nov 2019 15:03:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 48A58B49
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 15:03:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 38F6B844
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 15:03:11 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F02836898
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 15:03:10 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id p68so25084060qkf.9
	for <virtualization@lists.linux-foundation.org>;
	Wed, 06 Nov 2019 07:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=F6ynqqIbM2TOAD7hLFicRunvQIveutT6wIB583FFBto=;
	b=R6j8De2Hz+wv5GjEn77OIWTcRN2/zq7s+dlvxQRKwEB4B7l22UGdLMSetgiX0YFpxQ
	ueHU/bInMf1gnKZmhSiFARMwz21IDWpJDfEALwLuU8UwkDAtM9iAQicEW/G0D/PVHSd+
	63M73UhGQ415Yqae480r+qrobSH1nAxi5W9RyBRyaF1xhF/+hOjZ09ila3yE7zA+wpA5
	+AOEdhH17YlkDfbx3NyAN/zCCVp4pIF45n7uU6+qFdAf1MBk1jD6vnU86hFUY61zW4l6
	GtVJBHX6v0lJ2+0teaTN0R72GtbxCq/762tQKNXhOlgmG50QX3O1mvOgD30b7dIAfeQ9
	/d9Q==
X-Gm-Message-State: APjAAAW2HMxC7lqxyzxZoqylfee8nAfUK+eMoNtIKqCgvIY+ZWAt0e92
	FLrkhTNe/e7Bcogmd3oHfvuhHTW/LIq0kpgGij32WCMiOBLEhqJ3W5v+Q+f5pt19SM1hyhnJqFU
	Zq5LknGKBU6TmgJYdwGdz0ts+c9ck73cbn+fD8chZQg==
X-Received: by 2002:a05:6214:6f2:: with SMTP id
	bk18mr2645490qvb.10.1573052589484; 
	Wed, 06 Nov 2019 07:03:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzB6sR4iapHLMS9Rizs1m4GAhzYFfaFlAKVqoBEWSYBG3RuIIJ8NVNFKQELCmo/CWRJnkNJUQ==
X-Received: by 2002:a05:6214:6f2:: with SMTP id
	bk18mr2645450qvb.10.1573052589102; 
	Wed, 06 Nov 2019 07:03:09 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
	by smtp.gmail.com with ESMTPSA id
	o195sm12264065qke.35.2019.11.06.07.03.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 07:03:08 -0800 (PST)
Date: Wed, 6 Nov 2019 10:03:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] virtio_console: allocate inbufs in add_port() only if it
	is needed
Message-ID: <20191106095707-mutt-send-email-mst@kernel.org>
References: <20191018164718.15999-1-lvivier@redhat.com>
	<20191106085548-mutt-send-email-mst@kernel.org>
	<83d88904-1626-8dd6-9e5c-7abcee27bcd0@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83d88904-1626-8dd6-9e5c-7abcee27bcd0@redhat.com>
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

On Wed, Nov 06, 2019 at 03:02:25PM +0100, Laurent Vivier wrote:
> On 06/11/2019 14:56, Michael S. Tsirkin wrote:
> > On Fri, Oct 18, 2019 at 06:47:18PM +0200, Laurent Vivier wrote:
> >> When we hot unplug a virtserialport and then try to hot plug again,
> >> it fails:
> >>
> >> (qemu) chardev-add socket,id=serial0,path=/tmp/serial0,server,nowait
> >> (qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
> >>                   chardev=serial0,id=serial0,name=serial0
> >> (qemu) device_del serial0
> >> (qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
> >>                   chardev=serial0,id=serial0,name=serial0
> >> kernel error:
> >>   virtio-ports vport2p2: Error allocating inbufs
> >> qemu error:
> >>   virtio-serial-bus: Guest failure in adding port 2 for device \
> >>                      virtio-serial0.0
> >>
> >> This happens because buffers for the in_vq are allocated when the port is
> >> added but are not released when the port is unplugged.
> >>
> >> They are only released when virtconsole is removed (see a7a69ec0d8e4)
> >>
> >> To avoid the problem and to be symmetric, we could allocate all the buffers
> >> in init_vqs() as they are released in remove_vqs(), but it sounds like
> >> a waste of memory.
> >>
> >> Rather than that, this patch changes add_port() logic to only allocate the
> >> buffers if the in_vq has available free slots.
> >>
> >> Fixes: a7a69ec0d8e4 ("virtio_console: free buffers after reset")
> >> Cc: mst@redhat.com
> >> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >> ---
> >>  drivers/char/virtio_console.c | 17 +++++++++++------
> >>  1 file changed, 11 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> >> index 7270e7b69262..77105166fe01 100644
> >> --- a/drivers/char/virtio_console.c
> >> +++ b/drivers/char/virtio_console.c
> >> @@ -1421,12 +1421,17 @@ static int add_port(struct ports_device *portdev, u32 id)
> >>  	spin_lock_init(&port->outvq_lock);
> >>  	init_waitqueue_head(&port->waitqueue);
> >>  
> >> -	/* Fill the in_vq with buffers so the host can send us data. */
> >> -	nr_added_bufs = fill_queue(port->in_vq, &port->inbuf_lock);
> >> -	if (!nr_added_bufs) {
> >> -		dev_err(port->dev, "Error allocating inbufs\n");
> >> -		err = -ENOMEM;
> >> -		goto free_device;
> >> +	/* if the in_vq has not already been filled (the port has already been
> >> +	 * used and unplugged), fill the in_vq with buffers so the host can
> >> +	 * send us data.
> >> +	 */
> >> +	if (port->in_vq->num_free != 0) {
> >> +		nr_added_bufs = fill_queue(port->in_vq, &port->inbuf_lock);
> >> +		if (!nr_added_bufs) {
> >> +			dev_err(port->dev, "Error allocating inbufs\n");
> >> +			err = -ENOMEM;
> >> +			goto free_device;
> >> +		}
> >>  	}
> >>  
> >>  	if (is_rproc_serial(port->portdev->vdev))
> > 
> > Well fill_queue will just add slots as long as it can.
> > So on a full queue it does nothing. How does this patch help?
> 
> Yes, but in this case it returns 0 and so add_port() fails and exits
> with -ENOMEM and the device is freed. It's what this patch tries to avoid.
> 
> Thanks,
> Laurent

Oh I see. However it's a bit asymmetrical to special case ring full.
How about making fill_queue return int and testing return code for
-ENOSPC instead? Will also help propagate errors correctly.

And I guess CC stable?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
