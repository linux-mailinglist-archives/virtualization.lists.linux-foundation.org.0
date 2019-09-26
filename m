Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2E4BF62C
	for <lists.virtualization@lfdr.de>; Thu, 26 Sep 2019 17:47:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0F4B3CA1;
	Thu, 26 Sep 2019 15:47:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EC7398BF
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 15:47:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5AB4E8B3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 15:47:10 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A73B02CE955
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 15:47:09 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id k67so2841429qkc.3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 08:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=1yylcDQZ8r+5S5Gz7KG/29d/sKE5Q6ALcFR6qx+xQGA=;
	b=KeNVzKNThLxScF7N1iSIwdmTdnyXsshAhnJX2oBFlxw2RFpPhLc/m5TzbAT65EcmsV
	+6YDXodZf7/Z8FNzfGqQThaT5dvmOArZXS22t7jGe/7JOkMJE+dzzGb2LhlViRPGWD0V
	s6TDimPoneMJcloa4U5emUdI+/z4MnaF0oUlDTWfM/K2mkUnuuDx16cA4cc0ymHRXouy
	j8MKr4KJ5gSlZsw2m48MESY8Qx8OqHJ6R6e1ToGaFdEdPDsK0fJZikXwegFq3cRJ/dHD
	+1QjnneiffsgsZXKcRc3TgQfLK7Lq8G06o64Tv7OlWrVKw8yxcBF+2gXryRzL5ICVx/m
	YCYw==
X-Gm-Message-State: APjAAAWLAYq4MLRxbEMOSb9GWbToR8nx/8xDTfQq1Hh8LsS1hxj4J7FF
	s2ngJeYpVE401gOY96bWaZgYkmieOjzT688fi09/EW83s1pJMCjUxGU9haQezUHseQOX9W4grLZ
	dF9Ry3Dj0kW5cGHMpb7I+sX4/5zKtyV5tgjFx6XDPkA==
X-Received: by 2002:aed:2ce7:: with SMTP id g94mr4560945qtd.255.1569512828849; 
	Thu, 26 Sep 2019 08:47:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxXMLxPwOJSKW86VAhg+FA92BB2rFSPpVANRc+kAYWWIKkKpR3hJkzdDy+E5U7AhQ5WZnHHfA==
X-Received: by 2002:aed:2ce7:: with SMTP id g94mr4560904qtd.255.1569512828546; 
	Thu, 26 Sep 2019 08:47:08 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id a4sm1354995qkf.91.2019.09.26.08.46.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 08:47:07 -0700 (PDT)
Date: Thu, 26 Sep 2019 11:46:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH V2 5/8] mdev: introduce device specific ops
Message-ID: <20190926113958-mutt-send-email-mst@kernel.org>
References: <20190924135332.14160-1-jasowang@redhat.com>
	<20190924135332.14160-6-jasowang@redhat.com>
	<20190924170638.064d85f7@x1.home>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D58F754@SHSMSX104.ccr.corp.intel.com>
	<CAJPjb1+i7jb0aVfr=7CDuUBpeo_w3wAfTrnmuLVJ-h+qOV+1hw@mail.gmail.com>
	<20190925103028.1f2edf03@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925103028.1f2edf03@x1.home>
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

On Wed, Sep 25, 2019 at 10:30:28AM -0600, Alex Williamson wrote:
> On Wed, 25 Sep 2019 10:11:00 -0400
> Rob Miller <rob.miller@broadcom.com> wrote:
> > > > On Tue, 24 Sep 2019 21:53:29 +0800
> > > > Jason Wang <jasowang@redhat.com> wrote:
> > > > > diff --git a/drivers/vfio/mdev/vfio_mdev.c  
> > > > b/drivers/vfio/mdev/vfio_mdev.c  
> > > > > index 891cf83a2d9a..95efa054442f 100644
> > > > > --- a/drivers/vfio/mdev/vfio_mdev.c
> > > > > +++ b/drivers/vfio/mdev/vfio_mdev.c
> > > > > @@ -14,6 +14,7 @@
> > > > >  #include <linux/slab.h>
> > > > >  #include <linux/vfio.h>
> > > > >  #include <linux/mdev.h>
> > > > > +#include <linux/vfio_mdev.h>
> > > > >
> > > > >  #include "mdev_private.h"
> > > > >
> > > > > @@ -24,16 +25,16 @@
> > > > >  static int vfio_mdev_open(void *device_data)
> > > > >  {
> > > > >     struct mdev_device *mdev = device_data;
> > > > > -   struct mdev_parent *parent = mdev->parent;
> > > > > +   const struct vfio_mdev_device_ops *ops =  
> > > > mdev_get_dev_ops(mdev);  
> > > > >     int ret;
> > > > >
> > > > > -   if (unlikely(!parent->ops->open))
> > > > > +   if (unlikely(!ops->open))
> > > > >             return -EINVAL;
> > > > >
> > > > >     if (!try_module_get(THIS_MODULE))
> > > > >             return -ENODEV;  
> > >  
> > 
> > RJM>] My understanding lately is that this call to  
> > try_module_get(THIS_MODULE) is no longer needed as is considered as a
> > latent bug.
> > Quote from
> > https://stackoverflow.com/questions/1741415/linux-kernel-modules-when-to-use-try-module-get-module-put
> >  :
> > There are a number of uses of try_module_get(THIS_MODULE) in the kernel
> > source but most if not all of them are latent bugs that should be cleaned
> > up.
> 
> This use seems to fall exactly into the case where it is necessary, the
> open here is not a direct VFS call, it's an internal interface between
> modules.  The user is interacting with filesystem objects from the vfio
> module and the module reference we're trying to acquire here is to the
> vfio-mdev module.  Thanks,
> 
> Alex


I think the latent bug refers not to module get per se,
but to the module_put tied to it. E.g.:

 static void vfio_mdev_release(void *device_data)
 {
        struct mdev_device *mdev = device_data;
        struct mdev_parent *parent = mdev->parent;

        if (likely(parent->ops->release))
                parent->ops->release(mdev);

        module_put(THIS_MODULE);

Does anything prevent the module from unloading at this point?
if not then ...


 }

it looks like the implicit return (with instructions for argument pop
and functuon return) here can get overwritten on module
unload, causing a crash when executed.

IOW there's generally no way for module to keep a reference
to itself: it can take a reference but it needs someone else
to keep it and put.


-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
