Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8488C351257
	for <lists.virtualization@lfdr.de>; Thu,  1 Apr 2021 11:34:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD7AB40FA2;
	Thu,  1 Apr 2021 09:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEOkmo4wf6K7; Thu,  1 Apr 2021 09:34:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AFC740FAE;
	Thu,  1 Apr 2021 09:34:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 755B7C000B;
	Thu,  1 Apr 2021 09:34:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C4BBC000A;
 Thu,  1 Apr 2021 09:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B66A40528;
 Thu,  1 Apr 2021 09:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AB70holSYDgf; Thu,  1 Apr 2021 09:34:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E54744052D;
 Thu,  1 Apr 2021 09:34:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6995C68B05; Thu,  1 Apr 2021 11:34:08 +0200 (CEST)
Date: Thu, 1 Apr 2021 11:34:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 08/18] iommu/fsl_pamu: merge pamu_set_liodn and map_liodn
Message-ID: <20210401093408.GD2934@lst.de>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-9-hch@lst.de> <20210330124651.GH5908@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330124651.GH5908@willie-the-truck>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
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

On Tue, Mar 30, 2021 at 01:46:51PM +0100, Will Deacon wrote:
> > +	ret = pamu_config_ppaace(liodn, geom->aperture_start,
> > +				 geom->aperture_end - 1, ~(u32)0,
> > +				 0, dma_domain->snoop_id, dma_domain->stash_id,
> > +				 PAACE_AP_PERMS_QUERY | PAACE_AP_PERMS_UPDATE);
> 
> There's more '+1' / '-1' confusion here with aperture_end which I'm not
> managing to follow. What am I missing?

You did not missing anything, I messed this up.   Fixed.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
