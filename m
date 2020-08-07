Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCBF23E92C
	for <lists.virtualization@lfdr.de>; Fri,  7 Aug 2020 10:38:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F7AD888B6;
	Fri,  7 Aug 2020 08:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cdr-DbMfNads; Fri,  7 Aug 2020 08:38:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8FCE3888B5;
	Fri,  7 Aug 2020 08:38:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77870C004C;
	Fri,  7 Aug 2020 08:38:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C224C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 08:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3AB5E88836
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 08:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YrQpQ0ONalzH
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 08:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DD0E08852C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 08:38:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FE19B643;
 Fri,  7 Aug 2020 08:38:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] x86/paravirt: cleanup paravirt macros
Date: Fri,  7 Aug 2020 10:38:24 +0200
Message-Id: <20200807083826.16794-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200807083826.16794-1-jgross@suse.com>
References: <20200807083826.16794-1-jgross@suse.com>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
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

Some paravirt macros are no longer used, delete them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/paravirt.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index dedc89a07826..99da08852df0 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -614,16 +614,9 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 #endif /* SMP && PARAVIRT_SPINLOCKS */
 
 #ifdef CONFIG_X86_32
-#define PV_SAVE_REGS "pushl %ecx; pushl %edx;"
-#define PV_RESTORE_REGS "popl %edx; popl %ecx;"
-
 /* save and restore all caller-save registers, except return value */
 #define PV_SAVE_ALL_CALLER_REGS		"pushl %ecx;"
 #define PV_RESTORE_ALL_CALLER_REGS	"popl  %ecx;"
-
-#define PV_FLAGS_ARG "0"
-#define PV_EXTRA_CLOBBERS
-#define PV_VEXTRA_CLOBBERS
 #else
 /* save and restore all caller-save registers, except return value */
 #define PV_SAVE_ALL_CALLER_REGS						\
@@ -644,14 +637,6 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 	"pop %rsi;"							\
 	"pop %rdx;"							\
 	"pop %rcx;"
-
-/* We save some registers, but all of them, that's too much. We clobber all
- * caller saved registers but the argument parameter */
-#define PV_SAVE_REGS "pushq %%rdi;"
-#define PV_RESTORE_REGS "popq %%rdi;"
-#define PV_EXTRA_CLOBBERS EXTRA_CLOBBERS, "rcx" , "rdx", "rsi"
-#define PV_VEXTRA_CLOBBERS EXTRA_CLOBBERS, "rdi", "rcx" , "rdx", "rsi"
-#define PV_FLAGS_ARG "D"
 #endif
 
 /*
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
