Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CDE2D48AD
	for <lists.virtualization@lfdr.de>; Wed,  9 Dec 2020 19:15:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D7DBF87434;
	Wed,  9 Dec 2020 18:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TpasJxNiZXHc; Wed,  9 Dec 2020 18:15:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 203DC87483;
	Wed,  9 Dec 2020 18:15:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0265CC013B;
	Wed,  9 Dec 2020 18:15:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02DAFC013B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 18:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F22C887479
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 18:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KWybq971B77m
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 18:15:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AE00A87434
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 18:15:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0928F1FB;
 Wed,  9 Dec 2020 10:15:26 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.26.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B118B3F68F;
 Wed,  9 Dec 2020 10:15:22 -0800 (PST)
Date: Wed, 9 Dec 2020 18:15:14 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 05/12] x86: rework arch_local_irq_restore() to not use
 popf
Message-ID: <20201209181514.GA14235@C02TD0UTHF1T.local>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-6-jgross@suse.com>
 <20201120115943.GD3021@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120115943.GD3021@hirez.programming.kicks-ass.net>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

On Fri, Nov 20, 2020 at 12:59:43PM +0100, Peter Zijlstra wrote:
> On Fri, Nov 20, 2020 at 12:46:23PM +0100, Juergen Gross wrote:
> > +static __always_inline void arch_local_irq_restore(unsigned long flags)
> > +{
> > +	if (!arch_irqs_disabled_flags(flags))
> > +		arch_local_irq_enable();
> > +}
> 
> If someone were to write horrible code like:
> 
> 	local_irq_disable();
> 	local_irq_save(flags);
> 	local_irq_enable();
> 	local_irq_restore(flags);
> 
> we'd be up some creek without a paddle... now I don't _think_ we have
> genius code like that, but I'd feel saver if we can haz an assertion in
> there somewhere...

I've cobbled that together locally (i'll post it momentarily), and gave it a
spin on both arm64 and x86, whereupon it exploded at boot time on x86.

In arch/x86/kernel/apic/io_apic.c's timer_irq_works() we do:

	local_irq_save(flags);
	local_irq_enable();

	[ trigger an IRQ here ]

	local_irq_restore(flags);

... and in check_timer() we call that a number of times after either a
local_irq_save() or local_irq_disable(), eventually trailing with a
local_irq_disable() that will balance things up before calling
local_irq_restore().

I guess that timer_irq_works() should instead do:

	local_irq_save(flags);
	local_irq_enable();
	...
	local_irq_disable();
	local_irq_restore(flags);

... assuming we consider that legitimate?

With that, and all the calls to local_irq_disable() in check_timer() removed
(diff below) I get a clean boot under QEMU with the assertion hacked in and
DEBUG_LOCKDEP enabled.

Thanks
Mark.

---->8----
diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index 7b3c7e0d4a09..e79e665a3aeb 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -1631,6 +1631,7 @@ static int __init timer_irq_works(void)
        else
                delay_without_tsc();
 
+       local_irq_disable();
        local_irq_restore(flags);
 
        /*
@@ -2191,7 +2192,6 @@ static inline void __init check_timer(void)
                        goto out;
                }
                panic_if_irq_remap("timer doesn't work through Interrupt-remapped IO-APIC");
-               local_irq_disable();
                clear_IO_APIC_pin(apic1, pin1);
                if (!no_pin1)
                        apic_printk(APIC_QUIET, KERN_ERR "..MP-BIOS bug: "
@@ -2215,7 +2215,6 @@ static inline void __init check_timer(void)
                /*
                 * Cleanup, just in case ...
                 */
-               local_irq_disable();
                legacy_pic->mask(0);
                clear_IO_APIC_pin(apic2, pin2);
                apic_printk(APIC_QUIET, KERN_INFO "....... failed.\n");
@@ -2232,7 +2231,6 @@ static inline void __init check_timer(void)
                apic_printk(APIC_QUIET, KERN_INFO "..... works.\n");
                goto out;
        }
-       local_irq_disable();
        legacy_pic->mask(0);
        apic_write(APIC_LVT0, APIC_LVT_MASKED | APIC_DM_FIXED | cfg->vector);
        apic_printk(APIC_QUIET, KERN_INFO "..... failed.\n");
@@ -2251,7 +2249,6 @@ static inline void __init check_timer(void)
                apic_printk(APIC_QUIET, KERN_INFO "..... works.\n");
                goto out;
        }
-       local_irq_disable();
        apic_printk(APIC_QUIET, KERN_INFO "..... failed :(.\n");
        if (apic_is_x2apic_enabled())
                apic_printk(APIC_QUIET, KERN_INFO
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
