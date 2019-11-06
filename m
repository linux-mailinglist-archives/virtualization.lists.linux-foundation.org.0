Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9360AF18D1
	for <lists.virtualization@lfdr.de>; Wed,  6 Nov 2019 15:38:31 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D51AFC83;
	Wed,  6 Nov 2019 14:38:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EE877C03
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 14:38:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 76FEC8AB
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 14:38:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2019 06:38:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="214264460"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2019 06:38:21 -0800
Date: Wed, 6 Nov 2019 22:39:07 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5] vhost: introduce mdev based hardware backend
Message-ID: <20191106143907.GA10776@___>
References: <20191105115332.11026-1-tiwei.bie@intel.com>
	<20191106075733-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106075733-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zhihong.wang@intel.com,
	virtualization@lists.linux-foundation.org,
	maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

On Wed, Nov 06, 2019 at 07:59:02AM -0500, Michael S. Tsirkin wrote:
> On Tue, Nov 05, 2019 at 07:53:32PM +0800, Tiwei Bie wrote:
> > This patch introduces a mdev based hardware vhost backend.
> > This backend is built on top of the same abstraction used
> > in virtio-mdev and provides a generic vhost interface for
> > userspace to accelerate the virtio devices in guest.
> > 
> > This backend is implemented as a mdev device driver on top
> > of the same mdev device ops used in virtio-mdev but using
> > a different mdev class id, and it will register the device
> > as a VFIO device for userspace to use. Userspace can setup
> > the IOMMU with the existing VFIO container/group APIs and
> > then get the device fd with the device name. After getting
> > the device fd, userspace can use vhost ioctls on top of it
> > to setup the backend.
> > 
> > Signed-off-by: Tiwei Bie <tiwei.bie@intel.com>
> 
> So at this point, looks like the only thing missing is IFC, and then all
> these patches can go in.
> But as IFC is still being worked on anyway, it makes sense to
> address the minor comments manwhile so we don't need
> patches on top.
> Right?

Yeah, of course.

Thanks,
Tiwei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
