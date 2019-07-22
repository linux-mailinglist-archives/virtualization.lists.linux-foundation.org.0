Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AE370978
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 21:15:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 11AE6D7E;
	Mon, 22 Jul 2019 19:14:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BC83C86D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 19:14:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4CB387C3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 19:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209;
	h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k0Aa1oppo5fgpAqfdlhMZ/Y4FyX3KZF6G5NCMud93Ao=;
	b=tFFSxg0Nh2G+2z2wXW0kiyQe9
	pI4T7G3Po/BYJUF/dTPfTtYTgQHndHYOd2T3x5vPyfQZtBEJDEV7Xt5vAcjXDgaWEw4hezIOsAWe3
	A2p+EpI6mVaVlp/IsZk/mF7nTueQPBJ6AbJtJqubeRcoEmKj/FJop4YqiSX6x8lknsw8kuXc0WRQb
	nyIaiojxTFS93l+DLFa2hieuFTcZY00msSqMv6iMkyx2kCLXLEHLo8StTtaVB+666J8E/BchkXa4r
	5Q13HKIfQNErihSnxd261MYESBOoNhZz9yo+v99LWxzP2Es2+1OW+GCzOXThbLpB1IJqJw8ZXTNka
	kw4vEbxfw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=worktop.programming.kicks-ass.net)
	by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hpdlc-00068v-1I; Mon, 22 Jul 2019 19:14:36 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id D99D6980C6E; Mon, 22 Jul 2019 21:14:33 +0200 (CEST)
Date: Mon, 22 Jul 2019 21:14:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v3 4/9] x86/mm/tlb: Flush remote and local TLBs
	concurrently
Message-ID: <20190722191433.GD6698@worktop.programming.kicks-ass.net>
References: <20190719005837.4150-1-namit@vmware.com>
	<20190719005837.4150-5-namit@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719005837.4150-5-namit@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
	linux-hyperv@vger.kernel.org, x86@kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Thu, Jul 18, 2019 at 05:58:32PM -0700, Nadav Amit wrote:
> @@ -709,8 +716,9 @@ void native_flush_tlb_others(const struct cpumask *cpumask,
>  	 * doing a speculative memory access.
>  	 */
>  	if (info->freed_tables) {
> -		smp_call_function_many(cpumask, flush_tlb_func_remote,
> -			       (void *)info, 1);
> +		__smp_call_function_many(cpumask, flush_tlb_func_remote,
> +					 flush_tlb_func_local,
> +					 (void *)info, 1);
>  	} else {
>  		/*
>  		 * Although we could have used on_each_cpu_cond_mask(),
> @@ -737,7 +745,8 @@ void native_flush_tlb_others(const struct cpumask *cpumask,
>  			if (tlb_is_not_lazy(cpu))
>  				__cpumask_set_cpu(cpu, cond_cpumask);
>  		}
> -		smp_call_function_many(cond_cpumask, flush_tlb_func_remote,
> +		__smp_call_function_many(cond_cpumask, flush_tlb_func_remote,
> +					 flush_tlb_func_local,
>  					 (void *)info, 1);
>  	}
>  }

Do we really need that _local/_remote distinction? ISTR you had a patch
that frobbed flush_tlb_info into the csd and that gave space
constraints, but I'm not seeing that here (probably a wise, get stuff
merged etc..).

struct __call_single_data {
        struct llist_node          llist;                /*     0     8 */
        smp_call_func_t            func;                 /*     8     8 */
        void *                     info;                 /*    16     8 */
        unsigned int               flags;                /*    24     4 */

        /* size: 32, cachelines: 1, members: 4 */
        /* padding: 4 */
        /* last cacheline: 32 bytes */
};

struct flush_tlb_info {
        struct mm_struct *         mm;                   /*     0     8 */
        long unsigned int          start;                /*     8     8 */
        long unsigned int          end;                  /*    16     8 */
        u64                        new_tlb_gen;          /*    24     8 */
        unsigned int               stride_shift;         /*    32     4 */
        bool                       freed_tables;         /*    36     1 */

        /* size: 40, cachelines: 1, members: 6 */
        /* padding: 3 */
        /* last cacheline: 40 bytes */
};

IIRC what you did was make void *__call_single_data::info the last
member and a union until the full cacheline size (64). Given the above
that would get us 24 bytes for csd, leaving us 40 for that
flush_tlb_info.

But then we can still do something like the below, which doesn't change
things and still gets rid of that dual function crud, simplifying
smp_call_function_many again.

Index: linux-2.6/arch/x86/include/asm/tlbflush.h
===================================================================
--- linux-2.6.orig/arch/x86/include/asm/tlbflush.h
+++ linux-2.6/arch/x86/include/asm/tlbflush.h
@@ -546,8 +546,9 @@ struct flush_tlb_info {
 	unsigned long		start;
 	unsigned long		end;
 	u64			new_tlb_gen;
-	unsigned int		stride_shift;
-	bool			freed_tables;
+	unsigned int		cpu;
+	unsigned short		stride_shift;
+	unsigned char		freed_tables;
 };
 
 #define local_flush_tlb() __flush_tlb()
Index: linux-2.6/arch/x86/mm/tlb.c
===================================================================
--- linux-2.6.orig/arch/x86/mm/tlb.c
+++ linux-2.6/arch/x86/mm/tlb.c
@@ -659,6 +659,27 @@ static void flush_tlb_func_remote(void *
 	flush_tlb_func_common(f, false, TLB_REMOTE_SHOOTDOWN);
 }
 
+static void flush_tlb_func(void *info)
+{
+	const struct flush_tlb_info *f = info;
+	enum tlb_flush_reason reason = TLB_REMOTE_SHOOTDOWN;
+	bool local = false;
+
+	if (f->cpu == smp_processor_id()) {
+		local = true;
+		reason = (f->mm == NULL) ? TLB_LOCAL_SHOOTDOWN : TLB_LOCAL_MM_SHOOTDOWN;
+	} else {
+		inc_irq_stat(irq_tlb_count);
+
+		if (f->mm && f->mm != this_cpu_read(cpu_tlbstate.loaded_mm))
+			return;
+
+		count_vm_tlb_event(NR_TLB_REMOTE_FLUSH_RECEIVED);
+	}
+
+	flush_tlb_func_common(f, local, reason);
+}
+
 static bool tlb_is_not_lazy(int cpu)
 {
 	return !per_cpu(cpu_tlbstate_shared.is_lazy, cpu);

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
