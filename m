Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D0D34E7CF
	for <lists.virtualization@lfdr.de>; Tue, 30 Mar 2021 14:48:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA54E60799;
	Tue, 30 Mar 2021 12:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15lDdSW7jzEY; Tue, 30 Mar 2021 12:48:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78EC6607D5;
	Tue, 30 Mar 2021 12:48:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6502C0017;
	Tue, 30 Mar 2021 12:48:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D3C9C000A;
 Tue, 30 Mar 2021 12:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B0B940199;
 Tue, 30 Mar 2021 12:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVJG_owFbdUk; Tue, 30 Mar 2021 12:48:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21F84400B8;
 Tue, 30 Mar 2021 12:48:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F1D46192C;
 Tue, 30 Mar 2021 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617108529;
 bh=CwVLHzAbIRGNmseGymZZt8ntYfUkMAx0Rqzxp8d9noQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pUD7C5DybyqHBKMsmQEivGH1hWwGa3N5OI6xd0qkt45xHAkRAjS5eAJuXzsJ2ZUeM
 1k8Lwt7u1XxXRUk+MdsVDvU1bcxY/2HJn97Ks1yj4DVG89JSTfQbMclWyrEVDHm0IO
 pEDTRRc99XbGsioMmRpeBMSqjSSQpm/HZwhe42CZnA6SwVo+4AtsPgEUQ1xNb2lmfl
 2FE8hJuJOxfsW78UaDpQTyuEZxpOndqdfZ+em1/Qt+6iZJJiqlsOtgOBqxNmZy8BZT
 14MeYEp9Teh87QbVXWBczJ7QWpGAx1XLwx0jiXFF/WOrHYVo4TBskmtFxafXnp9va5
 MiPidn4q2sDgg==
Date: Tue, 30 Mar 2021 13:48:43 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/18] iommu/fsl_pamu: merge handle_attach_device into
 fsl_pamu_attach_device
Message-ID: <20210330124843.GI5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-10-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:15PM +0100, Christoph Hellwig wrote:
> No good reason to split this functionality over two functions.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 59 +++++++++++----------------------
>  1 file changed, 20 insertions(+), 39 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
