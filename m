Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B60F207F38
	for <lists.virtualization@lfdr.de>; Thu, 25 Jun 2020 00:16:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7931686A99;
	Wed, 24 Jun 2020 22:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yzWkfD8iPmN6; Wed, 24 Jun 2020 22:16:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7EB7786ACF;
	Wed, 24 Jun 2020 22:16:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69A8AC016F;
	Wed, 24 Jun 2020 22:16:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7581C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 22:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D66C287EA7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 22:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BrUSvsATgkvK
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 22:16:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CB18F87E9E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 22:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593036996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wYBrrjiMl0OQwY7HbHO2EuoBSyetaNO9eIfsg2bUWrc=;
 b=Oh/XwDvGuWT0oUenzrrlIU9gvZ79iVcOlJ9EOfmtc2Ow+1FARwUq9NuOI0/CzBz0KfNyzw
 j9a9GY+cZiP1DF7yXnETrNN7pO/wzTA0oOwUzvdJcf3cC8ZDFjfJ+k6OGQI2PemI4ozlt4
 QlA4DWvrmwI/01GT+2GRKzcGf7pwCkk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-xm70Fgv5OrCFQHUDMCOU9g-1; Wed, 24 Jun 2020 18:16:32 -0400
X-MC-Unique: xm70Fgv5OrCFQHUDMCOU9g-1
Received: by mail-wm1-f72.google.com with SMTP id s134so4548120wme.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 15:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wYBrrjiMl0OQwY7HbHO2EuoBSyetaNO9eIfsg2bUWrc=;
 b=OpOdGJsd/yJ0LYbPdwoZ1TT2IqIAKajpRinJlqHTBtp48RP3QWkwXHNzMAaEChTwyx
 Fcht/fhmoIju0gmVVaE4m3ve3oiXB/lSzTSLKJCikizMXy1dhhZvzkOhCdJ3rdeC8IlU
 IZi40LylQdl1J4ylVcApQK8nD6kiwsGw5UhHd845bkSt4MAV5ZAJuibv2984Q6lZbi+t
 nehUCI30WegLOMe2LzpPvlV4PFoxafebmxMRXiY6Xd9F9LvH/qXRVmR+w8zRUp06XjCn
 YzaBQcWkraWLvboNg8seKQxCQ7zgPIReXlN9ES4CfyRqCTlTmFPa4fXq2K2SQYV2Ii4/
 YWPQ==
X-Gm-Message-State: AOAM532K7AnZ5yk09MtQODzZqvtSh/Equw2xqZWHumXPg9fsnEdclimk
 ycOGB+062aCMaP/YU3uh09jpRGSkyWoJR3DYnCbCaIkmQxJ0Jvfz98kPO7isWCIDLDIcm/fLAf0
 H7JJPYgC/3f5eRnA5vGgaX/gLYzJCVjPBgfOTSz7rNA==
X-Received: by 2002:a5d:630d:: with SMTP id i13mr29616367wru.208.1593036991423; 
 Wed, 24 Jun 2020 15:16:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoZZ/QqNAP1QypcHjt3mv7sAp97QrEj/Mw3Cz3gd3OBPJIW+fGMGO1Vs/5O0ZnQg6aHPyOeQ==
X-Received: by 2002:a5d:630d:: with SMTP id i13mr29616327wru.208.1593036991077; 
 Wed, 24 Jun 2020 15:16:31 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 e8sm26368886wrv.24.2020.06.24.15.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 15:16:30 -0700 (PDT)
Date: Wed, 24 Jun 2020 18:16:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200624181026-mutt-send-email-mst@kernel.org>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, konrad.wilk@oracle.com,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
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

On Wed, Jun 24, 2020 at 02:53:54PM -0700, Stefano Stabellini wrote:
> On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > On Wed, Jun 24, 2020 at 10:59:47AM -0700, Stefano Stabellini wrote:
> > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > On Wed, Jun 24, 2020 at 05:17:32PM +0800, Peng Fan wrote:
> > > > > Export xen_swiotlb for all platforms using xen swiotlb
> > > > > 
> > > > > Use xen_swiotlb to determine when vring should use dma APIs to map the
> > > > > ring: when xen_swiotlb is enabled the dma API is required. When it is
> > > > > disabled, it is not required.
> > > > > 
> > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > 
> > > > Isn't there some way to use VIRTIO_F_IOMMU_PLATFORM for this?
> > > > Xen was there first, but everyone else is using that now.
> > > 
> > > Unfortunately it is complicated and it is not related to
> > > VIRTIO_F_IOMMU_PLATFORM :-(
> > > 
> > > 
> > > The Xen subsystem in Linux uses dma_ops via swiotlb_xen to translate
> > > foreign mappings (memory coming from other VMs) to physical addresses.
> > > On x86, it also uses dma_ops to translate Linux's idea of a physical
> > > address into a real physical address (this is unneeded on ARM.)
> > > 
> > > 
> > > So regardless of VIRTIO_F_IOMMU_PLATFORM, dma_ops should be used on Xen/x86
> > > always and on Xen/ARM if Linux is Dom0 (because it has foreign
> > > mappings.) That is why we have the if (xen_domain) return true; in
> > > vring_use_dma_api.
> > 
> > VIRTIO_F_IOMMU_PLATFORM makes guest always use DMA ops.
> > 
> > Xen hack predates VIRTIO_F_IOMMU_PLATFORM so it *also*
> > forces DMA ops even if VIRTIO_F_IOMMU_PLATFORM is clear.
> >
> > Unfortunately as a result Xen never got around to
> > properly setting VIRTIO_F_IOMMU_PLATFORM.
> 
> I don't think VIRTIO_F_IOMMU_PLATFORM would be correct for this because
> the usage of swiotlb_xen is not a property of virtio,


Basically any device without VIRTIO_F_ACCESS_PLATFORM
(that is it's name in latest virtio spec, VIRTIO_F_IOMMU_PLATFORM is
what linux calls it) is declared as "special, don't follow normal rules
for access".

So yes swiotlb_xen is not a property of virtio, but what *is* a property
of virtio is that it's not special, just a regular device from DMA POV.


> it is a detail of
> the way Linux does Xen address translations. swiotlb-xen is used to do
> these translations and it is hooked into the dma_ops framework.
> 
> It would be possible to have a device in hardware that is
> virtio-compatible and doesn't set VIRTIO_F_IOMMU_PLATFORM.

That device would be basically broken, since hardware
can't know whether it can access all memory or not.

> The device
> could be directly assigned (passthrough) to a DomU. We would still
> have to use swiotlb_xen if Xen is running.
> 
> You should think of swiotlb-xen as only internal to Linux and not
> related to whether the (virtual or non-virtual) hardware comes with an
> IOMMU or not.

IOMMU is a misnomer here.  Virtio spec now calls this bit
VIRTIO_F_ACCESS_PLATFORM. We should have done the same a while ago -
I'll send a patch.

> 
> > > You might have noticed that I missed one possible case above: Xen/ARM
> > > DomU :-)
> > > 
> > > Xen/ARM domUs don't need swiotlb_xen, it is not even initialized. So if
> > > (xen_domain) return true; would give the wrong answer in that case.
> > > Linux would end up calling the "normal" dma_ops, not swiotlb-xen, and
> > > the "normal" dma_ops fail.
> > > 
> > > 
> > > The solution I suggested was to make the check in vring_use_dma_api more
> > > flexible by returning true if the swiotlb_xen is supposed to be used,
> > > not in general for all Xen domains, because that is what the check was
> > > really meant to do.
> > 
> > Why not fix DMA ops so they DTRT (nop) on Xen/ARM DomU? What is wrong with that?
> 
> swiotlb-xen is not used on Xen/ARM DomU, the default dma_ops are the
> ones that are used. So you are saying, why don't we fix the default
> dma_ops to work with virtio?
> 
> It is bad that the default dma_ops crash with virtio, so yes I think it
> would be good to fix that. However, even if we fixed that, the if
> (xen_domain()) check in vring_use_dma_api is still a problem.

Why is it a problem? It just makes virtio use DMA API.
If that in turn works, problem solved.



> 
> Alternatively we could try to work-around it from swiotlb-xen. We could
> enable swiotlb-xen for Xen/ARM DomUs with a different implementation so
> that we could leave the vring_use_dma_api check unmodified.
> 
> It would be ugly because we would have to figure out from the new
> swiotlb-xen functions if the device is a normal device, so we have to
> call the regular dma_ops functions, or if the device is a virtio device,
> in which case there is nothing to do. I think it is undesirable but
> could probably be made to work.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
