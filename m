Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEB12151B1
	for <lists.virtualization@lfdr.de>; Mon,  6 Jul 2020 06:35:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A19D88C06;
	Mon,  6 Jul 2020 04:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E39wm8nYo4qu; Mon,  6 Jul 2020 04:35:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C869688C80;
	Mon,  6 Jul 2020 04:35:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9101C08A9;
	Mon,  6 Jul 2020 04:35:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A894C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6DF442039A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1+nIcIczweo
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:35:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by silver.osuosl.org (Postfix) with ESMTPS id F24C520399
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:35:53 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s10so39268247wrw.12
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Jul 2020 21:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZKbw/z5L6V9QIy1x3CDqGbQPwSP3RR4H4VZhRPfsp8M=;
 b=Hkf1JzYh8wjUYolV0yaByArSjR1r/H4U8J4WcN5XtRtVGH5W1a+waY2FcTp6vNrLBv
 jUMpiNqYBpmtBNy0cshISgyAcM8ayGC//EhS4EYX7SaFkqXmDS7tGBDLg5gGMwx+RI0v
 rFOVnaVf/ZahbQA9k3IR3fBN0Nr5dbv8ZnaxhEiQ8cS4v1n7xBWwPFfjtuUabcwR3wgn
 Pn010T/J+8URF0VzurWA/Zg0X0kLeBB6VLgpir94tXXLt4ibfN8TCZXm0Uqe8IgWEk7r
 i10AkbH3ZRjLbsnoD+AFWUwuWz0ZGk7mbp96o/clHt9q62DneKcDYbkA09H3OaLiOHAV
 /a/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZKbw/z5L6V9QIy1x3CDqGbQPwSP3RR4H4VZhRPfsp8M=;
 b=Koa0ZAdcZ6W93VR5wX4XADDrThEKkeRo9tCV6V8INRk00aieTg+B52la34rZSKlCzl
 5CUXpglhB6N4/kaSZtml5F5mKNIlZxvaHSqULk/HaeIBgbW5jqjAidz8uD3Oo5j3VtqO
 tG/NcaypKAwboiasCGArGQKbMDDbuEegg1Ulc8aOdy7YQiQqlWYjjDVxgCsnmq6J5Sgc
 0LNXUV95b0e3EeocsvGXllma0p2lXNISI5f8dnO1TuUCgOsY8rMXvctQO6h7Ik3aTaV/
 +6Q92yA6MvI9Rxp4vi5xPnu8axOaSbPkNxfDLSgaXkkYyqt6ylluMyJcVkSZ2zSxCJbQ
 S+OA==
X-Gm-Message-State: AOAM5331bgB7gkWViUskihGqD6ZT4W+saT34SYF4gwy0BoeafXcRqrBa
 uBXhoclSRtL6yirNxvZ/MGk=
X-Google-Smtp-Source: ABdhPJzihhpFIjNtA4jYZFpWqPBLQzM2ItdHfjFiE1pNPdxZGN7QPxVTkIDKR3KTQMdZob9+J5kqVg==
X-Received: by 2002:adf:f34e:: with SMTP id e14mr46431344wrp.299.1594010152557; 
 Sun, 05 Jul 2020 21:35:52 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id r10sm22202309wrm.17.2020.07.05.21.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 21:35:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
Date: Mon,  6 Jul 2020 14:35:34 +1000
Message-Id: <20200706043540.1563616-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

v3 is updated to use __pv_queued_spin_unlock, noticed by Waiman (thank you).

Thanks,
Nick

Nicholas Piggin (6):
  powerpc/powernv: must include hvcall.h to get PAPR defines
  powerpc/pseries: move some PAPR paravirt functions to their own file
  powerpc: move spinlock implementation to simple_spinlock
  powerpc/64s: implement queued spinlocks and rwlocks
  powerpc/pseries: implement paravirt qspinlocks for SPLPAR
  powerpc/qspinlock: optimised atomic_try_cmpxchg_lock that adds the
    lock hint

 arch/powerpc/Kconfig                          |  13 +
 arch/powerpc/include/asm/Kbuild               |   2 +
 arch/powerpc/include/asm/atomic.h             |  28 ++
 arch/powerpc/include/asm/paravirt.h           |  89 +++++
 arch/powerpc/include/asm/qspinlock.h          |  91 ++++++
 arch/powerpc/include/asm/qspinlock_paravirt.h |   7 +
 arch/powerpc/include/asm/simple_spinlock.h    | 292 +++++++++++++++++
 .../include/asm/simple_spinlock_types.h       |  21 ++
 arch/powerpc/include/asm/spinlock.h           | 308 +-----------------
 arch/powerpc/include/asm/spinlock_types.h     |  17 +-
 arch/powerpc/lib/Makefile                     |   3 +
 arch/powerpc/lib/locks.c                      |  12 +-
 arch/powerpc/platforms/powernv/pci-ioda-tce.c |   1 +
 arch/powerpc/platforms/pseries/Kconfig        |   5 +
 arch/powerpc/platforms/pseries/setup.c        |   6 +-
 include/asm-generic/qspinlock.h               |   4 +
 16 files changed, 577 insertions(+), 322 deletions(-)
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
