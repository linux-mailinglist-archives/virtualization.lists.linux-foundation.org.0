Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0238554B5D0
	for <lists.virtualization@lfdr.de>; Tue, 14 Jun 2022 18:22:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 897FE8333F;
	Tue, 14 Jun 2022 16:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GleYWhyLFdy8; Tue, 14 Jun 2022 16:22:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EBD2483366;
	Tue, 14 Jun 2022 16:22:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45196C002D;
	Tue, 14 Jun 2022 16:22:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0295FC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 16:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D452A40B70
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 16:22:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgwJRLMe75Gl
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 16:22:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id A08E140B65
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 16:22:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFB341692;
 Tue, 14 Jun 2022 09:22:23 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.41.154])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 113C43F66F;
 Tue, 14 Jun 2022 09:22:05 -0700 (PDT)
Date: Tue, 14 Jun 2022 17:22:02 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 20/36] arch/idle: Change arch_cpu_idle() IRQ behaviour
Message-ID: <Yqi1qra2k0HIft9W@FVFF77S0Q05N>
References: <20220608142723.103523089@infradead.org>
 <20220608144517.188449351@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608144517.188449351@infradead.org>
Cc: juri.lelli@redhat.com, rafael@kernel.org, benh@kernel.crashing.org,
 linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz,
 agordeev@linux.ibm.com, linux-arch@vger.kernel.org, vincent.guittot@linaro.org,
 mpe@ellerman.id.au, chenhuacai@kernel.org, linux-acpi@vger.kernel.org,
 agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com,
 catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com,
 mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com,
 linux-pm@vger.kernel.org, jiangshanlai@gmail.com,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org,
 acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org,
 dietmar.eggemann@arm.com, rth@twiddle.net, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org,
 paulus@samba.org, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com,
 virtualization@lists.linux-foundation.org,
 James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com,
 thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com,
 linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de,
 ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com,
 deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com,
 mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org,
 linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com,
 linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, shorne@gmail.com,
 linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org,
 dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com,
 lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org,
 will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org,
 linux-csky@vger.kernel.org, pv-drivers@vmware.com,
 linux-snps-arc@lists.infradead.org, mgorman@suse.de,
 jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
 ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org,
 josh@joshtriplett.org, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de,
 bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net,
 dalias@libc.org, tony@atomide.com, amakhalov@vmware.com,
 bjorn.andersson@linaro.org, hpa@zytor.com, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com,
 richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com,
 aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com,
 stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org,
 paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org,
 andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com,
 monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com,
 anup@brainfault.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net,
 linuxppc-dev@lists.ozlabs.org
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

On Wed, Jun 08, 2022 at 04:27:43PM +0200, Peter Zijlstra wrote:
> Current arch_cpu_idle() is called with IRQs disabled, but will return
> with IRQs enabled.
> 
> However, the very first thing the generic code does after calling
> arch_cpu_idle() is raw_local_irq_disable(). This means that
> architectures that can idle with IRQs disabled end up doing a
> pointless 'enable-disable' dance.
> 
> Therefore, push this IRQ disabling into the idle function, meaning
> that those architectures can avoid the pointless IRQ state flipping.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Nice!

  Acked-by: Mark Rutland <mark.rutland@arm.com> [arm64]

Mark.

> ---
>  arch/alpha/kernel/process.c      |    1 -
>  arch/arc/kernel/process.c        |    3 +++
>  arch/arm/kernel/process.c        |    1 -
>  arch/arm/mach-gemini/board-dt.c  |    3 ++-
>  arch/arm64/kernel/idle.c         |    1 -
>  arch/csky/kernel/process.c       |    1 -
>  arch/csky/kernel/smp.c           |    2 +-
>  arch/hexagon/kernel/process.c    |    1 -
>  arch/ia64/kernel/process.c       |    1 +
>  arch/microblaze/kernel/process.c |    1 -
>  arch/mips/kernel/idle.c          |    8 +++-----
>  arch/nios2/kernel/process.c      |    1 -
>  arch/openrisc/kernel/process.c   |    1 +
>  arch/parisc/kernel/process.c     |    2 --
>  arch/powerpc/kernel/idle.c       |    5 ++---
>  arch/riscv/kernel/process.c      |    1 -
>  arch/s390/kernel/idle.c          |    1 -
>  arch/sh/kernel/idle.c            |    1 +
>  arch/sparc/kernel/leon_pmc.c     |    4 ++++
>  arch/sparc/kernel/process_32.c   |    1 -
>  arch/sparc/kernel/process_64.c   |    3 ++-
>  arch/um/kernel/process.c         |    1 -
>  arch/x86/coco/tdx/tdx.c          |    3 +++
>  arch/x86/kernel/process.c        |   15 ++++-----------
>  arch/xtensa/kernel/process.c     |    1 +
>  kernel/sched/idle.c              |    2 --
>  26 files changed, 28 insertions(+), 37 deletions(-)
> 
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -57,7 +57,6 @@ EXPORT_SYMBOL(pm_power_off);
>  void arch_cpu_idle(void)
>  {
>  	wtint(0);
> -	raw_local_irq_enable();
>  }
>  
>  void arch_cpu_idle_dead(void)
> --- a/arch/arc/kernel/process.c
> +++ b/arch/arc/kernel/process.c
> @@ -114,6 +114,8 @@ void arch_cpu_idle(void)
>  		"sleep %0	\n"
>  		:
>  		:"I"(arg)); /* can't be "r" has to be embedded const */
> +
> +	raw_local_irq_disable();
>  }
>  
>  #else	/* ARC700 */
> @@ -122,6 +124,7 @@ void arch_cpu_idle(void)
>  {
>  	/* sleep, but enable both set E1/E2 (levels of interrupts) before committing */
>  	__asm__ __volatile__("sleep 0x3	\n");
> +	raw_local_irq_disable();
>  }
>  
>  #endif
> --- a/arch/arm/kernel/process.c
> +++ b/arch/arm/kernel/process.c
> @@ -78,7 +78,6 @@ void arch_cpu_idle(void)
>  		arm_pm_idle();
>  	else
>  		cpu_do_idle();
> -	raw_local_irq_enable();
>  }
>  
>  void arch_cpu_idle_prepare(void)
> --- a/arch/arm/mach-gemini/board-dt.c
> +++ b/arch/arm/mach-gemini/board-dt.c
> @@ -42,8 +42,9 @@ static void gemini_idle(void)
>  	 */
>  
>  	/* FIXME: Enabling interrupts here is racy! */
> -	local_irq_enable();
> +	raw_local_irq_enable();
>  	cpu_do_idle();
> +	raw_local_irq_disable();
>  }
>  
>  static void __init gemini_init_machine(void)
> --- a/arch/arm64/kernel/idle.c
> +++ b/arch/arm64/kernel/idle.c
> @@ -42,5 +42,4 @@ void noinstr arch_cpu_idle(void)
>  	 * tricks
>  	 */
>  	cpu_do_idle();
> -	raw_local_irq_enable();
>  }
> --- a/arch/csky/kernel/process.c
> +++ b/arch/csky/kernel/process.c
> @@ -101,6 +101,5 @@ void arch_cpu_idle(void)
>  #ifdef CONFIG_CPU_PM_STOP
>  	asm volatile("stop\n");
>  #endif
> -	raw_local_irq_enable();
>  }
>  #endif
> --- a/arch/csky/kernel/smp.c
> +++ b/arch/csky/kernel/smp.c
> @@ -314,7 +314,7 @@ void arch_cpu_idle_dead(void)
>  	while (!secondary_stack)
>  		arch_cpu_idle();
>  
> -	local_irq_disable();
> +	raw_local_irq_disable();
>  
>  	asm volatile(
>  		"mov	sp, %0\n"
> --- a/arch/hexagon/kernel/process.c
> +++ b/arch/hexagon/kernel/process.c
> @@ -44,7 +44,6 @@ void arch_cpu_idle(void)
>  {
>  	__vmwait();
>  	/*  interrupts wake us up, but irqs are still disabled */
> -	raw_local_irq_enable();
>  }
>  
>  /*
> --- a/arch/ia64/kernel/process.c
> +++ b/arch/ia64/kernel/process.c
> @@ -241,6 +241,7 @@ void arch_cpu_idle(void)
>  		(*mark_idle)(1);
>  
>  	raw_safe_halt();
> +	raw_local_irq_disable();
>  
>  	if (mark_idle)
>  		(*mark_idle)(0);
> --- a/arch/microblaze/kernel/process.c
> +++ b/arch/microblaze/kernel/process.c
> @@ -138,5 +138,4 @@ int dump_fpu(struct pt_regs *regs, elf_f
>  
>  void arch_cpu_idle(void)
>  {
> -       raw_local_irq_enable();
>  }
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -33,13 +33,13 @@ static void __cpuidle r3081_wait(void)
>  {
>  	unsigned long cfg = read_c0_conf();
>  	write_c0_conf(cfg | R30XX_CONF_HALT);
> -	raw_local_irq_enable();
>  }
>  
>  void __cpuidle r4k_wait(void)
>  {
>  	raw_local_irq_enable();
>  	__r4k_wait();
> +	raw_local_irq_disable();
>  }
>  
>  /*
> @@ -57,7 +57,6 @@ void __cpuidle r4k_wait_irqoff(void)
>  		"	.set	arch=r4000	\n"
>  		"	wait			\n"
>  		"	.set	pop		\n");
> -	raw_local_irq_enable();
>  }
>  
>  /*
> @@ -77,7 +76,6 @@ static void __cpuidle rm7k_wait_irqoff(v
>  		"	wait						\n"
>  		"	mtc0	$1, $12		# stalls until W stage	\n"
>  		"	.set	pop					\n");
> -	raw_local_irq_enable();
>  }
>  
>  /*
> @@ -103,6 +101,8 @@ static void __cpuidle au1k_wait(void)
>  	"	nop				\n"
>  	"	.set	pop			\n"
>  	: : "r" (au1k_wait), "r" (c0status));
> +
> +	raw_local_irq_disable();
>  }
>  
>  static int __initdata nowait;
> @@ -245,8 +245,6 @@ void arch_cpu_idle(void)
>  {
>  	if (cpu_wait)
>  		cpu_wait();
> -	else
> -		raw_local_irq_enable();
>  }
>  
>  #ifdef CONFIG_CPU_IDLE
> --- a/arch/nios2/kernel/process.c
> +++ b/arch/nios2/kernel/process.c
> @@ -33,7 +33,6 @@ EXPORT_SYMBOL(pm_power_off);
>  
>  void arch_cpu_idle(void)
>  {
> -	raw_local_irq_enable();
>  }
>  
>  /*
> --- a/arch/openrisc/kernel/process.c
> +++ b/arch/openrisc/kernel/process.c
> @@ -102,6 +102,7 @@ void arch_cpu_idle(void)
>  	raw_local_irq_enable();
>  	if (mfspr(SPR_UPR) & SPR_UPR_PMP)
>  		mtspr(SPR_PMR, mfspr(SPR_PMR) | SPR_PMR_DME);
> +	raw_local_irq_disable();
>  }
>  
>  void (*pm_power_off)(void) = NULL;
> --- a/arch/parisc/kernel/process.c
> +++ b/arch/parisc/kernel/process.c
> @@ -187,8 +187,6 @@ void arch_cpu_idle_dead(void)
>  
>  void __cpuidle arch_cpu_idle(void)
>  {
> -	raw_local_irq_enable();
> -
>  	/* nop on real hardware, qemu will idle sleep. */
>  	asm volatile("or %%r10,%%r10,%%r10\n":::);
>  }
> --- a/arch/powerpc/kernel/idle.c
> +++ b/arch/powerpc/kernel/idle.c
> @@ -51,10 +51,9 @@ void arch_cpu_idle(void)
>  		 * Some power_save functions return with
>  		 * interrupts enabled, some don't.
>  		 */
> -		if (irqs_disabled())
> -			raw_local_irq_enable();
> +		if (!irqs_disabled())
> +			raw_local_irq_disable();
>  	} else {
> -		raw_local_irq_enable();
>  		/*
>  		 * Go into low thread priority and possibly
>  		 * low power mode.
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -39,7 +39,6 @@ extern asmlinkage void ret_from_kernel_t
>  void arch_cpu_idle(void)
>  {
>  	cpu_do_idle();
> -	raw_local_irq_enable();
>  }
>  
>  void __show_regs(struct pt_regs *regs)
> --- a/arch/s390/kernel/idle.c
> +++ b/arch/s390/kernel/idle.c
> @@ -66,7 +66,6 @@ void arch_cpu_idle(void)
>  	idle->idle_count++;
>  	account_idle_time(cputime_to_nsecs(idle_time));
>  	raw_write_seqcount_end(&idle->seqcount);
> -	raw_local_irq_enable();
>  }
>  
>  static ssize_t show_idle_count(struct device *dev,
> --- a/arch/sh/kernel/idle.c
> +++ b/arch/sh/kernel/idle.c
> @@ -25,6 +25,7 @@ void default_idle(void)
>  	raw_local_irq_enable();
>  	/* Isn't this racy ? */
>  	cpu_sleep();
> +	raw_local_irq_disable();
>  	clear_bl_bit();
>  }
>  
> --- a/arch/sparc/kernel/leon_pmc.c
> +++ b/arch/sparc/kernel/leon_pmc.c
> @@ -57,6 +57,8 @@ static void pmc_leon_idle_fixup(void)
>  		"lda	[%0] %1, %%g0\n"
>  		:
>  		: "r"(address), "i"(ASI_LEON_BYPASS));
> +
> +	raw_local_irq_disable();
>  }
>  
>  /*
> @@ -70,6 +72,8 @@ static void pmc_leon_idle(void)
>  
>  	/* For systems without power-down, this will be no-op */
>  	__asm__ __volatile__ ("wr	%g0, %asr19\n\t");
> +
> +	raw_local_irq_disable();
>  }
>  
>  /* Install LEON Power Down function */
> --- a/arch/sparc/kernel/process_32.c
> +++ b/arch/sparc/kernel/process_32.c
> @@ -71,7 +71,6 @@ void arch_cpu_idle(void)
>  {
>  	if (sparc_idle)
>  		(*sparc_idle)();
> -	raw_local_irq_enable();
>  }
>  
>  /* XXX cli/sti -> local_irq_xxx here, check this works once SMP is fixed. */
> --- a/arch/sparc/kernel/process_64.c
> +++ b/arch/sparc/kernel/process_64.c
> @@ -59,7 +59,6 @@ void arch_cpu_idle(void)
>  {
>  	if (tlb_type != hypervisor) {
>  		touch_nmi_watchdog();
> -		raw_local_irq_enable();
>  	} else {
>  		unsigned long pstate;
>  
> @@ -90,6 +89,8 @@ void arch_cpu_idle(void)
>  			"wrpr %0, %%g0, %%pstate"
>  			: "=&r" (pstate)
>  			: "i" (PSTATE_IE));
> +
> +		raw_local_irq_disable();
>  	}
>  }
>  
> --- a/arch/um/kernel/process.c
> +++ b/arch/um/kernel/process.c
> @@ -216,7 +216,6 @@ void arch_cpu_idle(void)
>  {
>  	cpu_tasks[current_thread_info()->cpu].pid = os_getpid();
>  	um_idle_sleep();
> -	raw_local_irq_enable();
>  }
>  
>  int __cant_sleep(void) {
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
> @@ -178,6 +178,9 @@ void __cpuidle tdx_safe_halt(void)
>  	 */
>  	if (__halt(irq_disabled, do_sti))
>  		WARN_ONCE(1, "HLT instruction emulation failed\n");
> +
> +	/* XXX I can't make sense of what @do_sti actually does */
> +	raw_local_irq_disable();
>  }
>  
>  static bool read_msr(struct pt_regs *regs)
> --- a/arch/x86/kernel/process.c
> +++ b/arch/x86/kernel/process.c
> @@ -699,6 +699,7 @@ EXPORT_SYMBOL(boot_option_idle_override)
>  void __cpuidle default_idle(void)
>  {
>  	raw_safe_halt();
> +	raw_local_irq_disable();
>  }
>  #if defined(CONFIG_APM_MODULE) || defined(CONFIG_HALTPOLL_CPUIDLE_MODULE)
>  EXPORT_SYMBOL(default_idle);
> @@ -804,13 +805,7 @@ static void amd_e400_idle(void)
>  
>  	default_idle();
>  
> -	/*
> -	 * The switch back from broadcast mode needs to be called with
> -	 * interrupts disabled.
> -	 */
> -	raw_local_irq_disable();
>  	tick_broadcast_exit();
> -	raw_local_irq_enable();
>  }
>  
>  /*
> @@ -849,12 +844,10 @@ static __cpuidle void mwait_idle(void)
>  		}
>  
>  		__monitor((void *)&current_thread_info()->flags, 0, 0);
> -		if (!need_resched())
> +		if (!need_resched()) {
>  			__sti_mwait(0, 0);
> -		else
> -			raw_local_irq_enable();
> -	} else {
> -		raw_local_irq_enable();
> +			raw_local_irq_disable();
> +		}
>  	}
>  	__current_clr_polling();
>  }
> --- a/arch/xtensa/kernel/process.c
> +++ b/arch/xtensa/kernel/process.c
> @@ -183,6 +183,7 @@ void coprocessor_flush_release_all(struc
>  void arch_cpu_idle(void)
>  {
>  	platform_idle();
> +	raw_local_irq_disable();
>  }
>  
>  /*
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -79,7 +79,6 @@ void __weak arch_cpu_idle_dead(void) { }
>  void __weak arch_cpu_idle(void)
>  {
>  	cpu_idle_force_poll = 1;
> -	raw_local_irq_enable();
>  }
>  
>  /**
> @@ -96,7 +95,6 @@ void __cpuidle default_idle_call(void)
>  
>  		cpuidle_rcu_enter();
>  		arch_cpu_idle();
> -		raw_local_irq_disable();
>  		cpuidle_rcu_exit();
>  
>  		start_critical_timings();
> 
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
