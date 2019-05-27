Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8513D2B18D
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 11:47:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B48DE1709;
	Mon, 27 May 2019 09:47:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 571191703
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 09:47:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E7266A9
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 09:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ksp3G9sH2zzACmF2AeSPcK5YcZQtsXat2Vj9aWQQG+U=;
	b=P48Ta44XCwnjYxzE2Szf95Vt9
	DEITVVm+74m8Bb8Gl3NWJwk4TRSHiqzI4me8sM/R8LN7Si+alfGfxq5Ygp+/unzlAUHOEAMaXGUUk
	HuL4VHeNUavV/GmCXeXB52W+sv/19DgYqb/qYohVl88jHxI3npQnEgYu3MKj6swbywgxOS6yN9Lk2
	ggd42AjgHwC1KtcbR/M+53ID/oVEZrZVSEO+zbA7krglgq0y/Y2vjIIbdMnDHz61fPgKs2Kwz9flF
	pKEVmgKQJoY1Duv4IfUKMWiH98YTo0yL5G35fvQZCvb64DP0UzpuggBmHVFsYvhrFV2pbQAE053Kx
	AIvf7QlvQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=hirez.programming.kicks-ass.net)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVCDo-0006TR-FB; Mon, 27 May 2019 09:47:12 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8B475202BF402; Mon, 27 May 2019 11:47:10 +0200 (CEST)
Date: Mon, 27 May 2019 11:47:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local TLBs
	concurrently
Message-ID: <20190527094710.GU2623@hirez.programming.kicks-ass.net>
References: <20190525082203.6531-1-namit@vmware.com>
	<20190525082203.6531-6-namit@vmware.com>
	<08b21fb5-2226-7924-30e3-31e4adcfc0a3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08b21fb5-2226-7924-30e3-31e4adcfc0a3@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Nadav Amit <namit@vmware.com>, Thomas Gleixner <tglx@linutronix.de>,
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

On Sat, May 25, 2019 at 10:54:50AM +0200, Juergen Gross wrote:
> On 25/05/2019 10:22, Nadav Amit wrote:

> > diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
> > index 946f8f1f1efc..3a156e63c57d 100644
> > --- a/arch/x86/include/asm/paravirt_types.h
> > +++ b/arch/x86/include/asm/paravirt_types.h
> > @@ -211,6 +211,12 @@ struct pv_mmu_ops {
> >  	void (*flush_tlb_user)(void);
> >  	void (*flush_tlb_kernel)(void);
> >  	void (*flush_tlb_one_user)(unsigned long addr);
> > +	/*
> > +	 * flush_tlb_multi() is the preferred interface. When it is used,
> > +	 * flush_tlb_others() should return false.
> 
> This comment does not make sense. flush_tlb_others() return type is
> void.

I suspect that is an artifact from before the static_key; an attempt to
make the pv interface less awkward.

Something like the below would work for KVM I suspect, the others
(Hyper-V and Xen are more 'interesting').

---
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -580,7 +580,7 @@ static void __init kvm_apf_trap_init(voi
 
 static DEFINE_PER_CPU(cpumask_var_t, __pv_tlb_mask);
 
-static void kvm_flush_tlb_others(const struct cpumask *cpumask,
+static void kvm_flush_tlb_multi(const struct cpumask *cpumask,
 			const struct flush_tlb_info *info)
 {
 	u8 state;
@@ -594,6 +594,9 @@ static void kvm_flush_tlb_others(const s
 	 * queue flush_on_enter for pre-empted vCPUs
 	 */
 	for_each_cpu(cpu, flushmask) {
+		if (cpu == smp_processor_id())
+			continue;
+
 		src = &per_cpu(steal_time, cpu);
 		state = READ_ONCE(src->preempted);
 		if ((state & KVM_VCPU_PREEMPTED)) {
@@ -603,7 +606,7 @@ static void kvm_flush_tlb_others(const s
 		}
 	}
 
-	native_flush_tlb_others(flushmask, info);
+	native_flush_tlb_multi(flushmask, info);
 }
 
 static void __init kvm_guest_init(void)
@@ -628,9 +631,8 @@ static void __init kvm_guest_init(void)
 	if (kvm_para_has_feature(KVM_FEATURE_PV_TLB_FLUSH) &&
 	    !kvm_para_has_hint(KVM_HINTS_REALTIME) &&
 	    kvm_para_has_feature(KVM_FEATURE_STEAL_TIME)) {
-		pv_ops.mmu.flush_tlb_others = kvm_flush_tlb_others;
+		pv_ops.mmu.flush_tlb_multi = kvm_flush_tlb_multi;
 		pv_ops.mmu.tlb_remove_table = tlb_remove_table;
-		static_key_disable(&flush_tlb_multi_enabled.key);
 	}
 
 	if (kvm_para_has_feature(KVM_FEATURE_PV_EOI))
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
