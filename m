Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 64632678A53
	for <lists.virtualization@lfdr.de>; Mon, 23 Jan 2023 23:08:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1014813E6;
	Mon, 23 Jan 2023 22:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1014813E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkDTMc9tm3Bn; Mon, 23 Jan 2023 22:08:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9845E81E44;
	Mon, 23 Jan 2023 22:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9845E81E44
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3505C0077;
	Mon, 23 Jan 2023 22:08:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60D17C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Jan 2023 22:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41362815AC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Jan 2023 22:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41362815AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JN2Sy1CA6Eih
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Jan 2023 22:08:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD02813E6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAD02813E6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Jan 2023 22:08:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24F06B80DE1;
 Mon, 23 Jan 2023 22:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA9BC433D2;
 Mon, 23 Jan 2023 22:07:55 +0000 (UTC)
Date: Mon, 23 Jan 2023 17:07:53 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 3/6] ftrace/x86: Warn and ignore graph tracing when RCU
 is disabled
Message-ID: <20230123170753.7ac9419e@gandalf.local.home>
In-Reply-To: <20230123165304.370121e7@gandalf.local.home>
References: <20230123205009.790550642@infradead.org>
 <20230123205515.059999893@infradead.org>
 <20230123165304.370121e7@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, juri.lelli@redhat.com, daniel.lezcano@linaro.org,
 wanpengli@tencent.com, kvm@vger.kernel.org, rafael@kernel.org,
 pv-drivers@vmware.com, dave.hansen@linux.intel.com,
 virtualization@lists.linux-foundation.org, bsegall@google.com,
 amakhalov@vmware.com, will@kernel.org, vschneid@redhat.com, hpa@zytor.com,
 x86@kernel.org, mingo@kernel.org, mgorman@suse.de,
 linux-trace-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 boqun.feng@gmail.com, bp@alien8.de, vincent.guittot@linaro.org,
 boris.ostrovsky@oracle.com, dietmar.eggemann@arm.com, jgross@suse.com,
 seanjc@google.com, linux-kernel@vger.kernel.org, tglx@linutronix.de,
 mhiramat@kernel.org, pbonzini@redhat.com, bristot@redhat.com
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

On Mon, 23 Jan 2023 16:53:04 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 23 Jan 2023 21:50:12 +0100
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > All RCU disabled code should be noinstr and hence we should never get
> > here -- when we do, WARN about it and make sure to not actually do
> > tracing.
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  arch/x86/kernel/ftrace.c |    3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > --- a/arch/x86/kernel/ftrace.c
> > +++ b/arch/x86/kernel/ftrace.c
> > @@ -646,6 +646,9 @@ void prepare_ftrace_return(unsigned long
> >  	if (unlikely(atomic_read(&current->tracing_graph_pause)))
> >  		return;
> >  
> > +	if (WARN_ONCE(!rcu_is_watching(), "RCU not on for: %pS\n", (void *)ip))
> > +		return;
> > +  
> 
> Please add this to after recursion trylock below. Although WARN_ONCE()
> should not not have recursion issues, as function tracing can do weird
> things, I rather be safe than sorry, and not have the system triple boot
> due to some path that might get added in the future.
> 
> If rcu_is_watching() is false, it will still get by the below recursion
> check and warn. That is, the below check should be done before this
> function calls any other function.
> 
> >  	bit = ftrace_test_recursion_trylock(ip, *parent);
> >  	if (bit < 0)
> >  		return;
> >   
> 

Actually, perhaps we can just add this, and all you need to do is create
and set CONFIG_NO_RCU_TRACING (or some other name).

This should cover all ftrace locations. (Uncompiled).

-- Steve

diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index c303f7a114e9..10ee3fbb9113 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -135,6 +135,22 @@ extern void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip);
 # define do_ftrace_record_recursion(ip, pip)	do { } while (0)
 #endif
 
+#ifdef CONFIG_NO_RCU_TRACING
+# define trace_warn_on_no_rcu(ip)					\
+	({								\
+		bool __ret = false;					\
+		if (!trace_recursion_test(TRACE_RECORD_RECURSION_BIT)) { \
+			trace_recursion_set(TRACE_RECORD_RECURSION_BIT); \
+			__ret = WARN_ONCE(!rcu_is_watching(),		\
+					  "RCU not on for: %pS\n", (void *)ip); \
+			trace_recursion_clear(TRACE_RECORD_RECURSION_BIT); \
+		}							\
+		__ret;							\
+	})
+#else
+# define trace_warn_on_no_rcu(ip)	false
+#endif
+
 /*
  * Preemption is promised to be disabled when return bit >= 0.
  */
@@ -144,6 +160,9 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 	unsigned int val = READ_ONCE(current->trace_recursion);
 	int bit;
 
+	if (trace_warn_on_no_rcu(ip))
+		return -1;
+
 	bit = trace_get_context_bit() + start;
 	if (unlikely(val & (1 << bit))) {
 		/*
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
