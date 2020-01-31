Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF4F14E887
	for <lists.virtualization@lfdr.de>; Fri, 31 Jan 2020 06:54:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BCD1C2043B;
	Fri, 31 Jan 2020 05:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id soVAPnKoQl6m; Fri, 31 Jan 2020 05:54:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 04624203A7;
	Fri, 31 Jan 2020 05:54:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0CEEC0171;
	Fri, 31 Jan 2020 05:54:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C514C0171
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 05:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 79C1887D17
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 05:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Zs5kINMrdfP
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 05:54:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E54DA87CB5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 05:54:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 21:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,384,1574150400"; d="scan'208";a="377255838"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
 by orsmga004.jf.intel.com with ESMTP; 30 Jan 2020 21:54:12 -0800
Date: Fri, 31 Jan 2020 13:54:04 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200131055403.GB111365@___>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <43aeecb4-4c08-df3d-1c1d-699ec4c494bd@infradead.org>
 <05e21ed9-d5af-b57c-36cd-50b34915e82d@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05e21ed9-d5af-b57c-36cd-50b34915e82d@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: kvm@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, jgg@mellanox.com,
 rob.miller@broadcom.com, lulu@redhat.com, maxime.coquelin@redhat.com,
 hch@infradead.org, eperezma@redhat.com, haotian.wang@sifive.com,
 mhabets@solarflare.com, shahafs@mellanox.com, parav@mellanox.com,
 jiri@mellanox.com, zhihong.wang@intel.com, netdev@vger.kernel.org,
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

On Thu, Jan 30, 2020 at 09:12:57PM -0800, Randy Dunlap wrote:
> On 1/30/20 7:56 PM, Randy Dunlap wrote:
> > Hi,
> > 
> > On 1/30/20 7:36 PM, Tiwei Bie wrote:
> >> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> >> index f21c45aa5e07..13e6a94d0243 100644
> >> --- a/drivers/vhost/Kconfig
> >> +++ b/drivers/vhost/Kconfig
> >> @@ -34,6 +34,18 @@ config VHOST_VSOCK
> >>  	To compile this driver as a module, choose M here: the module will be called
> >>  	vhost_vsock.
> >>  
> >> +config VHOST_VDPA
> >> +	tristate "Vhost driver for vDPA based backend"
> 
> oops, missed this one:
> 	                           vDPA-based

Will fix. Thanks!

> 
> >> +	depends on EVENTFD && VDPA
> >> +	select VHOST
> >> +	default n
> >> +	---help---
> >> +	This kernel module can be loaded in host kernel to accelerate
> >> +	guest virtio devices with the vDPA based backends.
> > 
> > 	                              vDPA-based
> > 
> >> +
> >> +	To compile this driver as a module, choose M here: the module
> >> +	will be called vhost_vdpa.
> >> +
> > 
> > The preferred Kconfig style nowadays is
> > (a) use "help" instead of "---help---"
> > (b) indent the help text with one tab + 2 spaces
> > 
> > and don't use "default n" since that is already the default.
> > 
> >>  config VHOST
> >>  	tristate
> >>          depends on VHOST_IOTLB
> > 
> > thanks.
> > 
> 
> 
> -- 
> ~Randy
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
