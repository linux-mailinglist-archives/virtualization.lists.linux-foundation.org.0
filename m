Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 386095DE8E
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 09:14:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 46954ECE;
	Wed,  3 Jul 2019 07:14:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 59D05E6E
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 07:14:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3A90D70D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 07:14:03 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 81so750406pfy.13
	for <virtualization@lists.linux-foundation.org>;
	Wed, 03 Jul 2019 00:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=B1kQvrQoHFPsOT1yXoo85QIU6lm9lrhuL5yM9gcXKZ0=;
	b=U3//8FUQjF/ALJ+UuslT2L25V6aE+8FK80+u2OYuEEdin6s8rnA5w+jj7++AShQSdi
	jW7ID0kHpZmAl4bedD3F04hSBHWui/TsK+jt7BlTiwZl5D9q1v8Db1zAzv1qEPXF7viG
	PsIXtGnMKGNIgeWRmVClEuYzXescqpKkkiXFyqNTNBv5dQa1WHAq7chyVJtls7g4psMN
	C9IYNjE15xScaehnhswnl9VghKKiHqQLeQUtN2JbXIgs8P3YlXLmGZPrOhqc2G8gkgLy
	tTf/jp8nNhqxRWa1MK+ZADuRagUYV5OPRcF008+EYG/0G4QdktKcMo260Geb+UeHk/3v
	bbHA==
X-Gm-Message-State: APjAAAW5r5rNYzOdD7owKxY/XpIf0lpRIDgSsts6+1QOkwyETYDLoay8
	TcF2nY/G3Veey+LQqiu+Agg=
X-Google-Smtp-Source: APXvYqwUyamaUZpHybk6nfj2wr4zAu1x6OPqmfFZEMCShOUOWld0YXW8Rb4mD/UbT+YdTI4jAfzbyg==
X-Received: by 2002:a17:90a:22ef:: with SMTP id
	s102mr11149274pjc.2.1562138042451; 
	Wed, 03 Jul 2019 00:14:02 -0700 (PDT)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
	by smtp.gmail.com with ESMTPSA id
	j21sm1256593pfh.86.2019.07.03.00.14.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Jul 2019 00:14:01 -0700 (PDT)
To: Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v2 0/9] x86: Concurrent TLB flushes
Date: Tue,  2 Jul 2019 16:51:42 -0700
Message-Id: <20190702235151.4377-1-namit@vmware.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00, DATE_IN_PAST_06_12, 
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
	linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>, Rik van Riel <riel@surriel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, Ingo Molnar <mingo@redhat.com>,
	Nadav Amit <namit@vmware.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Nadav Amit via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Nadav Amit <namit@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Currently, local and remote TLB flushes are not performed concurrently,
which introduces unnecessary overhead - each INVLPG can take 100s of
cycles. This patch-set allows TLB flushes to be run concurrently: first
request the remote CPUs to initiate the flush, then run it locally, and
finally wait for the remote CPUs to finish their work.

In addition, there are various small optimizations to avoid unwarranted
false-sharing and atomic operations.

The proposed changes should also improve the performance of other
invocations of on_each_cpu(). Hopefully, no one has relied on this
behavior of on_each_cpu() that invoked functions first remotely and only
then locally [Peter says he remembers someone might do so, but without
further information it is hard to know how to address it].

Running sysbench on dax/ext4 w/emulated-pmem, write-cache disabled on
2-socket, 48-logical-cores (24+SMT) Haswell-X, 5 repetitions:

 sysbench fileio --file-total-size=3G --file-test-mode=rndwr \
  --file-io-mode=mmap --threads=X --file-fsync-mode=fdatasync run

  Th.	tip-jun28 avg (stdev)	+patch-set avg (stdev)	change
  ---	---------------------	----------------------	------
  1	1267765 (14146)		1299253 (5715)		+2.4%
  2	1734644 (11936)		1799225 (19577)		+3.7%
  4	2821268 (41184)		2919132 (40149)		+3.4%
  8	4171652 (31243)		4376925 (65416)		+4.9%
  16	5590729 (24160)		5829866 (8127)		+4.2%
  24	6250212 (24481)		6522303 (28044)		+4.3%
  32	3994314 (26606)		4077543 (10685)		+2.0%
  48	4345177 (28091)		4417821 (41337)		+1.6%

(Note that on configurations with up to 24 threads numactl was used to
set all threads on socket 1, which explains the drop in performance when
going to 32 threads).

Running the same benchmark with security mitigations disabled (PTI,
Spectre, MDS):

  Th.	tip-jun28 avg (stdev)	+patch-set avg (stdev)	change
  ---	---------------------	----------------------	------
  1	1598896 (5174)		1607903 (4091)		+0.5%
  2	2109472 (17827)		2224726 (4372)		+5.4%
  4	3448587 (11952)		3668551 (30219)		+6.3%
  8	5425778 (29641)		5606266 (33519)		+3.3%
  16	6931232 (34677)		7054052 (27873)		+1.7%
  24	7612473 (23482)		7783138 (13871)		+2.2%
  32	4296274 (18029)		4283279 (32323)		-0.3%
  48	4770029 (35541)		4764760 (13575)		-0.1%

Presumably, PTI requires two invalidations of each mapping, which allows
to get higher benefits from concurrency when PTI is on. At the same
time, when mitigations are on, other overheads reduce the potential
speedup.

I tried to reduce the size of the code of the main patch, which required
restructuring of the series.

v1 -> v2:
* Removing the patches that Thomas took [tglx]
* Adding hyper-v, Xen compile-tested implementations [Dave]
* Removing UV [Andy]
* Adding lazy optimization, removing inline keyword [Dave]
* Restructuring patch-set

RFCv2 -> v1:
* Fix comment on flush_tlb_multi [Juergen]
* Removing async invalidation optimizations [Andy]
* Adding KVM support [Paolo]

Cc: Andy Lutomirski <luto@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: Sasha Levin <sashal@kernel.org>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: kvm@vger.kernel.org
Cc: linux-hyperv@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org
Cc: x86@kernel.org
Cc: xen-devel@lists.xenproject.org

Nadav Amit (9):
  smp: Run functions concurrently in smp_call_function_many()
  x86/mm/tlb: Remove reason as argument for flush_tlb_func_local()
  x86/mm/tlb: Open-code on_each_cpu_cond_mask() for tlb_is_not_lazy()
  x86/mm/tlb: Flush remote and local TLBs concurrently
  x86/mm/tlb: Privatize cpu_tlbstate
  x86/mm/tlb: Do not make is_lazy dirty for no reason
  cpumask: Mark functions as pure
  x86/mm/tlb: Remove UV special case
  x86/mm/tlb: Remove unnecessary uses of the inline keyword

 arch/x86/hyperv/mmu.c                 |  13 ++-
 arch/x86/include/asm/paravirt.h       |   6 +-
 arch/x86/include/asm/paravirt_types.h |   4 +-
 arch/x86/include/asm/tlbflush.h       |  48 +++++----
 arch/x86/include/asm/trace/hyperv.h   |   2 +-
 arch/x86/kernel/kvm.c                 |  11 +-
 arch/x86/kernel/paravirt.c            |   2 +-
 arch/x86/mm/init.c                    |   2 +-
 arch/x86/mm/tlb.c                     | 147 ++++++++++++++++----------
 arch/x86/xen/mmu_pv.c                 |  20 ++--
 include/linux/cpumask.h               |   6 +-
 include/linux/smp.h                   |  27 +++--
 include/trace/events/xen.h            |   2 +-
 kernel/smp.c                          | 133 +++++++++++------------
 14 files changed, 245 insertions(+), 178 deletions(-)

-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
