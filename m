Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD3C622CA2
	for <lists.virtualization@lfdr.de>; Wed,  9 Nov 2022 14:44:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B75381F04;
	Wed,  9 Nov 2022 13:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B75381F04
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=gmb+SF+r
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bWbzwJQZtFL; Wed,  9 Nov 2022 13:44:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C2EE281F07;
	Wed,  9 Nov 2022 13:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2EE281F07
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB516C0077;
	Wed,  9 Nov 2022 13:44:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05854C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Nov 2022 13:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C78C881F05
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Nov 2022 13:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C78C881F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDdnw0tc4hoH
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Nov 2022 13:44:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA52781F04
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA52781F04
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Nov 2022 13:44:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 347521FA31;
 Wed,  9 Nov 2022 13:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1668001460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XGhyUDhGHvupHU419WMDjiak/WuJYjR4SadBUr9nDsI=;
 b=gmb+SF+rZlRw08ly+Fa3wcemeEgsFmOjpUv6FaEjc3Cmiy3jTbs7ASMJwYxW4f9T7wg+/9
 6hXBXTm6psa1p18mkQsLgo8rrPtVLo7FjH0NeA2F2j6xgOCtL9Hb9oDIxmHUBkB2rkI41E
 thEki649Sj7fBoq5himPkJe9nAXbyho=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCCF31331F;
 Wed,  9 Nov 2022 13:44:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hp+pLLOua2PXDwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 09 Nov 2022 13:44:19 +0000
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org
Subject: [PATCH v2] x86/paravirt: use common macro for creating simple asm
 paravirt functions
Date: Wed,  9 Nov 2022 14:44:18 +0100
Message-Id: <20221109134418.6516-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Wanpeng Li <wanpengli@tencent.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Alexey Makhalov <amakhalov@vmware.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
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
From: Juergen Gross via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

There are some paravirt assembler functions which are sharing a common
pattern. Introduce a macro DEFINE_PARAVIRT_ASM() for creating them.

Note that this macro is including explicit alignment of the generated
functions, leading to __raw_callee_save___kvm_vcpu_is_preempted(),
_paravirt_nop() and paravirt_ret0() to be aligned at 4 byte boundaries
now.

The explicit _paravirt_nop() prototype in paravirt.c isn't needed, as
it is included in paravirt_types.h already.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
---
V2:
- expanded commit message (Srivatsa S. Bhat)
---
 arch/x86/include/asm/paravirt.h           | 12 ++++++
 arch/x86/include/asm/qspinlock_paravirt.h | 46 ++++++++++-------------
 arch/x86/kernel/kvm.c                     | 19 +++-------
 arch/x86/kernel/paravirt.c                | 22 ++---------
 4 files changed, 40 insertions(+), 59 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 2a0b8dd4ec33..479bf264b8aa 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -730,6 +730,18 @@ static __always_inline unsigned long arch_local_irq_save(void)
 #undef PVOP_VCALL4
 #undef PVOP_CALL4
 
+#define DEFINE_PARAVIRT_ASM(func, instr, sec)		\
+	asm (".pushsection " #sec ", \"ax\"\n"		\
+	     ".global " #func "\n\t"			\
+	     ".type " #func ", @function\n\t"		\
+	     __ALIGN_STR "\n"				\
+	     #func ":\n\t"				\
+	     ASM_ENDBR					\
+	     instr					\
+	     ASM_RET					\
+	     ".size " #func ", . - " #func "\n\t"	\
+	     ".popsection")
+
 extern void default_banner(void);
 
 #else  /* __ASSEMBLY__ */
diff --git a/arch/x86/include/asm/qspinlock_paravirt.h b/arch/x86/include/asm/qspinlock_paravirt.h
index 60ece592b220..c490f5eb9f3e 100644
--- a/arch/x86/include/asm/qspinlock_paravirt.h
+++ b/arch/x86/include/asm/qspinlock_paravirt.h
@@ -14,8 +14,6 @@
 
 __PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock_slowpath, ".spinlock.text");
 #define __pv_queued_spin_unlock	__pv_queued_spin_unlock
-#define PV_UNLOCK		"__raw_callee_save___pv_queued_spin_unlock"
-#define PV_UNLOCK_SLOWPATH	"__raw_callee_save___pv_queued_spin_unlock_slowpath"
 
 /*
  * Optimized assembly version of __raw_callee_save___pv_queued_spin_unlock
@@ -37,32 +35,26 @@ __PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock_slowpath, ".spinlock.text");
  *   rsi = lockval           (second argument)
  *   rdx = internal variable (set to 0)
  */
-asm    (".pushsection .spinlock.text;"
-	".globl " PV_UNLOCK ";"
-	".type " PV_UNLOCK ", @function;"
-	".align 4,0x90;"
-	PV_UNLOCK ": "
-	ASM_ENDBR
-	FRAME_BEGIN
-	"push  %rdx;"
-	"mov   $0x1,%eax;"
-	"xor   %edx,%edx;"
-	LOCK_PREFIX "cmpxchg %dl,(%rdi);"
-	"cmp   $0x1,%al;"
-	"jne   .slowpath;"
-	"pop   %rdx;"
+#define PV_UNLOCK_ASM							\
+	FRAME_BEGIN							\
+	"push  %rdx\n\t"						\
+	"mov   $0x1,%eax\n\t"						\
+	"xor   %edx,%edx\n\t"						\
+	LOCK_PREFIX "cmpxchg %dl,(%rdi)\n\t"				\
+	"cmp   $0x1,%al\n\t"						\
+	"jne   .slowpath\n\t"						\
+	"pop   %rdx\n\t"						\
+	FRAME_END							\
+	ASM_RET								\
+	".slowpath:\n\t"						\
+	"push   %rsi\n\t"						\
+	"movzbl %al,%esi\n\t"						\
+	"call __raw_callee_save___pv_queued_spin_unlock_slowpath\n\t"	\
+	"pop    %rsi\n\t"						\
+	"pop    %rdx\n\t"						\
 	FRAME_END
-	ASM_RET
-	".slowpath: "
-	"push   %rsi;"
-	"movzbl %al,%esi;"
-	"call " PV_UNLOCK_SLOWPATH ";"
-	"pop    %rsi;"
-	"pop    %rdx;"
-	FRAME_END
-	ASM_RET
-	".size " PV_UNLOCK ", .-" PV_UNLOCK ";"
-	".popsection");
+DEFINE_PARAVIRT_ASM(__raw_callee_save___pv_queued_spin_unlock, PV_UNLOCK_ASM,
+		    .spinlock.text);
 
 #else /* CONFIG_64BIT */
 
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index d4e48b4a438b..856708cc78e7 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -798,19 +798,12 @@ extern bool __raw_callee_save___kvm_vcpu_is_preempted(long);
  * Hand-optimize version for x86-64 to avoid 8 64-bit register saving and
  * restoring to/from the stack.
  */
-asm(
-".pushsection .text;"
-".global __raw_callee_save___kvm_vcpu_is_preempted;"
-".type __raw_callee_save___kvm_vcpu_is_preempted, @function;"
-"__raw_callee_save___kvm_vcpu_is_preempted:"
-ASM_ENDBR
-"movq	__per_cpu_offset(,%rdi,8), %rax;"
-"cmpb	$0, " __stringify(KVM_STEAL_TIME_preempted) "+steal_time(%rax);"
-"setne	%al;"
-ASM_RET
-".size __raw_callee_save___kvm_vcpu_is_preempted, .-__raw_callee_save___kvm_vcpu_is_preempted;"
-".popsection");
-
+#define PV_VCPU_PREEMPTED_ASM						     \
+ "movq   __per_cpu_offset(,%rdi,8), %rax\n\t"				     \
+ "cmpb   $0, " __stringify(KVM_STEAL_TIME_preempted) "+steal_time(%rax)\n\t" \
+ "setne  %al\n\t"
+DEFINE_PARAVIRT_ASM(__raw_callee_save___kvm_vcpu_is_preempted,
+		    PV_VCPU_PREEMPTED_ASM, .text);
 #endif
 
 static void __init kvm_guest_init(void)
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 7ca2d46c08cc..6f306f885caf 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -37,27 +37,11 @@
  * nop stub, which must not clobber anything *including the stack* to
  * avoid confusing the entry prologues.
  */
-extern void _paravirt_nop(void);
-asm (".pushsection .entry.text, \"ax\"\n"
-     ".global _paravirt_nop\n"
-     "_paravirt_nop:\n\t"
-     ASM_ENDBR
-     ASM_RET
-     ".size _paravirt_nop, . - _paravirt_nop\n\t"
-     ".type _paravirt_nop, @function\n\t"
-     ".popsection");
+DEFINE_PARAVIRT_ASM(_paravirt_nop, "", .entry.text);
 
 /* stub always returning 0. */
-asm (".pushsection .entry.text, \"ax\"\n"
-     ".global paravirt_ret0\n"
-     "paravirt_ret0:\n\t"
-     ASM_ENDBR
-     "xor %" _ASM_AX ", %" _ASM_AX ";\n\t"
-     ASM_RET
-     ".size paravirt_ret0, . - paravirt_ret0\n\t"
-     ".type paravirt_ret0, @function\n\t"
-     ".popsection");
-
+#define PV_RET0_ASM	"xor %" _ASM_AX ", %" _ASM_AX "\n\t"
+DEFINE_PARAVIRT_ASM(paravirt_ret0, PV_RET0_ASM, .entry.text);
 
 void __init default_banner(void)
 {
-- 
2.35.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
