Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 553491BF5B1
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 12:39:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DDF3888660;
	Thu, 30 Apr 2020 10:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiarHx4cjkJU; Thu, 30 Apr 2020 10:39:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AE85E88688;
	Thu, 30 Apr 2020 10:39:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91701C016F;
	Thu, 30 Apr 2020 10:39:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A009CC016F;
 Thu, 30 Apr 2020 10:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 86C0588304;
 Thu, 30 Apr 2020 10:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T+COBPeX9+Oh; Thu, 30 Apr 2020 10:39:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1F9AB880B3;
 Thu, 30 Apr 2020 10:39:25 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3CF920838;
 Thu, 30 Apr 2020 10:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588243164;
 bh=6+7qBBamWTT9w7zClGZROm5AeCOL7MN9qOqe5yevm90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j4ZaDYWlFfnjJ0Kk6dtybxWMdijfCyiwyxZsPRioDIEIjW2Pq/Kffjmqjr3+J0Ejl
 JR4YgwOGru7gDKzTHRc+/mOOsVLTS5ejWCp0tS62mKzaXXuC93LMhd13Rxno4+GTvA
 qmCLkIDor0yLvS+hxfn7Nw42bPZSZSdBu25gx7Rk=
Date: Thu, 30 Apr 2020 11:39:19 +0100
From: Will Deacon <will@kernel.org>
To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [RFC/PATCH 0/1] virtio_mmio: hypervisor specific interfaces for
 MMIO
Message-ID: <20200430103919.GF19932@willie-the-truck>
References: <1588240976-10213-1-git-send-email-vatsa@codeaurora.org>
 <20200430100821.GC19932@willie-the-truck>
 <20200430102939.GG5097@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430102939.GG5097@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org, mst@redhat.com,
 jan.kiszka@siemens.com, konrad.wilk@oracle.com, christoffer.dall@arm.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 stefano.stabellini@xilinx.com, pratikp@codeaurora.org,
 linux-kernel@vger.kernel.org
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

Hi Vatsa,

On Thu, Apr 30, 2020 at 03:59:39PM +0530, Srivatsa Vaddagiri wrote:
> * Will Deacon <will@kernel.org> [2020-04-30 11:08:22]:
> 
> > > This patch is meant to seek comments. If its considered to be in right
> > > direction, will work on making it more complete and send the next version!
> > 
> > What's stopping you from implementing the trapping support in the
> > hypervisor? Unlike the other patches you sent out, where the guest memory
> > is not accessible to the host, there doesn't seem to be any advantage to
> > not having trapping support, or am I missing something here?
> 
> 	I have had this discussion with hypervisor folks. They seem to be
> concerned about complexity of having a VM's fault be handled in another
> untrusted VM. They are not keen to add MMIO support.

Right, but I'm concerned about forking the implementation from the spec
and I'm not keen to add these hooks ;)

What does your hook actually do? I'm assuming an HVC? If so, then where the
fault is handled seems to be unrelated and whether the guest exit is due to
an HVC or a stage-2 fault should be immaterial. In other words, I don't
follow why the trapping mechanism necessitates the way in which the fault is
handled.

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
