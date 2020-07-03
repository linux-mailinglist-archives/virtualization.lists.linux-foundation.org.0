Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7905D21350F
	for <lists.virtualization@lfdr.de>; Fri,  3 Jul 2020 09:35:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D5F7589848;
	Fri,  3 Jul 2020 07:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5BmLuiGKCIQH; Fri,  3 Jul 2020 07:35:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 55AB089854;
	Fri,  3 Jul 2020 07:35:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1753BC0733;
	Fri,  3 Jul 2020 07:35:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B67BBC0733
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8127D25043
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiJEecajyOvl
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 5465324B6B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:29 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id mn17so235026pjb.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Jul 2020 00:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbRBeJ+XIbof8SsSnUrtwZgJ/aiu8Z+x8SsI7+GEKqo=;
 b=Sx/HrLI1gUrhnhruDmTnduBJm6i1u2AFd+QouTv/vb5YltoyihE6ABJowb0MWAz6Pf
 +uXGTwzRxR7b4k3wQmaA6naeh+y4u9Y2BAoN9vb0ulKlIyhXQw/raf4qDDowv+9P3vx6
 YEPSk+sNOeSOK0Umr8u1rPFcNnN5aW+kfalo8IP036e6NWdMYadk5NZDPS8fvt9SB2tQ
 sSHyx3urEWcOP26k/GNZ3LLNVlsem7fH+NdDgB53nCrQVtn+Jf6XtQEbLD4BdcW+QJ5v
 JucXQVQ44J3p+gLsA04oOXln9Ypjb4MyUkxCDnJOZein/EaL7mal3GVQ2TRMyoqf03c/
 2E4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbRBeJ+XIbof8SsSnUrtwZgJ/aiu8Z+x8SsI7+GEKqo=;
 b=HEoWSPkGuZ6uJx46wQJuESsfSTwTg0c0ulczs85CyPgAIFdX2tNKs/W/oB3vvLFWqD
 um+DoGoJUjqMh4u1OcNFLd+EEIcr2XPctaoC5jy723JYm5lubkGI9zPWJYL9bRpKsP65
 dELKSwopKkCZiBoNREq9srohkK38Whflh2W6Y1U+collJgO0HtSAeb/QuzfcfGqhQyxN
 PE0hc0DjvxYRDFIw+i5L/eoqqDLXX9/zlxOTDYN59dqy/Nq70+7Fxbrn3PIK0su3Dprr
 0bG3Pjfn2nlwH5iHUNNJJice+/wTGNn9HbhLQt5Fmwe51jrRv0PkQ5D9npH+66n3xeDz
 p4iw==
X-Gm-Message-State: AOAM532yLopGFaHhD5zqZVUCKx1lDy7w1ZDHDetkrhLKtb5O2mNjFP2e
 IpacAl0O2Bav2A84zOS0gEo=
X-Google-Smtp-Source: ABdhPJxGGr/T+DMbaejYqpR0giBM8nZ8ynq17VDv7uveaGsjhL5t6fMWI9MQnFOkBe6Nr0BI89jHMg==
X-Received: by 2002:a17:90a:db48:: with SMTP id
 u8mr5957942pjx.169.1593761728886; 
 Fri, 03 Jul 2020 00:35:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id y7sm10218499pgk.93.2020.07.03.00.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 00:35:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH v2 0/6] powerpc: queued spinlocks and rwlocks
Date: Fri,  3 Jul 2020 17:35:10 +1000
Message-Id: <20200703073516.1354108-1-npiggin@gmail.com>
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

v2 is updated to account for feedback from Will, Peter, and
Waiman (thank you), and trims off a couple of RFC and unrelated
patches.

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
 arch/powerpc/include/asm/qspinlock.h          |  80 +++++
 arch/powerpc/include/asm/qspinlock_paravirt.h |   5 +
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
 16 files changed, 564 insertions(+), 322 deletions(-)
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
