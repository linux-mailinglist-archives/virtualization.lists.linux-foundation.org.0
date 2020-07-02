Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A837921217F
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 12:47:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 336EA8A79B;
	Thu,  2 Jul 2020 10:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tB2UbVcO3MKG; Thu,  2 Jul 2020 10:47:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B1CA88A7A3;
	Thu,  2 Jul 2020 10:47:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 812BFC0733;
	Thu,  2 Jul 2020 10:47:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCA2FC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BB6278A1F7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oadVo6P3IqJA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:47:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 101678A1F0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:47:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id o1so4593113plk.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 03:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=7/yp0REosLZos2NH5xismEOcBs6RT4AyW+naEiQaKEQ=;
 b=Tsn7QxuQps6f4KsopBLK/6r7NKPpGUWGpS+e+NrpdDPq41xQyUqMOo+gmEQkN1qI4S
 BHxGxUV5vcdLTX0ajvZOT5Jamg+NLxMN6Yb/BLiPv7A2HCYxQWyzcDfVKcDpDuSeZI2h
 3Q8YwMmLZnrNPs0yIu+sGh20AEHX9gWyfYaMvgUHoffumVOJhg0CiYR38X8RrHCWNf5j
 Md84bVtpBpyovyhHrUoxL6XPgBDUAjA5btaePBVMEdpYH3Nhk118jOknAg9Mx4Y7MhEK
 r/vtbGGjHtUkWLzw78JG/7MLM9d7Vw8hGja8DWr9kQ3IsewCaBztynFRMMH/QNdHLtke
 fVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=7/yp0REosLZos2NH5xismEOcBs6RT4AyW+naEiQaKEQ=;
 b=i1G2YJVlSL7XTZXItE2Mue6we/8f6I3V9y9QCa6rHPu03TrWjiEaLEJs+3wq1R6bHy
 3yykClPgBSXUaQfYAWWmf2bNoDTnwvZVdhuWm3viGCJvYtueeQ9qAMQ1Pm0D9r9+UzGn
 +7tyBt7EoJA4tlRzX7CT8bEeidOdHYDrzqiju3Z5y1EEoFgQwPtEUFVsMBQTFDnHo1Zf
 sg3nckAJUSxUmwJXz1wtSOrS+Nqp2s5c0KcigvW907nBhXnbGZXNm5hPCh6wJI+hGgyX
 N+mojiV69/tfgXfwVuDWdW+LRTSFS4y+doEX5NpGJ1i6vMVkVfBSbSf7CndlULQiZVT/
 1pSg==
X-Gm-Message-State: AOAM533fy8r/sPTPADJ3tmbFYZO52UnIyd/NH24yLNrMGwGsLSYLzEeQ
 z2pHSqqYT7zddf3JSrb6uds=
X-Google-Smtp-Source: ABdhPJwoIU+iCSn5Sb/43jebiYHxhFfNdVq9eoVNXNmFOsjzyeH63SOj20Ofhe6NtxmyHaem2+gpVQ==
X-Received: by 2002:a17:90a:a60a:: with SMTP id
 c10mr4463276pjq.117.1593686831628; 
 Thu, 02 Jul 2020 03:47:11 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id y19sm8213367pfc.135.2020.07.02.03.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 03:47:11 -0700 (PDT)
Date: Thu, 02 Jul 2020 20:47:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/8] powerpc/64s: implement queued spinlocks and rwlocks
To: Will Deacon <will@kernel.org>
References: <20200702074839.1057733-1-npiggin@gmail.com>
 <20200702074839.1057733-6-npiggin@gmail.com>
 <20200702080219.GB16113@willie-the-truck>
 <1593685459.r2tfxtfdp6.astroid@bobo.none>
 <20200702103506.GA16418@willie-the-truck>
In-Reply-To: <20200702103506.GA16418@willie-the-truck>
MIME-Version: 1.0
Message-Id: <1593686722.w9psaqk7yp.astroid@bobo.none>
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

Excerpts from Will Deacon's message of July 2, 2020 8:35 pm:
> On Thu, Jul 02, 2020 at 08:25:43PM +1000, Nicholas Piggin wrote:
>> Excerpts from Will Deacon's message of July 2, 2020 6:02 pm:
>> > On Thu, Jul 02, 2020 at 05:48:36PM +1000, Nicholas Piggin wrote:
>> >> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
>> >> new file mode 100644
>> >> index 000000000000..f84da77b6bb7
>> >> --- /dev/null
>> >> +++ b/arch/powerpc/include/asm/qspinlock.h
>> >> @@ -0,0 +1,20 @@
>> >> +/* SPDX-License-Identifier: GPL-2.0 */
>> >> +#ifndef _ASM_POWERPC_QSPINLOCK_H
>> >> +#define _ASM_POWERPC_QSPINLOCK_H
>> >> +
>> >> +#include <asm-generic/qspinlock_types.h>
>> >> +
>> >> +#define _Q_PENDING_LOOPS	(1 << 9) /* not tuned */
>> >> +
>> >> +#define smp_mb__after_spinlock()   smp_mb()
>> >> +
>> >> +static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
>> >> +{
>> >> +	smp_mb();
>> >> +	return atomic_read(&lock->val);
>> >> +}
>> > 
>> > Why do you need the smp_mb() here?
>> 
>> A long and sad tale that ends here 51d7d5205d338
>> 
>> Should probably at least refer to that commit from here, since this one 
>> is not going to git blame back there. I'll add something.
> 
> Is this still an issue, though?
> 
> See 38b850a73034 (where we added a similar barrier on arm64) and then
> c6f5d02b6a0f (where we removed it).
> 

Oh nice, I didn't know that went away. Thanks for the heads up.

I'm going to say I'm too scared to remove it while changing the
spinlock algorithm, but I'll open an issue and we should look at 
removing it.

Thanks,
Nick

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
