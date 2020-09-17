Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7567326D908
	for <lists.virtualization@lfdr.de>; Thu, 17 Sep 2020 12:29:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2613F87413;
	Thu, 17 Sep 2020 10:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6dQTSDBQx+cd; Thu, 17 Sep 2020 10:29:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 306BD8760E;
	Thu, 17 Sep 2020 10:29:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E28BC0864;
	Thu, 17 Sep 2020 10:29:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46513C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 10:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 34C5487422
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 10:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZbPo5QP7A4Gs
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 10:29:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7352387413
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 10:29:20 +0000 (UTC)
IronPort-SDR: 2Pe8/KP/wX6iBvkeDVYouBMUeLRVADSk90uwVgqM1LPPCXqkQHfXwWj94zD9L/DB0BUUK53VWX
 1OtJ3kK9mrww==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="159722700"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="159722700"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:29:18 -0700
IronPort-SDR: Sae5zd9KD3dEUlzr7XHC+ou/WiCIYT/fy4ar77tPms92ndus9S0NHGRtSrZfHv78NzTX/r3Vyg
 wBd0kK2KM1Mg==
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="483691895"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.45.143])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:29:15 -0700
Date: Thu, 17 Sep 2020 12:29:12 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH v6 0/4] Add a vhost RPMsg API
Message-ID: <20200917102911.GB11491@ubuntu>
References: <20200901151153.28111-1-guennadi.liakhovetski@linux.intel.com>
 <9433695b-5757-db73-bd8a-538fd1375e2a@st.com>
 <20200917054705.GA11491@ubuntu>
 <20200917083644.66yjer4zvoiftrk3@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917083644.66yjer4zvoiftrk3@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kishon@ti.com,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
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

Hi Vincent,

On Thu, Sep 17, 2020 at 10:36:44AM +0200, Vincent Whitchurch wrote:
> On Thu, Sep 17, 2020 at 07:47:06AM +0200, Guennadi Liakhovetski wrote:
> > On Tue, Sep 15, 2020 at 02:13:23PM +0200, Arnaud POULIQUEN wrote:
> > > So i would be agree with Vincent[2] which proposed to switch on a RPMsg API
> > > and creating a vhost rpmsg device. This is also proposed in the 
> > > "Enhance VHOST to enable SoC-to-SoC communication" RFC[3].
> > > Do you think that this alternative could match with your need?
> > 
> > As I replied to Vincent, I understand his proposal and the approach taken 
> > in the series [3], but I'm not sure I agree, that adding yet another 
> > virtual device / driver layer on the vhost side is a good idea. As far as 
> > I understand adding new completely virtual devices isn't considered to be 
> > a good practice in the kernel. Currently vhost is just a passive "library" 
> > and my vhost-rpmsg support keeps it that way. Not sure I'm in favour of 
> > converting vhost to a virtual device infrastructure.
> 
> I know it wasn't what you meant, but I noticed that the above paragraph
> could be read as if my suggestion was to convert vhost to a virtual
> device infrastructure, so I just want to clarify that that those are not
> related.  The only similarity between what I suggested in the thread in
> [2] and Kishon's RFC in [3] is that both involve creating a generic
> vhost-rpmsg driver which would allow the RPMsg API to be used for both
> sides of the link, instead of introducing a new API just for the server
> side.  That can be done without rewriting drivers/vhost/.

Thanks for the clarification. Another flexibility, that I'm trying to preserve 
with my approach is keeping direct access to iovec style data buffers for 
cases where that's the structure, that's already used by the respective 
driver on the host side. Since we already do packing and unpacking on the 
guest / client side, we don't need the same on the host / server side again.

Thanks
Guennadi

> > > [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335 
> > > [2]. https://www.spinics.net/lists/linux-virtualization/msg44195.html
> > > [3]. https://www.spinics.net/lists/linux-remoteproc/msg06634.html  
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
