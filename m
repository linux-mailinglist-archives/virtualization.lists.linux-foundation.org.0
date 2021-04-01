Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF29351265
	for <lists.virtualization@lfdr.de>; Thu,  1 Apr 2021 11:36:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 195E784A23;
	Thu,  1 Apr 2021 09:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3UZxwhnT_oA; Thu,  1 Apr 2021 09:36:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B8783B38;
	Thu,  1 Apr 2021 09:36:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28202C0017;
	Thu,  1 Apr 2021 09:36:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14F7CC000A;
 Thu,  1 Apr 2021 09:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEFFC40FB1;
 Thu,  1 Apr 2021 09:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6vF3QBLEZRw; Thu,  1 Apr 2021 09:36:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E901840FAE;
 Thu,  1 Apr 2021 09:36:45 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9A5C868B05; Thu,  1 Apr 2021 11:36:42 +0200 (CEST)
Date: Thu, 1 Apr 2021 11:36:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 11/18] iommu/fsl_pamu: remove the snoop_id field
Message-ID: <20210401093642.GE2934@lst.de>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-12-hch@lst.de>
 <20210330125816.GK5908@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330125816.GK5908@willie-the-truck>
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

On Tue, Mar 30, 2021 at 01:58:17PM +0100, Will Deacon wrote:
> pamu_config_ppaace() takes quite a few useless parameters at this stage,
> but anyway:

I'll see it it makes sense to throw in another patch at the end to cut
it down a bit more.

> Acked-by: Will Deacon <will@kernel.org>
> 
> Do you know if this driver is actually useful? Once the complexity has been
> stripped back, the stubs and default values really stand out.

Yeah.  No idea what the usefulness of this driver is.  Bascially all it
seems to do is to setup a few registers to allow access to the whole
physical memory.  But maybe that is required on this hardware to allow
for any DMA access?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
