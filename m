Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 453615432F6
	for <lists.virtualization@lfdr.de>; Wed,  8 Jun 2022 16:47:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BC3883E7A;
	Wed,  8 Jun 2022 14:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8SxWs0bwyJQN; Wed,  8 Jun 2022 14:47:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3685483ED6;
	Wed,  8 Jun 2022 14:47:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1DEBC0039;
	Wed,  8 Jun 2022 14:47:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6B1FC0039
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 14:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2319419AB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 14:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7ntwfrJVSo5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 14:46:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CABC4194B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=Gj+eSw46X5SDCGNw8cDv0ubviLBcGEVy5VW0lj+ATKg=; b=PcbQR+3su0P/C8pc1s793bBA2j
 ktQ235pkDlbAkwOAsWLsW7DM1mrfh1vhIzRbfNYR5F+8ain6CH9jgWYuoxYcl9uL+ocL0b+8XEOXt
 24PIItx96i9m0jKeLIwsBN7wi+qRRuwgHbXmsn9vkkOSl/hQ6c9MO4xk/n4kODjnZxuF/ldFEvFng
 RKNgnZ2b45WmOjCX7CJ/vNjd9ZJz2ATMfgbLbqDohT3ILrAVWpvPd1p1QwjA2MxqCCmR1M8FMqgQ/
 /DAneELoezzt6eDUpdwXCRtAQhyWretA4G2ZWAYAHTi4PqTwawLXUc26HjQgfO3qwapWqCjS2Q5FP
 3sSC5Q9g==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nywx6-00ChZl-GY; Wed, 08 Jun 2022 14:46:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D4501302F3F;
 Wed,  8 Jun 2022 16:46:23 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id BC41C20C119B1; Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
Message-ID: <20220608144517.948600553@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 08 Jun 2022 16:27:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH 32/36] ftrace: WARN on rcuidle
References: <20220608142723.103523089@infradead.org>
MIME-Version: 1.0
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
 paulus@samba.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org,
 dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org,
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

CONFIG_GENERIC_ENTRY disallows any and all tracing when RCU isn't
enabled.

XXX if s390 (the only other GENERIC_ENTRY user as of this writing)
isn't comfortable with this, we could switch to
HAVE_NOINSTR_VALIDATION which is x86_64 only atm.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/tracepoint.h |   13 ++++++++++++-
 kernel/trace/trace.c       |    3 +++
 2 files changed, 15 insertions(+), 1 deletion(-)

--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -178,6 +178,16 @@ static inline struct tracepoint *tracepo
 #endif /* CONFIG_HAVE_STATIC_CALL */
 
 /*
+ * CONFIG_GENERIC_ENTRY archs are expected to have sanitized entry and idle
+ * code that disallow any/all tracing/instrumentation when RCU isn't watching.
+ */
+#ifdef CONFIG_GENERIC_ENTRY
+#define RCUIDLE_COND(rcuidle)	(rcuidle)
+#else
+#define RCUIDLE_COND(rcuidle)	(rcuidle && in_nmi())
+#endif
+
+/*
  * it_func[0] is never NULL because there is at least one element in the array
  * when the array itself is non NULL.
  */
@@ -189,7 +199,8 @@ static inline struct tracepoint *tracepo
 			return;						\
 									\
 		/* srcu can't be used from NMI */			\
-		WARN_ON_ONCE(rcuidle && in_nmi());			\
+		if (WARN_ON_ONCE(RCUIDLE_COND(rcuidle)))		\
+			return;						\
 									\
 		/* keep srcu and sched-rcu usage consistent */		\
 		preempt_disable_notrace();				\
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3104,6 +3104,9 @@ void __trace_stack(struct trace_array *t
 		return;
 	}
 
+	if (WARN_ON_ONCE(IS_ENABLED(CONFIG_GENERIC_ENTRY)))
+		return;
+
 	/*
 	 * When an NMI triggers, RCU is enabled via rcu_nmi_enter(),
 	 * but if the above rcu_is_watching() failed, then the NMI


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
