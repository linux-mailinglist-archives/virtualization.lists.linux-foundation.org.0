Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C6D212169
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 12:35:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F251E24B59;
	Thu,  2 Jul 2020 10:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C3gSQf8TASNl; Thu,  2 Jul 2020 10:35:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EE5BD26694;
	Thu,  2 Jul 2020 10:35:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5CBCC0733;
	Thu,  2 Jul 2020 10:35:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D39BC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1BFB58A23C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJTvvtYzm4Up
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:35:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AE26989D01
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:35:11 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFF482073E;
 Thu,  2 Jul 2020 10:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593686111;
 bh=e2d7EoUGfBMQ8iAjxxfS9uLE6JsRVlpFYnf0i0i/9QQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zx19RhhCYndjeyr3Ntyuk/b/dG1YRNEW2u11qyAF1MnPiVC3uoqkfkflQnUQ20Q/V
 BRTJ4Go1k5kA4mHEeVWUTjblN4KXUh4EbOTxrozGkgaGXWwXaH767ODZtDY1/VBx5m
 Bh2iVabMtfwri5eKLtL7CGst/N2IPX3sUadygBbk=
Date: Thu, 2 Jul 2020 11:35:06 +0100
From: Will Deacon <will@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/8] powerpc/64s: implement queued spinlocks and rwlocks
Message-ID: <20200702103506.GA16418@willie-the-truck>
References: <20200702074839.1057733-1-npiggin@gmail.com>
 <20200702074839.1057733-6-npiggin@gmail.com>
 <20200702080219.GB16113@willie-the-truck>
 <1593685459.r2tfxtfdp6.astroid@bobo.none>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593685459.r2tfxtfdp6.astroid@bobo.none>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Anton Blanchard <anton@ozlabs.org>, linuxppc-dev@lists.ozlabs.org
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

On Thu, Jul 02, 2020 at 08:25:43PM +1000, Nicholas Piggin wrote:
> Excerpts from Will Deacon's message of July 2, 2020 6:02 pm:
> > On Thu, Jul 02, 2020 at 05:48:36PM +1000, Nicholas Piggin wrote:
> >> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
> >> new file mode 100644
> >> index 000000000000..f84da77b6bb7
> >> --- /dev/null
> >> +++ b/arch/powerpc/include/asm/qspinlock.h
> >> @@ -0,0 +1,20 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +#ifndef _ASM_POWERPC_QSPINLOCK_H
> >> +#define _ASM_POWERPC_QSPINLOCK_H
> >> +
> >> +#include <asm-generic/qspinlock_types.h>
> >> +
> >> +#define _Q_PENDING_LOOPS	(1 << 9) /* not tuned */
> >> +
> >> +#define smp_mb__after_spinlock()   smp_mb()
> >> +
> >> +static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
> >> +{
> >> +	smp_mb();
> >> +	return atomic_read(&lock->val);
> >> +}
> > 
> > Why do you need the smp_mb() here?
> 
> A long and sad tale that ends here 51d7d5205d338
> 
> Should probably at least refer to that commit from here, since this one 
> is not going to git blame back there. I'll add something.

Is this still an issue, though?

See 38b850a73034 (where we added a similar barrier on arm64) and then
c6f5d02b6a0f (where we removed it).

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
