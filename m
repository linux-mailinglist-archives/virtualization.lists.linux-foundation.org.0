Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D641FEE46
	for <lists.virtualization@lfdr.de>; Thu, 18 Jun 2020 11:03:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7C27587FED;
	Thu, 18 Jun 2020 09:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbFB9NIwuIiZ; Thu, 18 Jun 2020 09:03:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C9CD187C8A;
	Thu, 18 Jun 2020 09:03:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9231EC016E;
	Thu, 18 Jun 2020 09:03:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CC44C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 09:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 74C7B87FED
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 09:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJcqcOztcPJA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 09:03:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 21AAD87C8A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 09:03:49 +0000 (UTC)
IronPort-SDR: CvcB9O/fhhR7RTmq5v8FxD1UbhJII336aJYa3rCh9lsWWiUdkgA32pnhJSIIYg64GM/jVFSAzg
 z+di5va+l9bQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="203985593"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="203985593"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 02:03:48 -0700
IronPort-SDR: /6kHDHX7wY1CRf0e6PPCtYuooZMheWGl/tF42hkNHlSAubcrMt9WbD6cJYqo6V6SVrDIB93lxX
 COgb867Ow9Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="261966815"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.48.152])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jun 2020 02:03:44 -0700
Date: Thu, 18 Jun 2020 11:03:42 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH v3 5/5] vhost: add an RPMsg API
Message-ID: <20200618090341.GA4189@ubuntu>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200527180541.5570-6-guennadi.liakhovetski@linux.intel.com>
 <20200617191741.whnp7iteb36cjnia@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617191741.whnp7iteb36cjnia@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-remoteproc@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 sound-open-firmware@alsa-project.org
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

Hi Vincent,

On Wed, Jun 17, 2020 at 09:17:42PM +0200, Vincent Whitchurch wrote:
> On Wed, May 27, 2020 at 08:05:41PM +0200, Guennadi Liakhovetski wrote:
> > Linux supports running the RPMsg protocol over the VirtIO transport
> > protocol, but currently there is only support for VirtIO clients and
> > no support for a VirtIO server. This patch adds a vhost-based RPMsg
> > server implementation.
> 
> This looks really useful, but why is it implemented as an API and not as
> a real vhost driver which implements an rpmsg bus?  If you implement it
> as a vhost driver which implements rpmsg_device_ops and
> rpmsg_endpoint_ops, then wouldn't you be able to implement your
> vhost-sof driver using the normal rpmsg APIs?

Sorry, not sure what you mean by the "normal rpmsg API?" Do you mean the 
VirtIO RPMsg API? But that's the opposite side of the link - that's the 
guest side in the VM case and the Linux side in the remoteproc case. What 
this API is adding is a vhost RPMsg API. The kernel vhost framework 
itself is essentially a library of functions. Kernel vhost drivers simply 
create a misc device and use the vhost functions for some common 
functionality. This RPMsg vhost API stays in the same concept and provides 
further functions for RPMsg specific vhost operation.

> I tried quickly hooking up this code to such a vhost driver and I was
> able to communicate between host and guest systems with both
> rpmsg-client-sample and rpmsg-char which almost no modifications to
> those drivers.

You mean you used this patch to create RPMsg vhost drivers? Without 
creating a vhost RPMsg bus? Nice, glad to hear that!

Thanks
Guennadi
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
