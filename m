Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2B320552A
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 16:54:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0E9B187637;
	Tue, 23 Jun 2020 14:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vpIMiXKvL0jl; Tue, 23 Jun 2020 14:54:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 923798762B;
	Tue, 23 Jun 2020 14:54:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67023C016F;
	Tue, 23 Jun 2020 14:54:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA1FCC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 14:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B605588DC3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 14:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uyemARD4Umxn
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 14:53:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DC53988DB3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HULhaI+b5XJqnnihDW5C9Ggk4Cp4Adw7G89+l/htg0I=; b=jJTrms2hoV5Nzz7Wo9AaUII+sw
 2zCeUAXIjhAFqBTeIVysOW8tr+I1cq0WsZ3lg+qYSSCEttqsd40hQ44w4Jb0/b7p9n9EuwLHZUGw9
 VXaPwrIBRTP+ncvgGvke5TZe4297oUsZ6v+pOOO0Xdli7QEUP7NUDDaFIcHbpe3aKKy5VHZ8q8BGB
 gjco2dlW4zQJgFht29uUVdhszPfFQ+nZNew7IQU3vHNhE7hdYxDmswTkGkty6GKA9PgvhWRJu1nlE
 Ct0a2jSe9Ylu4gQVerv+8fbLzvGxE1U8jGZw4hbOwzvQb+kF/q2QDj1OLouPmZ3NaFf7RCMZ16/DE
 iC6FndYA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnkIz-00066t-Uk; Tue, 23 Jun 2020 14:53:46 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 836FC30477A;
 Tue, 23 Jun 2020 16:53:44 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7108C23CD6142; Tue, 23 Jun 2020 16:53:44 +0200 (CEST)
Date: Tue, 23 Jun 2020 16:53:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623145344.GA117543@hirez.programming.kicks-ass.net>
References: <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200428075512.GP30814@suse.de>
 <20200623110706.GB4817@hirez.programming.kicks-ass.net>
 <20200623113007.GH31822@suse.de>
 <20200623114818.GD4817@hirez.programming.kicks-ass.net>
 <20200623120433.GB14101@suse.de>
 <20200623125201.GG4817@hirez.programming.kicks-ass.net>
 <20200623134003.GD14101@suse.de>
 <20200623135916.GI4817@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623135916.GI4817@hirez.programming.kicks-ass.net>
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, X86 ML <x86@kernel.org>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

On Tue, Jun 23, 2020 at 03:59:16PM +0200, Peter Zijlstra wrote:

> So basically when your exception frame points to your own IST, you die.
> That sounds like something we should have in generic IST code.

Something like this... #DF already dies and NMI is 'magic'

---
 arch/x86/entry/common.c         |  7 +++++++
 arch/x86/include/asm/idtentry.h | 12 +++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/common.c b/arch/x86/entry/common.c
index af0d57ed5e69..e38e4f34c90c 100644
--- a/arch/x86/entry/common.c
+++ b/arch/x86/entry/common.c
@@ -742,6 +742,13 @@ noinstr void idtentry_exit_nmi(struct pt_regs *regs, bool restore)
 	__nmi_exit();
 }
 
+noinstr void idtentry_validate_ist(struct pt_regs *regs)
+{
+	if ((regs->sp & ~(EXCEPTION_STKSZ-1)) ==
+	    (_RET_IP_ & ~(EXCEPTION_STKSZ-1)))
+		die("IST stack recursion", regs, 0);
+}
+
 #ifdef CONFIG_XEN_PV
 #ifndef CONFIG_PREEMPTION
 /*
diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index 4e399f120ff8..974c1a4eacbb 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -19,6 +19,8 @@ void idtentry_exit_cond_rcu(struct pt_regs *regs, bool rcu_exit);
 bool idtentry_enter_nmi(struct pt_regs *regs);
 void idtentry_exit_nmi(struct pt_regs *regs, bool irq_state);
 
+void idtentry_validate_ist(struct pt_regs *regs);
+
 /**
  * DECLARE_IDTENTRY - Declare functions for simple IDT entry points
  *		      No error code pushed by hardware
@@ -322,7 +324,15 @@ static __always_inline void __##func(struct pt_regs *regs)
  * Maps to DEFINE_IDTENTRY_RAW
  */
 #define DEFINE_IDTENTRY_IST(func)					\
-	DEFINE_IDTENTRY_RAW(func)
+static __always_inline void __##func(struct pt_regs *regs);		\
+									\
+__visible noinstr void func(struct pt_regs *regs)			\
+{									\
+	idtentry_validate_ist(regs);					\
+	__##func(regs);							\
+}									\
+									\
+static __always_inline void __##func(struct pt_regs *regs)
 
 /**
  * DEFINE_IDTENTRY_NOIST - Emit code for NOIST entry points which
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
