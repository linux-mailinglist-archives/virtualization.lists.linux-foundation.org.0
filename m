Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 688492A8FBA
	for <lists.virtualization@lfdr.de>; Fri,  6 Nov 2020 07:56:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BC7E8702C;
	Fri,  6 Nov 2020 06:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CE0F1VUoIa3C; Fri,  6 Nov 2020 06:56:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73C0387020;
	Fri,  6 Nov 2020 06:56:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 489D3C0889;
	Fri,  6 Nov 2020 06:56:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7B5DC0889
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 06:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BC2172E0D9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 06:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uy5ZxKffn3JK
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 06:56:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id D69EA2E0D8
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 06:56:33 +0000 (UTC)
Received: from localhost (searspoint.nvidia.com [216.228.112.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83A17206F4;
 Fri,  6 Nov 2020 06:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604645793;
 bh=yRhE6XR0cLSyZZkXEIf4EKqkW1OuHyv4bdZKoioXVrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kuiVH9hQopx87bfdsAx2gbKmFgqYBDw23j1qfXnRfX10trVIjqzi1XQuIsXTGLE9G
 1DTngfIQUa/4q9EbToBgKnayZOqY86jTsC5P77eqHjqujTvlcdN+c69Yid3YbD3VC5
 tWou/zcOf1hZwMT8Gp8NSxGCgRn/4TGKZrD2daKc=
Date: Fri, 6 Nov 2020 08:56:29 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Saeed Mahameed <saeed@kernel.org>
Subject: Re: [PATCH mlx5-next v1 05/11] net/mlx5: Register mlx5 devices to
 auxiliary virtual bus
Message-ID: <20201106065629.GD5475@unreal>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-6-leon@kernel.org>
 <d10e7a08200458c1bddb72fc983a5917daebc8f1.camel@kernel.org>
 <20201105210948.GS2620339@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105210948.GS2620339@nvidia.com>
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

On Thu, Nov 05, 2020 at 05:09:48PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 05, 2020 at 12:59:20PM -0800, Saeed Mahameed wrote:
>
> > 2. you can always load a driver without its underlying device existed.
> > for example, you can load a pci device driver/module and it will load
> > and wait for pci devices to pop up, the subsysetem infrastructure will
> > match between drivers and devices and probe them.
>
> Yes, this works fine with this design
>
> > struct aux_driver mlx5_vpda_aux_driver {
> >
> >       .name = "vdpa",
> >        /* match this driver with mlx5_core devices */
> >       .id_table = {"mlx5_core"},
> >       .ops {
> >             /* called before probe on actual aux mlx5_core device */
> >            .is_supported(struct aux_device);
>
> This means module auto loading is impossible, we can't tell to load
> the module until we load the module to call the is_supported code ..

Right, and if we can, it will be violation of everything we know in
driver model, because the call "is_supported" will need to be called
for every registered driver without any relation to existed devices.

And mlx5_rescan_drivers() came as a need to overcome LAG and eswitch
craziness in everything related to their reprobe flows. Once they will
be changed to work like normal drivers, we will be able to simplify it.

So let's talk offline to see how can we improve mlx5_core even more
after this series is merged.

Thanks

>
> Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
