Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B014E883
	for <lists.virtualization@lfdr.de>; Fri, 31 Jan 2020 06:52:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 36C3C8743E;
	Fri, 31 Jan 2020 05:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOEchxs3Br1u; Fri, 31 Jan 2020 05:52:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 44DCE8723D;
	Fri, 31 Jan 2020 05:52:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A488C0171;
	Fri, 31 Jan 2020 05:52:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC000C0171
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 05:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A774D87D17
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 05:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FX4pil5kBFjz
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 05:52:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6429D87CB5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 05:52:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 21:52:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,384,1574150400"; d="scan'208";a="430265359"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jan 2020 21:52:21 -0800
Date: Fri, 31 Jan 2020 13:52:13 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200131055213.GA111365@___>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <43aeecb4-4c08-df3d-1c1d-699ec4c494bd@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43aeecb4-4c08-df3d-1c1d-699ec4c494bd@infradead.org>
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

On Thu, Jan 30, 2020 at 07:56:43PM -0800, Randy Dunlap wrote:
> Hi,
> 
> On 1/30/20 7:36 PM, Tiwei Bie wrote:
> > diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> > index f21c45aa5e07..13e6a94d0243 100644
> > --- a/drivers/vhost/Kconfig
> > +++ b/drivers/vhost/Kconfig
> > @@ -34,6 +34,18 @@ config VHOST_VSOCK
> >  	To compile this driver as a module, choose M here: the module will be called
> >  	vhost_vsock.
> >  
> > +config VHOST_VDPA
> > +	tristate "Vhost driver for vDPA based backend"
> > +	depends on EVENTFD && VDPA
> > +	select VHOST
> > +	default n
> > +	---help---
> > +	This kernel module can be loaded in host kernel to accelerate
> > +	guest virtio devices with the vDPA based backends.
> 
> 	                              vDPA-based

Will fix this and other similar ones in the patch. Thanks!

> 
> > +
> > +	To compile this driver as a module, choose M here: the module
> > +	will be called vhost_vdpa.
> > +
> 
> The preferred Kconfig style nowadays is
> (a) use "help" instead of "---help---"
> (b) indent the help text with one tab + 2 spaces
> 
> and don't use "default n" since that is already the default.

Will fix in the next version.

Thanks,
Tiwei

> 
> >  config VHOST
> >  	tristate
> >          depends on VHOST_IOTLB
> 
> thanks.
> -- 
> ~Randy
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
