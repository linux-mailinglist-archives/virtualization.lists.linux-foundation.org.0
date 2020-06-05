Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6A01EF16D
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 08:37:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C43A522264;
	Fri,  5 Jun 2020 06:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9iNRa+Qdg-9Z; Fri,  5 Jun 2020 06:37:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 93032220EF;
	Fri,  5 Jun 2020 06:37:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 646E6C016E;
	Fri,  5 Jun 2020 06:37:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AB5FC016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 06:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 52677883A6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 06:37:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGCDKwc-qrlR
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 06:37:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ABC5A88355
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 06:37:23 +0000 (UTC)
IronPort-SDR: 0LmVehD2u/Ff5ReJrdyQ2Mo4pWt05wDwwAKkOqLXdjfGD2sk2csC5n3uYuIohmf+idJpdF+I0r
 6MFP8bkQXDXQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 23:37:23 -0700
IronPort-SDR: 82FRlCmveZhL6aWg6ZhjdQaxcr8asyG2dL9ffUCw+0+fyQxzp7HfXwLIg2Nrzqv+P55RgD+qJC
 nyS5IJTjy6Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; d="scan'208";a="294590623"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.45.234])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2020 23:37:19 -0700
Date: Fri, 5 Jun 2020 08:37:18 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [RFC 11/12] rpmsg: increase buffer size and reduce buffer number
Message-ID: <20200605063718.GB32302@ubuntu>
References: <20200529073722.8184-1-guennadi.liakhovetski@linux.intel.com>
 <20200529073722.8184-12-guennadi.liakhovetski@linux.intel.com>
 <20200604195839.GA26734@xps15>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604195839.GA26734@xps15>
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

On Thu, Jun 04, 2020 at 01:58:39PM -0600, Mathieu Poirier wrote:
> Hi Guennadi,
> 
> On Fri, May 29, 2020 at 09:37:21AM +0200, Guennadi Liakhovetski wrote:
> > It is hard to imagine use-cases where 512 buffers would really be
> > needed, whereas 512 bytes per buffer might be too little. Change this
> > to use 16 16KiB buffers instead.
> > 
> > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > ---
> >  include/linux/virtio_rpmsg.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/virtio_rpmsg.h b/include/linux/virtio_rpmsg.h
> > index 679be8b..1add468 100644
> > --- a/include/linux/virtio_rpmsg.h
> > +++ b/include/linux/virtio_rpmsg.h
> > @@ -72,8 +72,8 @@ enum rpmsg_ns_flags {
> >   * can change this without changing anything in the firmware of the remote
> >   * processor.
> >   */
> > -#define MAX_RPMSG_NUM_BUFS	512
> > -#define MAX_RPMSG_BUF_SIZE	512
> > +#define MAX_RPMSG_NUM_BUFS	(512 / 32)
> > +#define MAX_RPMSG_BUF_SIZE	(512 * 32)
> 
> These have been a standard in the rpmsg protocol since the inception of the
> subsystem 9 years ago and can't be changed without serious impact to existing
> implementations.

Yes, I expected this to raise complaints. I just modified them to be able to 
run my code, but a better solution is needed for sure.

> I suggest to dynamically set the number and size of the buffers to use
> based on the value of virtio_device_id::device.  To do that please spin
> off a new function, something like rpmsg_get_buffer_size(), and in there use
> the device ID to fetch the numbers based on vdev->id->device.  That way the
> rpmsg driver can be used by multiple clients and the specifics of the buffers
> adjusted without impact to other users.

I'll look into this!

Thanks
Guennadi

> Thanks,
> Mathieu
> 
> >  
> >  /* Address 53 is reserved for advertising remote services */
> >  #define RPMSG_NS_ADDR		53
> > -- 
> > 1.9.3
> > 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
