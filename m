Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EB04022C604
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 15:14:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E84E8848B;
	Fri, 24 Jul 2020 13:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lZyfin-UGjKE; Fri, 24 Jul 2020 13:14:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB04D884A1;
	Fri, 24 Jul 2020 13:14:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87FBAC004C;
	Fri, 24 Jul 2020 13:14:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2E99C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E19BC8665E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVPWnIglBtld
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:14:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B77B786194
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:14:36 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z5so5195061pgb.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pNbiY4rCOWfn291u6DvF/2Ahe4KMxxHPAD/LG/AtX8A=;
 b=pXLqcyKcwadFpxMawcde5uKWsmYRkcG8MkmB7OazkUR1B9BxLPOTtomS0atxp0wsl0
 3K/nBNDtdLM3XMKp/+Q2KWPhTzNaLsUfCbkpvUQYl6EOzkHNK4vD7ZfKDhoLzWCd2/se
 fgoI8WC64Tprw9SX7RVYFGJVh3Fr+l1v+e5gbAofaNSm7BpQNZBwaJXh4KnnE/c7ATBL
 JP1X36gJgrQMWq1w5fNtffUVAvZelPJ7TC9Q/xuCVhzxxomWZcH5/i0edBgmsWZ5thXx
 Ig3Akrdt8zubCyDuzbipimtLx+lMYUOnS0mpNIrbb3vf4jg7KTVvtMzq2Quh777Evv+Z
 RCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pNbiY4rCOWfn291u6DvF/2Ahe4KMxxHPAD/LG/AtX8A=;
 b=acLQoG3U8aBsxertBkhVGfMpE8RaVOrz4/gocTnQCd2rEHrG1xdCwQVK6ZVGQVWV+z
 gCuLDCBvywRBc4FEHHIdY+HY13H2SSJS7ic4NSl7NbEA5bB2ox0IsOo7ezpyZaUINfPS
 /2RVJ2ao9IzRGGxqrVfd9NuOb11HR1Fs4WvPfM+N0jf/FnZU6dcwU47QwbxUnHc8QHKE
 3I727e+iURiB60sT3/EjqmBog3WPAQOPKrk2MG7jyq97AOpK7xVSTpcqSXtSSHgQuu93
 EGtFD//HHx9qAl8/ME0aAq5Yt7TNc+stfj6L6ZI+C80qVTjEBZSRxDQ+8tp65zst2r+8
 dyyA==
X-Gm-Message-State: AOAM532a6N1G/K5Nj9okI/lXEsbWLWLQirljjXJ3w9P0aMpK5DU1k3g5
 FCaPBn40Kk9B4ExAeJIN+S0=
X-Google-Smtp-Source: ABdhPJxTM0xNsmofbW6cID6lTwKMAYAg9GWepJp2u9OgGyKYII7bL4WnhIOmRKega9Bzh5DogPa2Zg==
X-Received: by 2002:a05:6a00:1586:: with SMTP id
 u6mr8714565pfk.147.1595596476262; 
 Fri, 24 Jul 2020 06:14:36 -0700 (PDT)
Received: from bobo.ibm.com (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id az16sm5871998pjb.7.2020.07.24.06.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 06:14:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/6] powerpc: queued spinlocks and rwlocks
Date: Fri, 24 Jul 2020 23:14:17 +1000
Message-Id: <20200724131423.1362108-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Waiman Long <longman@redhat.com>,
 Anton Blanchard <anton@ozlabs.org>, Will Deacon <will@kernel.org>
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

Updated with everybody's feedback (thanks all), and more performance
results.

What I've found is I might have been measuring the worst load point for
the paravirt case, and by looking at a range of loads it's clear that
queued spinlocks are overall better even on PV, doubly so when you look
at the generally much improved worst case latencies.

I have defaulted it to N even though I'm less concerned about the PV
numbers now, just because I think it needs more stress testing. But
it's very nicely selectable so should be low risk to include.

All in all this is a very cool technology and great results especially
on the big systems but even on smaller ones there are nice gains. Thanks
Waiman and everyone who developed it.

Thanks,
Nick

Nicholas Piggin (6):
  powerpc/pseries: move some PAPR paravirt functions to their own file
  powerpc: move spinlock implementation to simple_spinlock
  powerpc/64s: implement queued spinlocks and rwlocks
  powerpc/pseries: implement paravirt qspinlocks for SPLPAR
  powerpc/qspinlock: optimised atomic_try_cmpxchg_lock that adds the
    lock hint
  powerpc: implement smp_cond_load_relaxed

 arch/powerpc/Kconfig                          |  15 +
 arch/powerpc/include/asm/Kbuild               |   1 +
 arch/powerpc/include/asm/atomic.h             |  28 ++
 arch/powerpc/include/asm/barrier.h            |  14 +
 arch/powerpc/include/asm/paravirt.h           |  87 +++++
 arch/powerpc/include/asm/qspinlock.h          |  91 ++++++
 arch/powerpc/include/asm/qspinlock_paravirt.h |   7 +
 arch/powerpc/include/asm/simple_spinlock.h    | 288 ++++++++++++++++
 .../include/asm/simple_spinlock_types.h       |  21 ++
 arch/powerpc/include/asm/spinlock.h           | 308 +-----------------
 arch/powerpc/include/asm/spinlock_types.h     |  17 +-
 arch/powerpc/lib/Makefile                     |   3 +
 arch/powerpc/lib/locks.c                      |  12 +-
 arch/powerpc/platforms/pseries/Kconfig        |   9 +-
 arch/powerpc/platforms/pseries/setup.c        |   4 +-
 include/asm-generic/qspinlock.h               |   4 +
 16 files changed, 588 insertions(+), 321 deletions(-)
 create mode 100644 arch/powerpc/include/asm/paravirt.h
 create mode 100644 arch/powerpc/include/asm/qspinlock.h
 create mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h
 create mode 100644 arch/powerpc/include/asm/simple_spinlock.h
 create mode 100644 arch/powerpc/include/asm/simple_spinlock_types.h

-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
