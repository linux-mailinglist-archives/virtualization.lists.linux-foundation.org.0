Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A45BE0DE
	for <lists.virtualization@lfdr.de>; Tue, 20 Sep 2022 10:57:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E17060BFF;
	Tue, 20 Sep 2022 08:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E17060BFF
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dwq7k7OL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m7abajXeQbOO; Tue, 20 Sep 2022 08:57:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3798160DFA;
	Tue, 20 Sep 2022 08:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3798160DFA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52491C0077;
	Tue, 20 Sep 2022 08:57:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E581C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Sep 2022 08:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FFC440BE3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Sep 2022 08:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FFC440BE3
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=desiato.20200630 header.b=dwq7k7OL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BO__SesEwT3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Sep 2022 08:57:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 919A940104
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 919A940104
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Sep 2022 08:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/nDDP1N0D4CAKFG1jjZ0nUCcb4Cwi+2XeLNzAB5a/3A=; b=dwq7k7OLBAweuvxZAbsIyybjmJ
 LWKFQLhJfLLYjlWcLF1VzOmm/u3DYXUkxiGZB432qxzVGoPDa+HDV664vlFYQOwNVOgwYKQh00P/y
 2Moq5lHOrC15n7bUB20DWWFsx8XV1J1DNLnxbuCGUFWdx8geNgMfV6XhqReLWifLY+YeFodx27IXq
 /IrJ0mO09Di3qhEI4cp6g7HRbgntsbzEH8ickJuRs6Usu7AqtrURdlQsKWIMoNKkSXupoPQSsqje7
 UezmEjo7U4Z1A3DxPyeQLWaZEGErf50B+83wnXPcrPsl85uPvrl+T4DjBM0ejacsZ7Zz8oufPZrwY
 XBBt0mUA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oaZ3v-00EIvK-QL; Tue, 20 Sep 2022 08:57:04 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BEC303006B9;
 Tue, 20 Sep 2022 10:57:00 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 892F82BAC7A92; Tue, 20 Sep 2022 10:57:00 +0200 (CEST)
Date: Tue, 20 Sep 2022 10:57:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH v2 03/44] cpuidle/poll: Ensure IRQ state is invariant
Message-ID: <YymAXPkZkyFIEjXM@hirez.programming.kicks-ass.net>
References: <20220919095939.761690562@infradead.org>
 <20220919101520.534233547@infradead.org>
 <20220919131927.GA58444@lothringen>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220919131927.GA58444@lothringen>
Cc: juri.lelli@redhat.com, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org,
 bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com,
 linux-arch@vger.kernel.org, vincent.guittot@linaro.org, mpe@ellerman.id.au,
 chenhuacai@kernel.org, christophe.leroy@csgroup.eu, linux-acpi@vger.kernel.org,
 agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org,
 mattst88@gmail.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de,
 linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, senozhatsky@chromium.org,
 svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com,
 linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com,
 virtualization@lists.linux-foundation.org,
 James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com,
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

On Mon, Sep 19, 2022 at 03:19:27PM +0200, Frederic Weisbecker wrote:
> On Mon, Sep 19, 2022 at 11:59:42AM +0200, Peter Zijlstra wrote:
> > cpuidle_state::enter() methods should be IRQ invariant
> 
> Got a bit confused with the invariant thing since the first chunck I
> see in this patch is a conversion to an non-traceable local_irq_enable().
> 
> Maybe just add a short mention about that and why?

Changelog now reads:

---
Subject: cpuidle/poll: Ensure IRQ state is invariant
From: Peter Zijlstra <peterz@infradead.org>
Date: Tue May 31 15:43:32 CEST 2022

cpuidle_state::enter() methods should be IRQ invariant.

Additionally make sure to use raw_local_irq_*() methods since this
cpuidle callback will be called with RCU already disabled.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
