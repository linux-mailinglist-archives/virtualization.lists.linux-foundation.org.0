Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3535B420A49
	for <lists.virtualization@lfdr.de>; Mon,  4 Oct 2021 13:44:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C886142725;
	Mon,  4 Oct 2021 11:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGJPcv_g2E4z; Mon,  4 Oct 2021 11:44:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B771142790;
	Mon,  4 Oct 2021 11:44:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC79FC0025;
	Mon,  4 Oct 2021 11:44:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07798C000D;
 Mon,  4 Oct 2021 11:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC6A484A07;
 Mon,  4 Oct 2021 11:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BBvKui_YRgj4; Mon,  4 Oct 2021 11:44:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26EFC84A05;
 Mon,  4 Oct 2021 11:44:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF52361360;
 Mon,  4 Oct 2021 11:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633347863;
 bh=mQRvQ3f408AEkWZq+4V4qIbeNN7Z/LBzAzfPMOSXCA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KdPqz8NgYpjdUX+B1Ny6xDGh7zzNANIXH7XUdlxCGRwgl+PTCAK3SdPPjyqc6wO3T
 1H68ZLVZlseYCQBzr8vVzrunQsjJ1v9E0bKjOQY1IAmjWFa6KruOcNHjv7OTKHt2TU
 1gk3/B0SxIW5uDlMt3EXEA6PsNf9V3a29ojU4UqI6E773Q5+DYyZmKUnVKHCQkiSpY
 Md9LoC1M+gmmBm5r+XfZ5uLTbCsMIeUU/Q8QU7ts3rESzt2SB+wo3W8PtU1lzHG7yt
 Nw9Qovt/LahYFO84PBclT04b3wSKuyenDETSx2eTbNjERsgXPmgenGFtnzeuwvG+LF
 PWS+f+GQHmE+A==
Date: Mon, 4 Oct 2021 12:44:18 +0100
From: Will Deacon <will@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH 0/5] iommu: Some IOVA code reorganisation
Message-ID: <20211004114418.GC27373@willie-the-truck>
References: <1632477717-5254-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1632477717-5254-1-git-send-email-john.garry@huawei.com>
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

On Fri, Sep 24, 2021 at 06:01:52PM +0800, John Garry wrote:
> The IOVA domain structure is a bit overloaded, holding:
> - IOVA tree management
> - FQ control
> - IOVA rcache memories
> 
> Indeed only a couple of IOVA users use the rcache, and only dma-iommu.c
> uses the FQ feature.
> 
> This series separates out that structure. In addition, it moves the FQ
> code into dma-iommu.c . This is not strictly necessary, but it does make
> it easier for the FQ domain lookup the rcache domain.
> 
> The rcache code stays where it is, as it may be reworked in future, so
> there is not much point in relocating and then discarding.
> 
> This topic was initially discussed and suggested (I think) by Robin here:
> https://lore.kernel.org/linux-iommu/1d06eda1-9961-d023-f5e7-fe87e768f067@arm.com/

It would be useful to have Robin's Ack on patches 2-4. The implementation
looks straightforward to me, but the thread above isn't very clear about
what is being suggested.

To play devil's advocate: there aren't many direct users of the iovad code:
either they'll die out entirely (and everybody will use the dma-iommu code)
and it's fine having the flush queue code where it is, or we'll get more
users and the likelihood of somebody else wanting flush queues increases.

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
