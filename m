Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFE05BC69E
	for <lists.virtualization@lfdr.de>; Mon, 19 Sep 2022 12:17:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900CE84055;
	Mon, 19 Sep 2022 10:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 900CE84055
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fLDVs7Aj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1h-BEd8crcZa; Mon, 19 Sep 2022 10:17:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C644B83FEB;
	Mon, 19 Sep 2022 10:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C644B83FEB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39037C0084;
	Mon, 19 Sep 2022 10:17:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27ACBC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Sep 2022 10:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93BDA424FC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Sep 2022 10:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93BDA424FC
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=fLDVs7Aj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQeGyPSLoDTG
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Sep 2022 10:17:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5667841679
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5667841679
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Sep 2022 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=TtR3uUdCvUM2x08kEUTStDUmM7q30GrToBg+SVCjhcg=; b=fLDVs7Aj5IsIPSbZ9uP3HlZv74
 R1FNtQJlesBxAxH20mHNFNgOi8G6TmGVOm5kCWSGYGCB5XCLfek8ukDXCokb4M95Qey5bvuBemxOS
 ayf2Hz8jVxaa+UdCsN2M+JsvmocP7hT7U4zQX/I8/SkpoO/u2sDYpO7XPma83d29iRVaDA0JKwh4E
 VsvAYSpF1zBGa91ou16CzDlsAEWHbzim3R/hTq8m21hDIAD5uDuU44K4U+KHjOOoVT+Xw98aS4z5a
 DJJebX6DOGcVtgCldMCuc57B643drdf0+M3/9iRspyBGJLKy6BbxD63UeybB6Mz5t5DmzixjdXksJ
 GYRNmgPQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oaDq9-004bBp-6s; Mon, 19 Sep 2022 10:17:25 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 75DB7302F5D;
 Mon, 19 Sep 2022 12:16:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 883CE2BAC75B8; Mon, 19 Sep 2022 12:16:22 +0200 (CEST)
Message-ID: <20220919101522.775353582@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 19 Sep 2022 12:00:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v2 36/44] cpuidle,
 omap4: Push RCU-idle into omap4_enter_lowpower()
References: <20220919095939.761690562@infradead.org>
MIME-Version: 1.0
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com,
 linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz,
 agordeev@linux.ibm.com, linux-arch@vger.kernel.org, vincent.guittot@linaro.org,
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
 Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com,
 linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com,
 virtualization@lists.linux-foundation.org,
 James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com,
 thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com,
 linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de,
 ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com,
 deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com,
 dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org,
 kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net,
 sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com,
 alexander.shishkin@linux.intel.com, fweisbec@gmail.com, lpieralisi@kernel.org,
 atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com,
 will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org,
 linux-csky@vger.kernel.org, pv-drivers@vmware.com,
 linux-snps-arc@lists.infradead.org, mgorman@suse.de,
 jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
 ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org,
 ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com,
 shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com,
 amakhalov@vmware.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org,
 glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se,
 yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk,
 mingo@redhat.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi,
 openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com,
 linux-tegra@vger.kernel.org, namhyung@kernel.org,
 andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com,
 jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org,
 palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de,
 johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
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

From: Tony Lindgren <tony@atomide.com>

OMAP4 uses full SoC suspend modes as idle states, as such it needs the
whole power-domain and clock-domain code from the idle path.

All that code is not suitable to run with RCU disabled, as such push
RCU-idle deeper still.

Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/Yqcv6crSNKuSWoTu@atomide.com
---
 arch/arm/mach-omap2/common.h              |    6 ++++--
 arch/arm/mach-omap2/cpuidle44xx.c         |    8 ++------
 arch/arm/mach-omap2/omap-mpuss-lowpower.c |   12 +++++++++++-
 arch/arm/mach-omap2/pm44xx.c              |    2 +-
 4 files changed, 18 insertions(+), 10 deletions(-)

--- a/arch/arm/mach-omap2/common.h
+++ b/arch/arm/mach-omap2/common.h
@@ -284,11 +284,13 @@ extern u32 omap4_get_cpu1_ns_pa_addr(voi
 
 #if defined(CONFIG_SMP) && defined(CONFIG_PM)
 extern int omap4_mpuss_init(void);
-extern int omap4_enter_lowpower(unsigned int cpu, unsigned int power_state);
+extern int omap4_enter_lowpower(unsigned int cpu, unsigned int power_state,
+				bool rcuidle);
 extern int omap4_hotplug_cpu(unsigned int cpu, unsigned int power_state);
 #else
 static inline int omap4_enter_lowpower(unsigned int cpu,
-					unsigned int power_state)
+					unsigned int power_state,
+					bool rcuidle)
 {
 	cpu_do_idle();
 	return 0;
--- a/arch/arm/mach-omap2/cpuidle44xx.c
+++ b/arch/arm/mach-omap2/cpuidle44xx.c
@@ -105,9 +105,7 @@ static int omap_enter_idle_smp(struct cp
 	}
 	raw_spin_unlock_irqrestore(&mpu_lock, flag);
 
-	ct_cpuidle_enter();
-	omap4_enter_lowpower(dev->cpu, cx->cpu_state);
-	ct_cpuidle_exit();
+	omap4_enter_lowpower(dev->cpu, cx->cpu_state, true);
 
 	raw_spin_lock_irqsave(&mpu_lock, flag);
 	if (cx->mpu_state_vote == num_online_cpus())
@@ -186,10 +184,8 @@ static int omap_enter_idle_coupled(struc
 		}
 	}
 
-	ct_cpuidle_enter();
-	omap4_enter_lowpower(dev->cpu, cx->cpu_state);
+	omap4_enter_lowpower(dev->cpu, cx->cpu_state, true);
 	cpu_done[dev->cpu] = true;
-	ct_cpuidle_exit();
 
 	/* Wakeup CPU1 only if it is not offlined */
 	if (dev->cpu == 0 && cpumask_test_cpu(1, cpu_online_mask)) {
--- a/arch/arm/mach-omap2/omap-mpuss-lowpower.c
+++ b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
@@ -33,6 +33,7 @@
  * and first to wake-up when MPUSS low power states are excercised
  */
 
+#include <linux/cpuidle.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/errno.h>
@@ -214,6 +215,7 @@ static void __init save_l2x0_context(voi
  * of OMAP4 MPUSS subsystem
  * @cpu : CPU ID
  * @power_state: Low power state.
+ * @rcuidle: RCU needs to be idled
  *
  * MPUSS states for the context save:
  * save_state =
@@ -222,7 +224,8 @@ static void __init save_l2x0_context(voi
  *	2 - CPUx L1 and logic lost + GIC lost: MPUSS OSWR
  *	3 - CPUx L1 and logic lost + GIC + L2 lost: DEVICE OFF
  */
-int omap4_enter_lowpower(unsigned int cpu, unsigned int power_state)
+int omap4_enter_lowpower(unsigned int cpu, unsigned int power_state,
+			 bool rcuidle)
 {
 	struct omap4_cpu_pm_info *pm_info = &per_cpu(omap4_pm_info, cpu);
 	unsigned int save_state = 0, cpu_logic_state = PWRDM_POWER_RET;
@@ -268,6 +271,10 @@ int omap4_enter_lowpower(unsigned int cp
 	cpu_clear_prev_logic_pwrst(cpu);
 	pwrdm_set_next_pwrst(pm_info->pwrdm, power_state);
 	pwrdm_set_logic_retst(pm_info->pwrdm, cpu_logic_state);
+
+	if (rcuidle)
+		ct_cpuidle_enter();
+
 	set_cpu_wakeup_addr(cpu, __pa_symbol(omap_pm_ops.resume));
 	omap_pm_ops.scu_prepare(cpu, power_state);
 	l2x0_pwrst_prepare(cpu, save_state);
@@ -283,6 +290,9 @@ int omap4_enter_lowpower(unsigned int cp
 	if (IS_PM44XX_ERRATUM(PM_OMAP4_ROM_SMP_BOOT_ERRATUM_GICD) && cpu)
 		gic_dist_enable();
 
+	if (rcuidle)
+		ct_cpuidle_exit();
+
 	/*
 	 * Restore the CPUx power state to ON otherwise CPUx
 	 * power domain can transitions to programmed low power
--- a/arch/arm/mach-omap2/pm44xx.c
+++ b/arch/arm/mach-omap2/pm44xx.c
@@ -76,7 +76,7 @@ static int omap4_pm_suspend(void)
 	 * domain CSWR is not supported by hardware.
 	 * More details can be found in OMAP4430 TRM section 4.3.4.2.
 	 */
-	omap4_enter_lowpower(cpu_id, cpu_suspend_state);
+	omap4_enter_lowpower(cpu_id, cpu_suspend_state, false);
 
 	/* Restore next powerdomain state */
 	list_for_each_entry(pwrst, &pwrst_list, node) {


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
