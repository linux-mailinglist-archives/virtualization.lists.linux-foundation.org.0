Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2365EBAD
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 20:32:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 70FC6DD5;
	Wed,  3 Jul 2019 18:32:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 79B0AB1F
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 18:32:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2281F782
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 18:32:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5D31307D846;
	Wed,  3 Jul 2019 18:32:04 +0000 (UTC)
Received: from x1.home (ovpn-116-83.phx2.redhat.com [10.3.116.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1818F83085;
	Wed,  3 Jul 2019 18:31:58 +0000 (UTC)
Date: Wed, 3 Jul 2019 12:31:57 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Tiwei Bie <tiwei.bie@intel.com>
Subject: Re: [RFC v2] vhost: introduce mdev based hardware vhost backend
Message-ID: <20190703123157.2452bf95@x1.home>
In-Reply-To: <20190703091339.1847-1-tiwei.bie@intel.com>
References: <20190703091339.1847-1-tiwei.bie@intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 03 Jul 2019 18:32:09 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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

On Wed,  3 Jul 2019 17:13:39 +0800
Tiwei Bie <tiwei.bie@intel.com> wrote:
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 8f10748dac79..6c5718ab7eeb 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -201,6 +201,7 @@ struct vfio_device_info {
>  #define VFIO_DEVICE_FLAGS_AMBA  (1 << 3)	/* vfio-amba device */
>  #define VFIO_DEVICE_FLAGS_CCW	(1 << 4)	/* vfio-ccw device */
>  #define VFIO_DEVICE_FLAGS_AP	(1 << 5)	/* vfio-ap device */
> +#define VFIO_DEVICE_FLAGS_VHOST	(1 << 6)	/* vfio-vhost device */
>  	__u32	num_regions;	/* Max region index + 1 */
>  	__u32	num_irqs;	/* Max IRQ index + 1 */
>  };
> @@ -217,6 +218,7 @@ struct vfio_device_info {
>  #define VFIO_DEVICE_API_AMBA_STRING		"vfio-amba"
>  #define VFIO_DEVICE_API_CCW_STRING		"vfio-ccw"
>  #define VFIO_DEVICE_API_AP_STRING		"vfio-ap"
> +#define VFIO_DEVICE_API_VHOST_STRING		"vfio-vhost"
>  
>  /**
>   * VFIO_DEVICE_GET_REGION_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 8,
> @@ -573,6 +575,23 @@ enum {
>  	VFIO_CCW_NUM_IRQS
>  };
>  
> +/*
> + * The vfio-vhost bus driver makes use of the following fixed region and
> + * IRQ index mapping. Unimplemented regions return a size of zero.
> + * Unimplemented IRQ types return a count of zero.
> + */
> +
> +enum {
> +	VFIO_VHOST_CONFIG_REGION_INDEX,
> +	VFIO_VHOST_NOTIFY_REGION_INDEX,
> +	VFIO_VHOST_NUM_REGIONS
> +};
> +
> +enum {
> +	VFIO_VHOST_VQ_IRQ_INDEX,
> +	VFIO_VHOST_NUM_IRQS
> +};
> +

Note that the vfio API has evolved a bit since vfio-pci started this
way, with fixed indexes for pre-defined region types.  We now support
device specific regions which can be identified by a capability within
the REGION_INFO ioctl return data.  This allows a bit more flexibility,
at the cost of complexity, but the infrastructure already exists in
kernel and QEMU to make it relatively easy.  I think we'll have the
same support for interrupts soon too.  If you continue to pursue the
vfio-vhost direction you might want to consider these before committing
to fixed indexes.  Thanks,

Alex
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
