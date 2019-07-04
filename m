Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 981995F100
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 03:38:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 245C2CB0;
	Thu,  4 Jul 2019 01:38:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 12131CAB
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 01:38:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9F53E87C
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 01:38:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2019 18:38:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,449,1557212400"; d="scan'208";a="169312757"
Received: from npg-dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.151])
	by orsmga006.jf.intel.com with ESMTP; 03 Jul 2019 18:38:00 -0700
Date: Thu, 4 Jul 2019 09:36:36 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v2] vhost: introduce mdev based hardware vhost backend
Message-ID: <20190704013636.GA26992@___>
References: <20190703091339.1847-1-tiwei.bie@intel.com>
	<20190703123157.2452bf95@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703123157.2452bf95@x1.home>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	maxime.coquelin@redhat.com, zhihong.wang@intel.com
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

On Wed, Jul 03, 2019 at 12:31:57PM -0600, Alex Williamson wrote:
> On Wed,  3 Jul 2019 17:13:39 +0800
> Tiwei Bie <tiwei.bie@intel.com> wrote:
> > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> > index 8f10748dac79..6c5718ab7eeb 100644
> > --- a/include/uapi/linux/vfio.h
> > +++ b/include/uapi/linux/vfio.h
> > @@ -201,6 +201,7 @@ struct vfio_device_info {
> >  #define VFIO_DEVICE_FLAGS_AMBA  (1 << 3)	/* vfio-amba device */
> >  #define VFIO_DEVICE_FLAGS_CCW	(1 << 4)	/* vfio-ccw device */
> >  #define VFIO_DEVICE_FLAGS_AP	(1 << 5)	/* vfio-ap device */
> > +#define VFIO_DEVICE_FLAGS_VHOST	(1 << 6)	/* vfio-vhost device */
> >  	__u32	num_regions;	/* Max region index + 1 */
> >  	__u32	num_irqs;	/* Max IRQ index + 1 */
> >  };
> > @@ -217,6 +218,7 @@ struct vfio_device_info {
> >  #define VFIO_DEVICE_API_AMBA_STRING		"vfio-amba"
> >  #define VFIO_DEVICE_API_CCW_STRING		"vfio-ccw"
> >  #define VFIO_DEVICE_API_AP_STRING		"vfio-ap"
> > +#define VFIO_DEVICE_API_VHOST_STRING		"vfio-vhost"
> >  
> >  /**
> >   * VFIO_DEVICE_GET_REGION_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 8,
> > @@ -573,6 +575,23 @@ enum {
> >  	VFIO_CCW_NUM_IRQS
> >  };
> >  
> > +/*
> > + * The vfio-vhost bus driver makes use of the following fixed region and
> > + * IRQ index mapping. Unimplemented regions return a size of zero.
> > + * Unimplemented IRQ types return a count of zero.
> > + */
> > +
> > +enum {
> > +	VFIO_VHOST_CONFIG_REGION_INDEX,
> > +	VFIO_VHOST_NOTIFY_REGION_INDEX,
> > +	VFIO_VHOST_NUM_REGIONS
> > +};
> > +
> > +enum {
> > +	VFIO_VHOST_VQ_IRQ_INDEX,
> > +	VFIO_VHOST_NUM_IRQS
> > +};
> > +
> 
> Note that the vfio API has evolved a bit since vfio-pci started this
> way, with fixed indexes for pre-defined region types.  We now support
> device specific regions which can be identified by a capability within
> the REGION_INFO ioctl return data.  This allows a bit more flexibility,
> at the cost of complexity, but the infrastructure already exists in
> kernel and QEMU to make it relatively easy.  I think we'll have the
> same support for interrupts soon too.  If you continue to pursue the
> vfio-vhost direction you might want to consider these before committing
> to fixed indexes.  Thanks,

Thanks for the details! Will give it a try!

Thanks,
Tiwei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
