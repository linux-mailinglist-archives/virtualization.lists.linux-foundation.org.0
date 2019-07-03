Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 149A65E606
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 16:06:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8625E103C;
	Wed,  3 Jul 2019 14:06:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A001CFF1
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 14:04:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B66A9884
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 14:04:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id B1869AE14;
	Wed,  3 Jul 2019 14:04:22 +0000 (UTC)
Subject: Re: [PATCH v2 4/9] x86/mm/tlb: Flush remote and local TLBs
	concurrently
To: Nadav Amit <namit@vmware.com>, Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
References: <20190702235151.4377-1-namit@vmware.com>
	<20190702235151.4377-5-namit@vmware.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <d89e2b57-8682-153e-33d8-98084e9983d6@suse.com>
Date: Wed, 3 Jul 2019 16:04:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702235151.4377-5-namit@vmware.com>
Content-Language: de-DE
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@linutronix.de>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 03.07.19 01:51, Nadav Amit wrote:
> To improve TLB shootdown performance, flush the remote and local TLBs
> concurrently. Introduce flush_tlb_multi() that does so. Introduce
> paravirtual versions of flush_tlb_multi() for KVM, Xen and hyper-v (Xen
> and hyper-v are only compile-tested).
> 
> While the updated smp infrastructure is capable of running a function on
> a single local core, it is not optimized for this case. The multiple
> function calls and the indirect branch introduce some overhead, and
> might make local TLB flushes slower than they were before the recent
> changes.
> 
> Before calling the SMP infrastructure, check if only a local TLB flush
> is needed to restore the lost performance in this common case. This
> requires to check mm_cpumask() one more time, but unless this mask is
> updated very frequently, this should impact performance negatively.
> 
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Stephen Hemminger <sthemmin@microsoft.com>
> Cc: Sasha Levin <sashal@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: x86@kernel.org
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: linux-hyperv@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: kvm@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> Signed-off-by: Nadav Amit <namit@vmware.com>
> ---
>   arch/x86/hyperv/mmu.c                 | 13 +++---
>   arch/x86/include/asm/paravirt.h       |  6 +--
>   arch/x86/include/asm/paravirt_types.h |  4 +-
>   arch/x86/include/asm/tlbflush.h       |  9 ++--
>   arch/x86/include/asm/trace/hyperv.h   |  2 +-
>   arch/x86/kernel/kvm.c                 | 11 +++--
>   arch/x86/kernel/paravirt.c            |  2 +-
>   arch/x86/mm/tlb.c                     | 65 ++++++++++++++++++++-------
>   arch/x86/xen/mmu_pv.c                 | 20 ++++++---
>   include/trace/events/xen.h            |  2 +-
>   10 files changed, 91 insertions(+), 43 deletions(-)

...

> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index beb44e22afdf..19e481e6e904 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -1355,8 +1355,8 @@ static void xen_flush_tlb_one_user(unsigned long addr)
>   	preempt_enable();
>   }
>   
> -static void xen_flush_tlb_others(const struct cpumask *cpus,
> -				 const struct flush_tlb_info *info)
> +static void xen_flush_tlb_multi(const struct cpumask *cpus,
> +				const struct flush_tlb_info *info)
>   {
>   	struct {
>   		struct mmuext_op op;
> @@ -1366,7 +1366,7 @@ static void xen_flush_tlb_others(const struct cpumask *cpus,
>   	const size_t mc_entry_size = sizeof(args->op) +
>   		sizeof(args->mask[0]) * BITS_TO_LONGS(num_possible_cpus());
>   
> -	trace_xen_mmu_flush_tlb_others(cpus, info->mm, info->start, info->end);
> +	trace_xen_mmu_flush_tlb_multi(cpus, info->mm, info->start, info->end);
>   
>   	if (cpumask_empty(cpus))
>   		return;		/* nothing to do */
> @@ -1375,9 +1375,17 @@ static void xen_flush_tlb_others(const struct cpumask *cpus,
>   	args = mcs.args;
>   	args->op.arg2.vcpumask = to_cpumask(args->mask);
>   
> -	/* Remove us, and any offline CPUS. */
> +	/* Flush locally if needed and remove us */
> +	if (cpumask_test_cpu(smp_processor_id(), to_cpumask(args->mask))) {
> +		local_irq_disable();
> +		flush_tlb_func_local(info);

I think this isn't the correct function for PV guests.

In fact it should be much easier: just don't clear the own cpu from the
mask, that's all what's needed. The hypervisor is just fine having the
current cpu in the mask and it will do the right thing.


Juergen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
