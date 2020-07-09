Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CDC219D19
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 12:09:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 985AD86F35;
	Thu,  9 Jul 2020 10:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6iPhmdTNKhOy; Thu,  9 Jul 2020 10:09:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB85C87DA3;
	Thu,  9 Jul 2020 10:09:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88877C016F;
	Thu,  9 Jul 2020 10:09:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 140A6C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 10B7987E77
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGSCHEN3ZuDA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:09:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DA89F86456
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:09:17 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2X2f6tyhz9sSd;
 Thu,  9 Jul 2020 20:09:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594289355;
 bh=B+pvOdRR00uR6MW/d9Tg/MIy1GpvfDv7HP5aB55eLMw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kxRBUjVzQLmCVjdHJKK+OcMHo6neU1RQex6N/x2BrSSEzz8iH/g7k4DoVMlUhjVk7
 qjlMzJqNzIPeCAL4m8bkMuCl1Dr7W0UwucYzh02G9a/78uSyNSp/rFzURUfJIof5xH
 rvrxbDJUq5MJV/BQwK0VcLmyEvCImjHGLb+/cWWbDQYBeOaA4oQ2CL3X3APXF6/y2J
 D2L/vyTlEu1jwKOp2V1ztZHSpC9pxYI9LfxuGcgX3zR3P6RAS/67QId4q+XfV3yQtt
 K7ocKhOlTOWEa7eB+mqmgAgCqXAnWX3PTuHX9vuE8pgXODpslKd4pTMDt2KQ2hnq7g
 Rlwx0t1IcWGFQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/6] powerpc/pseries: move some PAPR paravirt functions
 to their own file
In-Reply-To: <20200706043540.1563616-3-npiggin@gmail.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-3-npiggin@gmail.com>
Date: Thu, 09 Jul 2020 20:11:29 +1000
Message-ID: <87d055vvzi.fsf@mpe.ellerman.id.au>
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
>

Little bit of changelog would be nice :D

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/paravirt.h | 61 +++++++++++++++++++++++++++++
>  arch/powerpc/include/asm/spinlock.h | 24 +-----------
>  arch/powerpc/lib/locks.c            | 12 +++---
>  3 files changed, 68 insertions(+), 29 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/paravirt.h
>
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> new file mode 100644
> index 000000000000..7a8546660a63
> --- /dev/null
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __ASM_PARAVIRT_H
> +#define __ASM_PARAVIRT_H

Should be _ASM_POWERPC_PARAVIRT_H

> +#ifdef __KERNEL__

We shouldn't need __KERNEL__ in here, it's not a uapi header.

cheers
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
