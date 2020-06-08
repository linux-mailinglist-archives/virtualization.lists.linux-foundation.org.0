Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D961F129F
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 08:01:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0E4FA20472;
	Mon,  8 Jun 2020 06:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXQSdyE44qWO; Mon,  8 Jun 2020 06:01:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9D03720476;
	Mon,  8 Jun 2020 06:01:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74257C016F;
	Mon,  8 Jun 2020 06:01:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B189C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 33C3885B4A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOMgRqn65wKV
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:00:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 55C6285540
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591596057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qV8rF1/p3MMAv+wx7e3r1Z9xxn/0nhBh79pwnRKPuUs=;
 b=RbwZ3So2vfFdWKpn+RkvjU22flcyCkk9OB13xoTG+5HCs/bojZZoFT/CccQjuLq8PA8dVw
 kgXwaSUwEqiikCzEPpy4SGmRExr65/Wi6zQPyCGD5WnlrV/hzrizyJbBjAtUiR+gfA/iVs
 5Js0gRj1Trd3jw6JYB8Mhima33KvlS0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-VPGwKeNXN5mVBHu63hLz9g-1; Mon, 08 Jun 2020 02:00:52 -0400
X-MC-Unique: VPGwKeNXN5mVBHu63hLz9g-1
Received: by mail-wm1-f72.google.com with SMTP id x6so4827648wmj.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 23:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qV8rF1/p3MMAv+wx7e3r1Z9xxn/0nhBh79pwnRKPuUs=;
 b=rFCeEWZdffFFZqYGL4ePCBkdQcqdCUarQnvouHlMq0UHFrFKzS2ztxc4UH129mNP04
 GuPG9uIGwRPWPcI1Zf1oZu9QLc5nlwGpUsUY726RcgWiH+p63Bw/1C4UhZNIWRi/Znm5
 wWDjeVcuHYGCyLAWvuI1DmRvUk0h2TTmVahXzJ5vcgJvI6a+AX1YARGWItROqPAq3qLm
 z+Yhbq4rT2Rvp27zmJBq5cg4eqBQVRZl+R5jGdV6fsrwHmcIlzcPNPYCSiVdKB8YvmCo
 CNDAyY7EZJkljnhGV24NgsnAHs76Gh9V1CrScVlHiASalDG0Fzxl7pOTGjql89TKVP+9
 hgtw==
X-Gm-Message-State: AOAM531L7BfTppEnu5QDN8gtWrvbKvL1FjKPPHB5Nx587roAoFYiZXfB
 lrHvOEeprYePUFA5vvxKUGLzKSwCxlw8D60x+nE4LSUM3+Pu92yetvbNlMZbEn8tGPKjJPXotOR
 qeZroO4JZg/i0rCm0Ew9Z2VcZhAlpncJfviH7VI0i/g==
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr21274519wrx.214.1591596051343; 
 Sun, 07 Jun 2020 23:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWwJuu90GiCa8Q3NNZkxIe2jccFeKD/lqncyqyhq/gOI8E1jgXUiYlIT9zREhMBPq6kfSAAA==
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr21274481wrx.214.1591596051013; 
 Sun, 07 Jun 2020 23:00:51 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 v19sm20932997wml.26.2020.06.07.23.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 23:00:50 -0700 (PDT)
Date: Mon, 8 Jun 2020 02:00:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v4 1/3] virtio: add dma-buf support for exported objects
Message-ID: <20200608015728-mutt-send-email-mst@kernel.org>
References: <20200526105811.30784-1-stevensd@chromium.org>
 <20200526105811.30784-2-stevensd@chromium.org>
 <20200604145620-mutt-send-email-mst@kernel.org>
 <CAD=HUj74mKs5AfcViD3CBva86E0Hvg_pmYChAJe3ny8jtnZ8Tw@mail.gmail.com>
 <20200606160155-mutt-send-email-mst@kernel.org>
 <CAD=HUj5Jn+grQVfxmPSSnERdGwnu8RceDsdpWpoxXH+WL4k+qw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=HUj5Jn+grQVfxmPSSnERdGwnu8RceDsdpWpoxXH+WL4k+qw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
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

On Mon, Jun 08, 2020 at 10:33:09AM +0900, David Stevens wrote:
> On Sun, Jun 7, 2020 at 5:04 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Jun 05, 2020 at 10:28:42AM +0900, David Stevens wrote:
> > > On Fri, Jun 5, 2020 at 4:05 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Tue, May 26, 2020 at 07:58:09PM +0900, David Stevens wrote:
> > > > > This change adds a new flavor of dma-bufs that can be used by virtio
> > > > > drivers to share exported objects. A virtio dma-buf can be queried by
> > > > > virtio drivers to obtain the UUID which identifies the underlying
> > > > > exported object.
> > > > >
> > > > > Signed-off-by: David Stevens <stevensd@chromium.org>
> > > >
> > > > Is this just for graphics? If yes I'd rather we put it in the graphics
> > > > driver. We can always move it later ...
> > >
> > > As stated in the cover letter, this will be used by virtio-video.
> > >
> > > The proposed virtio-video patches: https://markmail.org/thread/p5d3k566srtdtute
> > > The patch which imports these dma-bufs (slightly out of data, uses v3
> > > of this patch set): https://markmail.org/thread/j4xlqaaim266qpks
> > >
> > > > > ---
> > > > >  drivers/virtio/Makefile         |  2 +-
> > > > >  drivers/virtio/virtio.c         |  6 +++
> > > > >  drivers/virtio/virtio_dma_buf.c | 89 +++++++++++++++++++++++++++++++++
> > > > >  include/linux/virtio.h          |  1 +
> > > > >  include/linux/virtio_dma_buf.h  | 58 +++++++++++++++++++++
> > > > >  5 files changed, 155 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 drivers/virtio/virtio_dma_buf.c
> > > > >  create mode 100644 include/linux/virtio_dma_buf.h
> > > > >
> > > > > diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> > > > > index 29a1386ecc03..ecdae5b596de 100644
> > > > > --- a/drivers/virtio/Makefile
> > > > > +++ b/drivers/virtio/Makefile
> > > > > @@ -1,5 +1,5 @@
> > > > >  # SPDX-License-Identifier: GPL-2.0
> > > > > -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> > > > > +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
> > > > >  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
> > > > >  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
> > > > >  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> > > > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > > > index a977e32a88f2..5d46f0ded92d 100644
> > > > > --- a/drivers/virtio/virtio.c
> > > > > +++ b/drivers/virtio/virtio.c
> > > > > @@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(register_virtio_device);
> > > > >
> > > > > +bool is_virtio_device(struct device *dev)
> > > > > +{
> > > > > +     return dev->bus == &virtio_bus;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(is_virtio_device);
> > > > > +
> > > > >  void unregister_virtio_device(struct virtio_device *dev)
> > > > >  {
> > > > >       int index = dev->index; /* save for after device release */
> > > > > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> > > > > new file mode 100644
> > > > > index 000000000000..23e3399b11ed
> > > > > --- /dev/null
> > > > > +++ b/drivers/virtio/virtio_dma_buf.c
> > > > > @@ -0,0 +1,89 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > > +/*
> > > > > + * dma-bufs for virtio exported objects
> > > > > + *
> > > > > + * Copyright (C) 2020 Google, Inc.
> > > > > + */
> > > > > +
> > > > > +#include <linux/virtio_dma_buf.h>
> > > > > +
> > > > > +/**
> > > > > + * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> > > > > + *
> > > > > + * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> > > > > + * for an virtio exported object that can be queried by other virtio drivers
> > > > > + * for the object's UUID.
> > > > > + */
> > > > > +struct dma_buf *virtio_dma_buf_export(
> > > > > +             const struct virtio_dma_buf_export_info *virtio_exp_info)
> > > > > +{
> > > > > +     struct dma_buf_export_info exp_info;
> > > > > +
> > > > > +     if (!virtio_exp_info->ops
> > > > > +             || virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
> > > > > +             || !virtio_exp_info->ops->get_uuid) {
> > > > > +             return ERR_PTR(-EINVAL);
> > > > > +     }
> > > > > +
> > > > > +     exp_info.exp_name = virtio_exp_info->exp_name;
> > > > > +     exp_info.owner = virtio_exp_info->owner;
> > > > > +     exp_info.ops = &virtio_exp_info->ops->ops;
> > > > > +     exp_info.size = virtio_exp_info->size;
> > > > > +     exp_info.flags = virtio_exp_info->flags;
> > > > > +     exp_info.resv = virtio_exp_info->resv;
> > > > > +     exp_info.priv = virtio_exp_info->priv;
> > > > > +     BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
> > > > > +                  != sizeof(struct dma_buf_export_info));
> > > >
> > > > This is the only part that gives me pause. Why do we need this hack?
> > > > What's wrong with just using dma_buf_export_info directly,
> > > > and if you want the virtio ops, just using container_off?
> > >
> > > This approach provides a more explicit type signature and a little
> > > more type safety, I think. If others don't think it's a worthwhile
> > > tradeoff, I can remove it.
> > >
> > > -David
> >
> > The cost is that if dma_buf_export_info changes even slightly, we get
> > weird crashes.
> 
> I'm not sure I understand what types of changes you're referring to.
> As this is written, virtio-dma-buf is just another client of the
> dma-buf API. If this were rewritten to use dma-buf directly, then
> whatever code calls virtio_dma_buf_export would become a client of the
> dma-buf API. If the semantics of existing fields in the dma-buf API
> were changed and virtio-dma-buf wasn't updated, then yes, you could
> get weird crashes from virtio-dma-buf.
> However, the same problem would
> exist if virtio_dma_buf_export used dma-buf directly - changes to
> dma-buf's semantics could cause weird crashes if the caller of
> virtio_dma_buf_export wasn't updated properly. The only potential
> source of problems I see is if virtio_dma_buf_export_info wasn't
> updated properly, but virtio_dma_buf_export_info is dead simple, so I
> don't know if that's really a problem.
> 
> -David

I think you can get weird crashes if fields in dma buf are reordered, or
if a field size changes.  You have a build bug catching overall struct
size changes but that can remain the same due do compiler padding or
such.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
