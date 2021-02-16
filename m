Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E7031CA67
	for <lists.virtualization@lfdr.de>; Tue, 16 Feb 2021 13:11:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 57C83871B0;
	Tue, 16 Feb 2021 12:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejOb7ftTMOP0; Tue, 16 Feb 2021 12:11:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 00030871AD;
	Tue, 16 Feb 2021 12:11:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B433AC013A;
	Tue, 16 Feb 2021 12:11:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A54E9C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 12:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 93D4D85247
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 12:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vyA2u0nTagDZ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 12:11:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 48C368522E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 12:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qydaGrdRobsyV5LaMgil96UsQSn4K3xiCgp4dxh0juc=; b=W1OSaSNnkgJkSGPTgy8i13Fnth
 Q3yMBTUQI35ZC32HOj6lyR72QpKJCByW9IX627qEuospypeWxHjJGIexIeRPMxqE0ne9uQQtNhjrq
 bpoTv7CK6Y9Cg9FFNDqGjoFa67aUgp2jyFviMRH0o/L4iQMLWden+bu1eFoSy6H1so5yKTP+0qufM
 SbTdZckJ2IAXD57Vh/FXcxwpn5F8FXBRV1s8PxB45PtPKblZ4qOdDNxWQBJdHGBMLZWA/6dB/GbRW
 Ryy2BGjIC60/A5VLY8h27Nsvwue8yeJOw2/C9GZKFS6+uYPlFf8abXeJ8FKrixF4vTrxoLGrcBvM1
 rJh/I4Uw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lBzBS-00GpyS-Qf; Tue, 16 Feb 2021 12:10:52 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BCFB13059DD;
 Tue, 16 Feb 2021 13:10:25 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A5D6B2B9C6CCA; Tue, 16 Feb 2021 13:10:25 +0100 (CET)
Date: Tue, 16 Feb 2021 13:10:25 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [PATCH v5 4/8] x86/mm/tlb: Flush remote and local TLBs
 concurrently
Message-ID: <YCu2MQFdV4JTrUQb@hirez.programming.kicks-ass.net>
References: <20210209221653.614098-1-namit@vmware.com>
 <20210209221653.614098-5-namit@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209221653.614098-5-namit@vmware.com>
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
 linux-hyperv@vger.kernel.org, x86@kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Nadav Amit <namit@vmware.com>, Andy Lutomirski <luto@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Michael Kelley <mikelley@microsoft.com>
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

On Tue, Feb 09, 2021 at 02:16:49PM -0800, Nadav Amit wrote:
> @@ -816,8 +821,8 @@ STATIC_NOPV void native_flush_tlb_others(const struct cpumask *cpumask,
>  	 * doing a speculative memory access.
>  	 */
>  	if (info->freed_tables) {
> -		smp_call_function_many(cpumask, flush_tlb_func,
> -			       (void *)info, 1);
> +		on_each_cpu_cond_mask(NULL, flush_tlb_func, (void *)info, true,
> +				      cpumask);
>  	} else {
>  		/*
>  		 * Although we could have used on_each_cpu_cond_mask(),
> @@ -844,14 +849,15 @@ STATIC_NOPV void native_flush_tlb_others(const struct cpumask *cpumask,
>  			if (tlb_is_not_lazy(cpu))
>  				__cpumask_set_cpu(cpu, cond_cpumask);
>  		}
> -		smp_call_function_many(cond_cpumask, flush_tlb_func, (void *)info, 1);
> +		on_each_cpu_cond_mask(NULL, flush_tlb_func, (void *)info, true,
> +				      cpumask);
>  	}
>  }

Surely on_each_cpu_mask() is more appropriate? There the compiler can do
the NULL propagation because it's on the same TU.

--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -821,8 +821,7 @@ STATIC_NOPV void native_flush_tlb_multi(
 	 * doing a speculative memory access.
 	 */
 	if (info->freed_tables) {
-		on_each_cpu_cond_mask(NULL, flush_tlb_func, (void *)info, true,
-				      cpumask);
+		on_each_cpu_mask(cpumask, flush_tlb_func, (void *)info, true);
 	} else {
 		/*
 		 * Although we could have used on_each_cpu_cond_mask(),
@@ -849,8 +848,7 @@ STATIC_NOPV void native_flush_tlb_multi(
 			if (tlb_is_not_lazy(cpu))
 				__cpumask_set_cpu(cpu, cond_cpumask);
 		}
-		on_each_cpu_cond_mask(NULL, flush_tlb_func, (void *)info, true,
-				      cpumask);
+		on_each_cpu_mask(cpumask, flush_tlb_func, (void *)info, true);
 	}
 }
 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
