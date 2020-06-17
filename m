Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED2C1FD56C
	for <lists.virtualization@lfdr.de>; Wed, 17 Jun 2020 21:25:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E71BF894E0;
	Wed, 17 Jun 2020 19:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sTdahjSnDiYL; Wed, 17 Jun 2020 19:25:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56B6D894C3;
	Wed, 17 Jun 2020 19:25:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33A47C016E;
	Wed, 17 Jun 2020 19:25:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A19EC016E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 19:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6274989494
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 19:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsL4aYIRSY4X
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 19:25:01 +0000 (UTC)
X-Greylist: delayed 00:07:14 by SQLgrey-1.7.6
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D51E8894AC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 19:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=849; q=dns/txt; s=axis-central1;
 t=1592421901; x=1623957901;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CoUUOiZsKnhfZqKAoIVjBNqmCj7KbvkrBiiGm12QUvk=;
 b=YOvmqAG1Otpn1m/cLmM/YFGiA19FyquUtEebtfx4VScJEJ8jjBg2shhz
 j2YeEaP6LXpTgaeYDg9Ly58prXpmRo5SDVGVUgEiPZe18/2IqyzrOIWnv
 hhdUsxAeQ0N/XHaMYAnqqlmJg96SsZymHKQVYgncZ0HuQ9y4W62ZPSATH
 /GtBsfPjAs9l4tii4Rmq7qxvdh4lHJStACoId4QSvx39ZXhGAq4a7T7dl
 lJ5mJ47CRFy7jVy/oCa5J9fsI/nPKYV8FJ/iZJRFFk0VeSmxMkMwld3g3
 g4AseAi0dmC78AVebmxBYLytcLxi5jdH1zoXciyo1H1HmYTpwYMe2Yt2f g==;
IronPort-SDR: 50gvyFBNjMKUk/jDHf+ZW0rKM/PX94/QfJ2H/hQVUTkuOhRG7tSy1HEPaCQN8cGV3u0BQQf5yz
 fnNsWYdK4cje1vxXsJJWOlkqkzQrolqA0EkbYD1VqeDnLBQMoq6zy3abPfLaGze7gIk8zsJvEd
 +GXNNz64YbIU8/cF66x62jk94fPDL6KP3ZO37r28eTVj6WNHkUzZh9cZEi0luEdkaoGLcvGtjM
 Cm3xOoFqdtXohCBzU8Gf/EwwXLmFGW1uVf+GdxOPJ0Xobup1pE7tNGtw091SdnZc3WmPOUXa1K
 GkA=
X-IronPort-AV: E=Sophos;i="5.73,523,1583190000"; 
   d="scan'208";a="9645544"
Date: Wed, 17 Jun 2020 21:17:42 +0200
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH v3 5/5] vhost: add an RPMsg API
Message-ID: <20200617191741.whnp7iteb36cjnia@axis.com>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200527180541.5570-6-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527180541.5570-6-guennadi.liakhovetski@linux.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kvm@vger.kernel.org,
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

On Wed, May 27, 2020 at 08:05:41PM +0200, Guennadi Liakhovetski wrote:
> Linux supports running the RPMsg protocol over the VirtIO transport
> protocol, but currently there is only support for VirtIO clients and
> no support for a VirtIO server. This patch adds a vhost-based RPMsg
> server implementation.

This looks really useful, but why is it implemented as an API and not as
a real vhost driver which implements an rpmsg bus?  If you implement it
as a vhost driver which implements rpmsg_device_ops and
rpmsg_endpoint_ops, then wouldn't you be able to implement your
vhost-sof driver using the normal rpmsg APIs?

I tried quickly hooking up this code to such a vhost driver and I was
able to communicate between host and guest systems with both
rpmsg-client-sample and rpmsg-char which almost no modifications to
those drivers.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
