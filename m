Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 618CAD732E
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 12:26:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0E2DDB7A;
	Tue, 15 Oct 2019 10:26:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6A362B7A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 10:26:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E7EF18A0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 10:26:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3DBA306F4AB;
	Tue, 15 Oct 2019 10:26:22 +0000 (UTC)
Received: from gondolin (dhcp-192-233.str.redhat.com [10.33.192.233])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6ACB65DA8C;
	Tue, 15 Oct 2019 10:26:09 +0000 (UTC)
Date: Tue, 15 Oct 2019 12:26:07 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 1/7] mdev: class id support
Message-ID: <20191015122607.126e3960.cohuck@redhat.com>
In-Reply-To: <20191011081557.28302-2-jasowang@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
	<20191011081557.28302-2-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 15 Oct 2019 10:26:26 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
	airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
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

On Fri, 11 Oct 2019 16:15:51 +0800
Jason Wang <jasowang@redhat.com> wrote:

> Mdev bus only supports vfio driver right now, so it doesn't implement
> match method. But in the future, we may add drivers other than vfio,
> the first driver could be virtio-mdev. This means we need to add
> device class id support in bus match method to pair the mdev device
> and mdev driver correctly.
> 
> So this patch adds id_table to mdev_driver and class_id for mdev
> device with the match method for mdev bus.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  Documentation/driver-api/vfio-mediated-device.rst |  7 ++++++-
>  drivers/gpu/drm/i915/gvt/kvmgt.c                  |  1 +
>  drivers/s390/cio/vfio_ccw_ops.c                   |  1 +
>  drivers/s390/crypto/vfio_ap_ops.c                 |  1 +
>  drivers/vfio/mdev/mdev_core.c                     | 11 +++++++++++
>  drivers/vfio/mdev/mdev_driver.c                   | 14 ++++++++++++++
>  drivers/vfio/mdev/mdev_private.h                  |  1 +
>  drivers/vfio/mdev/vfio_mdev.c                     |  6 ++++++
>  include/linux/mdev.h                              |  8 ++++++++
>  include/linux/mod_devicetable.h                   |  8 ++++++++
>  samples/vfio-mdev/mbochs.c                        |  1 +
>  samples/vfio-mdev/mdpy.c                          |  1 +
>  samples/vfio-mdev/mtty.c                          |  1 +
>  13 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
> index 25eb7d5b834b..2035e48da7b2 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -102,12 +102,14 @@ structure to represent a mediated device's driver::
>        * @probe: called when new device created
>        * @remove: called when device removed
>        * @driver: device driver structure
> +      * @id_table: the ids serviced by this driver
>        */
>       struct mdev_driver {
>  	     const char *name;
>  	     int  (*probe)  (struct device *dev);
>  	     void (*remove) (struct device *dev);
>  	     struct device_driver    driver;
> +	     const struct mdev_class_id *id_table;
>       };
>  
>  A mediated bus driver for mdev should use this structure in the function calls
> @@ -165,12 +167,15 @@ register itself with the mdev core driver::
>  	extern int  mdev_register_device(struct device *dev,
>  	                                 const struct mdev_parent_ops *ops);
>  
> +It is also required to specify the class_id through::
> +
> +	extern int mdev_set_class(struct device *dev, u16 id);

Should the document state explicitly that this should be done in the
->create() callback? Also, I think that the class_id might be different
for different mdevs (even if the parent is the same) -- should that be
mentioned explicitly?

> +
>  However, the mdev_parent_ops structure is not required in the function call
>  that a driver should use to unregister itself with the mdev core driver::
>  
>  	extern void mdev_unregister_device(struct device *dev);
>  
> -
>  Mediated Device Management Interface Through sysfs
>  ==================================================
>  
(...)

Looks reasonable to me.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
