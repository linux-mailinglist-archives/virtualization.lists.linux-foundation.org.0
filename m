Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A41CF18A1ED
	for <lists.virtualization@lfdr.de>; Wed, 18 Mar 2020 18:47:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 53377883BF;
	Wed, 18 Mar 2020 17:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efU0AjZ3YMew; Wed, 18 Mar 2020 17:47:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AE3C08851B;
	Wed, 18 Mar 2020 17:47:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B6CCC013E;
	Wed, 18 Mar 2020 17:47:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E511C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 17:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 38833883E1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 17:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yIo4ri0uicbP
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 17:47:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4CB0B883BF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 17:47:49 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h6so11194158wrs.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kseN3s5pbnG7/vsBLsHjoINNOTDUkiMy3yEQnmpP6Fs=;
 b=J3g9TKfqJKopWqYJ4Y0m5U/Ogv9LpWEhsfO1HmoDswbPX8L/ha+lgBFkJKyTI7r88m
 Cjm5kc047GLWkh6q2iDWmt8qg15ES2KxTFUFoyR/bQsAFtXrkHp3okpgMwIyz4ghn9os
 F6Vf6dLyJCOv/1TuEXrNklLp+sNs3lqvLMxX8aHVzgsKV2rHHNwoNBA91smn0+HwPZdQ
 9vkNHmbroNM+cKAFXQxr8mOYotWu1b2TuX8wXNIhLzhx7YsdYUqgOJq2TFh+WNkGXjky
 Oqfz7T7889zYG1D7d+U0/MBJQLyNBALavAeriNAMcxdbd0WJIrzDDfWy72PSENn3SJIY
 O7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kseN3s5pbnG7/vsBLsHjoINNOTDUkiMy3yEQnmpP6Fs=;
 b=KuoBQw1O1ZHM9Qkq0stgIKGMVd85PKsu5iReJLCnzCCEmM4+7KQiBxJCKuz1wDIVI3
 roalmh2oPCyZJxt+YrvhJ/HCfE1BZw3SYWNGSDFQlYqjARbBTlTHNYKvYEeHIVYtjN87
 94oPbYzNXWg+QraL7IbYT5EVG68M7yqjBaDvzMuye9bx3fJz7bpBmnRSUntE3mF45znb
 qb5Jgq647UEZ/LYajuvZqSf3GyHl0ofBb/XVofWhC/bVIEA7sujAIEmVBpViJBZp561c
 3SZs72ADgiVcTKwt7l93Vsd3mJJR2asVCinOjr21cD5K7Q/Vy1Tp/YDa9qkq/xRuiOpu
 nooA==
X-Gm-Message-State: ANhLgQ1TNz8/3nT4xKfFrPqgl7uLa9IyvVfRy4ckQik05EwjL5RcLQAr
 GpdvFx4GS8DCTjiisaqSUfGNwA==
X-Google-Smtp-Source: ADFU+vvgCw3uOdQSIo2muV1GpLBLz0ExzhMew/9lEbFzDkfje06dVkFXLY5lNdG1Ejb+YtFgNPprng==
X-Received: by 2002:a5d:6388:: with SMTP id p8mr6553786wru.51.1584553667583;
 Wed, 18 Mar 2020 10:47:47 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id b203sm4887638wmc.45.2020.03.18.10.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 10:47:47 -0700 (PDT)
Date: Wed, 18 Mar 2020 18:47:39 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/virtio: Reject IOMMU page granule larger than
 PAGE_SIZE
Message-ID: <20200318174739.GC1501414@myrica>
References: <20200318114047.1518048-1-jean-philippe@linaro.org>
 <f1f3d844-8080-d26d-200e-a38480895480@arm.com>
 <09a32736-ea01-21f9-6bd5-9344b368f90a@redhat.com>
 <5b637bf5-dc49-b6eb-852a-a4317602d43e@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b637bf5-dc49-b6eb-852a-a4317602d43e@arm.com>
Cc: Auger Eric <eric.auger@redhat.com>, iommu@lists.linux-foundation.org,
 Bharat Bhushan <bbhushan2@marvell.com>,
 virtualization@lists.linux-foundation.org
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

On Wed, Mar 18, 2020 at 05:13:59PM +0000, Robin Murphy wrote:
> On 2020-03-18 4:14 pm, Auger Eric wrote:
> > Hi,
> > 
> > On 3/18/20 1:00 PM, Robin Murphy wrote:
> > > On 2020-03-18 11:40 am, Jean-Philippe Brucker wrote:
> > > > We don't currently support IOMMUs with a page granule larger than the
> > > > system page size. The IOVA allocator has a BUG_ON() in this case, and
> > > > VFIO has a WARN_ON().
> > 
> > Adding Alex in CC in case he has time to jump in. At the moment I don't
> > get why this WARN_ON() is here.
> > 
> > This was introduced in
> > c8dbca165bb090f926996a572ea2b5b577b34b70 vfio/iommu_type1: Avoid overflow
> > 
> > > > 
> > > > It might be possible to remove these obstacles if necessary. If the host
> > > > uses 64kB pages and the guest uses 4kB, then a device driver calling
> > > > alloc_page() followed by dma_map_page() will create a 64kB mapping for a
> > > > 4kB physical page, allowing the endpoint to access the neighbouring 60kB
> > > > of memory. This problem could be worked around with bounce buffers.
> > > 
> > > FWIW the fundamental issue is that callers of iommu_map() may expect to
> > > be able to map two or more page-aligned regions directly adjacent to
> > > each other for scatter-gather purposes (or ring buffer tricks), and
> > > that's just not possible if the IOMMU granule is too big. Bounce
> > > buffering would be a viable workaround for the streaming DMA API and
> > > certain similar use-cases, but not in general (e.g. coherent DMA, VFIO,
> > > GPUs, etc.)
> > > 
> > > Robin.
> > > 
> > > > For the moment, rather than triggering the IOVA BUG_ON() on mismatched
> > > > page sizes, abort the virtio-iommu probe with an error message.
> > 
> > I understand this is a introduced as a temporary solution but this
> > sounds as an important limitation to me. For instance this will prevent
> > from running a fedora guest exposed with a virtio-iommu with a RHEL host.
> 
> As above, even if you bypassed all the warnings it wouldn't really work
> properly anyway. In all cases that wouldn't be considered broken, the
> underlying hardware IOMMUs should support the same set of granules as the
> CPUs (or at least the smallest one), so is it actually appropriate for RHEL
> to (presumably) expose a 64K granule in the first place, rather than "works
> with anything" 4K? And/or more generally is there perhaps a hole in the
> virtio-iommu spec WRT being able to negotiate page_size_mask for a
> particular granule if multiple options are available?

That could be added (by allowing config write). The larger problems are:
1) Supporting granularity smaller than the host's PAGE_SIZE in host VFIO.
   At the moment it restricts the exposed page mask and rejects DMA_MAP
   requests not aligned on that granularity.
2) Propagating this negotiation all the way to io-pgtable and the SMMU
   driver in the host.

Thanks,
Jean

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
