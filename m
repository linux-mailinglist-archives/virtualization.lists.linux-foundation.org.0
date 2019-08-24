Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D17E9BC09
	for <lists.virtualization@lfdr.de>; Sat, 24 Aug 2019 08:02:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 76EDDAA5;
	Sat, 24 Aug 2019 06:02:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E537E2F
	for <virtualization@lists.linux-foundation.org>;
	Sat, 24 Aug 2019 06:02:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3D59867F
	for <virtualization@lists.linux-foundation.org>;
	Sat, 24 Aug 2019 06:02:41 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id bj8so6874068plb.4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 23:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PBhfWEbouVzAKjWN+Pc+TxdOjUmjwfquupK+iz/fQ4A=;
	b=Ov1SLDyu8MU0U3c/31P8yVpFcZvsdRZBubl+/+P3rNMNEaUD2LqcV7mxm8FCSTmTZt
	gT0HoowYMMTvMy0QmqSWi432EdPozX6p6nvgDE6t8vPUTC8FulCU4aXauTm3oHnQsrRS
	7Me/VEXItfsJ8joooVGUlpTfrbUhcMezWNeK0fX1Uw0421zSw/OeEvMqh2POD5W+jmMh
	79b39HOCkM45M9yR4vBlTskYnoqxhwVl9fzKi8d+bU+RmEtntY3TbTT+0cPuFwYZzxEa
	THnAoJeRVLSlcQSzQKCwTNTKsVPT4fgeKcyfTh6m2jYKIeUKTWfAW0RnZfkqV7M2abCJ
	b9SQ==
X-Gm-Message-State: APjAAAWTzh0fsWjwzRAA60dyi5SPw9AAcv4GOBzzbSK+5s8EkEbhTZIZ
	cChcbXNIucZzms35amyFlac=
X-Google-Smtp-Source: APXvYqxyv6SnHafwAq2wDS1W1xROCWpkM31he4PdrXfsHzhw8ccWshBnDB7Isij98lfCJIj1o8scog==
X-Received: by 2002:a17:902:248:: with SMTP id 66mr8776408plc.19.1566626560378;
	Fri, 23 Aug 2019 23:02:40 -0700 (PDT)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
	by smtp.gmail.com with ESMTPSA id
	i11sm6505645pfk.34.2019.08.23.23.02.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 23 Aug 2019 23:02:39 -0700 (PDT)
To: Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v4 0/9] x86/tlb: Concurrent TLB flushes
Date: Fri, 23 Aug 2019 15:41:44 -0700
Message-Id: <20190823224153.15223-1-namit@vmware.com>
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

[ Similar cover-letter to v3 with updated performance numbers on skylake.
  Sorry for the time it since the last version. ]

Currently, local and remote TLB flushes are not performed concurrently,
which introduces unnecessary overhead - each PTE flushing can take 100s
of cycles. This patch-set allows TLB flushes to be run concurrently:
first request the remote CPUs to initiate the flush, then run it
locally, and finally wait for the remote CPUs to finish their work.

In addition, there are various small optimizations to avoid, for
example, unwarranted false-sharing.

The proposed changes should also improve the performance of other
invocations of on_each_cpu(). Hopefully, no one has relied on this
behavior of on_each_cpu() that invoked functions first remotely and only
then locally [Peter says he remembers someone might do so, but without
further information it is hard to know how to address it].

Running sysbench on dax/ext4 w/emulated-pmem, write-cache disabled on
2-socket, 56-logical-cores (28+SMT) Skylake, 5 repetitions:

sysbench fileio --file-total-size=3G --file-test-mode=rndwr \
 --file-io-mode=mmap --threads=X --file-fsync-mode=fdatasync run

 Th.   tip-aug22 avg (stdev)   +patch-set avg (stdev)  change
 ---   ---------------------   ----------------------  ------
 1	1152920 (7453)		1169469 (9059)		+1.4%
 2	1545832 (12555)		1584172 (10484) 	+2.4%
 4	2480703 (12039)		2518641 (12875)		+1.5%
 8	3684486 (26007)		3840343 (44144)		+4.2%
 16	4981567 (23565)		5125756 (15458)		+2.8%
 32	5679542 (10116)		5887826 (6121)		+3.6%
 56	5630944 (17937)		5812514 (26264)		+3.2%

(Note that on configurations with up to 28 threads numactl was used to
set all threads on socket 1, which explains the drop in performance when
going to 32 threads).

Running the same benchmark with security mitigations disabled (PTI,
Spectre, MDS):

 Th.   tip-aug22 avg (stdev)   +patch-set avg (stdev)  change
 ---   ---------------------   ----------------------  ------
 1	1444119 (8524)		1469606 (10527)		+1.7%
 2	1921540 (24169)		1961899 (14450)		+2.1%
 4	3073716 (21786)		3199880 (16774)		+4.1%
 8	4700698 (49534)		4802312 (11043)		+2.1%
 16	6005180 (6366)		6006656 (31624)		   0%
 32	6826466 (10496)		6886622 (19110)		+0.8%
 56	6832344 (13468)		6885586 (20646)		+0.8%

The results are somewhat different than the results that have been obtained on
Haswell-X, which were sent before and the maximum performance improvement is
smaller. However, the performance improvement is significant.

v3 -> v4:
  * Merge flush_tlb_func_local and flush_tlb_func_remote() [Peter]
  * Prevent preemption on_each_cpu(). It is not needed, but it prevents
    concerns. [Peter/tglx]
  * Adding acked-, review-by tags

v2 -> v3:
* Open-code the remote/local-flush decision code [Andy]
* Fix hyper-v, Xen implementations [Andrew]
* Fix redundant TLB flushes.

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
  x86/mm/tlb: Unify flush_tlb_func_local() and flush_tlb_func_remote()
  x86/mm/tlb: Open-code on_each_cpu_cond_mask() for tlb_is_not_lazy()
  x86/mm/tlb: Flush remote and local TLBs concurrently
  x86/mm/tlb: Privatize cpu_tlbstate
  x86/mm/tlb: Do not make is_lazy dirty for no reason
  cpumask: Mark functions as pure
  x86/mm/tlb: Remove UV special case
  x86/mm/tlb: Remove unnecessary uses of the inline keyword

 arch/x86/hyperv/mmu.c                 |  10 +-
 arch/x86/include/asm/paravirt.h       |   6 +-
 arch/x86/include/asm/paravirt_types.h |   4 +-
 arch/x86/include/asm/tlbflush.h       |  52 +++----
 arch/x86/include/asm/trace/hyperv.h   |   2 +-
 arch/x86/kernel/kvm.c                 |  11 +-
 arch/x86/kernel/paravirt.c            |   2 +-
 arch/x86/mm/init.c                    |   2 +-
 arch/x86/mm/tlb.c                     | 195 ++++++++++++++------------
 arch/x86/xen/mmu_pv.c                 |  11 +-
 include/linux/cpumask.h               |   6 +-
 include/linux/smp.h                   |  34 ++++-
 include/trace/events/xen.h            |   2 +-
 kernel/smp.c                          | 138 +++++++++---------
 14 files changed, 254 insertions(+), 221 deletions(-)

-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
