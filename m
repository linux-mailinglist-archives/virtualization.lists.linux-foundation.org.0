Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5EA23BD14
	for <lists.virtualization@lfdr.de>; Tue,  4 Aug 2020 17:19:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AFA9687D6E;
	Tue,  4 Aug 2020 15:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbpuLWJMKwra; Tue,  4 Aug 2020 15:19:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E2E4087D65;
	Tue,  4 Aug 2020 15:19:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B96C5C004C;
	Tue,  4 Aug 2020 15:19:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39817C004C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 15:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2930187D65
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 15:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqxtEhiwR9t4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 15:19:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E5C4187D60
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 15:19:21 +0000 (UTC)
IronPort-SDR: nEdfSGCD5mZpK7AWUoH/UUN+GCW0PENvutW/uNSa81JBVtCH0BFV36QXvUu65T26M82VhPP4WH
 ezBVbKN1GDEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="237188542"
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; d="scan'208";a="237188542"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 08:19:21 -0700
IronPort-SDR: W+0vT9pAMJBlKPN8WWB96VYU+kRNXdEUZ7vCtbaQQAlMLFNnvV0fPnuBjQUVihn0RRt51v9QU5
 8jZKh7RTmSTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; d="scan'208";a="292606786"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.37.210])
 by orsmga006.jf.intel.com with ESMTP; 04 Aug 2020 08:19:18 -0700
Date: Tue, 4 Aug 2020 17:19:17 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 4/4] vhost: add an RPMsg API
Message-ID: <20200804151916.GC19025@ubuntu>
References: <20200722150927.15587-1-guennadi.liakhovetski@linux.intel.com>
 <20200722150927.15587-5-guennadi.liakhovetski@linux.intel.com>
 <20200804102132-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804102132-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kvm@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-remoteproc@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 sound-open-firmware@alsa-project.org
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

On Tue, Aug 04, 2020 at 10:27:08AM -0400, Michael S. Tsirkin wrote:
> On Wed, Jul 22, 2020 at 05:09:27PM +0200, Guennadi Liakhovetski wrote:
> > Linux supports running the RPMsg protocol over the VirtIO transport
> > protocol, but currently there is only support for VirtIO clients and
> > no support for a VirtIO server. This patch adds a vhost-based RPMsg
> > server implementation.
> > 
> > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > ---
> >  drivers/vhost/Kconfig       |   7 +
> >  drivers/vhost/Makefile      |   3 +
> >  drivers/vhost/rpmsg.c       | 375 ++++++++++++++++++++++++++++++++++++
> >  drivers/vhost/vhost_rpmsg.h |  74 +++++++
> >  4 files changed, 459 insertions(+)
> >  create mode 100644 drivers/vhost/rpmsg.c
> >  create mode 100644 drivers/vhost/vhost_rpmsg.h
> > 
> > diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> > index d3688c6afb87..602421bf1d03 100644
> > --- a/drivers/vhost/Kconfig
> > +++ b/drivers/vhost/Kconfig
> > @@ -38,6 +38,13 @@ config VHOST_NET
> >  	  To compile this driver as a module, choose M here: the module will
> >  	  be called vhost_net.
> >  
> > +config VHOST_RPMSG
> > +	tristate
> 
> So this lacks a description line so it does not appear
> in menuconfig. How is user supposed to set it?
> I added a one-line description.

That was on purpose. I don't think there's any value in this API stand-alone, 
so I let users select it as needed. But we can change that too, id desired.

> > +	depends on VHOST
> 
> Other drivers select VHOST instead. Any reason not to
> do it like this here?

I have

+	select VHOST
+	select VHOST_RPMSG

in my client driver patch.

> > +	help
> > +	  Vhost RPMsg API allows vhost drivers to communicate with VirtIO
> > +	  drivers, using the RPMsg over VirtIO protocol.
> > +
> 
> >  config VHOST_SCSI
> >  	tristate "VHOST_SCSI TCM fabric driver"
> >  	depends on TARGET_CORE && EVENTFD
> > diff --git a/drivers/vhost/Makefile b/drivers/vhost/Makefile
> > index f3e1897cce85..9cf459d59f97 100644
> > --- a/drivers/vhost/Makefile
> > +++ b/drivers/vhost/Makefile
> > @@ -2,6 +2,9 @@
> >  obj-$(CONFIG_VHOST_NET) += vhost_net.o
> >  vhost_net-y := net.o
> >  
> > +obj-$(CONFIG_VHOST_RPMSG) += vhost_rpmsg.o
> > +vhost_rpmsg-y := rpmsg.o
> > +
> >  obj-$(CONFIG_VHOST_SCSI) += vhost_scsi.o
> >  vhost_scsi-y := scsi.o
> >  
> > diff --git a/drivers/vhost/rpmsg.c b/drivers/vhost/rpmsg.c
> > new file mode 100644
> > index 000000000000..d7ab48414224
> > --- /dev/null
> > +++ b/drivers/vhost/rpmsg.c
> > @@ -0,0 +1,375 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright(c) 2020 Intel Corporation. All rights reserved.
> > + *
> > + * Author: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > + *
> > + * Vhost RPMsg VirtIO interface. It provides a set of functions to match the
> > + * guest side RPMsg VirtIO API, provided by drivers/rpmsg/virtio_rpmsg_bus.c
> > + * These functions handle creation of 2 virtual queues, handling of endpoint
> > + * addresses, sending a name-space announcement to the guest as well as any
> > + * user messages. This API can be used by any vhost driver to handle RPMsg
> > + * specific processing.
> > + * Specific vhost drivers, using this API will use their own VirtIO device
> > + * IDs, that should then also be added to the ID table in virtio_rpmsg_bus.c
> > + */
> > +
> > +#include <linux/compat.h>
> > +#include <linux/file.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/vhost.h>
> > +#include <linux/virtio_rpmsg.h>
> > +#include <uapi/linux/rpmsg.h>
> > +
> > +#include "vhost.h"
> > +#include "vhost_rpmsg.h"
> > +
> > +/*
> > + * All virtio-rpmsg virtual queue kicks always come with just one buffer -
> > + * either input or output
> > + */
> > +static int vhost_rpmsg_get_single(struct vhost_virtqueue *vq)
> > +{
> > +	struct vhost_rpmsg *vr = container_of(vq->dev, struct vhost_rpmsg, dev);
> > +	unsigned int out, in;
> > +	int head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov), &out, &in,
> > +				     NULL, NULL);
> > +	if (head < 0) {
> > +		vq_err(vq, "%s(): error %d getting buffer\n",
> > +		       __func__, head);
> > +		return head;
> > +	}
> > +
> > +	/* Nothing new? */
> > +	if (head == vq->num)
> > +		return head;
> > +
> > +	if (vq == &vr->vq[VIRTIO_RPMSG_RESPONSE] && (out || in != 1)) {
> 
> This in != 1 looks like a dependency on a specific message layout.
> virtio spec says to avoid these. Using iov iters it's not too hard to do
> ...

This is an RPMsg VirtIO implementation, and it has to match the virtio_rpmsg_bus.c 
driver, and that one has specific VirtIO queue and message usage patterns.

> > +		vq_err(vq,
> > +		       "%s(): invalid %d input and %d output in response queue\n",
> > +		       __func__, in, out);
> > +		goto return_buf;
> > +	}
> > +
> > +	if (vq == &vr->vq[VIRTIO_RPMSG_REQUEST] && (in || out != 1)) {
> > +		vq_err(vq,
> > +		       "%s(): invalid %d input and %d output in request queue\n",
> > +		       __func__, in, out);
> > +		goto return_buf;
> > +	}
> > +
> > +	return head;
> > +
> > +return_buf:
> > +	/*
> > +	 * FIXME: might need to return the buffer using vhost_add_used()
> > +	 * or vhost_discard_vq_desc(). vhost_discard_vq_desc() is
> > +	 * described as "being useful for error handling," but it makes
> > +	 * the thus discarded buffers "unseen," so next time we look we
> > +	 * retrieve them again?
> 
> 
> Yes. It's your decision what to do on error. if you also signal
> an eventfd using vq_err, then discarding will
> make it so userspace can poke at ring and hopefully fix it ...

I assume the user-space in this case is QEMU. Would it be the safest to use 
vhost_add_used() then?

> > +	 */
> > +	return -EINVAL;
> > +}

[snip]

> > +	return 0;
> > +
> > +return_buf:
> > +	/*
> > +	 * FIXME: vhost_discard_vq_desc() or vhost_add_used(), see comment in
> > +	 * vhost_rpmsg_get_single()
> > +	 */
> 
> What's to be done with this FIXME?

This is the same question as above - I just wasn't sure which error handling 
was appropriate here, don't think many vhost drivers do any od this...

Thanks
Guennadi
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
