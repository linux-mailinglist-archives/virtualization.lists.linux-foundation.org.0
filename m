Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 236401F1765
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 13:16:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9990386224;
	Mon,  8 Jun 2020 11:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7P5akiVhRme; Mon,  8 Jun 2020 11:16:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6387085FED;
	Mon,  8 Jun 2020 11:16:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4371DC016F;
	Mon,  8 Jun 2020 11:16:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 128D6C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 11:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0041F2078B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 11:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qR2nkPDZhXjU
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 11:16:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 196971FF11
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 11:16:43 +0000 (UTC)
IronPort-SDR: oTOwEY8tvTm1CjCMp9FV/5io11cVMajdCM11xtLuVOfWs5kHiwtBpTNHID9ivCeT3q9sox/iAN
 OcI8E+KN43FA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 04:16:42 -0700
IronPort-SDR: dl0qMu7dTDv+wwShs4f6FCGDv2URJOMFnCoSpWPuwosIAU8FdJ3hB6cg3IQtAVv53P8j+CQP/X
 1sto+gbPjG1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; d="scan'208";a="288442494"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.46.212])
 by orsmga002.jf.intel.com with ESMTP; 08 Jun 2020 04:16:39 -0700
Date: Mon, 8 Jun 2020 13:16:38 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
Message-ID: <20200608111637.GE10562@ubuntu>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200604151917-mutt-send-email-mst@kernel.org>
 <20200605063435.GA32302@ubuntu> <20200608073715.GA10562@ubuntu>
 <20200608091100.GC10562@ubuntu>
 <20200608051358-mutt-send-email-mst@kernel.org>
 <20200608101526.GD10562@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200608101526.GD10562@ubuntu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kvm@vger.kernel.org,
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

On Mon, Jun 08, 2020 at 12:15:26PM +0200, Guennadi Liakhovetski wrote:
> On Mon, Jun 08, 2020 at 05:19:06AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Jun 08, 2020 at 11:11:00AM +0200, Guennadi Liakhovetski wrote:
> > > Update: I looked through VirtIO 1.0 and 1.1 specs, data format their, 
> > > including byte order, is defined on a per-device type basis. RPMsg is 
> > > indeed included in the spec as device type 7, but that's the only 
> > > mention of it in both versions. It seems RPMsg over VirtIO isn't 
> > > standardised yet.
> > 
> > Yes. And it would be very good to have some standartization before we
> > keep adding things. For example without any spec if host code breaks
> > with some guests, how do we know which side should be fixed?
> > 
> > > Also it looks like newer interface definitions 
> > > specify using "guest native endianness" for Virtual Queue data.
> > 
> > They really don't or shouldn't. That's limited to legacy chapters.
> > Some definitions could have slipped through but it's not
> > the norm. I just quickly looked through the 1.1 spec and could
> > not find any instances that specify "guest native endianness"
> > but feel free to point them out to me.
> 
> Oh, there you go. No, sorry, my fault, it's the other way round: "guest 
> native" is for legacy and LE is for current / v1.0 and up.
> 
> > > So 
> > > I think the same should be done for RPMsg instead of enforcing LE?
> > 
> > That makes hardware implementations as well as any cross-endian
> > hypervisors tricky.
> 
> Yes, LE it is then. And we need to add some text to the spec.

I found the protocol and the message format definition: 
https://github.com/OpenAMP/open-amp/wiki/RPMsg-Messaging-Protocol#transport-layer---rpmsg 
Don't know what the best way for referencing it in the VirtIO standard 
would be: just a link to the source or a quote.

Thanks
Guennadi
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
