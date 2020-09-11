Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C45265AF9
	for <lists.virtualization@lfdr.de>; Fri, 11 Sep 2020 09:59:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 97AFB20780;
	Fri, 11 Sep 2020 07:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Mdb0SbW9UnT; Fri, 11 Sep 2020 07:59:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 21F8620519;
	Fri, 11 Sep 2020 07:59:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00B66C0051;
	Fri, 11 Sep 2020 07:59:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A87FCC0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 07:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 805F72050F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 07:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urxR7M1t3EPL
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 07:59:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by silver.osuosl.org (Postfix) with ESMTPS id 455C320506
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 07:59:19 +0000 (UTC)
IronPort-SDR: XKR9gY1pSEUHul5AmmlkClcBoe96QZ8VjDKe174GvsP0i90p5jDPeHAoxfC/TFbJCVu7OGhZFY
 WT5vIJFuKpdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="220267407"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; d="scan'208";a="220267407"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 00:59:18 -0700
IronPort-SDR: iDT9vVAuH2W1PbzfD/zs+OjLyNdr4CigVukWNXDRllpKhMI7QnnLfYbitFQE61Jnlvi3krOJSk
 OlymXk/fwhSw==
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; d="scan'208";a="344563126"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.38.203])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 00:59:16 -0700
Date: Fri, 11 Sep 2020 09:59:12 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v5 1/4] vhost: convert VHOST_VSOCK_SET_RUNNING to a
 generic ioctl
Message-ID: <20200911075912.GB26801@ubuntu>
References: <20200826174636.23873-1-guennadi.liakhovetski@linux.intel.com>
 <20200826174636.23873-2-guennadi.liakhovetski@linux.intel.com>
 <20200909224214.GB562265@xps15> <20200910062144.GA16802@ubuntu>
 <20200910164643.GA579940@xps15>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910164643.GA579940@xps15>
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

On Thu, Sep 10, 2020 at 10:46:43AM -0600, Mathieu Poirier wrote:
> On Thu, Sep 10, 2020 at 09:15:13AM +0200, Guennadi Liakhovetski wrote:
> > Hi Mathieu,
> > 
> > On Wed, Sep 09, 2020 at 04:42:14PM -0600, Mathieu Poirier wrote:
> > > On Wed, Aug 26, 2020 at 07:46:33PM +0200, Guennadi Liakhovetski wrote:
> > > > VHOST_VSOCK_SET_RUNNING is used by the vhost vsock driver to perform
> > > > crucial VirtQueue initialisation, like assigning .private fields and
> > > > calling vhost_vq_init_access(), and clean up. However, this ioctl is
> > > > actually extremely useful for any vhost driver, that doesn't have a
> > > > side channel to inform it of a status change, e.g. upon a guest
> > > > reboot. This patch makes that ioctl generic, while preserving its
> > > > numeric value and also keeping the original alias.
> > > > 
> > > > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > > > ---
> > > >  include/uapi/linux/vhost.h | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
> > > > index 75232185324a..11a4948b6216 100644
> > > > --- a/include/uapi/linux/vhost.h
> > > > +++ b/include/uapi/linux/vhost.h
> > > > @@ -97,6 +97,8 @@
> > > >  #define VHOST_SET_BACKEND_FEATURES _IOW(VHOST_VIRTIO, 0x25, __u64)
> > > >  #define VHOST_GET_BACKEND_FEATURES _IOR(VHOST_VIRTIO, 0x26, __u64)
> > > >  
> > > > +#define VHOST_SET_RUNNING _IOW(VHOST_VIRTIO, 0x61, int)
> > > > +
> > > 
> > > I don't see it used in the next patches and as such should be part of another
> > > series.
> > 
> > It isn't used in the next patches, it is used in this patch - see below.
> >
> 
> Right, but why is this part of this set?  What does it bring?  It should be part
> of a patchset where "VHOST_SET_RUNNING" is used.

Ok, I can remove this patch from this series and make it a part of the series, 
containing [1] "vhost: add an SOF Audio DSP driver"

Thanks
Guennadi

[1] https://www.spinics.net/lists/linux-virtualization/msg43309.html

> > > >  /* VHOST_NET specific defines */
> > > >  
> > > >  /* Attach virtio net ring to a raw socket, or tap device.
> > > > @@ -118,7 +120,7 @@
> > > >  /* VHOST_VSOCK specific defines */
> > > >  
> > > >  #define VHOST_VSOCK_SET_GUEST_CID	_IOW(VHOST_VIRTIO, 0x60, __u64)
> > > > -#define VHOST_VSOCK_SET_RUNNING		_IOW(VHOST_VIRTIO, 0x61, int)
> > > > +#define VHOST_VSOCK_SET_RUNNING		VHOST_SET_RUNNING
> > > >  
> > > >  /* VHOST_VDPA specific defines */
> > > >  
> > > > -- 
> > > > 2.28.0
> > > > 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
