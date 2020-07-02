Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC6921211F
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 12:25:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0C02D26D90;
	Thu,  2 Jul 2020 10:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id biWIoXpy0SP9; Thu,  2 Jul 2020 10:25:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0D7C126EF8;
	Thu,  2 Jul 2020 10:25:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D81ABC0733;
	Thu,  2 Jul 2020 10:25:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E406C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7AC4C8B190
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Sg-8sY4TPut
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:25:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F11018B188
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:25:49 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id k5so2770855pjg.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 03:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=2dEmOOaTKGF4Qlb49VhQf6A9PlFA3b36H9rV7z7cwEs=;
 b=fwrGZyQ5ZsT9XNpr3/IOWdRZ6ocaZNwfSU2kbuorYXlEEdLE5/x5p3TVpSz28QRp1G
 Rq97XWBtS9UIquZ9RJU/9RJJsvs3vSblV7P3bcy3AJKNZxupjf8CAIH6Vx5/rgUgktkk
 duzXAxjb/9SdEDlWvBSKLc74Js/6Hemi2omyXcEecBxTRXPd6QyrD+31gJzLltU6iW8n
 JF08jA85kpDrr4bA2nZyBfxoqXA5dQqxwaS7+++ll1ExbDrK2qXYBnMpcyDzOvT90egd
 caLSXaJhoRisXKEQ9uGYLW2o3jDa/MNsoH7QZe8RRqAZWZ+dpbslBRZd5PEW6CLytugN
 5Hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=2dEmOOaTKGF4Qlb49VhQf6A9PlFA3b36H9rV7z7cwEs=;
 b=iMlJ/3JqYy2zakSU2jDnEsOyGixFhQhSdqn5aJfAor7vU124+lH/YFImWe/qAutS6v
 GAiyJK035T9Bx1COWkA4DOpvzBGm2ow73PgCb7ond9BR8l/w4q4T3ScD18c+w8Ib0AOq
 IiXBskmbM5V2Ku2q66oHdztktj84PIB1heA3Hg+3qB4ZFvnJWXk/o/A3BRefKipFA8k/
 yibfVKBC2S49mcKGfpqHKrv7sdzPdcLgkT3WzkXrElJw5mnGeSSvArl32AhcT+og1JJk
 XXaPGlJ2aR4smkpc2wTlP/wcgbckE0vb0OoJ+9nGShLUOeRgOUNzolGFzY+9lfOwwtYX
 AKPQ==
X-Gm-Message-State: AOAM532Qf1EXKoOo468gMDQyRsT9CG9ft4XQz4/hDmCtUuqwHShUvMLN
 Kk0LgvKKFkDZev8L9S0Bjiw=
X-Google-Smtp-Source: ABdhPJx/3IphE9S504xPgr16qEBAcS0ylg8qERwwjyz6fVgDCXDiKIqknM6KTZc4U4Q2EmZZ4gfQeA==
X-Received: by 2002:a17:90a:17ab:: with SMTP id
 q40mr29264299pja.152.1593685549611; 
 Thu, 02 Jul 2020 03:25:49 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id g18sm8571288pfk.40.2020.07.02.03.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 03:25:48 -0700 (PDT)
Date: Thu, 02 Jul 2020 20:25:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/8] powerpc/64s: implement queued spinlocks and rwlocks
To: Will Deacon <will@kernel.org>
References: <20200702074839.1057733-1-npiggin@gmail.com>
 <20200702074839.1057733-6-npiggin@gmail.com>
 <20200702080219.GB16113@willie-the-truck>
In-Reply-To: <20200702080219.GB16113@willie-the-truck>
MIME-Version: 1.0
Message-Id: <1593685459.r2tfxtfdp6.astroid@bobo.none>
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

Excerpts from Will Deacon's message of July 2, 2020 6:02 pm:
> On Thu, Jul 02, 2020 at 05:48:36PM +1000, Nicholas Piggin wrote:
>> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
>> new file mode 100644
>> index 000000000000..f84da77b6bb7
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/qspinlock.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_POWERPC_QSPINLOCK_H
>> +#define _ASM_POWERPC_QSPINLOCK_H
>> +
>> +#include <asm-generic/qspinlock_types.h>
>> +
>> +#define _Q_PENDING_LOOPS	(1 << 9) /* not tuned */
>> +
>> +#define smp_mb__after_spinlock()   smp_mb()
>> +
>> +static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
>> +{
>> +	smp_mb();
>> +	return atomic_read(&lock->val);
>> +}
> 
> Why do you need the smp_mb() here?

A long and sad tale that ends here 51d7d5205d338

Should probably at least refer to that commit from here, since this one 
is not going to git blame back there. I'll add something.

Thanks,
Nick
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
