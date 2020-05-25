Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA11E0FE5
	for <lists.virtualization@lfdr.de>; Mon, 25 May 2020 15:53:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BD74287DD4;
	Mon, 25 May 2020 13:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mQw54ZMV912e; Mon, 25 May 2020 13:53:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 55C3B87DCC;
	Mon, 25 May 2020 13:53:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AB16C016F;
	Mon, 25 May 2020 13:53:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D8BCC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 13:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5918E86B33
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 13:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ahgh48EoiZQv
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 13:53:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F01958582C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 13:53:39 +0000 (UTC)
IronPort-SDR: drkqGEtDNFb+uFbk6iFE9Tx9MerCLLyVg50uecG2JE8pXU8Sl1J6dNgnQN8j3ap1QuQEvBzA5i
 1RQSqiX61D0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 06:53:39 -0700
IronPort-SDR: dSNA+hsvMXQ7/TGmbLKjL+2+ct9xikg6bsHiUwaUyF9OiTeNBvGAnD4tO+kDSFVC+NL5D1WoQp
 c8E/WTKvX20g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; d="scan'208";a="310010026"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.41.109])
 by FMSMGA003.fm.intel.com with ESMTP; 25 May 2020 06:53:37 -0700
Date: Mon, 25 May 2020 15:53:36 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [Sound-open-firmware] [PATCH 5/6] vhost: add an rpmsg API
Message-ID: <20200525135336.GB6761@ubuntu>
References: <20200516101109.2624-1-guennadi.liakhovetski@linux.intel.com>
 <20200516101109.2624-6-guennadi.liakhovetski@linux.intel.com>
 <9737e3f2-e59c-0174-9254-a2d8f29f30b7@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9737e3f2-e59c-0174-9254-a2d8f29f30b7@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 sound-open-firmware@alsa-project.org, linux-remoteproc@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Hi Pierre,

On Sat, May 16, 2020 at 12:00:35PM -0500, Pierre-Louis Bossart wrote:
> 
> > +config VHOST_RPMSG
> > +	tristate
> > +	depends on VHOST
> 
> depends on RPMSG_VIRTIO?

No, RPMSG_VIRTIO is used on the guest side, VHOST_RPMSG (as well as 
all other vhost drivers) on the host side.

> > +	default n
> 
> not needed

Ok, will remove.

Thanks
Guennadi
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
