Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E21434E816
	for <lists.virtualization@lfdr.de>; Tue, 30 Mar 2021 14:58:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87E7D83412;
	Tue, 30 Mar 2021 12:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPnbwpoVV2HR; Tue, 30 Mar 2021 12:58:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E99E83443;
	Tue, 30 Mar 2021 12:58:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85BA3C0017;
	Tue, 30 Mar 2021 12:58:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D00E6C000A;
 Tue, 30 Mar 2021 12:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD50D4047C;
 Tue, 30 Mar 2021 12:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ikRubZkyDZ2b; Tue, 30 Mar 2021 12:58:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F5764047B;
 Tue, 30 Mar 2021 12:58:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57D72619BC;
 Tue, 30 Mar 2021 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617109102;
 bh=5U0XNBMr1VJpT/QJQ4fWikCzjX4441gkw/Sdm3D+wWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DWN42kSzKc2/IQeLw9I9cnky9VKE8OZrRaxIp7imnahbv7MAIlCPAQOEf/2y5NMu8
 vScKgy/fFSn0Fhoux7qMTY9sZe6WF6VjaMVEZkplEDgA2afh3x+8zYKKjzvGPJlt06
 TgRQsOK9uVedQAZ/Jp8IqZ6ws7Nvou7AeWe16C/mwxZuyO+gjDcTWK3EQ4Q5CObwBj
 VbEcwCuxV+jbp7XKHFFopVyoBz4U9/TzMTSXuOeSy23hSGo2eadFh3veqGUn4ZV7xt
 6x9TFJiXvd7XE2fRBfyVs8VtDECvjUN4E+dczmX3kEuavFttoE7YeIPf2oxaLtcDm7
 ZIQdoQHPZqTlA==
Date: Tue, 30 Mar 2021 13:58:17 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/18] iommu/fsl_pamu: remove the snoop_id field
Message-ID: <20210330125816.GK5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-12-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:17PM +0100, Christoph Hellwig wrote:
> The snoop_id is always set to ~(u32)0.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 5 ++---
>  drivers/iommu/fsl_pamu_domain.h | 1 -
>  2 files changed, 2 insertions(+), 4 deletions(-)

pamu_config_ppaace() takes quite a few useless parameters at this stage,
but anyway:

Acked-by: Will Deacon <will@kernel.org>

Do you know if this driver is actually useful? Once the complexity has been
stripped back, the stubs and default values really stand out.

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
