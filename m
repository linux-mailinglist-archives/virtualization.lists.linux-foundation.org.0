Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48DB5448
	for <lists.virtualization@lfdr.de>; Tue, 17 Sep 2019 19:31:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 826F5150F;
	Tue, 17 Sep 2019 17:31:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 10A2B10CE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 17:31:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AA23F83A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 17:31:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88C9E10C0932;
	Tue, 17 Sep 2019 17:31:34 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3ABBC60852;
	Tue, 17 Sep 2019 17:31:26 +0000 (UTC)
Date: Tue, 17 Sep 2019 11:31:25 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH 0/2] Mdev: support mutiple kinds of devices
Message-ID: <20190917113125.6b2970e5@x1.home>
In-Reply-To: <20190912094012.29653-1-jasowang@redhat.com>
References: <20190912094012.29653-1-jasowang@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.66]);
	Tue, 17 Sep 2019 17:31:35 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: sebott@linux.ibm.com, mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org, oberpar@linux.ibm.com,
	kwankhede@nvidia.com, rob.miller@broadcom.com,
	linux-s390@vger.kernel.org, kvm@vger.kernel.org,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
	gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	Parav Pandit <parav@mellanox.com>, rodrigo.vivi@intel.com,
	virtualization@lists.linux-foundation.org,
	intel-gvt-dev@lists.freedesktop.org, lingshan.zhu@intel.com,
	akrowiak@linux.ibm.com, pmorel@linux.ibm.com, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, zhihong.wang@intel.com
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

[cc +Parav]

On Thu, 12 Sep 2019 17:40:10 +0800
Jason Wang <jasowang@redhat.com> wrote:

> Hi all:
> 
> During the development of virtio-mdev[1]. I find that mdev needs to be
> extended to support devices other than vfio mdev device. So this
> series tries to extend the mdev to be able to differ from different
> devices by:
> 
> - device id and matching for mdev bus
> - device speicfic callbacks and move vfio callbacks there
> 
> Sent for early reivew, compile test only!
> 
> Thanks
> 
> [1] https://lkml.org/lkml/2019/9/10/135

I expect Parav must have something similar in the works for their
in-kernel networking mdev support.  Link to discussion so far:

https://lore.kernel.org/kvm/20190912094012.29653-1-jasowang@redhat.com/T/#t

Thanks,
Alex


> Jason Wang (2):
>   mdev: device id support
>   mdev: introduce device specific ops
> 
>  drivers/gpu/drm/i915/gvt/kvmgt.c  | 16 ++++---
>  drivers/s390/cio/vfio_ccw_ops.c   | 16 ++++---
>  drivers/s390/crypto/vfio_ap_ops.c | 13 ++++--
>  drivers/vfio/mdev/mdev_core.c     | 14 +++++-
>  drivers/vfio/mdev/mdev_driver.c   | 14 ++++++
>  drivers/vfio/mdev/mdev_private.h  |  1 +
>  drivers/vfio/mdev/vfio_mdev.c     | 36 ++++++++++-----
>  include/linux/mdev.h              | 76 +++++++++++++++++++------------
>  include/linux/mod_devicetable.h   |  6 +++
>  samples/vfio-mdev/mbochs.c        | 18 +++++---
>  samples/vfio-mdev/mdpy.c          | 18 +++++---
>  samples/vfio-mdev/mtty.c          | 16 ++++---
>  12 files changed, 163 insertions(+), 81 deletions(-)
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
