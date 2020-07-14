Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 281CB21EB7A
	for <lists.virtualization@lfdr.de>; Tue, 14 Jul 2020 10:34:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B0CA788F8E;
	Tue, 14 Jul 2020 08:34:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmdJvbzvGDb3; Tue, 14 Jul 2020 08:34:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 21E4C88D75;
	Tue, 14 Jul 2020 08:34:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4BCDC0733;
	Tue, 14 Jul 2020 08:34:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18C8FC0733
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 08:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DBF9426781
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 08:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDtSIjgUdS7C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 08:34:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by silver.osuosl.org (Postfix) with ESMTPS id 045F92EA97
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 08:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1513; q=dns/txt; s=axis-central1;
 t=1594715644; x=1626251644;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yPIyi+r6Sam6BMh1LvjqkCOgwrjxWfE0YtcaPo8bqk4=;
 b=H2kjhcofcjlehL9rQuL2sC4wNiu8d/acJ0IS2MpPvH55uGQF1VFOywNF
 zQEoTENP3iTRnsQNfwHv9Rug9H9GXaPUVqqc5EuPt8aeTtQh1q14JuLbf
 NYsZzZiS6fVAmmGK+CwIxunt4nHpWxkSY1LzPjOXUDaucMLxBs+BwJDHK
 pu1j663JnZ+2+86jUhlB88OTGqRVfOQoQs9WAc96em3EGoGnDmho4hajl
 RCSyF+QJuBdW/i20Kz9lqicYdkcRIIfwKIADB/5XUXHTAvrf6GR0r2qy3
 uTAhBezu4l+QYyiPds62meDCnhbw2LlY4ZYI9CFpNtDAA+AXmHxtTdMWe g==;
IronPort-SDR: z0YQg/ccfWzz7HtSAR2rkwO0IbqB0TgoeghPfS8IJ4DM5u+SwnQRVggbabE9Qyx/JbOCEdRauM
 cmrRAH0RuYTbDTtYI6IC/QwTFj+yGj5tvf2Cc8G3R3Z4vaBz04HkvBP6gZ5oWeRhskRKcGAULh
 9j7MCdGUPHgenKYvYFi/AMv9MKjGRXvw7TBZgQro4GA6EY6EbkVJYPZLU6kkOZgk8ny16FVitr
 q4gYZW7AkN0mrNqvDqeLAZYq9baEKUGHUF6A2VAIYsdaRiZsV6s6bJdz9adwx+XU26CzWMIWqV
 //s=
X-IronPort-AV: E=Sophos;i="5.75,350,1589234400"; d="scan'208";a="10781944"
Date: Tue, 14 Jul 2020 10:33:59 +0200
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH v3 5/5] vhost: add an RPMsg API
Message-ID: <20200714083359.wn4uoq3d7zzsddkc@axis.com>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200527180541.5570-6-guennadi.liakhovetski@linux.intel.com>
 <20200617191741.whnp7iteb36cjnia@axis.com> <20200618090341.GA4189@ubuntu>
 <20200618093324.tu7oldr332ndfgev@axis.com> <20200618103940.GB4189@ubuntu>
 <20200618135241.362iuggde3jslx3p@axis.com> <20200618141412.GD4189@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618141412.GD4189@ubuntu>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>,
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

On Thu, Jun 18, 2020 at 04:14:12PM +0200, Guennadi Liakhovetski wrote:
> On Thu, Jun 18, 2020 at 03:52:42PM +0200, Vincent Whitchurch wrote:
> > Note that "the Linux side" is ambiguous for AMP since both sides can be
> > Linux, as they happen to be in my case.  I'm running virtio/rpmsg
> > between two physical processors (of different architectures), both
> > running Linux.
> 
> Ok, interesting, I didn't know such configurations were used too. I understood 
> the Linux rpmsg implementation in the way, that it's assumed, that the "host" 
> has to boot the "device" by sending an ELF formatted executable image to it, is 
> that optional? You aren't sending a complete Linux image to the device side, 
> are you?

I do pack the zImage, the dtb, and the initramfs into an ELF (along with
a tiny "bootloader" with just a handful of instructions), but the
remoteproc framework is not tied to the ELF format since ->parse_fw()
and friends are overridable by the remoteproc driver.

> > virtio has distinct driver and device roles so the completely different
> > APIs on each side are understandable.  But I don't see that distinction
> > in the rpmsg API which is why it seems like a good idea to me to make it
> > work from both sides of the link and allow the reuse of drivers like
> > rpmsg-char, instead of imposing virtio's distinction on rpmsg.
> 
> Understand. In principle I'm open to this idea, but before I implement it it 
> would be good to know what maintainers think?

Certainly.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
