Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4134E850
	for <lists.virtualization@lfdr.de>; Tue, 30 Mar 2021 15:04:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15CD440256;
	Tue, 30 Mar 2021 13:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7ASRnfN2Qin; Tue, 30 Mar 2021 13:04:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0907402BC;
	Tue, 30 Mar 2021 13:04:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA8D8C0017;
	Tue, 30 Mar 2021 13:04:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE1F7C000A;
 Tue, 30 Mar 2021 13:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCA93607DF;
 Tue, 30 Mar 2021 13:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_UnaG7YnogN; Tue, 30 Mar 2021 13:04:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EEDE6062A;
 Tue, 30 Mar 2021 13:04:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44FF2619B4;
 Tue, 30 Mar 2021 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617109473;
 bh=Ai+ioablpsVCP2atsV7c8O/Yf3FVTPamywu1gCQBwQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HhMpk57DFGVpx4ab+L1MraoUiLI5kQLI2sEy2eeVU34m/M9hnmwHSf1BSYHb+BN7B
 OH/3kLJ4LRy/KSa51z3LwWQBZHM4JRe/0movK0avHRIMyQnkvWZ6oW5mEj0UPhv8kQ
 tn65df3bajqTqdrmTJ67rxDd1vixWUxfqPUxOhITAvzITPwIDd2ssDWDcbGhabIZQv
 5Bfl/YURDw2+T3/H6P/OVMEBHQMNsqzXCjXk8HuSfMiFNJSlcJ5meb25/4prvxBxMN
 lxUV8mLtcIaNFm0+8MyEBCfE8BxCcQpHQtJSeqiecPNHliWDi0EAvdK2kf87cH0eE7
 7QTL4O7hg9h0Q==
Date: Tue, 30 Mar 2021 14:04:27 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/18] iommu: remove DOMAIN_ATTR_NESTING
Message-ID: <20210330130427.GN5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-15-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-15-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:20PM +0100, Christoph Hellwig wrote:
> Use an explicit enable_nesting method instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 43 ++++++++-------------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 30 +++++++-------
>  drivers/iommu/intel/iommu.c                 | 31 +++++----------
>  drivers/iommu/iommu.c                       | 10 +++++
>  drivers/vfio/vfio_iommu_type1.c             |  5 +--
>  include/linux/iommu.h                       |  4 +-
>  6 files changed, 55 insertions(+), 68 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
