Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCEC7B4FF6
	for <lists.virtualization@lfdr.de>; Mon,  2 Oct 2023 12:16:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F18EE817A1;
	Mon,  2 Oct 2023 10:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F18EE817A1
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r0etBzUw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rcojx4m_I_7J; Mon,  2 Oct 2023 10:16:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D50C58122A;
	Mon,  2 Oct 2023 10:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D50C58122A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21BF8C008C;
	Mon,  2 Oct 2023 10:16:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CABC2C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Oct 2023 10:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6CAA40359
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Oct 2023 10:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6CAA40359
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=r0etBzUw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ofKiPiRrflr
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Oct 2023 10:16:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5114940412
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Oct 2023 10:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5114940412
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 37B8260DE9;
 Mon,  2 Oct 2023 10:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE6EC433C8;
 Mon,  2 Oct 2023 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696241775;
 bh=VLliXuAF8QPVy04D/rtFQGZqAS64x++mfdCoI8VRoW8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r0etBzUwLk2CCjZoBGPM1zTIaXAL+w7ERcTqoBJI+KZWZQ4s8EOCD4jzlE4PHGzRI
 ZNUoqFn+6/vf7dL+COR1dtbqPuFSfY/AkuueyJzRK0oYHgMqc/9OpOjBFzrIfJ9q0u
 oDz0d9S8YDSccLiG81AHjqkmCIox4eSUc0LQElaMFHgToCvnIApVl4kUTEaJ4+rsRK
 6u/AMv0PgdQJx2hL6xqxI/Ao5ccRccvEZN4uVc8OrjrrBAgl+dqIxxgi8VlTQbLmJR
 SyzQUDgk6M18uTZH9DMAjGXOVBI9qgLq3RlzYbpwsFX2QiIkpcDC0KO/nbyJxG/TKR
 C7XshL7DUPdNw==
Date: Mon, 2 Oct 2023 13:16:12 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Dragos Tatulea <dtatulea@nvidia.com>
Subject: Re: [PATCH vhost v2 00/16] vdpa: Add support for vq descriptor
 mappings
Message-ID: <20231002101612.GB7059@unreal>
References: <20230928164550.980832-2-dtatulea@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928164550.980832-2-dtatulea@nvidia.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, gal@nvidia.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 Saeed Mahameed <saeedm@nvidia.com>
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

On Thu, Sep 28, 2023 at 07:45:11PM +0300, Dragos Tatulea wrote:
> This patch series adds support for vq descriptor table mappings which
> are used to improve vdpa live migration downtime. The improvement comes
> from using smaller mappings which take less time to create and destroy
> in hw.
> 
> The first part adds the vdpa core changes from Si-Wei [0].
> 
> The second part adds support in mlx5_vdpa:
> - Refactor the mr code to be able to cleanly add descriptor mappings.
> - Add hardware descriptor mr support.
> - Properly update iotlb for cvq during ASID switch.
> 
> Changes in v2:
> 
> - The "vdpa/mlx5: Enable hw support for vq descriptor mapping" change
>   was split off into two patches to avoid merge conflicts into the tree
>   of Linus.
> 
>   The first patch contains only changes for mlx5_ifc.h. This must be
>   applied into the mlx5-next tree [1] first. Once this patch is applied
>   on mlx5-next, the change has to be pulled fom mlx5-next into the vhost
>   tree and only then the remaining patches can be applied.
> 
> [0] https://lore.kernel.org/virtualization/1694248959-13369-1-git-send-email-si-wei.liu@oracle.com
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux.git/log/?h=mlx5-next
> 
> Dragos Tatulea (13):
>   vdpa/mlx5: Expose descriptor group mkey hw capability

I prepared shared branch with this patch.
https://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux.git/log/?h=mlx5-vhost

Thanks
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
