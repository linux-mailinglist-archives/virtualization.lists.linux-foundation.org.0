Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C7C1F13AA
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 09:37:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3319C858F5;
	Mon,  8 Jun 2020 07:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9sWndEoCdpEn; Mon,  8 Jun 2020 07:37:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D47EE85B4D;
	Mon,  8 Jun 2020 07:37:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B73CAC016F;
	Mon,  8 Jun 2020 07:37:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B8A0C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 07:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5E59620500
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 07:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VQpjJRQchme
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 07:37:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by silver.osuosl.org (Postfix) with ESMTPS id 903932010F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 07:37:21 +0000 (UTC)
IronPort-SDR: k2PB4yiiOkfgILke5uEQT1E6xusobr1o+cicL+wu2og5929/JUhlXyNwBrp0bj0hB1DkRr9ajD
 wXskmGQcGHWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 00:37:20 -0700
IronPort-SDR: 0MbWgAOzst80uRoqCZyGU9kY1/hY94HQs2KGF+L7ExL4Mb/GJwVBRYNnJGJEei4CbpeZ6+jl0v
 Qiu36kiErNQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; d="scan'208";a="417947180"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.46.212])
 by orsmga004.jf.intel.com with ESMTP; 08 Jun 2020 00:37:16 -0700
Date: Mon, 8 Jun 2020 09:37:15 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
Message-ID: <20200608073715.GA10562@ubuntu>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200604151917-mutt-send-email-mst@kernel.org>
 <20200605063435.GA32302@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605063435.GA32302@ubuntu>
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

Hi Michael,

On Fri, Jun 05, 2020 at 08:34:35AM +0200, Guennadi Liakhovetski wrote:
> 
> On Thu, Jun 04, 2020 at 03:23:37PM -0400, Michael S. Tsirkin wrote:

[snip]

> > Another it's out of line with 1.0 spec passing guest
> > endian data around. Won't work if host and guest
> > endian-ness do not match. Should pass eveything in LE and
> > convert.
> 
> Yes, I have to fix this, thanks.

Just to make sure my understanding is correct: this would involve also 
modifying the current virtio_rpmsg_bus.c implementation to add 
endianness conversions. That's what you meant, right?

Thanks
Guennadi
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
