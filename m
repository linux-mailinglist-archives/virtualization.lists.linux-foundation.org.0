Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B6FB48A2
	for <lists.virtualization@lfdr.de>; Tue, 17 Sep 2019 09:56:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E84801107;
	Tue, 17 Sep 2019 07:56:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 26A2C1107
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 07:56:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E43E176D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 07:56:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Sep 2019 00:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,515,1559545200"; d="scan'208";a="198613151"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
	by orsmga002.jf.intel.com with ESMTP; 17 Sep 2019 00:56:00 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Tue, 17 Sep 2019 00:56:00 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
	fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Tue, 17 Sep 2019 00:55:59 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
	SHSMSX108.ccr.corp.intel.com ([169.254.8.146]) with mapi id
	14.03.0439.000; Tue, 17 Sep 2019 15:55:58 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>, "kwankhede@nvidia.com"
	<kwankhede@nvidia.com>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>
Subject: RE: [RFC PATCH 1/2] mdev: device id support
Thread-Topic: [RFC PATCH 1/2] mdev: device id support
Thread-Index: AQHVaU43yYRO2jFY+0WKxy+p3wCayqcvhaCg
Date: Tue, 17 Sep 2019 07:55:57 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D579F2F@SHSMSX104.ccr.corp.intel.com>
References: <20190912094012.29653-1-jasowang@redhat.com>
	<20190912094012.29653-2-jasowang@redhat.com>
In-Reply-To: <20190912094012.29653-2-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODNhYjAxYmMtYmYzYi00ZmRhLWE0ODItOTlkM2MzNGM5N2NkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQ25HV1hBMTFGbG1oXC9QRml1MmRvb2xtWitHYUw0ckd3VVF2TDhJcHFIb1lhZFFtRVVTTjZOcEFwSkRBKzdNYk4ifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
	"mst@redhat.com" <mst@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
	"joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
	"heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"rob.miller@broadcom.com" <rob.miller@broadcom.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "Wang,
	Zhi A" <zhi.a.wang@intel.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"idos@mellanox.com" <idos@mellanox.com>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"Wang, Xiao W" <xiao.w.wang@intel.com>,
	"freude@linux.ibm.com" <freude@linux.ibm.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Vivi,
	Rodrigo" <rodrigo.vivi@intel.com>,
	"akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
	"pmorel@linux.ibm.com" <pmorel@linux.ibm.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
	"maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "Wang, 
	Zhihong" <zhihong.wang@intel.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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

> From: Jason Wang
> Sent: Thursday, September 12, 2019 5:40 PM
> 
> Mdev bus only support vfio driver right now, so it doesn't implement
> match method. But in the future, we may add drivers other than vfio,
> one example is virtio-mdev[1] driver. This means we need to add device
> id support in bus match method to pair the mdev device and mdev driver
> correctly.

"device id" sound a bit confusing to me - it usually means something
unique to each device, while here it is used to indicate expected driver
types (vfio, virtio, etc.). but using "bus id" is also not good - we have
only one mdev bus here. Then what about "class id"?

> 
> So this patch add id_table to mdev_driver and id for mdev parent, and
> implement the match method for mdev bus.
> 
> [1] https://lkml.org/lkml/2019/9/10/135
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c  |  2 +-
>  drivers/s390/cio/vfio_ccw_ops.c   |  2 +-
>  drivers/s390/crypto/vfio_ap_ops.c |  3 ++-
>  drivers/vfio/mdev/mdev_core.c     | 14 ++++++++++++--
>  drivers/vfio/mdev/mdev_driver.c   | 14 ++++++++++++++
>  drivers/vfio/mdev/mdev_private.h  |  1 +
>  drivers/vfio/mdev/vfio_mdev.c     |  6 ++++++
>  include/linux/mdev.h              |  6 +++++-
>  include/linux/mod_devicetable.h   |  6 ++++++
>  samples/vfio-mdev/mbochs.c        |  2 +-
>  samples/vfio-mdev/mdpy.c          |  2 +-
>  samples/vfio-mdev/mtty.c          |  2 +-
>  12 files changed, 51 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c
> b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 23aa3e50cbf8..19d51a35f019 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1625,7 +1625,7 @@ static int kvmgt_host_init(struct device *dev, void
> *gvt, const void *ops)
>  		return -EFAULT;
>  	intel_vgpu_ops.supported_type_groups = kvm_vgpu_type_groups;
> 
> -	return mdev_register_device(dev, &intel_vgpu_ops);
> +	return mdev_register_vfio_device(dev, &intel_vgpu_ops);
>  }
> 
>  static void kvmgt_host_exit(struct device *dev)
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c
> b/drivers/s390/cio/vfio_ccw_ops.c
> index 5eb61116ca6f..f87d9409e290 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -578,7 +578,7 @@ static const struct mdev_parent_ops
> vfio_ccw_mdev_ops = {
> 
>  int vfio_ccw_mdev_reg(struct subchannel *sch)
>  {
> -	return mdev_register_device(&sch->dev, &vfio_ccw_mdev_ops);
> +	return mdev_register_vfio_device(&sch->dev,
> &vfio_ccw_mdev_ops);
>  }
> 
>  void vfio_ccw_mdev_unreg(struct subchannel *sch)
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c
> b/drivers/s390/crypto/vfio_ap_ops.c
> index 0604b49a4d32..eacbde3c7a97 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -1295,7 +1295,8 @@ int vfio_ap_mdev_register(void)
>  {
>  	atomic_set(&matrix_dev->available_instances,
> MAX_ZDEV_ENTRIES_EXT);
> 
> -	return mdev_register_device(&matrix_dev->device,
> &vfio_ap_matrix_ops);
> +	return mdev_register_vfio_device(&matrix_dev->device,
> +					 &vfio_ap_matrix_ops);
>  }
> 
>  void vfio_ap_mdev_unregister(void)
> diff --git a/drivers/vfio/mdev/mdev_core.c
> b/drivers/vfio/mdev/mdev_core.c
> index b558d4cfd082..fc07ff3ebe96 100644
> --- a/drivers/vfio/mdev/mdev_core.c
> +++ b/drivers/vfio/mdev/mdev_core.c
> @@ -135,11 +135,14 @@ static int mdev_device_remove_cb(struct device
> *dev, void *data)
>   * mdev_register_device : Register a device
>   * @dev: device structure representing parent device.
>   * @ops: Parent device operation structure to be registered.
> + * @id: device id.
>   *
>   * Add device to list of registered parent devices.
>   * Returns a negative value on error, otherwise 0.
>   */
> -int mdev_register_device(struct device *dev, const struct
> mdev_parent_ops *ops)
> +int mdev_register_device(struct device *dev,
> +			 const struct mdev_parent_ops *ops,
> +			 u8 id)
>  {
>  	int ret;
>  	struct mdev_parent *parent;
> @@ -175,6 +178,7 @@ int mdev_register_device(struct device *dev, const
> struct mdev_parent_ops *ops)
> 
>  	parent->dev = dev;
>  	parent->ops = ops;
> +	parent->device_id = id;
> 
>  	if (!mdev_bus_compat_class) {
>  		mdev_bus_compat_class =
> class_compat_register("mdev_bus");
> @@ -208,7 +212,13 @@ int mdev_register_device(struct device *dev, const
> struct mdev_parent_ops *ops)
>  		put_device(dev);
>  	return ret;
>  }
> -EXPORT_SYMBOL(mdev_register_device);
> +
> +int mdev_register_vfio_device(struct device *dev,
> +			      const struct mdev_parent_ops *ops)
> +{
> +	return mdev_register_device(dev, ops, MDEV_ID_VFIO);
> +}
> +EXPORT_SYMBOL(mdev_register_vfio_device);
> 
>  /*
>   * mdev_unregister_device : Unregister a parent device
> diff --git a/drivers/vfio/mdev/mdev_driver.c
> b/drivers/vfio/mdev/mdev_driver.c
> index 0d3223aee20b..fd5e9541d18e 100644
> --- a/drivers/vfio/mdev/mdev_driver.c
> +++ b/drivers/vfio/mdev/mdev_driver.c
> @@ -69,8 +69,22 @@ static int mdev_remove(struct device *dev)
>  	return 0;
>  }
> 
> +static int mdev_match(struct device *dev, struct device_driver *drv)
> +{
> +	unsigned int i;
> +	struct mdev_device *mdev = to_mdev_device(dev);
> +	struct mdev_driver *mdrv = to_mdev_driver(drv);
> +	const struct mdev_device_id *ids = mdrv->id_table;
> +
> +	for (i = 0; ids[i].id; i++)
> +		if (ids[i].id == mdev->parent->device_id)
> +			return 1;
> +	return 0;
> +}
> +
>  struct bus_type mdev_bus_type = {
>  	.name		= "mdev",
> +	.match		= mdev_match,
>  	.probe		= mdev_probe,
>  	.remove		= mdev_remove,
>  };
> diff --git a/drivers/vfio/mdev/mdev_private.h
> b/drivers/vfio/mdev/mdev_private.h
> index 7d922950caaf..7fc8153671e0 100644
> --- a/drivers/vfio/mdev/mdev_private.h
> +++ b/drivers/vfio/mdev/mdev_private.h
> @@ -22,6 +22,7 @@ struct mdev_parent {
>  	struct list_head type_list;
>  	/* Synchronize device creation/removal with parent unregistration
> */
>  	struct rw_semaphore unreg_sem;
> +	u8 device_id;
>  };
> 
>  struct mdev_device {
> diff --git a/drivers/vfio/mdev/vfio_mdev.c
> b/drivers/vfio/mdev/vfio_mdev.c
> index 30964a4e0a28..887c57f10880 100644
> --- a/drivers/vfio/mdev/vfio_mdev.c
> +++ b/drivers/vfio/mdev/vfio_mdev.c
> @@ -120,10 +120,16 @@ static void vfio_mdev_remove(struct device *dev)
>  	vfio_del_group_dev(dev);
>  }
> 
> +static struct mdev_device_id id_table[] = {
> +	{ MDEV_ID_VFIO },
> +	{ 0 },
> +};
> +
>  static struct mdev_driver vfio_mdev_driver = {
>  	.name	= "vfio_mdev",
>  	.probe	= vfio_mdev_probe,
>  	.remove	= vfio_mdev_remove,
> +	.id_table = id_table,
>  };
> 
>  static int __init vfio_mdev_init(void)
> diff --git a/include/linux/mdev.h b/include/linux/mdev.h
> index 0ce30ca78db0..f85045392120 100644
> --- a/include/linux/mdev.h
> +++ b/include/linux/mdev.h
> @@ -118,6 +118,7 @@ struct mdev_type_attribute
> mdev_type_attr_##_name =		\
>   * @probe: called when new device created
>   * @remove: called when device removed
>   * @driver: device driver structure
> + * @id_table: the ids serviced by this driver.
>   *
>   **/
>  struct mdev_driver {
> @@ -125,6 +126,7 @@ struct mdev_driver {
>  	int  (*probe)(struct device *dev);
>  	void (*remove)(struct device *dev);
>  	struct device_driver driver;
> +	const struct mdev_device_id *id_table;
>  };
> 
>  #define to_mdev_driver(drv)	container_of(drv, struct mdev_driver, driver)
> @@ -135,7 +137,7 @@ const guid_t *mdev_uuid(struct mdev_device
> *mdev);
> 
>  extern struct bus_type mdev_bus_type;
> 
> -int mdev_register_device(struct device *dev, const struct
> mdev_parent_ops *ops);
> +int mdev_register_vfio_device(struct device *dev, const struct
> mdev_parent_ops *ops);
>  void mdev_unregister_device(struct device *dev);
> 
>  int mdev_register_driver(struct mdev_driver *drv, struct module *owner);
> @@ -145,4 +147,6 @@ struct device *mdev_parent_dev(struct
> mdev_device *mdev);
>  struct device *mdev_dev(struct mdev_device *mdev);
>  struct mdev_device *mdev_from_dev(struct device *dev);
> 
> +#define MDEV_ID_VFIO 1 /* VFIO device */
> +
>  #endif /* MDEV_H */
> diff --git a/include/linux/mod_devicetable.h
> b/include/linux/mod_devicetable.h
> index 5714fd35a83c..f1fc143df042 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -821,4 +821,10 @@ struct wmi_device_id {
>  	const void *context;
>  };
> 
> +/* MDEV */
> +
> +struct mdev_device_id {
> +	__u8 id;
> +};
> +
>  #endif /* LINUX_MOD_DEVICETABLE_H */
> diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> index ac5c8c17b1ff..71a4469be85d 100644
> --- a/samples/vfio-mdev/mbochs.c
> +++ b/samples/vfio-mdev/mbochs.c
> @@ -1468,7 +1468,7 @@ static int __init mbochs_dev_init(void)
>  	if (ret)
>  		goto failed2;
> 
> -	ret = mdev_register_device(&mbochs_dev, &mdev_fops);
> +	ret = mdev_register_vfio_device(&mbochs_dev, &mdev_fops);
>  	if (ret)
>  		goto failed3;
> 
> diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
> index cc86bf6566e4..d3029dd27d91 100644
> --- a/samples/vfio-mdev/mdpy.c
> +++ b/samples/vfio-mdev/mdpy.c
> @@ -775,7 +775,7 @@ static int __init mdpy_dev_init(void)
>  	if (ret)
>  		goto failed2;
> 
> -	ret = mdev_register_device(&mdpy_dev, &mdev_fops);
> +	ret = mdev_register_vfio_device(&mdpy_dev, &mdev_fops);
>  	if (ret)
>  		goto failed3;
> 
> diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
> index 92e770a06ea2..744c88a6b22c 100644
> --- a/samples/vfio-mdev/mtty.c
> +++ b/samples/vfio-mdev/mtty.c
> @@ -1468,7 +1468,7 @@ static int __init mtty_dev_init(void)
>  	if (ret)
>  		goto failed2;
> 
> -	ret = mdev_register_device(&mtty_dev.dev, &mdev_fops);
> +	ret = mdev_register_vfio_device(&mtty_dev.dev, &mdev_fops);
>  	if (ret)
>  		goto failed3;
> 
> --
> 2.19.1
> 
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
