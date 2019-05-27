Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2652B54C
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 14:32:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DD2A1184A;
	Mon, 27 May 2019 12:32:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E1ED91832
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 12:32:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 812AE821
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209;
	h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Bb4riJdUbAvU2dFDq22LE6R9qG/UUI43/Y/+y4V6Qvs=;
	b=c4TDFTpHK0CYd1vWu7R1zqW+/
	2vf2CkvycdZ1TOZgh6586+6hBSUOonS4izJJJLlU/laLZdtRg9vo/tFqP67DP/DrVq5GNeyOXkp8N
	ExSQgN5WmAiXgiz9FXGhkb7sqDhbv1+1n9qPgIj2TuqbkRY8ULdb/xs9kniGA0ESzx0t8DJo/mrAl
	uLK3C6fLgcCbWbFpO9EhXKZtWIcTmu+x6Co60LQwrkDHUOi8//21mfSvFniFvyuP82yQFaVkGwBIf
	aK/OeehLVOOzYZiUm+0l62ODKjdgrXRftiZCRVCOymL15JzQ7yEwGoiNpC9TkUxMutHPzfpYZgiur
	Nuu3rPt0w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=hirez.programming.kicks-ass.net)
	by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEnP-0003D7-9F; Mon, 27 May 2019 12:32:07 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 10A95202BF3E2; Mon, 27 May 2019 14:32:06 +0200 (CEST)
Date: Mon, 27 May 2019 14:32:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local TLBs
	concurrently
Message-ID: <20190527123206.GC2623@hirez.programming.kicks-ass.net>
References: <20190525082203.6531-1-namit@vmware.com>
	<20190525082203.6531-6-namit@vmware.com>
	<08b21fb5-2226-7924-30e3-31e4adcfc0a3@suse.com>
	<20190527094710.GU2623@hirez.programming.kicks-ass.net>
	<e9c0dc1f-799a-b6e3-8d41-58f0a6b693cd@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9c0dc1f-799a-b6e3-8d41-58f0a6b693cd@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
	linux-hyperv@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	xen-devel@lists.xenproject.org, Nadav Amit <namit@vmware.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, May 27, 2019 at 12:21:59PM +0200, Paolo Bonzini wrote:
> On 27/05/19 11:47, Peter Zijlstra wrote:

> > --- a/arch/x86/kernel/kvm.c
> > +++ b/arch/x86/kernel/kvm.c
> > @@ -580,7 +580,7 @@ static void __init kvm_apf_trap_init(voi
> >  
> >  static DEFINE_PER_CPU(cpumask_var_t, __pv_tlb_mask);
> >  
> > -static void kvm_flush_tlb_others(const struct cpumask *cpumask,
> > +static void kvm_flush_tlb_multi(const struct cpumask *cpumask,
> >  			const struct flush_tlb_info *info)
> >  {
> >  	u8 state;
> > @@ -594,6 +594,9 @@ static void kvm_flush_tlb_others(const s
> >  	 * queue flush_on_enter for pre-empted vCPUs
> >  	 */
> >  	for_each_cpu(cpu, flushmask) {
> > +		if (cpu == smp_processor_id())
> > +			continue;
> > +
> 
> Even this would be just an optimization; the vCPU you're running on
> cannot be preempted.  You can just change others to multi.

Yeah, I know, but it felt weird so I added the explicit skip. No strong
feelings though.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
