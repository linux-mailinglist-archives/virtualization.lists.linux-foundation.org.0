Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC7F263E5F
	for <lists.virtualization@lfdr.de>; Thu, 10 Sep 2020 09:18:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 420088758F;
	Thu, 10 Sep 2020 07:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N6SDffxJTQa5; Thu, 10 Sep 2020 07:18:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1BC5E8758D;
	Thu, 10 Sep 2020 07:18:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB1E7C0051;
	Thu, 10 Sep 2020 07:18:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4105AC0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 07:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 35A6B204E9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 07:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RSdtHLfFJsD7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 07:18:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by silver.osuosl.org (Postfix) with ESMTPS id 225C4204BF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 07:18:48 +0000 (UTC)
IronPort-SDR: W/sEeK8sUlQKUdmRBMPlInFukW+Pnc0b6vcuNy7WdoBDGAquK7c/oCwxwVzv+ZkxMyMfCaROHc
 hFHxxMAF+6xQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="146203304"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="146203304"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 00:18:47 -0700
IronPort-SDR: C4xNaFHVegFkhmFhEuyJbIo4ffq0n12ZF2U8OD+oSwANc3qi4x1/CL8kxfCpeRnZZcZ9zoHTTd
 CtOdnG5ETgMA==
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="286480336"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.39.14])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 00:18:44 -0700
Date: Thu, 10 Sep 2020 09:18:41 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v5 3/4] rpmsg: update documentation
Message-ID: <20200910071841.GA17698@ubuntu>
References: <20200826174636.23873-1-guennadi.liakhovetski@linux.intel.com>
 <20200826174636.23873-4-guennadi.liakhovetski@linux.intel.com>
 <20200909224521.GC562265@xps15>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909224521.GC562265@xps15>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-remoteproc@vger.kernel.org,
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

On Wed, Sep 09, 2020 at 04:45:21PM -0600, Mathieu Poirier wrote:
> On Wed, Aug 26, 2020 at 07:46:35PM +0200, Guennadi Liakhovetski wrote:
> > rpmsg_create_ept() takes struct rpmsg_channel_info chinfo as its last
> > argument, not a u32 value. The first two arguments are also updated.
> > 
> > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > ---
> >  Documentation/rpmsg.txt | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/rpmsg.txt b/Documentation/rpmsg.txt
> > index 24b7a9e1a5f9..1ce353cb232a 100644
> > --- a/Documentation/rpmsg.txt
> > +++ b/Documentation/rpmsg.txt
> > @@ -192,9 +192,9 @@ Returns 0 on success and an appropriate error value on failure.
> >  
> >  ::
> >  
> > -  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_channel *rpdev,
> > -		void (*cb)(struct rpmsg_channel *, void *, int, void *, u32),
> > -		void *priv, u32 addr);
> > +  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
> > +					  rpmsg_rx_cb_t cb, void *priv,
> > +					  struct rpmsg_channel_info chinfo);
> 
> Again I don't see this being used in this set...  It should have been sent on
> its own to the remoteproc and documentation mailing list.  Note that
> Documentation/rpmsg.txt is now Documentation/staging/rpmsg.rst

Sure, can send it separately.

Thanks
Guennadi

> >  every rpmsg address in the system is bound to an rx callback (so when
> >  inbound messages arrive, they are dispatched by the rpmsg bus using the
> > -- 
> > 2.28.0
> > 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
