Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E82D92B4480
	for <lists.virtualization@lfdr.de>; Mon, 16 Nov 2020 14:12:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A98F870CD;
	Mon, 16 Nov 2020 13:12:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yszh4fmuRh3r; Mon, 16 Nov 2020 13:12:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DDE338711D;
	Mon, 16 Nov 2020 13:12:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1C4FC07FF;
	Mon, 16 Nov 2020 13:12:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3752FC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 13:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 25AFE86841
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 13:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wfHAH0yAzw3X
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 13:12:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1A4508683A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 13:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605532363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1MsyfwNa8Jx32AXWJVdoiRXVhLmfFI1tNXSgaZ45fq4=;
 b=FS2B2tSPC2hTRK/gO5gjkOp9ujZUzL9/ZfaqzkrnCn26eBjRtahhdzfFewgcFBLjoYZt8W
 CuHp97zP/31WI3xo0pdUpVwRB4b4/vU8G2G3ST9avt0TDqmeyNy/04zT3VBO9Hw/awa/Ae
 scYKdBzFYLw8vKjLELp2cWFCL1l75dI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-bDv7oN_IPrGJAGLkXu80Kw-1; Mon, 16 Nov 2020 08:12:42 -0500
X-MC-Unique: bDv7oN_IPrGJAGLkXu80Kw-1
Received: by mail-wr1-f70.google.com with SMTP id r15so11154232wrn.15
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 05:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1MsyfwNa8Jx32AXWJVdoiRXVhLmfFI1tNXSgaZ45fq4=;
 b=EVggwHsstqSKbVtt+CHROvlV/BvO5ACoGYQBAlJeu46qKQoy4q8VJ9ZVHdQhfiMgd0
 usWFEN54HIuWW2bDcssuxqVDddU5lnzR+7DWLn5mNDLFaMl1mhpyovmDG4FhDf/RYN8m
 CE8PM3jxtGDBQD+luGs7cN/PJILeJRbDTdasSvIobuRb1sEiVQZ/rWYrJH0K3DXffYxl
 K7EsR/03ArAyEBIYsO+ViaDe+SoW810fiLK2KmBc3kdndxXDl+Hoct7hHqIDUgbFVBIw
 IrUtsbXbLZgADFgLSKBuzt9qdOfFHfsRpABP4VHbc2w+reevN5M9S/OonfpqbQa5TjJg
 sMKQ==
X-Gm-Message-State: AOAM531MNG3UnD4/fK9F1sCA2YEb5I6h06AlojKuDZjDUjKxdrhmF7h9
 j4guvys85KFBqSUDujo4HBoaWcqz4cTbKrwvblnk9VrGOKuRl44zi5P5EvqZArjiKvKjFDOkpKt
 0mPYAvTnbPFbiT+RyDB035D+XItJWLFQvfTePskRx8g==
X-Received: by 2002:a1c:3d54:: with SMTP id k81mr16012161wma.144.1605532360899; 
 Mon, 16 Nov 2020 05:12:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWEajR0OWDyqeKkIjBoeFIm1XjBpo/ZNOIzpQvPnoEBfltGFQv72xS2lc0N8QZKFC3zlWOfQ==
X-Received: by 2002:a1c:3d54:: with SMTP id k81mr16012142wma.144.1605532360706; 
 Mon, 16 Nov 2020 05:12:40 -0800 (PST)
Received: from redhat.com ([147.161.8.56])
 by smtp.gmail.com with ESMTPSA id f19sm19145825wml.21.2020.11.16.05.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 05:12:39 -0800 (PST)
Date: Mon, 16 Nov 2020 08:12:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: [PATCH virtio] virtio: virtio_console: fix DMA memory allocation
 for rproc serial
Message-ID: <20201116080943-mutt-send-email-mst@kernel.org>
References: <AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch>
 <20201116091950.GA30524@infradead.org>
 <20201116071910-mutt-send-email-mst@kernel.org>
 <u9RJBckNwnezQttAPrOyEqDYKu0rnhedUZYGpaS83qg@cp3-web-024.plabs.ch>
MIME-Version: 1.0
In-Reply-To: <u9RJBckNwnezQttAPrOyEqDYKu0rnhedUZYGpaS83qg@cp3-web-024.plabs.ch>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Amit Shah <amit@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Christoph Hellwig <hch@infradead.org>, linux-remoteproc@vger.kernel.org,
 Suman Anna <s-anna@ti.com>, virtualization@lists.linux-foundation.org
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

On Mon, Nov 16, 2020 at 01:07:28PM +0000, Alexander Lobakin wrote:
> From: "Michael S. Tsirkin" <mst@redhat.com>
> Date: Mon, 16 Nov 2020 07:25:31 -0500
> 
> > On Mon, Nov 16, 2020 at 09:19:50AM +0000, Christoph Hellwig wrote:
> >> I just noticed this showing up in Linus' tree and I'm not happy.
> >
> > Are you sure? I think it's in next.
> 
> Nope, it goes to fixes since it just fixes the regression introduced
> in 5.7.

Oh you are right, Greg merged it and I didn't notice because I didn't
rebase my tree.

> That's why it's not about any refactoring or rethinking the whole
> model.
> 
> >> This whole model of the DMA subdevices in remoteproc is simply broken.
> >>
> >> We really need to change the virtio code pass an expicit DMA device (
> >> similar to what e.g. the USB and RDMA code does), instead of faking up
> >> devices with broken adhoc inheritance of DMA properties and magic poking
> >> into device parent relationships.
> 
> But lots of subsystems like netdev for example uses dev->parent for
> DMA operations. I know that their pointers go directly to the
> platform/PCI/etc. device, but still.
> 
> The only reason behind "fake" DMA devices for rproc is to be able to
> reserve DMA memory through the Device Tree exclusively for only one
> virtio dev like virtio_console or virtio_rpmsg_bus. That's why
> they are present, are coercing DMA caps from physical dev
> representor, and why questinable dma_declare_coherent_memory()
> is still here and doesn't allow to build rproc core as a module.
> I agree that this is not the best model obviously, and we should take
> a look at it.
> 
> > OK but we do have a regression since 5.7 and this looks like
> > a fix appropriate for e.g. stable, right?
> >
> >> Bjorn, I thought you were going to look into this a while ago?
> >>
> >>
> >> On Wed, Nov 04, 2020 at 03:31:36PM +0000, Alexander Lobakin wrote:
> >>> Since commit 086d08725d34 ("remoteproc: create vdev subdevice with
> >>> specific dma memory pool"), every remoteproc has a DMA subdevice
> >>> ("remoteprocX#vdevYbuffer") for each virtio device, which inherits
> >>> DMA capabilities from the corresponding platform device. This allowed
> >>> to associate different DMA pools with each vdev, and required from
> >>> virtio drivers to perform DMA operations with the parent device
> >>> (vdev->dev.parent) instead of grandparent (vdev->dev.parent->parent).
> >>>
> >>> virtio_rpmsg_bus was already changed in the same merge cycle with
> >>> commit d999b622fcfb ("rpmsg: virtio: allocate buffer from parent"),
> >>> but virtio_console did not. In fact, operations using the grandparent
> >>> worked fine while the grandparent was the platform device, but since
> >>> commit c774ad010873 ("remoteproc: Fix and restore the parenting
> >>> hierarchy for vdev") this was changed, and now the grandparent device
> >>> is the remoteproc device without any DMA capabilities.
> >>> So, starting v5.8-rc1 the following warning is observed:
> >>>
> >>> [    2.483925] ------------[ cut here ]------------
> >>> [    2.489148] WARNING: CPU: 3 PID: 101 at kernel/dma/mapping.c:427 0x80e7eee8
> >>> [    2.489152] Modules linked in: virtio_console(+)
> >>> [    2.503737]  virtio_rpmsg_bus rpmsg_core
> >>> [    2.508903]
> >>> [    2.528898] <Other modules, stack and call trace here>
> >>> [    2.913043]
> >>> [    2.914907] ---[ end trace 93ac8746beab612c ]---
> >>> [    2.920102] virtio-ports vport1p0: Error allocating inbufs
> >>>
> >>> kernel/dma/mapping.c:427 is:
> >>>
> >>> WARN_ON_ONCE(!dev->coherent_dma_mask);
> >>>
> >>> obviously because the grandparent now is remoteproc dev without any
> >>> DMA caps:
> >>>
> >>> [    3.104943] Parent: remoteproc0#vdev1buffer, grandparent: remoteproc0
> >>>
> >>> Fix this the same way as it was for virtio_rpmsg_bus, using just the
> >>> parent device (vdev->dev.parent, "remoteprocX#vdevYbuffer") for DMA
> >>> operations.
> >>> This also allows now to reserve DMA pools/buffers for rproc serial
> >>> via Device Tree.
> >>>
> >>> Fixes: c774ad010873 ("remoteproc: Fix and restore the parenting hierarchy for vdev")
> >>> Cc: stable@vger.kernel.org # 5.1+
> >>> Signed-off-by: Alexander Lobakin <alobakin@pm.me>
> >>> ---
> >>>  drivers/char/virtio_console.c | 8 ++++----
> >>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> >>> index a2da8f768b94..1836cc56e357 100644
> >>> --- a/drivers/char/virtio_console.c
> >>> +++ b/drivers/char/virtio_console.c
> >>> @@ -435,12 +435,12 @@ static struct port_buffer *alloc_buf(struct virtio_device *vdev, size_t buf_size
> >>>  		/*
> >>>  		 * Allocate DMA memory from ancestor. When a virtio
> >>>  		 * device is created by remoteproc, the DMA memory is
> >>> -		 * associated with the grandparent device:
> >>> -		 * vdev => rproc => platform-dev.
> >>> +		 * associated with the parent device:
> >>> +		 * virtioY => remoteprocX#vdevYbuffer.
> >>>  		 */
> >>> -		if (!vdev->dev.parent || !vdev->dev.parent->parent)
> >>> +		buf->dev = vdev->dev.parent;
> >>> +		if (!buf->dev)
> >>>  			goto free_buf;
> >>> -		buf->dev = vdev->dev.parent->parent;
> >>>
> >>>  		/* Increase device refcnt to avoid freeing it */
> >>>  		get_device(buf->dev);
> >>> --
> >>> 2.29.2
> >>>
> >>>
> >> ---end quoted text---
> 
> Thanks,
> Al

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
