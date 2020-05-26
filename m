Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F041E2A57
	for <lists.virtualization@lfdr.de>; Tue, 26 May 2020 20:55:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D14C8886DC;
	Tue, 26 May 2020 18:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oWNDw8a+I6DK; Tue, 26 May 2020 18:55:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DB77886DF;
	Tue, 26 May 2020 18:55:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BB2FC016F;
	Tue, 26 May 2020 18:55:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B850C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 18:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 747858771E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 18:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DC48MSfr-OjI
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 18:55:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B3C9C8680C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 18:55:26 +0000 (UTC)
IronPort-SDR: DX7ntjenVwVkutEczZNjbHlp1a6cub4HMhxaXFIJRA+YY89V23bxQbYsYZ7xrFDke8i29VLKSd
 xKamZpSVqcGw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 11:55:25 -0700
IronPort-SDR: LM8Rw2civZIYcAzaibIqLsIxMtiExBEGRfS9EcMikWRkbrKkBBVxqfVFXBc89l2TIM4QIyNZcU
 Pa09HC0Hu5KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="468453839"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.45.66])
 by fmsmga006.fm.intel.com with ESMTP; 26 May 2020 11:55:24 -0700
Date: Tue, 26 May 2020 20:55:22 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [Sound-open-firmware] [PATCH 5/6] vhost: add an rpmsg API
Message-ID: <20200526185522.GA6992@ubuntu>
References: <20200516101109.2624-1-guennadi.liakhovetski@linux.intel.com>
 <20200516101109.2624-6-guennadi.liakhovetski@linux.intel.com>
 <9737e3f2-e59c-0174-9254-a2d8f29f30b7@linux.intel.com>
 <20200525135336.GB6761@ubuntu>
 <59029e07-f49b-8d1a-4eb4-2f6d5775cf54@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59029e07-f49b-8d1a-4eb4-2f6d5775cf54@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 sound-open-firmware@alsa-project.org, linux-remoteproc@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Hi Pierre,

On Tue, May 26, 2020 at 01:30:24PM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 5/25/20 8:53 AM, Guennadi Liakhovetski wrote:
> > Hi Pierre,
> > 
> > On Sat, May 16, 2020 at 12:00:35PM -0500, Pierre-Louis Bossart wrote:
> > > 
> > > > +config VHOST_RPMSG
> > > > +	tristate
> > > > +	depends on VHOST
> > > 
> > > depends on RPMSG_VIRTIO?
> > 
> > No, RPMSG_VIRTIO is used on the guest side, VHOST_RPMSG (as well as
> > all other vhost drivers) on the host side.
> 
> I vaguely recalled something about sockets, and was wondering if there isn't
> a dependency on this:
> 
> config VHOST_VSOCK
> 	tristate "vhost virtio-vsock driver"
> 	depends on VSOCKETS && EVENTFD && VHOST_DPN
> 	select VHOST

You probably are thinking about the first patch in the series "vhost: convert 
VHOST_VSOCK_SET_RUNNING to a generic ioctl." But no, this RPMsg driver 
doesn't depend on vsock, on the contrary, it takes a (albeit tiny) piece of 
functionality from vsock and makes it global.

Thanks
Guennadi
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
