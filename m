Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 147AA26F98A
	for <lists.virtualization@lfdr.de>; Fri, 18 Sep 2020 11:47:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A372C87482;
	Fri, 18 Sep 2020 09:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3Hr5CeOCeER; Fri, 18 Sep 2020 09:47:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E07D87476;
	Fri, 18 Sep 2020 09:47:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C0E4C0051;
	Fri, 18 Sep 2020 09:47:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6306C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 09:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9DAEF872E7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 09:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40jJiwiCy5QQ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 09:47:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B7858872E6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 09:47:50 +0000 (UTC)
IronPort-SDR: QrfdpFuEES/n9aVWL/dHqfBG7NCFQ7iG12y2EEvqNoC3Gg5DW2PRh/bNZ+orZ47mMuENU7HsHZ
 wa3oa5gAkcDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147643787"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="147643787"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 02:47:49 -0700
IronPort-SDR: HsSK8dd3I6seoZJ6w/il1vRz+2QDfGFUrG53vEYEahWzSEp3FRkX2ofrrbVD55ofhD/fg5AfuV
 8u2BPmBPKqEg==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="484137781"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.42.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 02:47:23 -0700
Date: Fri, 18 Sep 2020 11:47:20 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v6 0/4] Add a vhost RPMsg API
Message-ID: <20200918094719.GD19246@ubuntu>
References: <20200901151153.28111-1-guennadi.liakhovetski@linux.intel.com>
 <9433695b-5757-db73-bd8a-538fd1375e2a@st.com>
 <20200917054705.GA11491@ubuntu>
 <47a9ad01-c922-3b1c-84de-433f229ffba3@st.com>
 <20200918054420.GA19246@ubuntu>
 <0b7d9004-d71b-8b9a-eaed-f92833ce113f@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b7d9004-d71b-8b9a-eaed-f92833ce113f@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
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

Hi Arnaud,

On Fri, Sep 18, 2020 at 09:47:45AM +0200, Arnaud POULIQUEN wrote:
> Hi Guennadi,
> 
> On 9/18/20 7:44 AM, Guennadi Liakhovetski wrote:
> > Hi Arnaud,
> > 
> > On Thu, Sep 17, 2020 at 05:21:02PM +0200, Arnaud POULIQUEN wrote:
> >> Hi Guennadi,
> >>
> >>> -----Original Message-----
> >>> From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> >>> Sent: jeudi 17 septembre 2020 07:47
> >>> To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
> >>> Cc: kvm@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> >>> virtualization@lists.linux-foundation.org; sound-open-firmware@alsa-
> >>> project.org; Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>; Liam
> >>> Girdwood <liam.r.girdwood@linux.intel.com>; Michael S. Tsirkin
> >>> <mst@redhat.com>; Jason Wang <jasowang@redhat.com>; Ohad Ben-Cohen
> >>> <ohad@wizery.com>; Bjorn Andersson <bjorn.andersson@linaro.org>; Mathieu
> >>> Poirier <mathieu.poirier@linaro.org>; Vincent Whitchurch
> >>> <vincent.whitchurch@axis.com>
> >>> Subject: Re: [PATCH v6 0/4] Add a vhost RPMsg API
> >>>
> >>> Hi Arnaud,
> >>>
> >>> On Tue, Sep 15, 2020 at 02:13:23PM +0200, Arnaud POULIQUEN wrote:
> >>>> Hi  Guennadi,
> >>>>
> >>>> On 9/1/20 5:11 PM, Guennadi Liakhovetski wrote:
> >>>>> Hi,
> >>>>>
> >>>>> Next update:
> >>>>>
> >>>>> v6:
> >>>>> - rename include/linux/virtio_rpmsg.h ->
> >>>>> include/linux/rpmsg/virtio.h
> >>>>>
> >>>>> v5:
> >>>>> - don't hard-code message layout
> >>>>>
> >>>>> v4:
> >>>>> - add endianness conversions to comply with the VirtIO standard
> >>>>>
> >>>>> v3:
> >>>>> - address several checkpatch warnings
> >>>>> - address comments from Mathieu Poirier
> >>>>>
> >>>>> v2:
> >>>>> - update patch #5 with a correct vhost_dev_init() prototype
> >>>>> - drop patch #6 - it depends on a different patch, that is currently
> >>>>>   an RFC
> >>>>> - address comments from Pierre-Louis Bossart:
> >>>>>   * remove "default n" from Kconfig
> >>>>>
> >>>>> Linux supports RPMsg over VirtIO for "remote processor" / AMP use
> >>>>> cases. It can however also be used for virtualisation scenarios,
> >>>>> e.g. when using KVM to run Linux on both the host and the guests.
> >>>>> This patch set adds a wrapper API to facilitate writing vhost
> >>>>> drivers for such RPMsg-based solutions. The first use case is an
> >>>>> audio DSP virtualisation project, currently under development, ready
> >>>>> for review and submission, available at
> >>>>> https://github.com/thesofproject/linux/pull/1501/commits
> >>>>
> >>>> Mathieu pointed me your series. On my side i proposed the rpmsg_ns_msg
> >>>> service[1] that does not match with your implementation.
> >>>> As i come late, i hope that i did not miss something in the history...
> >>>> Don't hesitate to point me the discussions, if it is the case.
> >>>
> >>> Well, as you see, this is a v6 only of this patch set, and apart from it there have
> >>> been several side discussions and patch sets.
> >>>
> >>>> Regarding your patchset, it is quite confusing for me. It seems that
> >>>> you implement your own protocol on top of vhost forked from the RPMsg
> >>> one.
> >>>> But look to me that it is not the RPMsg protocol.
> >>>
> >>> I'm implementing a counterpart to the rpmsg protocol over VirtIO as initially
> >>> implemented by drivers/rpmsg/virtio_rpmsg_bus.c for the "main CPU" (in case
> >>> of remoteproc over VirtIO) or the guest side in case of Linux virtualisation.
> >>> Since my implementation can talk to that driver, I don't think, that I'm inventing
> >>> a new protocol. I'm adding support for the same protocol for the opposite side
> >>> of the VirtIO divide.
> >>
> >> The main point I would like to highlight here is related to the use of the name "RPMsg"
> >> more than how you implement your IPC protocol.
> >> If It is a counterpart, it probably does not respect interface for RPMsg clients.
> >> A good way to answer this, might be to respond to this question:
> >> Is the rpmsg sample client[4] can be used on top of your vhost RPMsg implementation?
> >> If the response is no, describe it as a RPMsg implementation could lead to confusion...
> > 
> > Sorry, I don't quite understand your logic. RPMsg is a communication protocol, not an 
> > API. An RPMsg implementation has to be able to communicate with other compliant RPMsg 
> > implementations, it doesn't have to provide any specific API. Am I missing anything?
> 
> You are right nothing is written in stone that compliance with the user RPMsg API defined
> in the Linux Documentation [5] is mandatory.

A quote from [5]:

<quote>
Rpmsg is a virtio-based messaging bus that allows kernel drivers to communicate
with remote processors available on the system.
</quote>

So, that document describes the API used by Linux drivers to talk to remote processors. 
It says nothing about VMs. What my patches do, they add a capability to the Linux RPMsg 
implementation to also be used with VMs. Moreover, this is a particularly good fit, 
because both cases can use VirtIO, so, the "VirtIO side" of the communication doesn't 
have to change, and indeed it remains unchanged and uses the API in [5]. But what I do, 
is I also add RPMsg support to the host side.

> IMO, as this API is defined in the Linux documentation [5] we should respect it, to ensure
> one generic implementation. The RPMsg sample client[4] uses this user API, so seems to me
> a good candidate to verify this. 
> 
> That's said, shall we multiple the RPMsg implementations in Linux with several APIs,
> With the risk to make the RPMsg clients devices dependent on these implementations?
> That could lead to complex code or duplications...

So, no, in my understanding there aren't two competing alternative APIs, you'd never have 
to choose between them. If you're writing a driver for Linux to communicate with remote 
processors or to run on VMs, you use the existing API. If you're writing a driver for 
Linux to communicate with those VMs, you use the vhost API and whatever help is available 
for RPMsg processing.

However, I can in principle imagine a single driver, written to work on both sides. 
Something like the rpmsg_char.c or maybe some networking driver. Is that what you're 
referring to? I can see that as a fun exercise, but are there any real uses for that? 
You could do the same with VirtIO, however, it has been decided to go with two 
distinct APIs: virtio for guests and vhost for the host, noone bothered to create a 
single API for both and nobody seems to miss one. Why would we want one with RPMsg?

Thanks
Guennadi

> I'm not the right person to answer, Bjorn and Mathieu are.
> 
> [5] https://elixir.bootlin.com/linux/v5.8.10/source/Documentation/rpmsg.txt#L66
> 
> Thanks,
> Arnaud
> 
>   
> > 
> > Thanks
> > Guennadi
> > 
> >> [4] https://elixir.bootlin.com/linux/v5.9-rc5/source/samples/rpmsg/rpmsg_client_sample.c
> >>
> >> Regards,
> >> Arnaud
> >>
> >>>
> >>>> So i would be agree with Vincent[2] which proposed to switch on a
> >>>> RPMsg API and creating a vhost rpmsg device. This is also proposed in
> >>>> the "Enhance VHOST to enable SoC-to-SoC communication" RFC[3].
> >>>> Do you think that this alternative could match with your need?
> >>>
> >>> As I replied to Vincent, I understand his proposal and the approach taken in the
> >>> series [3], but I'm not sure I agree, that adding yet another virtual device /
> >>> driver layer on the vhost side is a good idea. As far as I understand adding new
> >>> completely virtual devices isn't considered to be a good practice in the kernel.
> >>> Currently vhost is just a passive "library"
> >>> and my vhost-rpmsg support keeps it that way. Not sure I'm in favour of
> >>> converting vhost to a virtual device infrastructure.
> >>>
> >>> Thanks for pointing me out at [3], I should have a better look at it.
> >>>
> >>> Thanks
> >>> Guennadi
> >>>
> >>>> [1].
> >>>> https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338
> >>>> 335 [2].
> >>>> https://www.spinics.net/lists/linux-virtualization/msg44195.html
> >>>> [3]. https://www.spinics.net/lists/linux-remoteproc/msg06634.html
> >>>>
> >>>> Thanks,
> >>>> Arnaud
> >>>>
> >>>>>
> >>>>> Thanks
> >>>>> Guennadi
> >>>>>
> >>>>> Guennadi Liakhovetski (4):
> >>>>>   vhost: convert VHOST_VSOCK_SET_RUNNING to a generic ioctl
> >>>>>   rpmsg: move common structures and defines to headers
> >>>>>   rpmsg: update documentation
> >>>>>   vhost: add an RPMsg API
> >>>>>
> >>>>>  Documentation/rpmsg.txt          |   6 +-
> >>>>>  drivers/rpmsg/virtio_rpmsg_bus.c |  78 +------
> >>>>>  drivers/vhost/Kconfig            |   7 +
> >>>>>  drivers/vhost/Makefile           |   3 +
> >>>>>  drivers/vhost/rpmsg.c            | 373 +++++++++++++++++++++++++++++++
> >>>>>  drivers/vhost/vhost_rpmsg.h      |  74 ++++++
> >>>>>  include/linux/rpmsg/virtio.h     |  83 +++++++
> >>>>>  include/uapi/linux/rpmsg.h       |   3 +
> >>>>>  include/uapi/linux/vhost.h       |   4 +-
> >>>>>  9 files changed, 551 insertions(+), 80 deletions(-)  create mode
> >>>>> 100644 drivers/vhost/rpmsg.c  create mode 100644
> >>>>> drivers/vhost/vhost_rpmsg.h  create mode 100644
> >>>>> include/linux/rpmsg/virtio.h
> >>>>>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
