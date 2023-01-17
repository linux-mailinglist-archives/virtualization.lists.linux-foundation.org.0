Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id C47F866E248
	for <lists.virtualization@lfdr.de>; Tue, 17 Jan 2023 16:35:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D3F141691;
	Tue, 17 Jan 2023 15:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D3F141691
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0MRhbEg1BbJ; Tue, 17 Jan 2023 15:35:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 806F34176C;
	Tue, 17 Jan 2023 15:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 806F34176C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A96F7C007B;
	Tue, 17 Jan 2023 15:35:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE8B8C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Jan 2023 15:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F93360BDD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Jan 2023 15:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F93360BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7g0xHMrpKJB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Jan 2023 15:35:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 695F760BCE
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 695F760BCE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Jan 2023 15:35:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94F4F12FC;
 Tue, 17 Jan 2023 07:36:16 -0800 (PST)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.31.153])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACA663F67D;
 Tue, 17 Jan 2023 07:35:17 -0800 (PST)
Date: Tue, 17 Jan 2023 15:35:10 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v3 00/51] cpuidle,rcu: Clean up the mess
Message-ID: <Y8bALvyrPpdg++/J@FVFF77S0Q05N.cambridge.arm.com>
References: <20230112194314.845371875@infradead.org>
 <Y8WCWAuQSHN651dA@FVFF77S0Q05N.cambridge.arm.com>
 <Y8Z31UbzG3LJgAXE@hirez.programming.kicks-ass.net>
 <Y8afpbHtDOqAHq9M@FVFF77S0Q05N.cambridge.arm.com>
 <20230117142140.g423hxisv7djudof@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230117142140.g423hxisv7djudof@bogus>
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com,
 linus.walleij@linaro.org, nsekhar@ti.com, bsegall@google.com,
 guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com,
 linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 vincent.guittot@linaro.org, mpe@ellerman.id.au, chenhuacai@kernel.org,
 christophe.leroy@csgroup.eu, linux-acpi@vger.kernel.org, agross@kernel.org,
 geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com,
 mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de,
 linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, senozhatsky@chromium.org,
 svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, alim.akhtar@samsung.com,
 dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org,
 James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com,
 thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com,
 linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de,
 ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, will@kernel.org,
 brgl@bgdev.pl, daniel.lezcano@linaro.org, jonathanh@nvidia.com,
 dennis@kernel.org, frederic@kernel.org, lenb@kernel.org,
 linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com,
 linux-arm-msm@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net,
 sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com,
 alexander.shishkin@linux.intel.com, lpieralisi@kernel.org,
 atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com,
 festevam@gmail.com, boris.ostrovsky@oracle.com, khilman@kernel.org,
 linux-csky@vger.kernel.org, tony@atomide.com,
 linux-snps-arc@lists.infradead.org, mgorman@suse.de,
 jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
 ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, monstr@monstr.eu,
 rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 konrad.dybcio@linaro.org, ryabinin.a.a@gmail.com, linux-alpha@vger.kernel.org,
 shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org,
 Peter Zijlstra <peterz@infradead.org>, amakhalov@vmware.com,
 linux-mm@kvack.org, glider@google.com, hpa@zytor.com,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com,
 anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com,
 richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com,
 mhiramat@kernel.org, aou@eecs.berkeley.edu, paulmck@kernel.org,
 hca@linux.ibm.com, richard.henderson@linaro.org,
 stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org,
 acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org,
 namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org,
 dvyukov@google.com, jgross@suse.com, pv-drivers@vmware.com,
 andersson@kernel.org, linux-mips@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, anup@brainfault.org,
 bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org,
 deller@gmx.de
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

On Tue, Jan 17, 2023 at 02:21:40PM +0000, Sudeep Holla wrote:
> On Tue, Jan 17, 2023 at 01:16:21PM +0000, Mark Rutland wrote:
> > On Tue, Jan 17, 2023 at 11:26:29AM +0100, Peter Zijlstra wrote:
> > > On Mon, Jan 16, 2023 at 04:59:04PM +0000, Mark Rutland wrote:
> > > 
> > > > I'm sorry to have to bear some bad news on that front. :(
> > > 
> > > Moo, something had to give..
> > > 
> > > 
> > > > IIUC what's happenign here is the PSCI cpuidle driver has entered idle and RCU
> > > > is no longer watching when arm64's cpu_suspend() manipulates DAIF. Our
> > > > local_daif_*() helpers poke lockdep and tracing, hence the call to
> > > > trace_hardirqs_off() and the RCU usage.
> > > 
> > > Right, strictly speaking not needed at this point, IRQs should have been
> > > traced off a long time ago.
> > 
> > True, but there are some other calls around here that *might* end up invoking
> > RCU stuff (e.g. the MTE code).
> > 
> > That all needs a noinstr cleanup too, which I'll sort out as a follow-up.
> > 
> > > > I think we need RCU to be watching all the way down to cpu_suspend(), and it's
> > > > cpu_suspend() that should actually enter/exit idle context. That and we need to
> > > > make cpu_suspend() and the low-level PSCI invocation noinstr.
> > > > 
> > > > I'm not sure whether 32-bit will have a similar issue or not.
> > > 
> > > I'm not seeing 32bit or Risc-V have similar issues here, but who knows,
> > > maybe I missed somsething.
> > 
> > I reckon if they do, the core changes here give us the infrastructure to fix
> > them if/when we get reports.
> > 
> > > In any case, the below ought to cure the ARM64 case and remove that last
> > > known RCU_NONIDLE() user as a bonus.
> > 
> > The below works for me testing on a Juno R1 board with PSCI, using defconfig +
> > CONFIG_PROVE_LOCKING=y + CONFIG_DEBUG_LOCKDEP=y + CONFIG_DEBUG_ATOMIC_SLEEP=y.
> > I'm not sure how to test the LPI / FFH part, but it looks good to me.
> > 
> > FWIW:
> > 
> > Reviewed-by: Mark Rutland <mark.rutland@arm.com>
> > Tested-by: Mark Rutland <mark.rutland@arm.com>
> > 
> > Sudeep, would you be able to give the LPI/FFH side a spin with the kconfig
> > options above?
> > 
> 
> Not sure if I have messed up something in my mail setup, but I did reply
> earlier.

Sorry, that was my bad; I had been drafting my reply for a while and forgot to
re-check prior to sending.

> I did test both DT/cpuidle-psci driver and  ACPI/LPI+FFH driver
> with the fix Peter sent. I was seeing same splat as you in both DT and
> ACPI boot which the patch fixed it. I used the same config as described by
> you above.

Perfect; thanks!

Mark.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
