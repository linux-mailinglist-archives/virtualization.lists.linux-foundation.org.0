Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E2434E8B3
	for <lists.virtualization@lfdr.de>; Tue, 30 Mar 2021 15:16:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E55ED607DF;
	Tue, 30 Mar 2021 13:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mbMgkzPc5-z7; Tue, 30 Mar 2021 13:16:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id D294C60720;
	Tue, 30 Mar 2021 13:16:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6122FC000A;
	Tue, 30 Mar 2021 13:16:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F3ECC000A;
 Tue, 30 Mar 2021 13:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F93240346;
 Tue, 30 Mar 2021 13:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tblg0v2NUdan; Tue, 30 Mar 2021 13:16:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 941C540256;
 Tue, 30 Mar 2021 13:16:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC2AD600CD;
 Tue, 30 Mar 2021 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617110172;
 bh=oFXOyKxZKWj8q01FK45XVtCIPwg3akZJbcVTrbuBLVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l1jGuJCF4w1qP0WDBFRJLJbU4g/DIEbv74dOL2tJmCIJybKQT/Nk25Yv0qXeq5IaC
 EisAJbuKCJR8lIBRsfnD7dSAWI3QM8tCB0T4wmdwHhk0eojOnRHrf3takMiJpJwGys
 qw9rVNUl438UrVnp+OEcnv9h6o59f29jn7JL4MjeriTt710N2VzyfvUgJkzuLUdgJx
 4Y2jHOJXj+PRMj3LOs3p9/SoE/WlKyknigr1X7t5UGpaPbgNBBHfe0p2oKPY6K334d
 WE4pAmPZzxHYIndqKqgDdIvzbqUmJFYVOWwBPIBWWv8bjLCKMWwTnaXYTxNqTxJ/U6
 pwVpVBFdgZ8rw==
Date: Tue, 30 Mar 2021 14:16:06 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/18] iommu: remove iommu_domain_{get,set}_attr
Message-ID: <20210330131606.GA6122@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-19-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-19-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
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

On Tue, Mar 16, 2021 at 04:38:24PM +0100, Christoph Hellwig wrote:
> Remove the now unused iommu attr infrastructure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/iommu/iommu.c | 26 --------------------------
>  include/linux/iommu.h | 36 ------------------------------------
>  2 files changed, 62 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
