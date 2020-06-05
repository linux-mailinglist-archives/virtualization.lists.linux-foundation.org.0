Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 007311EF193
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 08:47:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79ABC86E57;
	Fri,  5 Jun 2020 06:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dq8KHG6_odnE; Fri,  5 Jun 2020 06:47:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DD76286E8A;
	Fri,  5 Jun 2020 06:47:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB70EC016E;
	Fri,  5 Jun 2020 06:47:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1765CC016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 06:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 04CBA88241
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 06:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lzJ4jYWC4YK7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 06:47:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 63A5C881E1
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 06:47:03 +0000 (UTC)
IronPort-SDR: GPHmDGExwQD8JDIGG3CTu+w+LwnO1ESt6sN+SedSD5H6v4DBXwVxEnKKb9uYPHUdJzD3YVp9tz
 5BHIb1SbenHA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 23:47:03 -0700
IronPort-SDR: WnnVVIdiW3il2sBTTZGnfrO6uGvZzsuHI4KDy4CFF86jvS6k0jWo8f+qtxxXS4jRBc5zcbWiKZ
 1UOQN4j0fJVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; d="scan'208";a="257952630"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.45.234])
 by fmsmga007.fm.intel.com with ESMTP; 04 Jun 2020 23:47:00 -0700
Date: Fri, 5 Jun 2020 08:46:59 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [RFC 12/12] rpmsg: add a device ID to also bind to the ADSP device
Message-ID: <20200605064659.GC32302@ubuntu>
References: <20200529073722.8184-1-guennadi.liakhovetski@linux.intel.com>
 <20200529073722.8184-13-guennadi.liakhovetski@linux.intel.com>
 <20200604200156.GB26734@xps15>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604200156.GB26734@xps15>
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

On Thu, Jun 04, 2020 at 02:01:56PM -0600, Mathieu Poirier wrote:
> On Fri, May 29, 2020 at 09:37:22AM +0200, Guennadi Liakhovetski wrote:
> > The ADSP device uses the RPMsg API to connect vhost and VirtIO SOF
> > Audio DSP drivers on KVM host and guest.
> > 
> > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index f3bd050..ebe3f19 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -949,6 +949,7 @@ static void rpmsg_remove(struct virtio_device *vdev)
> >  
> >  static struct virtio_device_id id_table[] = {
> >  	{ VIRTIO_ID_RPMSG, VIRTIO_DEV_ANY_ID },
> > +	{ VIRTIO_ID_ADSP, VIRTIO_DEV_ANY_ID },
> 
> I am fine with this patch but won't add an RB because of the (many) checkpatch
> errors.  Based on the comment I made on the previous set seeing those was
> unexpected.

Are you using "--strict?" Sorry, I don't see any checkpatch errors, only warnings. 
Most of them are "over 80 characters" which as we now know is no more an issue, 
I just haven't updated my tree yet. Most others are really minor IMHO. Maybe one 
of them I actually would want to fix - using "help" instead of "---help---" in 
Kconfig. What errors are you seeing in your checks?

Thanks
Guennadi

> Thanks,
> Mathieu
> 
> >  	{ 0 },
> >  };
> >  
> > -- 
> > 1.9.3
> > 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
