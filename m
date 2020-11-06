Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D398E2A8FE2
	for <lists.virtualization@lfdr.de>; Fri,  6 Nov 2020 08:06:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 905D3871BE;
	Fri,  6 Nov 2020 07:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sX4bfnCcUu-l; Fri,  6 Nov 2020 07:06:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DDB99871CF;
	Fri,  6 Nov 2020 07:06:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C12ADC0889;
	Fri,  6 Nov 2020 07:06:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD9E2C0889
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 07:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A314D871A7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 07:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8uWoIOr4x2tE
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 07:05:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 70AB5870DF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 07:05:58 +0000 (UTC)
Received: from localhost (searspoint.nvidia.com [216.228.112.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D5BA221FE;
 Fri,  6 Nov 2020 07:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604646357;
 bh=NcentItc4GzP7DMUGCOjybP9u3nED8AkeAk+ghWanY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WeQA5GCo1OiQ1S6XtvtUVHunQH7CB+jf6nhafOK25CaY7SOsjWWUXWSJTXufQ/GuX
 LsOp24B2uwbjJacAax4MwryzJX6VOHqIaoqxNPHG9ye7oPP/P7SCzGEIZXBAu0IGyo
 jpWetcwbyQsUe42ZWwf7KowqZsGWui5Y9hyxhSz8=
Date: Fri, 6 Nov 2020 09:05:52 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Saeed Mahameed <saeed@kernel.org>
Subject: Re: [PATCH mlx5-next v1 04/11] vdpa/mlx5: Make hardware definitions
 visible to all mlx5 devices
Message-ID: <20201106070552.GE5475@unreal>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-5-leon@kernel.org>
 <8a8e75215a5d3d8cfa9c3c6747325dbbf965811f.camel@kernel.org>
 <20201105203657.GR2620339@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105203657.GR2620339@nvidia.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kiran.patil@intel.com, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-rdma@vger.kernel.org, gregkh <gregkh@linuxfoundation.org>,
 ranjani.sridharan@linux.intel.com, Roi Dayan <roid@nvidia.com>,
 virtualization@lists.linux-foundation.org, fred.oh@linux.intel.com,
 tiwai@suse.de, Doug Ledford <dledford@redhat.com>, broonie@kernel.org,
 Parav Pandit <parav@nvidia.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, dan.j.williams@intel.com,
 shiraz.saleem@intel.com, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org
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

On Thu, Nov 05, 2020 at 04:36:57PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 05, 2020 at 12:31:52PM -0800, Saeed Mahameed wrote:
> > On Sun, 2020-11-01 at 22:15 +0200, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > >
> > > Move mlx5_vdpa IFC header file to the general include folder, so
> > > mlx5_core will be able to reuse it to check if VDPA is supported
> > > prior to creating an auxiliary device.
> > >
> >
> > I don't really like this, the whole idea of aux devices is that they
> > get to do own logic and hide details, now we are exposing aux
> > specific stuff to the bus ..  let's figure a way to avoid such
> > exposure as we discussed yesterday.
>
> Not quite, the idea is we get to have a cleaner split between the two
> sides.
>
> The device side is responsible for things centric to the device, like
> "does this device actually exists" which is what is_supported is
> doing.
>
> The driver side holds the driver specific logic.
>
> > is_supported check shouldn't belong to mlx5_core and each aux device
> > (en/ib/vdpa) should implement own is_supported op and keep the details
> > hidden in the aux driver like it was before this patch.
>
> No, it really should be in the device side.
>
> Part of the point here is to properly fix module loading. That means
> the core driver must only create devices that can actually have a
> driver bound to them because creating a device triggers module
> loading.
>
> For instance we do not want to auto load vdpa modules on every mlx5
> system for no reason, that is not clean at all.

Saeed,

Jason gave very good example and it is not far from the real life requirement.
We have an internal task to make sure that mlx5_vdpa is loaded without any
other mlx5_* modules (ib and eth). This series solves it naturally.

Thanks

>
> Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
