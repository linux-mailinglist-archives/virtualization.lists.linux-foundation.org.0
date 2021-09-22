Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8734841499A
	for <lists.virtualization@lfdr.de>; Wed, 22 Sep 2021 14:48:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B3760BC6;
	Wed, 22 Sep 2021 12:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6eLS0yQrCpL; Wed, 22 Sep 2021 12:48:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7F23E613BD;
	Wed, 22 Sep 2021 12:48:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 201B5C000D;
	Wed, 22 Sep 2021 12:48:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF53EC000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 12:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1CDD8403F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 12:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pmlEb8uDzU6h
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 12:48:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EE1383FFD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oAPrbliIVMtJ6nyhmSrbiDdRqfA8JQhJf2UshZDVT88=; b=tEhxQE1Rmf1aTw5P1Xwbfp0kSE
 YhEyVwt1OomoAedgQy7bd0MGsyzpJuDb6xfOPGIy5Aam6rrlnutVUT6hpOPH+vxUDYZKFZIMGrEKh
 3gQSU0/TwUk/ouYEPzD5cUnwbDumaIhLYrnr3h/7NXqphYNEu8c7OmvWIaaA1SrqbRyZW2o1nMIiw
 DpHkDrSzUBUtp8+fMzfqTHvg1AMcupoiR7sQUybbpk52IWxGnkXmOTbMpPhMF+/HhKfq773SzI5mN
 Vn/f9OxoFZzS4dAcBzm+5xJ8UuNUR2znLUvU2M4Emmgi5x28KyDkgbQlbACPLVWxFjqR07SKJXdSc
 3aNbmczA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT1do-004mud-Fa; Wed, 22 Sep 2021 12:46:36 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0C64A9816EA; Wed, 22 Sep 2021 14:46:24 +0200 (CEST)
Date: Wed, 22 Sep 2021 14:46:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 0/2] x86/xen: simplify irq pvops
Message-ID: <20210922124623.GR4323@worktop.programming.kicks-ass.net>
References: <20210922103102.3589-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210922103102.3589-1-jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
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

On Wed, Sep 22, 2021 at 12:31:00PM +0200, Juergen Gross wrote:
> The pvops function for Xen PV guests handling the interrupt flag are
> much more complex than needed.
> 
> With the supported Xen hypervisor versions they can be simplified a
> lot, especially by removing the need for disabling preemption.
> 
> Juergen Gross (2):
>   x86/xen: remove xen_have_vcpu_info_placement flag
>   x86/xen: switch initial pvops IRQ functions to dummy ones
> 
>  arch/x86/include/asm/paravirt_types.h |   2 +
>  arch/x86/kernel/paravirt.c            |  13 ++-
>  arch/x86/xen/enlighten.c              | 116 ++++++--------------------
>  arch/x86/xen/enlighten_hvm.c          |   6 +-
>  arch/x86/xen/enlighten_pv.c           |  28 ++-----
>  arch/x86/xen/irq.c                    |  61 +-------------
>  arch/x86/xen/smp.c                    |  24 ------
>  arch/x86/xen/xen-ops.h                |   4 +-
>  8 files changed, 53 insertions(+), 201 deletions(-)

That looks awesome, I'm totally in favour of deleting code :-)

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
