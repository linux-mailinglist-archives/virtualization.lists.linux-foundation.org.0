Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 038BE5BC747
	for <lists.virtualization@lfdr.de>; Mon, 19 Sep 2022 12:19:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FEDE41711;
	Mon, 19 Sep 2022 10:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FEDE41711
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ADXtthd/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKbGVXeF8fxU; Mon, 19 Sep 2022 10:19:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3A3B1416E8;
	Mon, 19 Sep 2022 10:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A3B1416E8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 807E9C0077;
	Mon, 19 Sep 2022 10:18:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 779D7C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Sep 2022 10:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F380416E7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Sep 2022 10:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F380416E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IvXh5-4iCAO
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Sep 2022 10:18:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D33B40B7A
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D33B40B7A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Sep 2022 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=wztoayxqdaRhc3fzwYQuz0RAh5ZT6y7bJFX0CXMuNy8=; b=ADXtthd/kB2UkNVNsBZX3mcAgx
 eb1wSA1egq4M07Od+XfETtj3lhd4iMNEvYwcU9NzeS13eZKp+mowXOQTzEFZK7CeroXVfNcUNAucm
 DFEs4ENnbXNf93/JuDzTXaj8dDvpaoObTItrP5rfAcPTaGTUO9u17CB7M9lBwSzhZqApt31copOyD
 THHS1zzgB7BqCqSJl0DeM5JLgmoPtje3pC9taSIf0jDAy3NiwNozoFE6k7Aa6gH0axWhSw0Ae2Kln
 k7+RKfh2KfpdBiXJ6godhy6Y1cfSrmD10KmQxJ5TbTEnSM6kxy+r95TYqIDfTireSwql4ofArgV57
 wDOwI0dQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oaDpF-004ahk-Dm; Mon, 19 Sep 2022 10:16:29 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 99768302218;
 Mon, 19 Sep 2022 12:16:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id D336C2BA49039; Mon, 19 Sep 2022 12:16:21 +0200 (CEST)
Message-ID: <20220919101520.602636221@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 19 Sep 2022 11:59:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v2 04/44] cpuidle: Move IRQ state validation
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

Make cpuidle_enter_state() consistent with the s2idle variant and
verify ->enter() always returns with interrupts disabled.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 drivers/cpuidle/cpuidle.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -236,7 +236,11 @@ int cpuidle_enter_state(struct cpuidle_d
 	stop_critical_timings();
 	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
 		ct_idle_enter();
+
 	entered_state = target_state->enter(dev, drv, index);
+	if (WARN_ONCE(!irqs_disabled(), "%ps leaked IRQ state", target_state->enter))
+		raw_local_irq_disable();
+
 	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
 		ct_idle_exit();
 	start_critical_timings();
@@ -248,12 +252,8 @@ int cpuidle_enter_state(struct cpuidle_d
 	/* The cpu is no longer idle or about to enter idle. */
 	sched_idle_set_state(NULL);
 
-	if (broadcast) {
-		if (WARN_ON_ONCE(!irqs_disabled()))
-			local_irq_disable();
-
+	if (broadcast)
 		tick_broadcast_exit();
-	}
 
 	if (!cpuidle_state_is_coupled(drv, index))
 		local_irq_enable();


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
