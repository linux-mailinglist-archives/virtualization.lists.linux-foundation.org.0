Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4457C1F150F
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:11:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EBC3F20488;
	Mon,  8 Jun 2020 09:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjeWbTgI3385; Mon,  8 Jun 2020 09:11:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3134720474;
	Mon,  8 Jun 2020 09:11:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07E3CC016F;
	Mon,  8 Jun 2020 09:11:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2674CC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 18DA120474
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnnR6myhCo1q
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:11:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by silver.osuosl.org (Postfix) with ESMTPS id 25C1F2044F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:11:07 +0000 (UTC)
IronPort-SDR: v3RzOvSoYOu3MntMmXUq3iCxgP+v/M+X+vPPMAk632l3lzVkZc1g48lU1PR4o2yf6D4UwcZRVP
 N2PVv0s0gNjw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 02:11:05 -0700
IronPort-SDR: c6ZAhXQaDJ4dIM9JJuB5GZtmw6xqbYPfM0945uT+/Ru/NmZgrmDQg06GmHfhtPHtU9pg2Ir1JO
 luFM8hYzCbfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; d="scan'208";a="258641818"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.46.212])
 by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2020 02:11:02 -0700
Date: Mon, 8 Jun 2020 11:11:00 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
Message-ID: <20200608091100.GC10562@ubuntu>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200604151917-mutt-send-email-mst@kernel.org>
 <20200605063435.GA32302@ubuntu> <20200608073715.GA10562@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200608073715.GA10562@ubuntu>
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

Update: I looked through VirtIO 1.0 and 1.1 specs, data format their, 
including byte order, is defined on a per-device type basis. RPMsg is 
indeed included in the spec as device type 7, but that's the only 
mention of it in both versions. It seems RPMsg over VirtIO isn't 
standardised yet. Also it looks like newer interface definitions 
specify using "guest native endianness" for Virtual Queue data. So 
I think the same should be done for RPMsg instead of enforcing LE?

Thanks
Guennadi

On Mon, Jun 08, 2020 at 09:37:15AM +0200, Guennadi Liakhovetski wrote:
> Hi Michael,
> 
> On Fri, Jun 05, 2020 at 08:34:35AM +0200, Guennadi Liakhovetski wrote:
> > 
> > On Thu, Jun 04, 2020 at 03:23:37PM -0400, Michael S. Tsirkin wrote:
> 
> [snip]
> 
> > > Another it's out of line with 1.0 spec passing guest
> > > endian data around. Won't work if host and guest
> > > endian-ness do not match. Should pass eveything in LE and
> > > convert.
> > 
> > Yes, I have to fix this, thanks.
> 
> Just to make sure my understanding is correct: this would involve also 
> modifying the current virtio_rpmsg_bus.c implementation to add 
> endianness conversions. That's what you meant, right?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
