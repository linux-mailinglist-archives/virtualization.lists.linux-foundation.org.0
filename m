Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E163667FC5
	for <lists.virtualization@lfdr.de>; Thu, 12 Jan 2023 20:58:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ABB060EFD;
	Thu, 12 Jan 2023 19:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ABB060EFD
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=f8TroYQi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLXB2_Vr_90x; Thu, 12 Jan 2023 19:58:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 584F060EA7;
	Thu, 12 Jan 2023 19:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 584F060EA7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A759C0078;
	Thu, 12 Jan 2023 19:58:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 157C0C0092
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Jan 2023 19:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2801460E80
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Jan 2023 19:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2801460E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1nnG7A0Loxf7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Jan 2023 19:57:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7714260E71
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7714260E71
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Jan 2023 19:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=A36GBNDeZcYlVC8rkRiSg7Fkb66ciqPmteGiazOXnKo=; b=f8TroYQijIlc9MuWlP4LwBLqev
 fPz8ciZ+SdwGgd+2dJNYnnpQQfPyL98wQLCxEdxcxA7jXGonUiF59Vm/+fX/v7qM8g5FLUmOTcYTd
 hqPpoLIDep8jXNb4QI+vppOcG4nANADValU324FWAQyr0xAZKKscT0Fj8Jrh7UyUfLwpsYnsOEWNz
 eQRPSdLyPwoJR6DYI9crm2nvFg9liwcgMxc46hAGZACQUxHgHL8kM0Lc1lLwF9174dIfxotwuNWx0
 KkzVpLQtlnyo1ad4E13LtdvMggDa3/MeFTlRbijDXhqwH1GQuZNTKtNRZ9gryMA3HVyhHm3enhGOO
 s4VYrYww==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pG3hZ-005Odj-TU; Thu, 12 Jan 2023 19:57:30 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4AEF830341C;
 Thu, 12 Jan 2023 20:57:13 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id DFC6A2CCF1F66; Thu, 12 Jan 2023 20:57:07 +0100 (CET)
Message-ID: <20230112195540.373461409@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 20:43:31 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v3 17/51] objtool/idle: Validate __cpuidle code as noinstr
References: <20230112194314.845371875@infradead.org>
MIME-Version: 1.0
Cc: juri.lelli@redhat.com, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org,
 nsekhar@ti.com, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz,
 agordeev@linux.ibm.com, linux-arch@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, vincent.guittot@linaro.org,
 mpe@ellerman.id.au, chenhuacai@kernel.org, christophe.leroy@csgroup.eu,
 linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org,
 linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com,
 mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de,
 linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, senozhatsky@chromium.org,
 svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org,
 mark.rutland@arm.com, linux-ia64@vger.kernel.org, alim.akhtar@samsung.com,
 dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org,
 James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com,
 thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com,
 linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de,
 ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, will@kernel.org,
 brgl@bgdev.pl, daniel.lezcano@linaro.org, jonathanh@nvidia.com,
 dennis@kernel.org, frederic@kernel.org, lenb@kernel.org,
 linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com,
 linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com,
 chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com,
 alexander.shishkin@linux.intel.com, lpieralisi@kernel.org,
 atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com,
 festevam@gmail.com, boris.ostrovsky@oracle.com, khilman@kernel.org,
 linux-csky@vger.kernel.org, pv-drivers@vmware.com,
 linux-snps-arc@lists.infradead.org, mgorman@suse.de,
 jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
 ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org,
 ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, konrad.dybcio@linaro.org, ryabinin.a.a@gmail.com,
 sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net,
 dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, linux-mm@kvack.org,
 glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se,
 yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk,
 mingo@redhat.com, mhiramat@kernel.org, aou@eecs.berkeley.edu,
 paulmck@kernel.org, hca@linux.ibm.com, richard.henderson@linaro.org,
 stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org,
 acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org,
 namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org,
 dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, andersson@kernel.org,
 linux-mips@vger.kernel.org, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com,
 anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net,
 linuxppc-dev@lists.ozlabs.org, deller@gmx.de
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

Idle code is very like entry code in that RCU isn't available. As
such, add a little validation.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Acked-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Tony Lindgren <tony@atomide.com>
Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 arch/alpha/kernel/vmlinux.lds.S      |    1 -
 arch/arc/kernel/vmlinux.lds.S        |    1 -
 arch/arm/include/asm/vmlinux.lds.h   |    1 -
 arch/arm64/kernel/vmlinux.lds.S      |    1 -
 arch/csky/kernel/vmlinux.lds.S       |    1 -
 arch/hexagon/kernel/vmlinux.lds.S    |    1 -
 arch/ia64/kernel/vmlinux.lds.S       |    1 -
 arch/loongarch/kernel/vmlinux.lds.S  |    1 -
 arch/m68k/kernel/vmlinux-nommu.lds   |    1 -
 arch/m68k/kernel/vmlinux-std.lds     |    1 -
 arch/m68k/kernel/vmlinux-sun3.lds    |    1 -
 arch/microblaze/kernel/vmlinux.lds.S |    1 -
 arch/mips/kernel/vmlinux.lds.S       |    1 -
 arch/nios2/kernel/vmlinux.lds.S      |    1 -
 arch/openrisc/kernel/vmlinux.lds.S   |    1 -
 arch/parisc/kernel/vmlinux.lds.S     |    1 -
 arch/powerpc/kernel/vmlinux.lds.S    |    1 -
 arch/riscv/kernel/vmlinux-xip.lds.S  |    1 -
 arch/riscv/kernel/vmlinux.lds.S      |    1 -
 arch/s390/kernel/vmlinux.lds.S       |    1 -
 arch/sh/kernel/vmlinux.lds.S         |    1 -
 arch/sparc/kernel/vmlinux.lds.S      |    1 -
 arch/um/kernel/dyn.lds.S             |    1 -
 arch/um/kernel/uml.lds.S             |    1 -
 arch/x86/include/asm/irqflags.h      |   11 ++++-------
 arch/x86/include/asm/mwait.h         |    2 +-
 arch/x86/kernel/vmlinux.lds.S        |    1 -
 arch/xtensa/kernel/vmlinux.lds.S     |    1 -
 include/asm-generic/vmlinux.lds.h    |    9 +++------
 include/linux/compiler_types.h       |    8 ++++++--
 include/linux/cpu.h                  |    3 ---
 tools/objtool/check.c                |   13 +++++++++++++
 32 files changed, 27 insertions(+), 45 deletions(-)

--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -27,7 +27,6 @@ SECTIONS
 		HEAD_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		*(.fixup)
 		*(.gnu.warning)
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -85,7 +85,6 @@ SECTIONS
 		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/arm/include/asm/vmlinux.lds.h
+++ b/arch/arm/include/asm/vmlinux.lds.h
@@ -96,7 +96,6 @@
 		SOFTIRQENTRY_TEXT					\
 		TEXT_TEXT						\
 		SCHED_TEXT						\
-		CPUIDLE_TEXT						\
 		LOCK_TEXT						\
 		KPROBES_TEXT						\
 		ARM_STUBS_TEXT						\
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -175,7 +175,6 @@ SECTIONS
 			ENTRY_TEXT
 			TEXT_TEXT
 			SCHED_TEXT
-			CPUIDLE_TEXT
 			LOCK_TEXT
 			KPROBES_TEXT
 			HYPERVISOR_TEXT
--- a/arch/csky/kernel/vmlinux.lds.S
+++ b/arch/csky/kernel/vmlinux.lds.S
@@ -34,7 +34,6 @@ SECTIONS
 		SOFTIRQENTRY_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		*(.fixup)
--- a/arch/hexagon/kernel/vmlinux.lds.S
+++ b/arch/hexagon/kernel/vmlinux.lds.S
@@ -41,7 +41,6 @@ SECTIONS
 		IRQENTRY_TEXT
 		SOFTIRQENTRY_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		*(.fixup)
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -51,7 +51,6 @@ SECTIONS {
 		__end_ivt_text = .;
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/loongarch/kernel/vmlinux.lds.S
+++ b/arch/loongarch/kernel/vmlinux.lds.S
@@ -42,7 +42,6 @@ SECTIONS
 	.text : {
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/m68k/kernel/vmlinux-nommu.lds
+++ b/arch/m68k/kernel/vmlinux-nommu.lds
@@ -48,7 +48,6 @@ SECTIONS {
 		IRQENTRY_TEXT
 		SOFTIRQENTRY_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		*(.fixup)
 		. = ALIGN(16);
--- a/arch/m68k/kernel/vmlinux-std.lds
+++ b/arch/m68k/kernel/vmlinux-std.lds
@@ -19,7 +19,6 @@ SECTIONS
 	IRQENTRY_TEXT
 	SOFTIRQENTRY_TEXT
 	SCHED_TEXT
-	CPUIDLE_TEXT
 	LOCK_TEXT
 	*(.fixup)
 	*(.gnu.warning)
--- a/arch/m68k/kernel/vmlinux-sun3.lds
+++ b/arch/m68k/kernel/vmlinux-sun3.lds
@@ -19,7 +19,6 @@ SECTIONS
 	IRQENTRY_TEXT
 	SOFTIRQENTRY_TEXT
 	SCHED_TEXT
-	CPUIDLE_TEXT
 	LOCK_TEXT
 	*(.fixup)
 	*(.gnu.warning)
--- a/arch/microblaze/kernel/vmlinux.lds.S
+++ b/arch/microblaze/kernel/vmlinux.lds.S
@@ -36,7 +36,6 @@ SECTIONS {
 		EXIT_TEXT
 		EXIT_CALL
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -61,7 +61,6 @@ SECTIONS
 	.text : {
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/nios2/kernel/vmlinux.lds.S
+++ b/arch/nios2/kernel/vmlinux.lds.S
@@ -24,7 +24,6 @@ SECTIONS
 	.text : {
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		IRQENTRY_TEXT
 		SOFTIRQENTRY_TEXT
--- a/arch/openrisc/kernel/vmlinux.lds.S
+++ b/arch/openrisc/kernel/vmlinux.lds.S
@@ -52,7 +52,6 @@ SECTIONS
           _stext = .;
 	  TEXT_TEXT
 	  SCHED_TEXT
-	  CPUIDLE_TEXT
 	  LOCK_TEXT
 	  KPROBES_TEXT
 	  IRQENTRY_TEXT
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -86,7 +86,6 @@ SECTIONS
 		TEXT_TEXT
 		LOCK_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
 		SOFTIRQENTRY_TEXT
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -111,7 +111,6 @@ SECTIONS
 #endif
 		NOINSTR_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/riscv/kernel/vmlinux-xip.lds.S
+++ b/arch/riscv/kernel/vmlinux-xip.lds.S
@@ -39,7 +39,6 @@ SECTIONS
 		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		ENTRY_TEXT
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -42,7 +42,6 @@ SECTIONS
 		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		ENTRY_TEXT
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -42,7 +42,6 @@ SECTIONS
 		HEAD_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/sh/kernel/vmlinux.lds.S
+++ b/arch/sh/kernel/vmlinux.lds.S
@@ -29,7 +29,6 @@ SECTIONS
 		HEAD_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/sparc/kernel/vmlinux.lds.S
+++ b/arch/sparc/kernel/vmlinux.lds.S
@@ -50,7 +50,6 @@ SECTIONS
 		HEAD_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/um/kernel/dyn.lds.S
+++ b/arch/um/kernel/dyn.lds.S
@@ -74,7 +74,6 @@ SECTIONS
     _stext = .;
     TEXT_TEXT
     SCHED_TEXT
-    CPUIDLE_TEXT
     LOCK_TEXT
     IRQENTRY_TEXT
     SOFTIRQENTRY_TEXT
--- a/arch/um/kernel/uml.lds.S
+++ b/arch/um/kernel/uml.lds.S
@@ -35,7 +35,6 @@ SECTIONS
     _stext = .;
     TEXT_TEXT
     SCHED_TEXT
-    CPUIDLE_TEXT
     LOCK_TEXT
     IRQENTRY_TEXT
     SOFTIRQENTRY_TEXT
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -8,9 +8,6 @@
 
 #include <asm/nospec-branch.h>
 
-/* Provide __cpuidle; we can't safely include <linux/cpu.h> */
-#define __cpuidle __section(".cpuidle.text")
-
 /*
  * Interrupt control:
  */
@@ -45,13 +42,13 @@ static __always_inline void native_irq_e
 	asm volatile("sti": : :"memory");
 }
 
-static inline __cpuidle void native_safe_halt(void)
+static __always_inline void native_safe_halt(void)
 {
 	mds_idle_clear_cpu_buffers();
 	asm volatile("sti; hlt": : :"memory");
 }
 
-static inline __cpuidle void native_halt(void)
+static __always_inline void native_halt(void)
 {
 	mds_idle_clear_cpu_buffers();
 	asm volatile("hlt": : :"memory");
@@ -84,7 +81,7 @@ static __always_inline void arch_local_i
  * Used in the idle loop; sti takes one instruction cycle
  * to complete:
  */
-static inline __cpuidle void arch_safe_halt(void)
+static __always_inline void arch_safe_halt(void)
 {
 	native_safe_halt();
 }
@@ -93,7 +90,7 @@ static inline __cpuidle void arch_safe_h
  * Used when interrupts are already enabled or to
  * shutdown the processor:
  */
-static inline __cpuidle void halt(void)
+static __always_inline void halt(void)
 {
 	native_halt();
 }
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -105,7 +105,7 @@ static inline void __sti_mwait(unsigned
  * New with Core Duo processors, MWAIT can take some hints based on CPU
  * capability.
  */
-static inline void mwait_idle_with_hints(unsigned long eax, unsigned long ecx)
+static __always_inline void mwait_idle_with_hints(unsigned long eax, unsigned long ecx)
 {
 	if (static_cpu_has_bug(X86_BUG_MONITOR) || !current_set_polling_and_test()) {
 		if (static_cpu_has_bug(X86_BUG_CLFLUSH_MONITOR)) {
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -129,7 +129,6 @@ SECTIONS
 		HEAD_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		SOFTIRQENTRY_TEXT
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -125,7 +125,6 @@ SECTIONS
     ENTRY_TEXT
     TEXT_TEXT
     SCHED_TEXT
-    CPUIDLE_TEXT
     LOCK_TEXT
     *(.fixup)
   }
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -580,6 +580,9 @@
 		ALIGN_FUNCTION();					\
 		__noinstr_text_start = .;				\
 		*(.noinstr.text)					\
+		__cpuidle_text_start = .;				\
+		*(.cpuidle.text)					\
+		__cpuidle_text_end = .;					\
 		__noinstr_text_end = .;
 
 /*
@@ -620,12 +623,6 @@
 		*(.spinlock.text)					\
 		__lock_text_end = .;
 
-#define CPUIDLE_TEXT							\
-		ALIGN_FUNCTION();					\
-		__cpuidle_text_start = .;				\
-		*(.cpuidle.text)					\
-		__cpuidle_text_end = .;
-
 #define KPROBES_TEXT							\
 		ALIGN_FUNCTION();					\
 		__kprobes_text_start = .;				\
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -232,11 +232,15 @@ struct ftrace_likely_data {
 #endif
 
 /* Section for code which can't be instrumented at all */
-#define noinstr								\
-	noinline notrace __attribute((__section__(".noinstr.text")))	\
+#define __noinstr_section(section)					\
+	noinline notrace __attribute((__section__(section)))		\
 	__no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage \
 	__no_sanitize_memory
 
+#define noinstr __noinstr_section(".noinstr.text")
+
+#define __cpuidle __noinstr_section(".cpuidle.text")
+
 #endif /* __KERNEL__ */
 
 #endif /* __ASSEMBLY__ */
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -176,9 +176,6 @@ void __noreturn cpu_startup_entry(enum c
 
 void cpu_idle_poll_ctrl(bool enable);
 
-/* Attach to any functions which should be considered cpuidle. */
-#define __cpuidle	__section(".cpuidle.text")
-
 bool cpu_in_idle(unsigned long pc);
 
 void arch_cpu_idle(void);
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -376,6 +376,7 @@ static int decode_instructions(struct ob
 
 		if (!strcmp(sec->name, ".noinstr.text") ||
 		    !strcmp(sec->name, ".entry.text") ||
+		    !strcmp(sec->name, ".cpuidle.text") ||
 		    !strncmp(sec->name, ".text.__x86.", 12))
 			sec->noinstr = true;
 
@@ -3361,6 +3362,12 @@ static inline bool noinstr_call_dest(str
 		return true;
 
 	/*
+	 * If the symbol is a static_call trampoline, we can't tell.
+	 */
+	if (func->static_call_tramp)
+		return true;
+
+	/*
 	 * The __ubsan_handle_*() calls are like WARN(), they only happen when
 	 * something 'BAD' happened. At the risk of taking the machine down,
 	 * let them proceed to get the message out.
@@ -4155,6 +4162,12 @@ static int validate_noinstr_sections(str
 	if (sec) {
 		warnings += validate_section(file, sec);
 		warnings += validate_unwind_hints(file, sec);
+	}
+
+	sec = find_section_by_name(file->elf, ".cpuidle.text");
+	if (sec) {
+		warnings += validate_section(file, sec);
+		warnings += validate_unwind_hints(file, sec);
 	}
 
 	return warnings;


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
