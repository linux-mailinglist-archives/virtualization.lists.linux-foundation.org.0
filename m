Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C7420A20
	for <lists.virtualization@lfdr.de>; Mon,  4 Oct 2021 13:31:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF37D42776;
	Mon,  4 Oct 2021 11:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejQYuZQs4sRx; Mon,  4 Oct 2021 11:31:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C3B3B4277D;
	Mon,  4 Oct 2021 11:31:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8008C0025;
	Mon,  4 Oct 2021 11:31:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CA91C000D;
 Mon,  4 Oct 2021 11:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 218AF4277D;
 Mon,  4 Oct 2021 11:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOVoBZ-KWrdR; Mon,  4 Oct 2021 11:31:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD71742776;
 Mon,  4 Oct 2021 11:31:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 389166126A;
 Mon,  4 Oct 2021 11:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633347087;
 bh=9eIlIsfHP4knhIwYLjRza2zeq4D4+bTC9yyALw6VTm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jhFX7IxCrBvKVHXdciM4UfP5k4cacZRr1l06EUPGJXrcOuYunFNiT4xMiLyuZCT42
 KDxOue4JEnyYteWXJmd0fWgHOj9NdG+vEp/JiJn9DVWVmvSQf+gEnpGN8TdRwYmEtZ
 K/Gw5H5WxgrKuM1LBoIj8H/j+0alUyW4rbigV0ZMFx+s66MgILJQ/bT9xf7oeItxeh
 81Ix7t4dclBKnzEmOPGgs+HZT6BHPhVefzfHy+Q+JuobaPA/wy2AiRq7o8EyE2YYiD
 0RDRy2AA046P+g1nby14u6nUPJSMLI2ovH/0SnWjPj8nxB1hsPIpW33g7nChVl2zWA
 p6lOfMXB3P2wQ==
Date: Mon, 4 Oct 2021 12:31:21 +0100
From: Will Deacon <will@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH 1/5] iova: Move fast alloc size roundup into
 alloc_iova_fast()
Message-ID: <20211004113121.GA27373@willie-the-truck>
References: <1632477717-5254-1-git-send-email-john.garry@huawei.com>
 <1632477717-5254-2-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1632477717-5254-2-git-send-email-john.garry@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mst@redhat.com, joro@8bytes.org, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 xieyongji@bytedance.com, iommu@lists.linux-foundation.org,
 thunder.leizhen@huawei.com, robin.murphy@arm.com, baolu.lu@linux.intel.com
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

On Fri, Sep 24, 2021 at 06:01:53PM +0800, John Garry wrote:
> It really is a property of the IOVA rcache code that we need to alloc a
> power-of-2 size, so relocate the functionality to resize into
> alloc_iova_fast(), rather than the callsites.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> ---
>  drivers/iommu/dma-iommu.c            | 8 --------
>  drivers/iommu/iova.c                 | 9 +++++++++
>  drivers/vdpa/vdpa_user/iova_domain.c | 8 --------
>  3 files changed, 9 insertions(+), 16 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
