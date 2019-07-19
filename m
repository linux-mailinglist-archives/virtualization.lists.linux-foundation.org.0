Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE86D80E
	for <lists.virtualization@lfdr.de>; Fri, 19 Jul 2019 02:59:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 55BB01EED;
	Fri, 19 Jul 2019 00:59:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7C5551C7F
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 00:58:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5DBD3180
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 00:58:58 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id f5so4827432pgu.5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 17:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RWWNgv0WcWjfE9wWYHQhoeNKyBfGxLtvDshgZHYc1vE=;
	b=E6BdmnEny9HvNXCWWCNu6nigVdrpKQtrHpd5VaYYdtM3k7Iw5VCr81HViblNf21v7h
	pdOiQKD/Mzjt5foPPtR/vGwqST+Lww69HAOEVBcC9zpv6zaJaGjFJnJNGkb0S4rKHVov
	aR9w9trSnWXNKKvksT7GA2SyyDMDFPtp33R6Dp+muBqYuCmPW/6tanGcMYReD5WfdTyi
	1k2uNUIEfmMrmmwZRR7rI8S8oBhjdqNNEpv/Q7eLHMHrqq002C1pyCkyKDdIVP83EMuY
	rO6kN4m5hxmVIsI0/TPPb8bKOoh5SqPHXm3uh0xoC7BHSl6BpuJ5lAlZUZHP7qytUq0X
	lySA==
X-Gm-Message-State: APjAAAWKyB6z6wJN6hw1N8JNb3LxwiwM2E2MadeO8/tpihOFjWATXL+Z
	/ZYjlf9MyoILZZreR3v0akA=
X-Google-Smtp-Source: APXvYqxZoIKjz9ViGfUIEExjwwIbnjfGtWb7w9xiUnCbHyVRrBrLCxFCFJP5cS9IAYKOxxdelYaABg==
X-Received: by 2002:a63:a346:: with SMTP id v6mr4814748pgn.57.1563497937499;
	Thu, 18 Jul 2019 17:58:57 -0700 (PDT)
Received: from htb-2n-eng-dhcp405.eng.vmware.com ([66.170.99.1])
	by smtp.gmail.com with ESMTPSA id
	j128sm14025166pfg.28.2019.07.18.17.58.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 17:58:56 -0700 (PDT)
To: Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v3 0/9] x86: Concurrent TLB flushes
Date: Thu, 18 Jul 2019 17:58:28 -0700
Message-Id: <20190719005837.4150-1-namit@vmware.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

[ Cover-letter is identical to v2, including benchmark results,
  excluding the change log. ] 

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

  Th.   tip-jun28 avg (stdev)   +patch-set avg (stdev)  change
  ---   ---------------------   ----------------------  ------
  1     1267765 (14146)         1299253 (5715)          +2.4%
  2     1734644 (11936)         1799225 (19577)         +3.7%
  4     2821268 (41184)         2919132 (40149)         +3.4%
  8     4171652 (31243)         4376925 (65416)         +4.9%
  16    5590729 (24160)         5829866 (8127)          +4.2%
  24    6250212 (24481)         6522303 (28044)         +4.3%
  32    3994314 (26606)         4077543 (10685)         +2.0%
  48    4345177 (28091)         4417821 (41337)         +1.6%

(Note that on configurations with up to 24 threads numactl was used to
set all threads on socket 1, which explains the drop in performance when
going to 32 threads).

Running the same benchmark with security mitigations disabled (PTI,
Spectre, MDS):

  Th.   tip-jun28 avg (stdev)   +patch-set avg (stdev)  change
  ---   ---------------------   ----------------------  ------
  1     1598896 (5174)          1607903 (4091)          +0.5%
  2     2109472 (17827)         2224726 (4372)          +5.4%
  4     3448587 (11952)         3668551 (30219)         +6.3%
  8     5425778 (29641)         5606266 (33519)         +3.3%
  16    6931232 (34677)         7054052 (27873)         +1.7%
  24    7612473 (23482)         7783138 (13871)         +2.2%
  32    4296274 (18029)         4283279 (32323)         -0.3%
  48    4770029 (35541)         4764760 (13575)         -0.1%

Presumably, PTI requires two invalidations of each mapping, which allows
to get higher benefits from concurrency when PTI is on. At the same
time, when mitigations are on, other overheads reduce the potential
speedup.

I tried to reduce the size of the code of the main patch, which required
restructuring of the series.

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
  x86/mm/tlb: Remove reason as argument for flush_tlb_func_local()
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
 arch/x86/include/asm/tlbflush.h       |  47 ++++-----
 arch/x86/include/asm/trace/hyperv.h   |   2 +-
 arch/x86/kernel/kvm.c                 |  11 ++-
 arch/x86/kernel/paravirt.c            |   2 +-
 arch/x86/mm/init.c                    |   2 +-
 arch/x86/mm/tlb.c                     | 133 ++++++++++++++++----------
 arch/x86/xen/mmu_pv.c                 |  11 +--
 include/linux/cpumask.h               |   6 +-
 include/linux/smp.h                   |  27 ++++--
 include/trace/events/xen.h            |   2 +-
 kernel/smp.c                          | 133 ++++++++++++--------------
 14 files changed, 218 insertions(+), 178 deletions(-)

-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
