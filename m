Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F4C351521
	for <lists.virtualization@lfdr.de>; Thu,  1 Apr 2021 15:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0FB840004;
	Thu,  1 Apr 2021 13:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7S78xLx1ufR; Thu,  1 Apr 2021 13:27:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87517400CE;
	Thu,  1 Apr 2021 13:27:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DA60C0017;
	Thu,  1 Apr 2021 13:27:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C292C000A;
 Thu,  1 Apr 2021 13:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E75B7400A9;
 Thu,  1 Apr 2021 13:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39sJa3UfN0Bq; Thu,  1 Apr 2021 13:27:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57AC440004;
 Thu,  1 Apr 2021 13:27:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A058961241;
 Thu,  1 Apr 2021 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617283623;
 bh=ZaHUJTjbwUns7JXT//LzMknWL6q18amExZVUaKXxS9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tPQZOKwDhHIr5lXyEm/VCmT3W6pqy/ixtcnXbdgYlJ8ni/2f59nR0dso2anIOy/6D
 yubGrVetOumTcaiZbHX4Olh4hsU0tjohQ7KZR1tENMpRhYzw95x7arHY4ue6E+9WkX
 clEEoWENof9fvWzU58Ok8pHkvy7Zuy52OrSJHN1IH1arMaZPU9GF+HLzz4hGC+Inh/
 buLk1kGm/5OBfSi+8kmpw9NgIzV3NCqRMNsuMHTzntbgKIkhS5WbnN8KMDtIFbQ5gR
 Lneqrq3L7HQIkqlYg8jtbsLKJlGI3o+q19JOhoYOpbzuxTj5LL62tV804S9J+b0JeI
 jTztNA2TZ9zgQ==
Date: Thu, 1 Apr 2021 14:26:58 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 16/18] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
Message-ID: <20210401132657.GA8997@willie-the-truck>
References: <20210316153825.135976-17-hch@lst.de>
 <20210330131149.GP5908@willie-the-truck>
 <a6952aa7-4d7e-54f0-339e-e15f88596dcc@arm.com>
 <20210330135801.GA6187@willie-the-truck>
 <578d6aa5-4239-f5d7-2e9f-686b18e52bba@arm.com>
 <20210331114947.GA7626@willie-the-truck>
 <ef895942-e115-7878-ab86-37e8a1614df5@arm.com>
 <20210331153256.GA7815@willie-the-truck>
 <81dd27fe-28ee-c800-fe5d-aaa64cb93513@arm.com>
 <20210401095945.GA6726@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401095945.GA6726@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kvm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
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

On Thu, Apr 01, 2021 at 11:59:45AM +0200, Christoph Hellwig wrote:
> For now I'll just pass the iommu_domain to iommu_get_dma_strict,
> so that we can check for it.  We can do additional cleanups on top
> of that later.

Sounds good to me, cheers!

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
