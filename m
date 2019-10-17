Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A951BDB4ED
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 19:53:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 67E38F6A;
	Thu, 17 Oct 2019 17:53:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 14E54C74
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 17:53:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6BE4A5D3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 17:53:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20DFA8AC6FB;
	Thu, 17 Oct 2019 17:53:22 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A39035C1D6;
	Thu, 17 Oct 2019 17:53:10 +0000 (UTC)
Date: Thu, 17 Oct 2019 11:53:10 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH V4 3/6] mdev: introduce device specific ops
Message-ID: <20191017115310.0481cc52@x1.home>
In-Reply-To: <20191017170755.15506ada.cohuck@redhat.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
	<20191017104836.32464-4-jasowang@redhat.com>
	<20191017170755.15506ada.cohuck@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Thu, 17 Oct 2019 17:53:22 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, intel-gfx@lists.freedesktop.org,
	zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
	gor@linux.ibm.com, jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	parav@mellanox.com, zhihong.wang@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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

On Thu, 17 Oct 2019 17:07:55 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Thu, 17 Oct 2019 18:48:33 +0800
> Jason Wang <jasowang@redhat.com> wrote:
> 
> > Currently, except for the create and remove, the rest of
> > mdev_parent_ops is designed for vfio-mdev driver only and may not help
> > for kernel mdev driver. With the help of class id, this patch
> > introduces device specific callbacks inside mdev_device
> > structure. This allows different set of callback to be used by
> > vfio-mdev and virtio-mdev.
> > 
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  .../driver-api/vfio-mediated-device.rst       | 25 +++++----
> >  MAINTAINERS                                   |  1 +
> >  drivers/gpu/drm/i915/gvt/kvmgt.c              | 18 ++++---
> >  drivers/s390/cio/vfio_ccw_ops.c               | 18 ++++---
> >  drivers/s390/crypto/vfio_ap_ops.c             | 14 +++--
> >  drivers/vfio/mdev/mdev_core.c                 | 18 +++++--
> >  drivers/vfio/mdev/mdev_private.h              |  1 +
> >  drivers/vfio/mdev/vfio_mdev.c                 | 37 ++++++-------
> >  include/linux/mdev.h                          | 45 ++++------------
> >  include/linux/vfio_mdev.h                     | 52 +++++++++++++++++++
> >  samples/vfio-mdev/mbochs.c                    | 20 ++++---
> >  samples/vfio-mdev/mdpy.c                      | 20 ++++---
> >  samples/vfio-mdev/mtty.c                      | 18 ++++---
> >  13 files changed, 184 insertions(+), 103 deletions(-)
> >  create mode 100644 include/linux/vfio_mdev.h
> > 
> > diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
> > index f9a78d75a67a..0cca84d19603 100644
> > --- a/Documentation/driver-api/vfio-mediated-device.rst
> > +++ b/Documentation/driver-api/vfio-mediated-device.rst
> > @@ -152,11 +152,22 @@ callbacks per mdev parent device, per mdev type, or any other categorization.
> >  Vendor drivers are expected to be fully asynchronous in this respect or
> >  provide their own internal resource protection.)
> >  
> > -The callbacks in the mdev_parent_ops structure are as follows:
> > -
> > -* open: open callback of mediated device
> > -* close: close callback of mediated device
> > -* ioctl: ioctl callback of mediated device
> > +As multiple types of mediated devices may be supported, the device
> > +must set up the class id and the device specific callbacks in create()  
> 
> s/in create()/in the create()/
> 
> > +callback. E.g for vfio-mdev device it needs to be done through:  
> 
> "Each class provides a helper function to do so; e.g. for vfio-mdev
> devices, the function to be called is:"
> 
> ?
> 
> > +
> > +    int mdev_set_vfio_ops(struct mdev_device *mdev,
> > +                          const struct vfio_mdev_ops *vfio_ops);
> > +
> > +The class id (set to MDEV_CLASS_ID_VFIO) is used to match a device  
> 
> "(set by this helper function to MDEV_CLASS_ID_VFIO)" ?
> 
> > +with an mdev driver via its id table. The device specific callbacks
> > +(specified in *ops) are obtainable via mdev_get_dev_ops() (for use by  
> 
> "(specified in *vfio_ops by the caller)" ?
> 
> > +the mdev bus driver). A vfio-mdev device (class id MDEV_CLASS_ID_VFIO)
> > +uses the following device-specific ops:
> > +
> > +* open: open callback of vfio mediated device
> > +* close: close callback of vfio mediated device
> > +* ioctl: ioctl callback of vfio mediated device
> >  * read : read emulation callback
> >  * write: write emulation callback
> >  * mmap: mmap emulation callback
> > @@ -167,10 +178,6 @@ register itself with the mdev core driver::
> >  	extern int  mdev_register_device(struct device *dev,
> >  	                                 const struct mdev_parent_ops *ops);
> >  
> > -It is also required to specify the class_id in create() callback through::
> > -
> > -	int mdev_set_class(struct mdev_device *mdev, u16 id);
> > -  
> 
> I'm wondering if this patch set should start out with introducing
> helper functions already (i.e. don't introduce mdev_set_class(), but
> start out with mdev_set_class_vfio() which will gain the *vfio_ops
> argument in this patch.)

Yes, it would be cleaner, but is it really worth the churn?  Correct me
if I'm wrong, but I think we get to the same point after this patch and
aside from the function name itself, the difference is really just that
the class_id is briefly exposed to the parent driver, right?  Thanks,

Alex
 
> >  However, the mdev_parent_ops structure is not required in the function call
> >  that a driver should use to unregister itself with the mdev core driver::
> >    
> 
> (...)
> 
> > diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
> > index 3a9c52d71b4e..d0f3113c8071 100644
> > --- a/drivers/vfio/mdev/mdev_core.c
> > +++ b/drivers/vfio/mdev/mdev_core.c
> > @@ -45,15 +45,23 @@ void mdev_set_drvdata(struct mdev_device *mdev, void *data)
> >  }
> >  EXPORT_SYMBOL(mdev_set_drvdata);
> >  
> > -/* Specify the class for the mdev device, this must be called during
> > - * create() callback.
> > +/* Specify the VFIO device ops for the mdev device, this
> > + * must be called during create() callback for VFIO mdev device.
> >   */  
> 
> /*
>  * Specify the mdev device to be a VFIO mdev device, and set the
>  * VFIO devices ops for it. This must be called from the create()
>  * callback for VFIO mdev devices.
>  */
> 
> ?
> 
> > -void mdev_set_class(struct mdev_device *mdev, u16 id)
> > +void mdev_set_vfio_ops(struct mdev_device *mdev,
> > +		       const struct vfio_mdev_device_ops *vfio_ops)
> >  {
> >  	WARN_ON(mdev->class_id);
> > -	mdev->class_id = id;
> > +	mdev->class_id = MDEV_CLASS_ID_VFIO;
> > +	mdev->device_ops = vfio_ops;
> >  }
> > -EXPORT_SYMBOL(mdev_set_class);
> > +EXPORT_SYMBOL(mdev_set_vfio_ops);
> > +
> > +const void *mdev_get_dev_ops(struct mdev_device *mdev)
> > +{
> > +	return mdev->device_ops;
> > +}
> > +EXPORT_SYMBOL(mdev_get_dev_ops);
> >  
> >  struct device *mdev_dev(struct mdev_device *mdev)
> >  {  
> 
> (...)
> 
> The code change looks good to me; I'm just wondering if we should
> introduce mdev_set_class() at all (see above).

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
