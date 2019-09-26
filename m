Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B30BF6A8
	for <lists.virtualization@lfdr.de>; Thu, 26 Sep 2019 18:26:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 07438D67;
	Thu, 26 Sep 2019 16:26:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F2C83AD1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 16:26:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 751E38CF
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 16:26:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A492315C027;
	Thu, 26 Sep 2019 16:26:16 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42F615D9D5;
	Thu, 26 Sep 2019 16:26:08 +0000 (UTC)
Date: Thu, 26 Sep 2019 10:26:08 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V2 5/8] mdev: introduce device specific ops
Message-ID: <20190926102608.5ec81923@x1.home>
In-Reply-To: <20190926113958-mutt-send-email-mst@kernel.org>
References: <20190924135332.14160-1-jasowang@redhat.com>
	<20190924135332.14160-6-jasowang@redhat.com>
	<20190924170638.064d85f7@x1.home>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D58F754@SHSMSX104.ccr.corp.intel.com>
	<CAJPjb1+i7jb0aVfr=7CDuUBpeo_w3wAfTrnmuLVJ-h+qOV+1hw@mail.gmail.com>
	<20190925103028.1f2edf03@x1.home>
	<20190926113958-mutt-send-email-mst@kernel.org>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 26 Sep 2019 16:26:16 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"airlied@linux.ie" <airlied@linux.ie>,
	"joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
	"heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"kwankhede@nvidia.com" <kwankhede@nvidia.com>,
	Rob Miller <rob.miller@broadcom.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"sebott@linux.ibm.com" <sebott@linux.ibm.com>,
	"lulu@redhat.com" <lulu@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
	"haotian.wang@sifive.com" <haotian.wang@sifive.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"Wang, Zhi A" <zhi.a.wang@intel.com>,
	"idos@mellanox.com" <idos@mellanox.com>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"Wang, Xiao W" <xiao.w.wang@intel.com>,
	"freude@linux.ibm.com" <freude@linux.ibm.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
	"parav@mellanox.com" <parav@mellanox.com>, "Vivi, 
	Rodrigo" <rodrigo.vivi@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>, "Zhu,
	Lingshan" <lingshan.zhu@intel.com>,
	"akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "Wang,
	Zhihong" <zhihong.wang@intel.com>
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

On Thu, 26 Sep 2019 11:46:55 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Sep 25, 2019 at 10:30:28AM -0600, Alex Williamson wrote:
> > On Wed, 25 Sep 2019 10:11:00 -0400
> > Rob Miller <rob.miller@broadcom.com> wrote:  
> > > > > On Tue, 24 Sep 2019 21:53:29 +0800
> > > > > Jason Wang <jasowang@redhat.com> wrote:  
> > > > > > diff --git a/drivers/vfio/mdev/vfio_mdev.c    
> > > > > b/drivers/vfio/mdev/vfio_mdev.c    
> > > > > > index 891cf83a2d9a..95efa054442f 100644
> > > > > > --- a/drivers/vfio/mdev/vfio_mdev.c
> > > > > > +++ b/drivers/vfio/mdev/vfio_mdev.c
> > > > > > @@ -14,6 +14,7 @@
> > > > > >  #include <linux/slab.h>
> > > > > >  #include <linux/vfio.h>
> > > > > >  #include <linux/mdev.h>
> > > > > > +#include <linux/vfio_mdev.h>
> > > > > >
> > > > > >  #include "mdev_private.h"
> > > > > >
> > > > > > @@ -24,16 +25,16 @@
> > > > > >  static int vfio_mdev_open(void *device_data)
> > > > > >  {
> > > > > >     struct mdev_device *mdev = device_data;
> > > > > > -   struct mdev_parent *parent = mdev->parent;
> > > > > > +   const struct vfio_mdev_device_ops *ops =    
> > > > > mdev_get_dev_ops(mdev);    
> > > > > >     int ret;
> > > > > >
> > > > > > -   if (unlikely(!parent->ops->open))
> > > > > > +   if (unlikely(!ops->open))
> > > > > >             return -EINVAL;
> > > > > >
> > > > > >     if (!try_module_get(THIS_MODULE))
> > > > > >             return -ENODEV;    
> > > >    
> > >   
> > > RJM>] My understanding lately is that this call to    
> > > try_module_get(THIS_MODULE) is no longer needed as is considered as a
> > > latent bug.
> > > Quote from
> > > https://stackoverflow.com/questions/1741415/linux-kernel-modules-when-to-use-try-module-get-module-put
> > >  :
> > > There are a number of uses of try_module_get(THIS_MODULE) in the kernel
> > > source but most if not all of them are latent bugs that should be cleaned
> > > up.  
> > 
> > This use seems to fall exactly into the case where it is necessary, the
> > open here is not a direct VFS call, it's an internal interface between
> > modules.  The user is interacting with filesystem objects from the vfio
> > module and the module reference we're trying to acquire here is to the
> > vfio-mdev module.  Thanks,
> > 
> > Alex  
> 
> 
> I think the latent bug refers not to module get per se,
> but to the module_put tied to it. E.g.:
> 
>  static void vfio_mdev_release(void *device_data)
>  {
>         struct mdev_device *mdev = device_data;
>         struct mdev_parent *parent = mdev->parent;
> 
>         if (likely(parent->ops->release))
>                 parent->ops->release(mdev);
> 
>         module_put(THIS_MODULE);
> 
> Does anything prevent the module from unloading at this point?
> if not then ...
> 
> 
>  }
> 
> it looks like the implicit return (with instructions for argument pop
> and functuon return) here can get overwritten on module
> unload, causing a crash when executed.
> 
> IOW there's generally no way for module to keep a reference
> to itself: it can take a reference but it needs someone else
> to keep it and put.

I'd always assumed this would exit cleanly, but perhaps there is a
latent race there.  In any case, taking a module reference within the
module in this case is better than not doing so, as the latter would
potentially allow the module to be removed at any point in time, while
the former only seems to expose acquire and release gaps.  Add it to
the todo list.  Thanks,

Alex
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
