Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA681FF46C
	for <lists.virtualization@lfdr.de>; Thu, 18 Jun 2020 16:14:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3E7318953F;
	Thu, 18 Jun 2020 14:14:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uuV1x11C1m2o; Thu, 18 Jun 2020 14:14:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B282489576;
	Thu, 18 Jun 2020 14:14:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82CDBC016E;
	Thu, 18 Jun 2020 14:14:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E97E5C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 14:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D710E8953F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 14:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlCaq0HEeuCn
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 14:14:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EC4BC8947B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 14:14:18 +0000 (UTC)
IronPort-SDR: EDY7CRZs2JpJyHhIjb30CuZ8v7V/McPIFuUHywS2Q5RWs3echTliiQYtihqNhHzxpqZ1UnKnpP
 HP3wM6eAkUcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="207822842"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="207822842"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 07:14:18 -0700
IronPort-SDR: 0itBy+xKAWbv8XVSzGrTX5a00QgANjZmuLmz4Kd9PS8ZFk8J8KQqQXg3VyR0B1cefAsJZ3FOOt
 28jlxIVBXIqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="477253979"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.48.152])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jun 2020 07:14:15 -0700
Date: Thu, 18 Jun 2020 16:14:12 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH v3 5/5] vhost: add an RPMsg API
Message-ID: <20200618141412.GD4189@ubuntu>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200527180541.5570-6-guennadi.liakhovetski@linux.intel.com>
 <20200617191741.whnp7iteb36cjnia@axis.com>
 <20200618090341.GA4189@ubuntu>
 <20200618093324.tu7oldr332ndfgev@axis.com>
 <20200618103940.GB4189@ubuntu>
 <20200618135241.362iuggde3jslx3p@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618135241.362iuggde3jslx3p@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>
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

On Thu, Jun 18, 2020 at 03:52:42PM +0200, Vincent Whitchurch wrote:
> On Thu, Jun 18, 2020 at 12:39:40PM +0200, Guennadi Liakhovetski wrote:
> > On Thu, Jun 18, 2020 at 11:33:24AM +0200, Vincent Whitchurch wrote:
> > > By the "normal rpmsg API" I mean register_rpmsg_driver(), rpmsg_send(),
> > > etc.  That API is not tied to virtio in any way and there are other
> > > non-virtio backends for this API in the tree.  So it seems quite natural
> > > to implement a vhost backend for this API so that both sides of the link
> > > can use the same API but different backends, instead of forcing them to
> > > use of different APIs.
> > 
> > Ok, I see what you mean now. But I'm not sure this is useful or desired. I'm 
> > not an expert in KVM / VirtIO, I've only been working in the area for less 
> > than a year, so, I might well be wrong.
> > 
> > You're proposing to use the rpmsg API in vhost drivers. As far as I 
> > understand so far that API was only designated for the Linux side (in case of 
> > AMPs) which corresponds to VM guests in virtualisation case. So, I'm not sure 
> > we want to use the same API for the hosts? This can be done as you have 
> > illustrated, but is it desirable? The vhost API is far enough from the VirtIO 
> > driver API, so I'm not sure why we want the same API for rpmsg?
> 
> Note that "the Linux side" is ambiguous for AMP since both sides can be
> Linux, as they happen to be in my case.  I'm running virtio/rpmsg
> between two physical processors (of different architectures), both
> running Linux.

Ok, interesting, I didn't know such configurations were used too. I understood 
the Linux rpmsg implementation in the way, that it's assumed, that the "host" 
has to boot the "device" by sending an ELF formatted executable image to it, is 
that optional? You aren't sending a complete Linux image to the device side, 
are you?

> virtio has distinct driver and device roles so the completely different
> APIs on each side are understandable.  But I don't see that distinction
> in the rpmsg API which is why it seems like a good idea to me to make it
> work from both sides of the link and allow the reuse of drivers like
> rpmsg-char, instead of imposing virtio's distinction on rpmsg.

Understand. In principle I'm open to this idea, but before I implement it it 
would be good to know what maintainers think?

Thanks
Guennadi
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
