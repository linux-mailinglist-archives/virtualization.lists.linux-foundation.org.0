Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9723F2C8116
	for <lists.virtualization@lfdr.de>; Mon, 30 Nov 2020 10:33:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 272DA86C35;
	Mon, 30 Nov 2020 09:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3xY5JwfK3sF; Mon, 30 Nov 2020 09:33:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6C6B186C29;
	Mon, 30 Nov 2020 09:33:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EA3CC0052;
	Mon, 30 Nov 2020 09:33:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 665BBC0052
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 09:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 47F3087301
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 09:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2WVoR78bVun
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 09:33:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1FBE1872FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606728798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7wZtjSzGIaF/U+jd9vQGVbaZpJMrOBssW+kZUbY0C4=;
 b=U1kXFQSvw9nxNBHLfGfC833Hqydtj/8pspR3J8iUQULr7kYFBVspkVt6uQwsq6f+mLuBGn
 JidBbl6QU+HsUG9HZHrS+mktwxBsQNR1zCKr3wkUN7wGGRorD/MHVMQuW1DOJWO9dJyxNM
 Qp1mOAHrt49lpAl0+2cqyREQAbBJQkg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-NmwFFxegOquG6jP5PfINZQ-1; Mon, 30 Nov 2020 04:33:14 -0500
X-MC-Unique: NmwFFxegOquG6jP5PfINZQ-1
Received: by mail-wm1-f70.google.com with SMTP id q1so4152983wmq.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 01:33:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H7wZtjSzGIaF/U+jd9vQGVbaZpJMrOBssW+kZUbY0C4=;
 b=lR4fLBvDogJ00qa47rVnf58ZsOzoDraURhvYBGIwIejvgEcU17AHb/VpVfBCAhkYnb
 eneBDnDh2gIDX54D4FpptPE0CCQAfOQS7Rf1iT83NA+s2DOsxti2+rMfQbIbNBY8zKdM
 atciIMQO86Wb9lVwfpwFf50vGgl9FmxqLy/9QwbtW1qCYudqHy9qbKjS4dB4yTu6HY7o
 LXVAmWD2RvCyD1yNSERph1iKT+7rOmnrcgxsN7QkUHgF/YAU/r4Ed69P196NkR5al1uE
 ocmEKbUGlWH/+enAQ0CZ1D7sBmNZHaeIT3X5EWzI9mUok4YF5lYFWrLEWhbJWM+Trqzj
 5CXw==
X-Gm-Message-State: AOAM530JfNcWRgGmuoEmFI8YS44sEfbj2CvkvEkgF8Si69aCuPuZA7/Y
 Wnt5TrnflggUvuPnX4j6bT/MDsdpqD50mjJDimFua2rYJF0XeJhFpbO+xTaJvkRS5G+ZUCJE0B6
 Vj47Bl9Nl1H17NaO0AoLhrdqO8tcAXI0kEVHnJKjCww==
X-Received: by 2002:adf:8143:: with SMTP id 61mr26745544wrm.318.1606728793268; 
 Mon, 30 Nov 2020 01:33:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0t6u/3wURWn9N8zkZPiZ95gKJucC/wG875k/KAanJvg4ucGYRlB4rSPrqcgd1Ly+7PQX3lg==
X-Received: by 2002:adf:8143:: with SMTP id 61mr26745520wrm.318.1606728793106; 
 Mon, 30 Nov 2020 01:33:13 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id x9sm19438455wru.55.2020.11.30.01.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 01:33:12 -0800 (PST)
Date: Mon, 30 Nov 2020 04:33:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eli Cohen <elic@nvidia.com>
Subject: Re: [PATCH] vdpa/mlx5: Use random MAC for the vdpa net instance
Message-ID: <20201130043050-mutt-send-email-mst@kernel.org>
References: <20201129064351.63618-1-elic@nvidia.com>
 <20201129150505-mutt-send-email-mst@kernel.org>
 <20201130062746.GA99449@mtl-vdi-166.wap.labs.mlnx>
 <20201130035147-mutt-send-email-mst@kernel.org>
 <20201130092759.GB99449@mtl-vdi-166.wap.labs.mlnx>
MIME-Version: 1.0
In-Reply-To: <20201130092759.GB99449@mtl-vdi-166.wap.labs.mlnx>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, lulu@redhat.com,
 virtualization@lists.linux-foundation.org
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

On Mon, Nov 30, 2020 at 11:27:59AM +0200, Eli Cohen wrote:
> On Mon, Nov 30, 2020 at 04:00:51AM -0500, Michael S. Tsirkin wrote:
> > On Mon, Nov 30, 2020 at 08:27:46AM +0200, Eli Cohen wrote:
> > > On Sun, Nov 29, 2020 at 03:08:22PM -0500, Michael S. Tsirkin wrote:
> > > > On Sun, Nov 29, 2020 at 08:43:51AM +0200, Eli Cohen wrote:
> > > > > We should not try to use the VF MAC address as that is used by the
> > > > > regular (e.g. mlx5_core) NIC implementation. Instead, use a random
> > > > > generated MAC address.
> > > > > 
> > > > > Suggested by: Cindy Lu <lulu@redhat.com>
> > > > > Fixes: 1a86b377aa21 ("vdpa/mlx5: Add VDPA driver for supported mlx5 devices")
> > > > > Signed-off-by: Eli Cohen <elic@nvidia.com>
> > > > 
> > > > I didn't realise it's possible to use VF in two ways
> > > > with and without vdpa.
> > > 
> > > Using a VF you can create quite a few resources, e.g. send queues
> > > recieve queues, virtio_net queues etc. So you can possibly create
> > > several instances of vdpa net devices and nic net devices.
> > > 
> > > > Could you include a bit more description on the failure
> > > > mode?
> > > 
> > > Well, using the MAC address of the nic vport is wrong since that is the
> > > MAC of the regular NIC implementation of mlx5_core.
> > 
> > Right but ATM it doesn't coexist with vdpa so what's the problem?
> > 
> 
> This call is wrong:  mlx5_query_nic_vport_mac_address()
> 
> > > > Is switching to a random mac for such an unusual
> > > > configuration really justified?
> > > 
> > > Since I can't use the NIC's MAC address, I have two options:
> > > 1. To get the MAC address as was chosen by the user administering the
> > >    NIC. This should invoke the set_config callback. Unfortunately this
> > >    is not implemented yet.
> > > 
> > > 2. Use a random MAC address. This is OK since if (1) is implemented it
> > >    can always override this random configuration.
> > > 
> > > > It looks like changing a MAC could break some guests,
> > > > can it not?
> > > >
> > > 
> > > No, it will not. The current version of mlx5 VDPA does not allow regular
> > > NIC driver and VDPA to co-exist. I have patches ready that enable that
> > > from steering point of view. I will post them here once other patches on
> > > which they depend will be merged.
> > > 
> > > https://patchwork.ozlabs.org/project/netdev/patch/20201120230339.651609-12-saeedm@nvidia.com/
> > 
> > Could you be more explicit on the following points:
> > - which configuration is broken ATM (as in, two device have identical
> >   macs? any other issues)?
> 
> The only wrong thing is the call to  mlx5_query_nic_vport_mac_address().
> It's not breaking anything yet is wrong. The random MAC address setting
> is required for the steering patches.

Okay so I'm not sure the Fixes tag at least is appropriate if it's a
dependency of a new feature.

> > - why won't device MAC change from guest point of view?
> > 
> 
> It's lack of implementation in qemu as far as I know.

Sorry not sure I understand. What's not implemented in QEMU?

> > 
> > > > > ---
> > > > >  drivers/vdpa/mlx5/net/mlx5_vnet.c | 5 +----
> > > > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> > > > > index 1fa6fcac8299..80d06d958b8b 100644
> > > > > --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> > > > > +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> > > > > @@ -1955,10 +1955,7 @@ void *mlx5_vdpa_add_dev(struct mlx5_core_dev *mdev)
> > > > >  	if (err)
> > > > >  		goto err_mtu;
> > > > >  
> > > > > -	err = mlx5_query_nic_vport_mac_address(mdev, 0, 0, config->mac);
> > > > > -	if (err)
> > > > > -		goto err_mtu;
> > > > > -
> > > > > +	eth_random_addr(config->mac);
> > > > >  	mvdev->vdev.dma_dev = mdev->device;
> > > > >  	err = mlx5_vdpa_alloc_resources(&ndev->mvdev);
> > > > >  	if (err)
> > > > > -- 
> > > > > 2.26.2
> > > > 
> > 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
