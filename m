Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCF431CAF8
	for <lists.virtualization@lfdr.de>; Tue, 16 Feb 2021 14:17:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D75B5867EB;
	Tue, 16 Feb 2021 13:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id De15eu1TbKC7; Tue, 16 Feb 2021 13:17:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DA14867B5;
	Tue, 16 Feb 2021 13:17:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10743C013A;
	Tue, 16 Feb 2021 13:17:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84134C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 13:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 81141867EB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 13:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsGtQk8w1TNj
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 13:17:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DD529867B5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 13:17:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1BED64DA5;
 Tue, 16 Feb 2021 13:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613481468;
 bh=vmkdvq+0gAgPMBKTUi07+7vQKbFc6q4t3W8fgD+9ijI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IOGQ6k4scCo+1lFqhGgPdTbgwgNHIKHz8M3p0bpUmr87lSznNvHDjbYbaQY5bGy0V
 btIukcmHUZpm74vJpW+S3d+wklHOpwwBu4Bkv/YmL3T6UuXk8LqsQHHHwtowlVtHfI
 C4AY6KdzSFt3ZaBuwxK/yEdeYr8nWcAr6lMd1m6IPKaE7+VW/Dr5IcJhsSTrQ431/6
 4Yp0A5lHbL7LGwCxOquNVeZYo9+UD7eKjMbYsQyxPHX67CX716ynEADZ2xQ+83yIv8
 MIs67muR1qk5GeZHcmDd41L0mi9U7mcv7AfNF0egtuKm6OAViYp/kAqCCclU1VTEpl
 jxl0DqcZuiR+Q==
Date: Tue, 16 Feb 2021 15:17:44 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Eli Cohen <elic@nvidia.com>
Subject: Re: [PATCH] vdpa/mlx5: Extract correct pointer from driver data
Message-ID: <YCvF+BfHeJWx3x2G@unreal>
References: <20210216055022.25248-1-elic@nvidia.com>
 <20210216055022.25248-2-elic@nvidia.com> <YCtnxyTHJl9TU87L@unreal>
 <20210216064226.GA83717@mtl-vdi-166.wap.labs.mlnx>
 <YCt2PiMIZxbR15IA@unreal>
 <20210216124540.GA94503@mtl-vdi-166.wap.labs.mlnx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210216124540.GA94503@mtl-vdi-166.wap.labs.mlnx>
Cc: mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, si-wei.liu@oracle.com
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

On Tue, Feb 16, 2021 at 02:45:40PM +0200, Eli Cohen wrote:
> On Tue, Feb 16, 2021 at 09:37:34AM +0200, Leon Romanovsky wrote:
> > On Tue, Feb 16, 2021 at 08:42:26AM +0200, Eli Cohen wrote:
> > > On Tue, Feb 16, 2021 at 08:35:51AM +0200, Leon Romanovsky wrote:
> > > > On Tue, Feb 16, 2021 at 07:50:22AM +0200, Eli Cohen wrote:
> > > > > struct mlx5_vdpa_net pointer was stored in drvdata. Extract it as well
> > > > > in mlx5v_remove().
> > > > >
> > > > > Fixes: 74c9729dd892 ("vdpa/mlx5: Connect mlx5_vdpa to auxiliary bus")
> > > > > Signed-off-by: Eli Cohen <elic@nvidia.com>
> > > > > ---
> > > > >  drivers/vdpa/mlx5/net/mlx5_vnet.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> > > > > index 6b0a42183622..4103d3b64a2a 100644
> > > > > --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> > > > > +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> > > > > @@ -2036,9 +2036,9 @@ static int mlx5v_probe(struct auxiliary_device *adev,
> > > > >
> > > > >  static void mlx5v_remove(struct auxiliary_device *adev)
> > > > >  {
> > > > > -	struct mlx5_vdpa_dev *mvdev = dev_get_drvdata(&adev->dev);
> > > > > +	struct mlx5_vdpa_net *ndev = dev_get_drvdata(&adev->dev);
> > > > >
> > > > > -	vdpa_unregister_device(&mvdev->vdev);
> > > > > +	vdpa_unregister_device(&ndev->mvdev.vdev);
> > > > >  }
> > > >
> > > > IMHO, The more correct solution is to fix dev_set_drvdata() call,
> > > > because we are regustering/unregistering/allocating "struct mlx5_vdpa_dev".
> > > >
> > >
> > > We're allocating "struct mlx5_vdpa_net". "struct mlx5_vdpa_dev" is just
> > > a member field of "struct mlx5_vdpa_net".
> >
> > I referred to these lines in the mlx5v_probe():
> >   1986         err = mlx5_vdpa_alloc_resources(&ndev->mvdev);
> >   1987         if (err)
> >   1988                 goto err_mtu;
> >   1989
> >   1990         err = alloc_resources(ndev);
> >   1991         if (err)
> >   1992                 goto err_res;
> >   1993
> >   1994         err = vdpa_register_device(&mvdev->vdev);
> >
> > So mlx5v_remove() is better to be symmetrical.
> >
>
> It's "struct mlx5_vdpa_net" that is being allocated here so it makes
> sense to set this pointer as the the driver data.

Anyway, it doesn't important.

Thanks, for the original patch.
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
