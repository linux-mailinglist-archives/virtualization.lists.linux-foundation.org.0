Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3792F4A30
	for <lists.virtualization@lfdr.de>; Wed, 13 Jan 2021 12:30:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3BAC22A12C;
	Wed, 13 Jan 2021 11:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VdzdwrJ1RGFI; Wed, 13 Jan 2021 11:30:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 609462A0D9;
	Wed, 13 Jan 2021 11:30:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4770AC013A;
	Wed, 13 Jan 2021 11:30:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E18EAC013A;
 Wed, 13 Jan 2021 11:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CFD8484494;
 Wed, 13 Jan 2021 11:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MMVAa0aa74xz; Wed, 13 Jan 2021 11:30:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7CFBB84186;
 Wed, 13 Jan 2021 11:30:23 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0514168AFE; Wed, 13 Jan 2021 12:30:18 +0100 (CET)
Date: Wed, 13 Jan 2021 12:30:17 +0100
From: Christoph Hellwig <hch@lst.de>
To: Martin Radev <martin.b.radev@gmail.com>
Subject: Re: [PATCH] swiotlb: Validate bounce size in the sync/unmap path
Message-ID: <20210113113017.GA28106@lst.de>
References: <X/27MSbfDGCY9WZu@martin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/27MSbfDGCY9WZu@martin>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: thomas.lendacky@amd.com, file@sect.tu-berlin.de,
 robert.buhren@sect.tu-berlin.de, kvm@vger.kernel.org, konrad.wilk@oracle.com,
 mathias.morbitzer@aisec.fraunhofer.de, joro@8bytes.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, hch@lst.de,
 kirill.shutemov@linux.intel.com, m.szyprowski@samsung.com
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

On Tue, Jan 12, 2021 at 04:07:29PM +0100, Martin Radev wrote:
> The size of the buffer being bounced is not checked if it happens
> to be larger than the size of the mapped buffer. Because the size
> can be controlled by a device, as it's the case with virtio devices,
> this can lead to memory corruption.
> 

I'm really worried about all these hodge podge hacks for not trusted
hypervisors in the I/O stack.  Instead of trying to harden protocols
that are fundamentally not designed for this, how about instead coming
up with a new paravirtualized I/O interface that is specifically
designed for use with an untrusted hypervisor from the start?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
