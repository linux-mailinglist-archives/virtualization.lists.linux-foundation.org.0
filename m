Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D14034E8A9
	for <lists.virtualization@lfdr.de>; Tue, 30 Mar 2021 15:15:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A54140343;
	Tue, 30 Mar 2021 13:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3crfIhdHn-m; Tue, 30 Mar 2021 13:15:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B034031D;
	Tue, 30 Mar 2021 13:15:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2F19C0017;
	Tue, 30 Mar 2021 13:14:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5685C000A;
 Tue, 30 Mar 2021 13:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A666483942;
 Tue, 30 Mar 2021 13:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ta8-7nPnDZGR; Tue, 30 Mar 2021 13:14:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06E9883521;
 Tue, 30 Mar 2021 13:14:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CC5561969;
 Tue, 30 Mar 2021 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617110094;
 bh=/N2/wqR7fHjSlaXvMJl1cBMXpKNT/xsesoTMSv6L4kI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H6MULnqd9QB+NK7wZgljGNSyugWhqntzuA7hl6JZlcXm+z2v3zoJChkrFgo2shzTp
 7kWpdutfdv00Me8uRq6k4CXKfRgdJaXG0FfA9YbsG7wlg+Z7r07gTIgQWxT1LkYSkp
 DWVbOk8SbfrQM2yIud8rcAqs2GuTEOcAwOUAIWj8VuZr3tlHjGMQxciGj89GTcsI+6
 wA3QIpJx15k5zaCAI2i0QTwhK5h7hVXzLMWRdWcVoJrrjF7aHn1fmW9gVtnH0wdl2V
 3tX5hH0qrjR/RU13f5CzrPtpxHRIDR3ndCSVxdrE0CM6hBMj0APadZ/nh/M/gdHzKH
 JgeNVk/teVZHA==
Date: Tue, 30 Mar 2021 14:14:49 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 17/18] iommu: remove DOMAIN_ATTR_IO_PGTABLE_CFG
Message-ID: <20210330131448.GQ5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-18-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-18-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:23PM +0100, Christoph Hellwig wrote:
> Use an explicit set_pgtable_quirks method instead that just passes
> the actual quirk bitmask instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c   | 64 +++++--------------------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h   |  2 +-
>  drivers/iommu/iommu.c                   | 11 +++++
>  include/linux/io-pgtable.h              |  4 --
>  include/linux/iommu.h                   | 12 ++++-
>  6 files changed, 35 insertions(+), 63 deletions(-)

I'm fine with this for now, although there has been talk about passing
things other than boolean flags as page-table quirks. We can cross that
bridge when we get there, so:

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
