Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8F15916A
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 15:04:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9810D8763E;
	Tue, 11 Feb 2020 14:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhuVSKEl4nPZ; Tue, 11 Feb 2020 14:04:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DEF8879CD;
	Tue, 11 Feb 2020 14:04:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 618E3C07FE;
	Tue, 11 Feb 2020 14:04:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01AE6C1D8E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DEBB986499
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPe2OjI8GT2L
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1B7C486497
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:59 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3D1ACE9D; Tue, 11 Feb 2020 14:53:17 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 56/62] x86/realmode: Add SEV-ES specific trampoline entry point
Date: Tue, 11 Feb 2020 14:52:50 +0100
Message-Id: <20200211135256.24617-57-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211135256.24617-1-joro@8bytes.org>
References: <20200211135256.24617-1-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

The code at the trampoline entry point is executed in real-mode. In
real-mode #VC exceptions can't be handled, so anything that might cause
such an exception must be avoided.

In the standard trampoline entry code this is the WBINVD instruction and
the call to verify_cpu(), which are both not needed anyway when running
as an SEV-ES guest.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/realmode.h      |  3 +++
 arch/x86/realmode/rm/header.S        |  3 +++
 arch/x86/realmode/rm/trampoline_64.S | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/arch/x86/include/asm/realmode.h b/arch/x86/include/asm/realmode.h
index b35030eeec36..6590394af309 100644
--- a/arch/x86/include/asm/realmode.h
+++ b/arch/x86/include/asm/realmode.h
@@ -21,6 +21,9 @@ struct real_mode_header {
 	/* SMP trampoline */
 	u32	trampoline_start;
 	u32	trampoline_header;
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+	u32	sev_es_trampoline_start;
+#endif
 #ifdef CONFIG_X86_64
 	u32	trampoline_pgd;
 #endif
diff --git a/arch/x86/realmode/rm/header.S b/arch/x86/realmode/rm/header.S
index af04512c02d9..8c1db5bf5d78 100644
--- a/arch/x86/realmode/rm/header.S
+++ b/arch/x86/realmode/rm/header.S
@@ -20,6 +20,9 @@ SYM_DATA_START(real_mode_header)
 	/* SMP trampoline */
 	.long	pa_trampoline_start
 	.long	pa_trampoline_header
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+	.long	pa_sev_es_trampoline_start
+#endif
 #ifdef CONFIG_X86_64
 	.long	pa_trampoline_pgd;
 #endif
diff --git a/arch/x86/realmode/rm/trampoline_64.S b/arch/x86/realmode/rm/trampoline_64.S
index 251758ed7443..84c5d1b33d10 100644
--- a/arch/x86/realmode/rm/trampoline_64.S
+++ b/arch/x86/realmode/rm/trampoline_64.S
@@ -56,6 +56,7 @@ SYM_CODE_START(trampoline_start)
 	testl   %eax, %eax		# Check for return code
 	jnz	no_longmode
 
+.Lswitch_to_protected:
 	/*
 	 * GDT tables in non default location kernel can be beyond 16MB and
 	 * lgdt will not be able to load the address as in real mode default
@@ -80,6 +81,25 @@ no_longmode:
 	jmp no_longmode
 SYM_CODE_END(trampoline_start)
 
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+/* SEV-ES supports non-zero IP for entry points - no alignment needed */
+SYM_CODE_START(sev_es_trampoline_start)
+	cli			# We should be safe anyway
+
+	LJMPW_RM(1f)
+1:
+	mov	%cs, %ax	# Code and data in the same place
+	mov	%ax, %ds
+	mov	%ax, %es
+	mov	%ax, %ss
+
+	# Setup stack
+	movl	$rm_stack_end, %esp
+
+	jmp	.Lswitch_to_protected
+SYM_CODE_END(sev_es_trampoline_start)
+#endif	/* CONFIG_AMD_MEM_ENCRYPT */
+
 #include "../kernel/verify_cpu.S"
 
 	.section ".text32","ax"
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
