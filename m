Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7800C18A120
	for <lists.virtualization@lfdr.de>; Wed, 18 Mar 2020 18:06:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0317486E9F;
	Wed, 18 Mar 2020 17:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zh0h5gTRKqhW; Wed, 18 Mar 2020 17:06:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8085C86E7F;
	Wed, 18 Mar 2020 17:06:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53265C18DA;
	Wed, 18 Mar 2020 17:06:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2A2BC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 17:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9B75E883FA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 17:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mAC8Avxy8fbB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 17:06:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 95F54883E1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 17:06:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w16so14972644wrv.13
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 10:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=C6WF92f6FqCxd2uXjXbK38TBNn0Z5GJhzehWNybMYWU=;
 b=G63eeq2nFFKzV+64WvrADIUtMN5OBGThYtmAtjVGtaptHQD4olL6D0s5qBf+u68grF
 sW47lkIys/4zZMTqaHeayGINFFHu8iu3pdaxwOw/JvU59RcHrZBDgLUZVIVrLb4b+rrQ
 nPcGKZS1KdaotMJlEqvaGbLz43a9bzYYVUDA893nGJZ51tHeELpdfLmG3zKd9fGK0KrU
 gx6KnI8nvF4TdxLLI1m1tGk/PuXPfsTQSBLnUqLE5byzxsRGE0rgVmr55vMrGjlJpCWr
 T21zeHodup2gzIENP578OHRpXJZsN5oLUa2k6fLmCjRJy2EYyUhnp3Y/YV5V6WXW5O/F
 c1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C6WF92f6FqCxd2uXjXbK38TBNn0Z5GJhzehWNybMYWU=;
 b=i4IZt1cOPVClATZSyR3GtgSwEIIFX/Z9TZ+/uSrODQkr5dmLrKR7YIM7+vrvdV0eHT
 vCq2DcttnHq405uhmBIEO8BxfPiUzYAs1skoo/ATamYobYCee1wf5tweZy+SRgD1xT+z
 2Qp5+1ZMkgUW+hpUVrTlnb6NLEBPfnmpe4/mWeKUBoXUyqpuwZPBkqw5L3OJQHo1bS91
 4nPfxcAAn29zpe/OCzal474bjAWqlHG0pbnpOEBLgBWZPQ9UqTs0EuPjWs41eeJyMFJF
 ZIc9CEYIH9+2wAOnIDtxeZnM/nOQADDYXj+sn7ScMU3KOPktEQVgQ1MR6eXPl9ZNjfKN
 yUzw==
X-Gm-Message-State: ANhLgQ3Rne3npL6NJ5v9RjDLpGfai1DgJAi5OX8lYcNfhzfrA3EwTGp1
 KyECKLJ74ZxojWvLUi13YZIi8A==
X-Google-Smtp-Source: ADFU+vvtR8KxLPxbAacgtfInpjUnb7K87vRYKsQyiVxHYPV7R+Zu/ccbSDiZ2M0iAiuIRKOIDdBWWw==
X-Received: by 2002:a5d:484d:: with SMTP id n13mr6960351wrs.179.1584551209936; 
 Wed, 18 Mar 2020 10:06:49 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id v8sm10378361wrw.2.2020.03.18.10.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 10:06:49 -0700 (PDT)
Date: Wed, 18 Mar 2020 18:06:41 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH] iommu/virtio: Reject IOMMU page granule larger than
 PAGE_SIZE
Message-ID: <20200318170641.GB1501414@myrica>
References: <20200318114047.1518048-1-jean-philippe@linaro.org>
 <f1f3d844-8080-d26d-200e-a38480895480@arm.com>
 <09a32736-ea01-21f9-6bd5-9344b368f90a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09a32736-ea01-21f9-6bd5-9344b368f90a@redhat.com>
Cc: joro@8bytes.org, iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org,
 Bharat Bhushan <bbhushan2@marvell.com>, Robin Murphy <robin.murphy@arm.com>
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

On Wed, Mar 18, 2020 at 05:14:05PM +0100, Auger Eric wrote:
> Hi,
> 
> On 3/18/20 1:00 PM, Robin Murphy wrote:
> > On 2020-03-18 11:40 am, Jean-Philippe Brucker wrote:
> >> We don't currently support IOMMUs with a page granule larger than the
> >> system page size. The IOVA allocator has a BUG_ON() in this case, and
> >> VFIO has a WARN_ON().
> 
> Adding Alex in CC in case he has time to jump in. At the moment I don't
> get why this WARN_ON() is here.
> 
> This was introduced in
> c8dbca165bb090f926996a572ea2b5b577b34b70 vfio/iommu_type1: Avoid overflow
> 
> >>
> >> It might be possible to remove these obstacles if necessary. If the host
> >> uses 64kB pages and the guest uses 4kB, then a device driver calling
> >> alloc_page() followed by dma_map_page() will create a 64kB mapping for a
> >> 4kB physical page, allowing the endpoint to access the neighbouring 60kB
> >> of memory. This problem could be worked around with bounce buffers.
> > 
> > FWIW the fundamental issue is that callers of iommu_map() may expect to
> > be able to map two or more page-aligned regions directly adjacent to
> > each other for scatter-gather purposes (or ring buffer tricks), and
> > that's just not possible if the IOMMU granule is too big. Bounce
> > buffering would be a viable workaround for the streaming DMA API and
> > certain similar use-cases, but not in general (e.g. coherent DMA, VFIO,
> > GPUs, etc.)
> > 
> > Robin.
> > 
> >> For the moment, rather than triggering the IOVA BUG_ON() on mismatched
> >> page sizes, abort the virtio-iommu probe with an error message.
> 
> I understand this is a introduced as a temporary solution but this
> sounds as an important limitation to me. For instance this will prevent
> from running a fedora guest exposed with a virtio-iommu with a RHEL host.

Looks like you have another argument for nested translation :) We could
probably enable 64k-4k for VFIO, but I don't think we can check and fix
all uses of iommu_map() across the kernel, even if we disallow
IOMMU_DOMAIN_DMA for this case.

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
