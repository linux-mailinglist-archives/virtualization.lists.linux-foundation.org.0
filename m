Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F61211205
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 19:35:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2BB0A8BD86;
	Wed,  1 Jul 2020 17:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HvHe-6FKVWZe; Wed,  1 Jul 2020 17:34:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DBC28BDA0;
	Wed,  1 Jul 2020 17:34:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16629C0733;
	Wed,  1 Jul 2020 17:34:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9599AC0733;
 Wed,  1 Jul 2020 17:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 75BE38BD7E;
 Wed,  1 Jul 2020 17:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIzjPfczqmQJ; Wed,  1 Jul 2020 17:34:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2C9818BD86;
 Wed,  1 Jul 2020 17:34:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5CDCB20781;
 Wed,  1 Jul 2020 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593624894;
 bh=7gRGt637RJr7xqh8m9IFhKHH4colOY8f4NtES4RwwhY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=s4JTo+sHZ5kueHTuTEAo2QGy2uhqmeAHdidNDEG2j3pV3VxRg5Xv6wKav2TR+6t4b
 XUiS73u1pvO97HpBjUcfEuJ+XpBhQ0M0mFiLtwwqKmYcxdiCP4RGhschpBHp6VSQJP
 m93SVv9K90jHvPW8nUrDpWPn4XcEaTHFUj4sKDZM=
Date: Wed, 1 Jul 2020 10:34:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
In-Reply-To: <20200701133456.GA23888@infradead.org>
Message-ID: <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
 <20200701133456.GA23888@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, konrad.wilk@oracle.com,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-imx@nxp.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
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

On Wed, 1 Jul 2020, Christoph Hellwig wrote:
> On Mon, Jun 29, 2020 at 04:46:09PM -0700, Stefano Stabellini wrote:
> > > I could imagine some future Xen hosts setting a flag somewhere in the
> > > platform capability saying "no xen specific flag, rely on
> > > "VIRTIO_F_ACCESS_PLATFORM". Then you set that accordingly in QEMU.
> > > How about that?
> > 
> > Yes, that would be fine and there is no problem implementing something
> > like that when we get virtio support in Xen. Today there are still no
> > virtio interfaces provided by Xen to ARM guests (no virtio-block/net,
> > etc.)
> > 
> > In fact, in both cases we are discussing virtio is *not* provided by
> > Xen; it is a firmware interface to something entirely different:
> > 
> > 1) virtio is used to talk to a remote AMP processor (RPMesg)
> > 2) virtio is used to talk to a secure-world firmware/OS (Trusty)
> >
> > VIRTIO_F_ACCESS_PLATFORM is not set by Xen in these cases but by RPMesg
> > and by Trusty respectively. I don't know if Trusty should or should not
> > set VIRTIO_F_ACCESS_PLATFORM, but I think Linux should still work
> > without issues.
> > 
> 
> Any virtio implementation that is not in control of the memory map
> (aka not the hypervisor) absolutely must set VIRTIO_F_ACCESS_PLATFORM,
> else it is completely broken.

Lots of broken virtio implementations out there it would seem :-(


> > The xen_domain() check in Linux makes it so that vring_use_dma_api
> > returns the opposite value on native Linux compared to Linux as Xen/ARM
> > DomU by "accident". By "accident" because there is no architectural
> > reason why Linux Xen/ARM DomU should behave differently compared to
> > native Linux in this regard.
> > 
> > I hope that now it is clearer why I think the if (xen_domain()) check
> > needs to be improved anyway, even if we fix generic dma_ops with virtio
> > interfaces missing VIRTIO_F_ACCESS_PLATFORM.
> 
> IMHO that Xen quirk should never have been added in this form..

Would you be in favor of a more flexible check along the lines of the
one proposed in the patch that started this thread:

    if (xen_vring_use_dma())
            return true;


xen_vring_use_dma would be implemented so that it returns true when
xen_swiotlb is required and false otherwise.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
