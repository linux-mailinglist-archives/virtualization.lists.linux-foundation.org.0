Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F12E310F44
	for <lists.virtualization@lfdr.de>; Fri,  5 Feb 2021 18:59:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 27A9886AD1;
	Fri,  5 Feb 2021 17:59:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hujc9OpAU6S4; Fri,  5 Feb 2021 17:59:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA89C86BA4;
	Fri,  5 Feb 2021 17:59:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2876AC1825;
	Fri,  5 Feb 2021 17:59:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B66CC013A;
 Fri,  5 Feb 2021 17:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 76D738737E;
 Fri,  5 Feb 2021 17:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxVd0ztsHAmM; Fri,  5 Feb 2021 17:58:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9B22287349;
 Fri,  5 Feb 2021 17:58:57 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1A3F667373; Fri,  5 Feb 2021 18:58:53 +0100 (CET)
Date: Fri, 5 Feb 2021 18:58:52 +0100
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] swiotlb: Validate bounce size in the sync/unmap path
Message-ID: <20210205175852.GA1021@lst.de>
References: <X/27MSbfDGCY9WZu@martin> <20210113113017.GA28106@lst.de>
 <YAV0uhfkimXn1izW@martin> <20210203124922.GB16923@lst.de>
 <20210203193638.GA325136@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203193638.GA325136@fedora>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Martin Radev <martin.b.radev@gmail.com>, thomas.lendacky@amd.com,
 file@sect.tu-berlin.de, robert.buhren@sect.tu-berlin.de, kvm@vger.kernel.org,
 mathias.morbitzer@aisec.fraunhofer.de, joro@8bytes.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 Christoph Hellwig <hch@lst.de>, kirill.shutemov@linux.intel.com,
 m.szyprowski@samsung.com
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

On Wed, Feb 03, 2021 at 02:36:38PM -0500, Konrad Rzeszutek Wilk wrote:
> > So what?  If you guys want to provide a new capability you'll have to do
> > work.  And designing a new protocol based around the fact that the
> > hardware/hypervisor is not trusted and a copy is always required makes
> > a lot of more sense than throwing in band aids all over the place.
> 
> If you don't trust the hypervisor, what would this capability be in?

Well, they don't trust the hypervisor to not attack the guest somehow,
except through the data read.  I never really understood the concept,
as it leaves too many holes.

But the point is that these schemes want to force bounce buffering
because they think it is more secure.  And if that is what you want
you better have protocol build around the fact that each I/O needs
to use bounce buffers, so you make those buffers the actual shared
memory use for communication, and build the protocol around it.
E.g. you don't force the ridiculous NVMe PRP offset rules on the block
layer, just to make a complicated swiotlb allocation that needs to
preserve the alignment just do I/O.  But instead you have a trivial
ring buffer or whatever because you know I/O will be copied anyway
and none of all the hard work higher layers do to make the I/O suitable
for a normal device apply.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
