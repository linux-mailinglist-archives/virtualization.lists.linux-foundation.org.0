Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 384171F1E0E
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 19:02:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BF7598817F;
	Mon,  8 Jun 2020 17:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6Yk6vPN996G; Mon,  8 Jun 2020 17:02:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68108881B7;
	Mon,  8 Jun 2020 17:02:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D8B4C016F;
	Mon,  8 Jun 2020 17:02:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D3A4C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 17:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 749A286216
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 17:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBn4INQjkPSx
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 17:02:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 36D1E86205
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 17:02:35 +0000 (UTC)
IronPort-SDR: S5RZcc9gvyp8tmB11zyboMhyFSR+jDUBJkFYXejbRY3WEH4xcg9DSk/lJDslVoFdl7OaUI1HUP
 y3W3XsmJLbEg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 10:02:32 -0700
IronPort-SDR: p4KFNaWueYHUWVFFaEvmfRaE7L2L3X79MfyU23nJE5C9UKdgy8vS9D3H67NaNJHIg/fzsweu60
 3FRFbfslAMJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; d="scan'208";a="472767150"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.46.212])
 by fmsmga005.fm.intel.com with ESMTP; 08 Jun 2020 10:02:29 -0700
Date: Mon, 8 Jun 2020 19:02:27 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [RFC 12/12] rpmsg: add a device ID to also bind to the ADSP device
Message-ID: <20200608170227.GG10562@ubuntu>
References: <20200529073722.8184-1-guennadi.liakhovetski@linux.intel.com>
 <20200529073722.8184-13-guennadi.liakhovetski@linux.intel.com>
 <20200604200156.GB26734@xps15> <20200605064659.GC32302@ubuntu>
 <20200608161757.GA32518@xps15>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200608161757.GA32518@xps15>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kvm@vger.kernel.org,
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

Hi Mathieu,

On Mon, Jun 08, 2020 at 10:17:57AM -0600, Mathieu Poirier wrote:
> On Fri, Jun 05, 2020 at 08:46:59AM +0200, Guennadi Liakhovetski wrote:
> > Hi Mathieu,
> > 
> > On Thu, Jun 04, 2020 at 02:01:56PM -0600, Mathieu Poirier wrote:
> > > On Fri, May 29, 2020 at 09:37:22AM +0200, Guennadi Liakhovetski wrote:
> > > > The ADSP device uses the RPMsg API to connect vhost and VirtIO SOF
> > > > Audio DSP drivers on KVM host and guest.
> > > > 
> > > > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > > > ---
> > > >  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > index f3bd050..ebe3f19 100644
> > > > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > @@ -949,6 +949,7 @@ static void rpmsg_remove(struct virtio_device *vdev)
> > > >  
> > > >  static struct virtio_device_id id_table[] = {
> > > >  	{ VIRTIO_ID_RPMSG, VIRTIO_DEV_ANY_ID },
> > > > +	{ VIRTIO_ID_ADSP, VIRTIO_DEV_ANY_ID },
> > > 
> > > I am fine with this patch but won't add an RB because of the (many) checkpatch
> > > errors.  Based on the comment I made on the previous set seeing those was
> > > unexpected.
> > 
> > Are you using "--strict?" Sorry, I don't see any checkpatch errors, only warnings. 
> 
> No, plane checkpatch on the rproc-next branch.
> 
> > Most of them are "over 80 characters" which as we now know is no more an issue,
> 
> There is a thread discussing the matter but I have not seen a clear resolution
> yet.

I think the resolution is pretty clear as defined by Linus, but maybe it has changed 
again since I last checked.

> > I just haven't updated my tree yet. Most others are really minor IMHO. Maybe one
> 
> Minor or not, if checkpatch complains then it is important enough to address.  I
> am willing to overlook the lines over 80 characters but everything else needs to
> be dealt with.

Sure, checkpatch should be run before each patch submission and whatever it reports 
should be considered. As Documentation/process/submitting-patches.rst clearly 
states:

"Check your patches with the patch style checker prior to submission
(scripts/checkpatch.pl).  Note, though, that the style checker should be
viewed as a guide, not as a replacement for human judgment.  If your code
looks better with a violation then its probably best left alone."

So, yes, I checked all what checkepatch reported and used my judgement to decide 
which recommendations to take and which to ignore.

Thanks
Guennadi

> Thanks,
> Mathieu
>  
> > of them I actually would want to fix - using "help" instead of "---help---" in 
> > Kconfig. What errors are you seeing in your checks?
> > 
> > Thanks
> > Guennadi
> > 
> > > Thanks,
> > > Mathieu
> > > 
> > > >  	{ 0 },
> > > >  };
> > > >  
> > > > -- 
> > > > 1.9.3
> > > > 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
