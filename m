Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CEB2138F1
	for <lists.virtualization@lfdr.de>; Fri,  3 Jul 2020 12:49:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3DA4C20435;
	Fri,  3 Jul 2020 10:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Fjjj3HfsH53; Fri,  3 Jul 2020 10:49:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 388E0203DA;
	Fri,  3 Jul 2020 10:49:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE8A3C0733;
	Fri,  3 Jul 2020 10:49:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D8C7C0733
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 10:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 25288203DA
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 10:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiTeubC4R-WO
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 10:49:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by silver.osuosl.org (Postfix) with ESMTPS id 961B820392
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 10:49:51 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49ysDD0gdYz9sSy;
 Fri,  3 Jul 2020 20:49:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1593773388;
 bh=RfcGFiZqerkVV2+Xy8mk+CmXEwgXM5XeAEZk9tVyLEo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jE5FAgWTrhkfhhz6BYzecTvfdbDagKlkEWrYP3L0gbYhUVcSmlNc1lC6f2ixexXfj
 QMnhT3le4DAgIHjrdKH22ewB074mqgaY+h4/qPtQCqXxPj1aL8oLqf9cRSSFg+ZpER
 kOBkntxdcz0tYKdN5N9tEC3tWly5GI/no1ixwSUH2ll5U30V57HbQBu863Xoilh+tH
 faLA8P2ykdWIk2tfZCnjGNmZvES09DuT2hr7WHCNOOgcbnej88JykIeo5CrGmWKVP4
 mhpmHq+ygewJ07zs3nF7tn1T8SdxHp2Y2ozRdDw+CH0ePoLytwGYkTSssCCGuyHwKH
 P9M8prScLig4Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 5/8] powerpc/64s: implement queued spinlocks and rwlocks
In-Reply-To: <1593686722.w9psaqk7yp.astroid@bobo.none>
References: <20200702074839.1057733-1-npiggin@gmail.com>
 <20200702074839.1057733-6-npiggin@gmail.com>
 <20200702080219.GB16113@willie-the-truck>
 <1593685459.r2tfxtfdp6.astroid@bobo.none>
 <20200702103506.GA16418@willie-the-truck>
 <1593686722.w9psaqk7yp.astroid@bobo.none>
Date: Fri, 03 Jul 2020 20:52:02 +1000
Message-ID: <878sg07twt.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Will Deacon's message of July 2, 2020 8:35 pm:
>> On Thu, Jul 02, 2020 at 08:25:43PM +1000, Nicholas Piggin wrote:
>>> Excerpts from Will Deacon's message of July 2, 2020 6:02 pm:
>>> > On Thu, Jul 02, 2020 at 05:48:36PM +1000, Nicholas Piggin wrote:
>>> >> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
>>> >> new file mode 100644
>>> >> index 000000000000..f84da77b6bb7
>>> >> --- /dev/null
>>> >> +++ b/arch/powerpc/include/asm/qspinlock.h
>>> >> @@ -0,0 +1,20 @@
>>> >> +/* SPDX-License-Identifier: GPL-2.0 */
>>> >> +#ifndef _ASM_POWERPC_QSPINLOCK_H
>>> >> +#define _ASM_POWERPC_QSPINLOCK_H
>>> >> +
>>> >> +#include <asm-generic/qspinlock_types.h>
>>> >> +
>>> >> +#define _Q_PENDING_LOOPS	(1 << 9) /* not tuned */
>>> >> +
>>> >> +#define smp_mb__after_spinlock()   smp_mb()
>>> >> +
>>> >> +static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
>>> >> +{
>>> >> +	smp_mb();
>>> >> +	return atomic_read(&lock->val);
>>> >> +}
>>> > 
>>> > Why do you need the smp_mb() here?
>>> 
>>> A long and sad tale that ends here 51d7d5205d338
>>> 
>>> Should probably at least refer to that commit from here, since this one 
>>> is not going to git blame back there. I'll add something.
>> 
>> Is this still an issue, though?
>> 
>> See 38b850a73034 (where we added a similar barrier on arm64) and then
>> c6f5d02b6a0f (where we removed it).
>> 
>
> Oh nice, I didn't know that went away. Thanks for the heads up.

Argh! I spent so much time chasing that damn bug in the ipc code.

> I'm going to say I'm too scared to remove it while changing the
> spinlock algorithm, but I'll open an issue and we should look at 
> removing it.

Sounds good.

cheers
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
