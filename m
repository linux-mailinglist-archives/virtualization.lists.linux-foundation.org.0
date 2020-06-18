Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BDE1FF3C5
	for <lists.virtualization@lfdr.de>; Thu, 18 Jun 2020 15:52:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D1E4F87ABF;
	Thu, 18 Jun 2020 13:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzPeUcWc9SEc; Thu, 18 Jun 2020 13:52:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B7E1687AA0;
	Thu, 18 Jun 2020 13:52:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93D04C089E;
	Thu, 18 Jun 2020 13:52:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 409CBC016E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 13:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3C40887AA0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 13:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TETujjgI75wS
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 13:52:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3D58387A9B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1795; q=dns/txt; s=axis-central1;
 t=1592488367; x=1624024367;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K3qXhXuXakILYod+5kBesnr9hqgCoyRBGyf2BukPwdg=;
 b=Pkyzpih49lG/OOcW38xILjQbKMuVXgithRBKDdM1rLyJ0rrSJRJKiv2j
 o+Rw0CYHRDErWAEzTlew+y6OfFaLqDm6iPCt4U5n0C83U92TSc6ta6DGh
 ce4vUTKGD0oDvhIeMaLJ5jPqEsZ5en7W7GAzMxtq6pWekTXKj47OA3a+7
 eRFGBX0ojxSl6aKRYXBG0LLBib/VjX7IgZImsgJvDaltGIcQWkwNV24yE
 +y57VZVT/FdS/pSAf2od277/tbl/HhzwojzjvbDHWdBe9I5pXSWKWud/d
 b3oQdWNLlMtnsMlesMCJK+wUOa9byDcU1DM9MP6U+8wGxamHm21u3MT/z Q==;
IronPort-SDR: 39f17DGWhFX5mDaAv7IFIaJMjHJWXn2jBB81PhoK6/VVmRVRxOLK37romffu9KZl3JRlPdAynf
 sAA8fjyOW6T7KjXFkatNsLBerEF8qKy5i3xVWCN/ww2yn5w0iQa4ZNI/vFYW09hFS4Vgu0BHRt
 23WOtQVtc1NvNPxB+h+h4MD6plcO6WuKOWHRTnIeWx8ltuBZe2DW6IkGbeE+o04bL1rUQh4src
 H03lOeRTsDA4ir9o2LZedXL8hFawX0edYqNXElrOqYFUsxPlIHs11izPXHVw4r3XB4ls/erFsC
 p3c=
X-IronPort-AV: E=Sophos;i="5.73,526,1583190000"; 
   d="scan'208";a="9960045"
Date: Thu, 18 Jun 2020 15:52:42 +0200
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH v3 5/5] vhost: add an RPMsg API
Message-ID: <20200618135241.362iuggde3jslx3p@axis.com>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200527180541.5570-6-guennadi.liakhovetski@linux.intel.com>
 <20200617191741.whnp7iteb36cjnia@axis.com> <20200618090341.GA4189@ubuntu>
 <20200618093324.tu7oldr332ndfgev@axis.com> <20200618103940.GB4189@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618103940.GB4189@ubuntu>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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

On Thu, Jun 18, 2020 at 12:39:40PM +0200, Guennadi Liakhovetski wrote:
> On Thu, Jun 18, 2020 at 11:33:24AM +0200, Vincent Whitchurch wrote:
> > By the "normal rpmsg API" I mean register_rpmsg_driver(), rpmsg_send(),
> > etc.  That API is not tied to virtio in any way and there are other
> > non-virtio backends for this API in the tree.  So it seems quite natural
> > to implement a vhost backend for this API so that both sides of the link
> > can use the same API but different backends, instead of forcing them to
> > use of different APIs.
> 
> Ok, I see what you mean now. But I'm not sure this is useful or desired. I'm 
> not an expert in KVM / VirtIO, I've only been working in the area for less 
> than a year, so, I might well be wrong.
> 
> You're proposing to use the rpmsg API in vhost drivers. As far as I 
> understand so far that API was only designated for the Linux side (in case of 
> AMPs) which corresponds to VM guests in virtualisation case. So, I'm not sure 
> we want to use the same API for the hosts? This can be done as you have 
> illustrated, but is it desirable? The vhost API is far enough from the VirtIO 
> driver API, so I'm not sure why we want the same API for rpmsg?

Note that "the Linux side" is ambiguous for AMP since both sides can be
Linux, as they happen to be in my case.  I'm running virtio/rpmsg
between two physical processors (of different architectures), both
running Linux.

virtio has distinct driver and device roles so the completely different
APIs on each side are understandable.  But I don't see that distinction
in the rpmsg API which is why it seems like a good idea to me to make it
work from both sides of the link and allow the reuse of drivers like
rpmsg-char, instead of imposing virtio's distinction on rpmsg.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
