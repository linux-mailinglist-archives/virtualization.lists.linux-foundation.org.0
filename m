Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFDB163A8D
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 03:52:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8F6784EB9;
	Wed, 19 Feb 2020 02:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YONCs23YzgWD; Wed, 19 Feb 2020 02:52:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EACD984D9F;
	Wed, 19 Feb 2020 02:52:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5858C013E;
	Wed, 19 Feb 2020 02:52:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0312CC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 02:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F293E845C0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 02:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gTb4EAcJJM8y
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 02:52:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2BAEE84553
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 02:52:54 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 18:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,458,1574150400"; d="scan'208";a="258770970"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
 by fmsmga004.fm.intel.com with ESMTP; 18 Feb 2020 18:52:48 -0800
Date: Wed, 19 Feb 2020 10:52:38 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200219025217.GA971968@___>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <20200218135359.GA9608@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218135359.GA9608@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: kvm@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, maxime.coquelin@redhat.com, hch@infradead.org,
 eperezma@redhat.com, haotian.wang@sifive.com, mhabets@solarflare.com,
 shahafs@mellanox.com, parav@mellanox.com, jiri@mellanox.com,
 zhihong.wang@intel.com, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, hanand@xilinx.com, lingshan.zhu@intel.com
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

On Tue, Feb 18, 2020 at 09:53:59AM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 31, 2020 at 11:36:51AM +0800, Tiwei Bie wrote:
> 
> > +static int vhost_vdpa_alloc_minor(struct vhost_vdpa *v)
> > +{
> > +	return idr_alloc(&vhost_vdpa.idr, v, 0, MINORMASK + 1,
> > +			 GFP_KERNEL);
> > +}
> 
> Please don't use idr in new code, use xarray directly
> 
> > +static int vhost_vdpa_probe(struct device *dev)
> > +{
> > +	struct vdpa_device *vdpa = dev_to_vdpa(dev);
> > +	const struct vdpa_config_ops *ops = vdpa->config;
> > +	struct vhost_vdpa *v;
> > +	struct device *d;
> > +	int minor, nvqs;
> > +	int r;
> > +
> > +	/* Currently, we only accept the network devices. */
> > +	if (ops->get_device_id(vdpa) != VIRTIO_ID_NET) {
> > +		r = -ENOTSUPP;
> > +		goto err;
> > +	}
> > +
> > +	v = kzalloc(sizeof(*v), GFP_KERNEL | __GFP_RETRY_MAYFAIL);
> > +	if (!v) {
> > +		r = -ENOMEM;
> > +		goto err;
> > +	}
> > +
> > +	nvqs = VHOST_VDPA_VQ_MAX;
> > +
> > +	v->vqs = kmalloc_array(nvqs, sizeof(struct vhost_virtqueue),
> > +			       GFP_KERNEL);
> > +	if (!v->vqs) {
> > +		r = -ENOMEM;
> > +		goto err_alloc_vqs;
> > +	}
> > +
> > +	mutex_init(&v->mutex);
> > +	atomic_set(&v->opened, 0);
> > +
> > +	v->vdpa = vdpa;
> > +	v->nvqs = nvqs;
> > +	v->virtio_id = ops->get_device_id(vdpa);
> > +
> > +	mutex_lock(&vhost_vdpa.mutex);
> > +
> > +	minor = vhost_vdpa_alloc_minor(v);
> > +	if (minor < 0) {
> > +		r = minor;
> > +		goto err_alloc_minor;
> > +	}
> > +
> > +	d = device_create(vhost_vdpa.class, NULL,
> > +			  MKDEV(MAJOR(vhost_vdpa.devt), minor),
> > +			  v, "%d", vdpa->index);
> > +	if (IS_ERR(d)) {
> > +		r = PTR_ERR(d);
> > +		goto err_device_create;
> > +	}
> > +
> 
> I can't understand what this messing around with major/minor numbers
> does. Without allocating a cdev via cdev_add/etc there is only a
> single char dev in existence here. This and the stuff in
> vhost_vdpa_open() looks non-functional.

I followed the code in VFIO. Please see more details below.

> 
> > +static void vhost_vdpa_remove(struct device *dev)
> > +{
> > +	DEFINE_WAIT_FUNC(wait, woken_wake_function);
> > +	struct vhost_vdpa *v = dev_get_drvdata(dev);
> > +	int opened;
> > +
> > +	add_wait_queue(&vhost_vdpa.release_q, &wait);
> > +
> > +	do {
> > +		opened = atomic_cmpxchg(&v->opened, 0, 1);
> > +		if (!opened)
> > +			break;
> > +		wait_woken(&wait, TASK_UNINTERRUPTIBLE, HZ * 10);
> > +	} while (1);
> > +
> > +	remove_wait_queue(&vhost_vdpa.release_q, &wait);
> 
> *barf* use the normal refcount pattern please
> 
> read side:
> 
>   refcount_inc_not_zero(uses)
>   //stuff
>   if (refcount_dec_and_test(uses))
>      complete(completer)
> 
> destroy side:
>   if (refcount_dec_and_test(uses))
>      complete(completer)
>   wait_for_completion(completer)
>   // refcount now permanently == 0
> 
> Use a completion in driver code
> 
> > +	mutex_lock(&vhost_vdpa.mutex);
> > +	device_destroy(vhost_vdpa.class,
> > +		       MKDEV(MAJOR(vhost_vdpa.devt), v->minor));
> > +	vhost_vdpa_free_minor(v->minor);
> > +	mutex_unlock(&vhost_vdpa.mutex);
> > +	kfree(v->vqs);
> > +	kfree(v);
> 
> This use after-fress vs vhost_vdpa_open prior to it setting the open
> bit. Maybe use xarray, rcu and kfree_rcu ..
> 
> > +static int __init vhost_vdpa_init(void)
> > +{
> > +	int r;
> > +
> > +	idr_init(&vhost_vdpa.idr);
> > +	mutex_init(&vhost_vdpa.mutex);
> > +	init_waitqueue_head(&vhost_vdpa.release_q);
> > +
> > +	/* /dev/vhost-vdpa/$vdpa_device_index */
> > +	vhost_vdpa.class = class_create(THIS_MODULE, "vhost-vdpa");
> > +	if (IS_ERR(vhost_vdpa.class)) {
> > +		r = PTR_ERR(vhost_vdpa.class);
> > +		goto err_class;
> > +	}
> > +
> > +	vhost_vdpa.class->devnode = vhost_vdpa_devnode;
> > +
> > +	r = alloc_chrdev_region(&vhost_vdpa.devt, 0, MINORMASK + 1,
> > +				"vhost-vdpa");
> > +	if (r)
> > +		goto err_alloc_chrdev;
> > +
> > +	cdev_init(&vhost_vdpa.cdev, &vhost_vdpa_fops);
> > +	r = cdev_add(&vhost_vdpa.cdev, vhost_vdpa.devt, MINORMASK + 1);
> > +	if (r)
> > +		goto err_cdev_add;
> 
> It is very strange, is the intention to create a single global char
> dev?

No. It's to create a per-vdpa char dev named
vhost-vdpa/$vdpa_device_index in dev.

I followed the code in VFIO which creates char dev
vfio/$GROUP dynamically, e.g.:

https://github.com/torvalds/linux/blob/b1da3acc781c/drivers/vfio/vfio.c#L2164-L2180
https://github.com/torvalds/linux/blob/b1da3acc781c/drivers/vfio/vfio.c#L373-L387
https://github.com/torvalds/linux/blob/b1da3acc781c/drivers/vfio/vfio.c#L1553

Is it something unwanted?

Thanks for the review.

Regards,
Tiwei

> 
> If so, why is there this:
> 
> +static int vhost_vdpa_open(struct inode *inode, struct file *filep)
> +{
> +	struct vhost_vdpa *v;
> +	struct vhost_dev *dev;
> +	struct vhost_virtqueue **vqs;
> +	int nvqs, i, r, opened;
> +
> +	v = vhost_vdpa_get_from_minor(iminor(inode));
> 
> ?
> 
> If the idea is to create a per-vdpa char dev then this stuff belongs
> in vhost_vdpa_probe(), the cdev should be part of the vhost_vdpa, and
> the above should be container_of not an idr lookup.
> 
> Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
