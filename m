Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D47A11BF4F0
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 12:08:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7B40F86E5A;
	Thu, 30 Apr 2020 10:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8O1VNORnzh8; Thu, 30 Apr 2020 10:08:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BEF29811E9;
	Thu, 30 Apr 2020 10:08:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98C29C0889;
	Thu, 30 Apr 2020 10:08:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D084C016F;
 Thu, 30 Apr 2020 10:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 36687204F1;
 Thu, 30 Apr 2020 10:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4FrodGTRwZKl; Thu, 30 Apr 2020 10:08:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 6C5C5204CC;
 Thu, 30 Apr 2020 10:08:28 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98A012173E;
 Thu, 30 Apr 2020 10:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588241308;
 bh=xa6SpmSmz9EAdtVLWr+Oo3a8W/zi6Yh4mLHT8M/Bb5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GCUHU4XQOC1NYyjmFXVXCCbulAEM7AZSTxyQ7+5I2SwHz/G+uEMnzpoE4im98LLc8
 wgr0/Gjnbc+UtBMh7+Fs0Cnj/od/q3LJ/UT4MmYDHK3a5/o+rhH2n1z5vbDrO/Is7j
 sIS1+lyZbST/U8limbFBI5yeJZYFzMq+yVAkgwWM=
Date: Thu, 30 Apr 2020 11:08:22 +0100
From: Will Deacon <will@kernel.org>
To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [RFC/PATCH 0/1] virtio_mmio: hypervisor specific interfaces for
 MMIO
Message-ID: <20200430100821.GC19932@willie-the-truck>
References: <1588240976-10213-1-git-send-email-vatsa@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588240976-10213-1-git-send-email-vatsa@codeaurora.org>
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

On Thu, Apr 30, 2020 at 03:32:55PM +0530, Srivatsa Vaddagiri wrote:
> The Type-1 hypervisor we are dealing with does not allow for MMIO transport. 
> [1] summarizes some of the problems we have in making virtio work on such
> hypervisors. This patch proposes a solution for transport problem viz how we can
> do config space IO on such a hypervisor. Hypervisor specific methods
> introduced allows for seamless IO of config space.

Seamless huh? You'd hope that might obviate the need for extra patches...

> This patch is meant to seek comments. If its considered to be in right
> direction, will work on making it more complete and send the next version!

What's stopping you from implementing the trapping support in the
hypervisor? Unlike the other patches you sent out, where the guest memory
is not accessible to the host, there doesn't seem to be any advantage to
not having trapping support, or am I missing something here?

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
