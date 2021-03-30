Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5466D34E7B0
	for <lists.virtualization@lfdr.de>; Tue, 30 Mar 2021 14:44:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAB7483B9E;
	Tue, 30 Mar 2021 12:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zleYVGFwFduc; Tue, 30 Mar 2021 12:44:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81DD383CE6;
	Tue, 30 Mar 2021 12:44:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5E30C0017;
	Tue, 30 Mar 2021 12:44:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FDAFC000A;
 Tue, 30 Mar 2021 12:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2E204018E;
 Tue, 30 Mar 2021 12:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1sTgdlGkgG8G; Tue, 30 Mar 2021 12:44:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D112400B8;
 Tue, 30 Mar 2021 12:44:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94D82619A7;
 Tue, 30 Mar 2021 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617108264;
 bh=Cgba8HldB3p1zZnOmguZN9H7CCw3hn4+e9TzO2/HTCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XqjgVkeihtvV0muU9cRH6UOfyOCOIad3+p70dAR0KpfjquoAv9Udl7usitJx6k+BL
 QjydYcgHavFRbcWpgbvPPrWkiV/HoPSK0Y5Al7Wgn8qeEE7Dz7897ny039C66QZuRc
 Aj/mq1osuVlfi5bYrw8gZ7w0/xKHRj1it7sjuQIQuPs/7Lf2GPQHSGtch0QCHfcRhH
 54sfzj/rL7F2gyyuPDAkX+EUBI3YuPHKKPDrOQzuj0iQ59qI4wMM4uxguudNDIGvnN
 U1eVEzquLKFCOh3sFFHAV1h8ykTy7BSJi3dHezZk9HYl0EguBcQW/0R42/h/WW3C0M
 1/q4jESgaIcAw==
Date: Tue, 30 Mar 2021 13:44:18 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/18] iommu/fsl_pamu: replace DOMAIN_ATTR_FSL_PAMU_STASH
 with a direct call
Message-ID: <20210330124418.GG5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-8-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:13PM +0100, Christoph Hellwig wrote:
> Add a fsl_pamu_configure_l1_stash API that qman_portal can call directly
> instead of indirecting through the iommu attr API.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  arch/powerpc/include/asm/fsl_pamu_stash.h | 12 +++---------
>  drivers/iommu/fsl_pamu_domain.c           | 16 +++-------------
>  drivers/iommu/fsl_pamu_domain.h           |  2 --
>  drivers/soc/fsl/qbman/qman_portal.c       | 18 +++---------------
>  include/linux/iommu.h                     |  1 -
>  5 files changed, 9 insertions(+), 40 deletions(-)

Heh, this thing is so over-engineered.

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
