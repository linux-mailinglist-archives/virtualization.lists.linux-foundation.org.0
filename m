Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 566FD54B682
	for <lists.virtualization@lfdr.de>; Tue, 14 Jun 2022 18:43:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEC0C83298;
	Tue, 14 Jun 2022 16:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bw79uNG5N132; Tue, 14 Jun 2022 16:43:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BA1CB81990;
	Tue, 14 Jun 2022 16:43:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 287A0C002D;
	Tue, 14 Jun 2022 16:43:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 580F1C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 16:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44F9583103
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 16:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOAVls9o9UoW
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 16:43:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08D3A81990
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 16:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=47+tWvYfTyzzIcAfKg2dikUAXvzTciJT7x9ArpBU0cQ=; b=WhjpnYz1DKB/ghxhQBYKZr1QWz
 84Rt1GI0YXBpWpQ+Rpq7OdaNTLjSPvHCVKLFiVIOCLsRCFy4DqvtOiDgSLHRe8OVkGLFTex3SSmV8
 GohZ4ojxrTeP3ET5b4IFii7FfH5UbRGPxexOa+//wX1ieayjZ2GRIBUTTRmWuqKFS+bMiVDFKRSHa
 IV/MEvx0ElZNGt7kUqMr8NdHhRUFOmSCcqPcU9jSeSr7SVt4T0z3jKsQ6pCYU45ZyxeCj6DorIHXj
 CZmBSb2KSbTYN4gQwzBcOOqwVgJL0yEm9Ud5o0YTPtfXZ0pRZucUs+sMUdTCsznw5yKZXiWmZw8aF
 sEV0aFJg==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o19cN-007uQt-Hy; Tue, 14 Jun 2022 16:42:16 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2279B3002BE;
 Tue, 14 Jun 2022 18:42:15 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 123E028B3F62D; Tue, 14 Jun 2022 18:42:15 +0200 (CEST)
Date: Tue, 14 Jun 2022 18:42:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 15/36] cpuidle,cpu_pm: Remove RCU fiddling from
 cpu_pm_{enter,exit}()
Message-ID: <Yqi6Zp+DTm22dLB9@hirez.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <20220608144516.871305980@infradead.org>
 <YqiznJL7qB9uSQ9c@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqiznJL7qB9uSQ9c@FVFF77S0Q05N>
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
 James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com,
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

On Tue, Jun 14, 2022 at 05:13:16PM +0100, Mark Rutland wrote:
> On Wed, Jun 08, 2022 at 04:27:38PM +0200, Peter Zijlstra wrote:
> > All callers should still have RCU enabled.
> 
> IIUC with that true we should be able to drop the RCU_NONIDLE() from
> drivers/perf/arm_pmu.c, as we only needed that for an invocation via a pm
> notifier.
> 
> I should be able to give that a spin on some hardware.
> 
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  kernel/cpu_pm.c |    9 ---------
> >  1 file changed, 9 deletions(-)
> > 
> > --- a/kernel/cpu_pm.c
> > +++ b/kernel/cpu_pm.c
> > @@ -30,16 +30,9 @@ static int cpu_pm_notify(enum cpu_pm_eve
> >  {
> >  	int ret;
> >  
> > -	/*
> > -	 * This introduces a RCU read critical section, which could be
> > -	 * disfunctional in cpu idle. Copy RCU_NONIDLE code to let RCU know
> > -	 * this.
> > -	 */
> > -	rcu_irq_enter_irqson();
> >  	rcu_read_lock();
> >  	ret = raw_notifier_call_chain(&cpu_pm_notifier.chain, event, NULL);
> >  	rcu_read_unlock();
> > -	rcu_irq_exit_irqson();
> 
> To make this easier to debug, is it worth adding an assertion that RCU is
> watching here? e.g.
> 
> 	RCU_LOCKDEP_WARN(!rcu_is_watching(),
> 			 "cpu_pm_notify() used illegally from EQS");
> 

My understanding is that rcu_read_lock() implies something along those
lines when PROVE_RCU.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
