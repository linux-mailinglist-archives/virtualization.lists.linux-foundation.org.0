Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B163D4D02
	for <lists.virtualization@lfdr.de>; Sun, 25 Jul 2021 11:51:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B458271D;
	Sun, 25 Jul 2021 09:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfxckvEH48NB; Sun, 25 Jul 2021 09:51:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6C05B829BB;
	Sun, 25 Jul 2021 09:51:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2A4CC000E;
	Sun, 25 Jul 2021 09:51:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D383C000E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 09:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 419854039F
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 09:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3EDJ0nV2hl5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 09:51:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAB1940307
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 09:51:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F0236069E;
 Sun, 25 Jul 2021 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627206679;
 bh=hyDjtkF5eCcWkADXAB8rrXfHqOep6tJmcaDVlottAjM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UcHBjYhHkRvNFCR4CdHvCdWWKNWeM7lDfj+yZCIoXN35uoSWLbiLjnpI86ER6Z4ev
 MJQaWOhLCGWcI/tLT13yaUl2ir2HpYPkpDV6zOT1eUw636FBc2Bd05wAMwDgxzusaO
 VjsNOdFMMcThgim+LhDj+hkz7acuKNaKxLDSV623Hbmo2MPcecr5zcQxu2AQbGTF2K
 SisM+Qqhg6mrVDh5teydoYCYvI7yxxWLWrH/QLWYxwPtCI+PLMkHS+DCJsgKNH/85Y
 TI6CB4ed9uEoHM4qndkP+VXc6yg82KZ85QyZoGoSdTslai20DmL3r+uIU9DV9L/B53
 n7aPfed4zAGeA==
Date: Sun, 25 Jul 2021 12:51:15 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH mlx5-next] IB/mlx5: Rename is_apu_thread_cq function to
 is_apu_cq
Message-ID: <YP00E/bLM+RTY3u7@unreal>
References: <0e3364dab7e0e4eea5423878b01aa42470be8d36.1626609184.git.leonro@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e3364dab7e0e4eea5423878b01aa42470be8d36.1626609184.git.leonro@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Jakub Kicinski <kuba@kernel.org>,
 Saeed Mahameed <saeedm@nvidia.com>, Tal Gilboa <talgi@nvidia.com>
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

On Sun, Jul 18, 2021 at 02:54:13PM +0300, Leon Romanovsky wrote:
> From: Tal Gilboa <talgi@nvidia.com>
> 
> is_apu_thread_cq() used to detect CQs which are attached to APU
> threads. This was extended to support other elements as well,
> so the function was renamed to is_apu_cq().
> 
> c_eqn_or_apu_element was extended from 8 bits to 32 bits, which wan't
> reflected when the APU support was first introduced.
> 
> Signed-off-by: Tal Gilboa <talgi@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/infiniband/hw/mlx5/cq.c                            | 2 +-
>  drivers/infiniband/hw/mlx5/devx.c                          | 7 +++----
>  drivers/net/ethernet/mellanox/mlx5/core/cq.c               | 3 ++-
>  drivers/net/ethernet/mellanox/mlx5/core/en_main.c          | 2 +-
>  drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.c        | 2 +-
>  drivers/net/ethernet/mellanox/mlx5/core/steering/dr_send.c | 2 +-
>  drivers/vdpa/mlx5/net/mlx5_vnet.c                          | 2 +-
>  include/linux/mlx5/mlx5_ifc.h                              | 5 ++---
>  8 files changed, 12 insertions(+), 13 deletions(-)

Applied to mlx5-next.
616d57693455 ("IB/mlx5: Rename is_apu_thread_cq function to is_apu_cq")

Jason, please pull.

Thanks
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
