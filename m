Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C7116552F
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 03:42:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 66D5784B37;
	Thu, 20 Feb 2020 02:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eAwob-H-Ei9a; Thu, 20 Feb 2020 02:42:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2385384AE3;
	Thu, 20 Feb 2020 02:42:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AA21C013E;
	Thu, 20 Feb 2020 02:42:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32149C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 02:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 220BA204A7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 02:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xr5bWvaMJt-m
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 02:42:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id A5E8D203EE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 02:42:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 18:42:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,462,1574150400"; d="scan'208";a="229327721"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
 by orsmga008.jf.intel.com with ESMTP; 19 Feb 2020 18:42:42 -0800
Date: Thu, 20 Feb 2020 10:42:21 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200220024220.GA43609@___>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <20200218135359.GA9608@ziepe.ca> <20200219025217.GA971968@___>
 <20200219131102.GN31668@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219131102.GN31668@ziepe.ca>
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

On Wed, Feb 19, 2020 at 09:11:02AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 19, 2020 at 10:52:38AM +0800, Tiwei Bie wrote:
> > > > +static int __init vhost_vdpa_init(void)
> > > > +{
> > > > +	int r;
> > > > +
> > > > +	idr_init(&vhost_vdpa.idr);
> > > > +	mutex_init(&vhost_vdpa.mutex);
> > > > +	init_waitqueue_head(&vhost_vdpa.release_q);
> > > > +
> > > > +	/* /dev/vhost-vdpa/$vdpa_device_index */
> > > > +	vhost_vdpa.class = class_create(THIS_MODULE, "vhost-vdpa");
> > > > +	if (IS_ERR(vhost_vdpa.class)) {
> > > > +		r = PTR_ERR(vhost_vdpa.class);
> > > > +		goto err_class;
> > > > +	}
> > > > +
> > > > +	vhost_vdpa.class->devnode = vhost_vdpa_devnode;
> > > > +
> > > > +	r = alloc_chrdev_region(&vhost_vdpa.devt, 0, MINORMASK + 1,
> > > > +				"vhost-vdpa");
> > > > +	if (r)
> > > > +		goto err_alloc_chrdev;
> > > > +
> > > > +	cdev_init(&vhost_vdpa.cdev, &vhost_vdpa_fops);
> > > > +	r = cdev_add(&vhost_vdpa.cdev, vhost_vdpa.devt, MINORMASK + 1);
> > > > +	if (r)
> > > > +		goto err_cdev_add;
> > > 
> > > It is very strange, is the intention to create a single global char
> > > dev?
> > 
> > No. It's to create a per-vdpa char dev named
> > vhost-vdpa/$vdpa_device_index in dev.
> > 
> > I followed the code in VFIO which creates char dev
> > vfio/$GROUP dynamically, e.g.:
> > 
> > https://github.com/torvalds/linux/blob/b1da3acc781c/drivers/vfio/vfio.c#L2164-L2180
> > https://github.com/torvalds/linux/blob/b1da3acc781c/drivers/vfio/vfio.c#L373-L387
> > https://github.com/torvalds/linux/blob/b1da3acc781c/drivers/vfio/vfio.c#L1553
> > 
> > Is it something unwanted?
> 
> Yes it is unwanted. This is some special pattern for vfio's unique
> needs. 
> 
> Since this has a struct device for each char dev instance please use
> the normal cdev_device_add() driven pattern here, or justify why it
> needs to be special like this.

I see. Thanks! I will embed the cdev in each vhost_vdpa
structure directly.

Regards,
Tiwei

> 
> Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
