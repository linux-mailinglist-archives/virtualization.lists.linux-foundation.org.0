Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F02C3211D57
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 09:48:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F52D8906C;
	Thu,  2 Jul 2020 07:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOGACjzTZgmD; Thu,  2 Jul 2020 07:48:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 446B689066;
	Thu,  2 Jul 2020 07:48:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1749FC0733;
	Thu,  2 Jul 2020 07:48:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EE9BC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1C21A89066
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwOdUO8YQYAQ
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:48:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7CE0989057
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:48:54 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id p3so13064016pgh.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 00:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BGkFFlz3CL02oLLT9btRQ7t/uEdtktYrj+rJR3OzJfE=;
 b=VBfP9EfuSC5B01Yl75AWN5yemr1U1nXAUk5J9ZUrRV6z1IlF+wqWTn7hCEuC1eO+pI
 8f86dVB/F+CRd2am9M5cdc/3ApYWU6kEbVD5j3DjFhKedIbYD6rPBQFjGeEFgjvWKhXo
 0e1AZa92QpzFmLh0b6SRUIBVyzGbRd5JemEOktspm7S9V6vAkyWXCfRj4tjCBfWyfnT+
 ibbtdkwflelrAnPwkuhudW8uZVK9d9lclyVgPdyVkQ6uqW230GSyTCzVVXtq2CoRm+Q3
 kcR2wSgzchyBlq61itWFoQtZn4e2Yc2BMOZTuceB0zw5NeG/q5iyNoN40PF6g1sA1DIe
 pXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BGkFFlz3CL02oLLT9btRQ7t/uEdtktYrj+rJR3OzJfE=;
 b=L7bA+zOBd6sltL0CheeYjTDBuS1QVI9hI1NIHfL3ViFsG9Idif6ikUqQQwQ47pLHDW
 jfEbj5Yw8g/twlunU5xbvaM+TEh8xu2cQTzq4xC6YNh+eX8e8O9RtaKvNrdygt5n1mFN
 Vk6cWC3YTBziKwC80SO5YBzRLaMPQM8Bsugxj5ZVlJmnCRMjnvC7a7+bSauV7canUPni
 yvmYC5rDcsBppdSE1jcbp0fmOQp8xbMowcKxNqLppsyHXXyD7drwePPAvGoSFPe/nuCC
 21PbZ0B/vt6Fl3DmNAssViZsuyclgekxiFxt40eC6Td+ugW6JBsi07BM8wR8T/2YmKDX
 RLGQ==
X-Gm-Message-State: AOAM530IfQ6wT0ukTZL9RtA4tTOP7+82bVR3cZAPJuXQfnrf2FWJJwWX
 DYhPQaw/kZQWC8zGtqgyje0=
X-Google-Smtp-Source: ABdhPJyZZV6c4bnHmvuCFcUHb/+F9EKbXInlk5xywpAnKg6m7EzNfoqKOOHYh+AmFZBFfTL3c0/qMQ==
X-Received: by 2002:a65:4847:: with SMTP id i7mr14123759pgs.385.1593676134139; 
 Thu, 02 Jul 2020 00:48:54 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id 17sm6001953pfv.16.2020.07.02.00.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:48:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 0/8] powerpc: queued spinlocks and rwlocks
Date: Thu,  2 Jul 2020 17:48:31 +1000
Message-Id: <20200702074839.1057733-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, Boqun Feng <boqun.feng@gmail.com>,
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

This series adds an option to use queued spinlocks for powerpc, and
makes it the default for the Book3S-64 subarch.

This effort starts with the generic code so it's very simple but
still very performant. There are optimisations that can be made to
slowpaths, but I think it's better to attack those incrementally
if/when we find things, and try to add the improvements to generic
code as much as possible.

Still in the process of getting numbers and testing, but the
implementation turned out to be surprisingly simple and we have a
config option, so I think we could merge it fairly soon.

Thanks,
Nick

Nicholas Piggin (8):
  powerpc/powernv: must include hvcall.h to get PAPR defines
  powerpc/pseries: use smp_rmb() in H_CONFER spin yield
  powerpc/pseries: move some PAPR paravirt functions to their own file
  powerpc: move spinlock implementation to simple_spinlock
  powerpc/64s: implement queued spinlocks and rwlocks
  powerpc/pseries: implement paravirt qspinlocks for SPLPAR
  powerpc/qspinlock: optimised atomic_try_cmpxchg_lock that adds the
    lock hint
  powerpc/64s: remove paravirt from simple spinlocks (RFC only)

 arch/powerpc/Kconfig                          |  13 +
 arch/powerpc/include/asm/Kbuild               |   2 +
 arch/powerpc/include/asm/atomic.h             |  28 ++
 arch/powerpc/include/asm/paravirt.h           |  84 +++++
 arch/powerpc/include/asm/qspinlock.h          |  75 +++++
 arch/powerpc/include/asm/qspinlock_paravirt.h |   5 +
 arch/powerpc/include/asm/simple_spinlock.h    | 235 +++++++++++++
 .../include/asm/simple_spinlock_types.h       |  21 ++
 arch/powerpc/include/asm/spinlock.h           | 308 +-----------------
 arch/powerpc/include/asm/spinlock_types.h     |  17 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c           |   6 -
 arch/powerpc/lib/Makefile                     |   1 -
 arch/powerpc/lib/locks.c                      |  65 ----
 arch/powerpc/platforms/powernv/pci-ioda-tce.c |   1 +
 arch/powerpc/platforms/pseries/Kconfig        |   5 +
 arch/powerpc/platforms/pseries/setup.c        |   6 +-
 include/asm-generic/qspinlock.h               |   4 +
 17 files changed, 488 insertions(+), 388 deletions(-)
 create mode 100644 arch/powerpc/include/asm/paravirt.h
 create mode 100644 arch/powerpc/include/asm/qspinlock.h
 create mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h
 create mode 100644 arch/powerpc/include/asm/simple_spinlock.h
 create mode 100644 arch/powerpc/include/asm/simple_spinlock_types.h
 delete mode 100644 arch/powerpc/lib/locks.c

-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
