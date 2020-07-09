Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 531EC219D3E
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 12:13:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0E5CD87AC8;
	Thu,  9 Jul 2020 10:13:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIdSYE3Gd1mM; Thu,  9 Jul 2020 10:13:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8110487C1C;
	Thu,  9 Jul 2020 10:13:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C413C016F;
	Thu,  9 Jul 2020 10:13:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28F42C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0DAC487C1C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPht7EXajKRV
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:13:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E3D2C87AC8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:13:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2X7g5nVsz9sSd;
 Thu,  9 Jul 2020 20:13:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594289615;
 bh=V/UfiEcEJmEZN4U3f8evnqswy/uVMHS/9JdwtGfPUdY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nzRAwHg5DWqxnr64TpRTPXGRnE8/0g/MyPqvHEW3TplcuZ3VZBDq81ZBJjsHRPTfO
 WsF67x5DG9UVg2a+ikk+zlNznorFWPGELSjP7EJNjUETZRVcWnF+6eFUI+sARv0w89
 XmFkeR/7TehGnZiVKu6YYFKLGW8hNZc/gnQcUwejYBC3byHW8EBZb19YX67mHIQYKc
 cLm365Y07n+K60Q2nwUmyXjBB4LGBvpb6xIwZgrvc6vJFfdVIO/82FuL9RSpKLGfyo
 0DKn3B2IBr7N3KP7jsgXda8lowUQ5CSUzWetkPqOxOJ71izeS+acNFfg6Gr0mcz8ci
 mGMQBP8XgO4aA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 3/6] powerpc: move spinlock implementation to
 simple_spinlock
In-Reply-To: <20200706043540.1563616-4-npiggin@gmail.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-4-npiggin@gmail.com>
Date: Thu, 09 Jul 2020 20:15:51 +1000
Message-ID: <87a709vvs8.fsf@mpe.ellerman.id.au>
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
> To prepare for queued spinlocks. This is a simple rename except to update
> preprocessor guard name and a file reference.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/simple_spinlock.h    | 292 ++++++++++++++++++
>  .../include/asm/simple_spinlock_types.h       |  21 ++
>  arch/powerpc/include/asm/spinlock.h           | 285 +----------------
>  arch/powerpc/include/asm/spinlock_types.h     |  12 +-
>  4 files changed, 315 insertions(+), 295 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/simple_spinlock.h
>  create mode 100644 arch/powerpc/include/asm/simple_spinlock_types.h
>
> diff --git a/arch/powerpc/include/asm/simple_spinlock.h b/arch/powerpc/include/asm/simple_spinlock.h
> new file mode 100644
> index 000000000000..e048c041c4a9
> --- /dev/null
> +++ b/arch/powerpc/include/asm/simple_spinlock.h
> @@ -0,0 +1,292 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __ASM_SIMPLE_SPINLOCK_H
> +#define __ASM_SIMPLE_SPINLOCK_H

_ASM_POWERPC_SIMPLE_SPINLOCK_H

> +#ifdef __KERNEL__

Shouldn't be necessary.

> +/*
> + * Simple spin lock operations.  
> + *
> + * Copyright (C) 2001-2004 Paul Mackerras <paulus@au.ibm.com>, IBM
> + * Copyright (C) 2001 Anton Blanchard <anton@au.ibm.com>, IBM
> + * Copyright (C) 2002 Dave Engebretsen <engebret@us.ibm.com>, IBM
> + *	Rework to support virtual processors
> + *
> + * Type of int is used as a full 64b word is not necessary.
> + *
> + * (the type definitions are in asm/simple_spinlock_types.h)
> + */
> +#include <linux/irqflags.h>
> +#include <asm/paravirt.h>
> +#ifdef CONFIG_PPC64
> +#include <asm/paca.h>
> +#endif

I don't think paca.h needs a CONFIG_PPC64 guard, it contains one. I know
you're just moving the code, but still nice to cleanup slightly along
the way.

cheers

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
