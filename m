Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D9315219CD5
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 12:03:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7427F897B6;
	Thu,  9 Jul 2020 10:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2ew05TcpATH; Thu,  9 Jul 2020 10:03:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E2A03897BA;
	Thu,  9 Jul 2020 10:03:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0D0EC016F;
	Thu,  9 Jul 2020 10:03:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D365AC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C953D897B6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lrJba6i07b5K
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:03:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 83190897AE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:03:11 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2WvZ3zGxz9sTH;
 Thu,  9 Jul 2020 20:03:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594288986;
 bh=gzevlDZNhGR3zBt4oGJSiaOWmNIXxDnq4AJkVnA7ct8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FGveEg8q/y3tCFCeSW1FsRbhFSvX8FhcucbFCIXftYTCKPONKTv/40QFtquvhS7Yo
 PzXwGYKN7bovdbCuMD9lgGZakoYc2SOVrOpgitHHV+kYC3njs0+MPZ+BhyTGB9o+6t
 jNfCMr6brEGBnannqnY2pUkSB5UZp/XUOHF3PqH++pCffJ9+JixW+/tHMqnaHPCA2p
 x9T56tPe0+HFuPp06W4+IOZ9S0ZRYFuezORe9sSIH+715fqj7tkhTxHACSUtShzB/r
 +zGySTRD9bXU5UDoL0fTvXIBwPFr8LToCxfYHvUOi/Uuzt7xvwIge32QyPjtpPZpyI
 pdmw83qWCiusQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 1/6] powerpc/powernv: must include hvcall.h to get PAPR
 defines
In-Reply-To: <20200706043540.1563616-2-npiggin@gmail.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-2-npiggin@gmail.com>
Date: Thu, 09 Jul 2020 20:05:18 +1000
Message-ID: <87fta1vw9t.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Anton Blanchard <anton@ozlabs.org>,
 Will Deacon <will@kernel.org>
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

Nicholas Piggin <npiggin@gmail.com> writes:
> An include goes away in future patches which breaks compilation
> without this.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda-tce.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
> index f923359d8afc..8eba6ece7808 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
> @@ -15,6 +15,7 @@
>  
>  #include <asm/iommu.h>
>  #include <asm/tce.h>
> +#include <asm/hvcall.h> /* share error returns with PAPR */
>  #include "pci.h"
>  
>  unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb)
> -- 
> 2.23.0

This isn't needed anymore AFAICS, since:

5f202c1a1d42 ("powerpc/powernv/ioda: Return correct error if TCE level allocation failed")

cheers
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
