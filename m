Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 858056BE14B
	for <lists.virtualization@lfdr.de>; Fri, 17 Mar 2023 07:33:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB63F80C08;
	Fri, 17 Mar 2023 06:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB63F80C08
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=BKQjya5P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VHxP2onXbWsN; Fri, 17 Mar 2023 06:33:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7B4A680AFD;
	Fri, 17 Mar 2023 06:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B4A680AFD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92074C0089;
	Fri, 17 Mar 2023 06:33:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D6DBC0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Mar 2023 06:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3121D82146
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Mar 2023 06:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3121D82146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zkdmDyX_DKQ2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Mar 2023 06:33:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49C2882144
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49C2882144
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Mar 2023 06:33:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43C3A1FDD9;
 Fri, 17 Mar 2023 06:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1679034807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OiBncbLTZGuRasTkt9MC9ORDhJhUkXWXd1OQZCJH40s=;
 b=BKQjya5PqrIxb9aAn4Mz+gobbphLA6c6rel8QZXbG3+S8RkqsWNUfhi3/ErPNBCvYzDd+L
 lrJi3gHmwOGoF02ibKZ0S9yAnzRfWY7d4zUoSjYSb11gysxKe9FzSPMxXtdhSSBoxOEGlb
 AnI9HdLXrMAWTYasMTpqMPjKX3jqdyU=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DDF8E13428;
 Fri, 17 Mar 2023 06:33:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SVayNLYJFGTGfAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Mar 2023 06:33:26 +0000
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v2] x86/paravirt: convert simple paravirt functions to asm
Date: Fri, 17 Mar 2023 07:33:25 +0100
Message-Id: <20230317063325.361-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Alexey Makhalov <amakhalov@vmware.com>,
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

All functions referenced via __PV_IS_CALLEE_SAVE() need to be assembler
functions, as those functions calls are hidden from gcc. In case the
kernel is compiled with "-fzero-call-used-regs" the compiler will
clobber caller-saved registers at the end of C functions, which will
result in unexpectedly zeroed registers at the call site of the
related paravirt functions.

Replace the C functions with DEFINE_PARAVIRT_ASM() constructs using
the same instructions as the related paravirt calls in the
PVOP_ALT_[V]CALLEE*() macros.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use noinstr section (Peter Zijlstra, Andrew Cooper)
---
 arch/x86/include/asm/paravirt_types.h |  8 +++++++-
 arch/x86/kernel/paravirt.c            | 27 ++++++---------------------
 2 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 8c1da419260f..49f5c6955229 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -562,8 +562,14 @@ void paravirt_flush_lazy_mmu(void);
 
 void _paravirt_nop(void);
 void paravirt_BUG(void);
-u64 _paravirt_ident_64(u64);
 unsigned long paravirt_ret0(void);
+#ifdef CONFIG_PARAVIRT_XXL
+u64 _paravirt_ident_64(u64);
+unsigned long pv_native_save_fl(void);
+void pv_native_irq_disable(void);
+void pv_native_irq_enable(void);
+unsigned long pv_native_read_cr2(void);
+#endif
 
 #define paravirt_nop	((void *)_paravirt_nop)
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 42e182868873..5ec2071570a4 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -64,11 +64,11 @@ static unsigned paravirt_patch_call(void *insn_buff, const void *target,
 }
 
 #ifdef CONFIG_PARAVIRT_XXL
-/* identity function, which can be inlined */
-u64 notrace _paravirt_ident_64(u64 x)
-{
-	return x;
-}
+DEFINE_PARAVIRT_ASM(_paravirt_ident_64, "mov %rdi, %rax", .text);
+DEFINE_PARAVIRT_ASM(pv_native_save_fl, "pushf; pop %rax", .noinstr.text);
+DEFINE_PARAVIRT_ASM(pv_native_irq_disable, "cli", .noinstr.text);
+DEFINE_PARAVIRT_ASM(pv_native_irq_enable, "sti", .noinstr.text);
+DEFINE_PARAVIRT_ASM(pv_native_read_cr2, "mov %cr2, %rax", .noinstr.text);
 #endif
 
 DEFINE_STATIC_KEY_TRUE(virt_spin_lock_key);
@@ -197,11 +197,6 @@ void paravirt_end_context_switch(struct task_struct *next)
 		arch_enter_lazy_mmu_mode();
 }
 
-static noinstr unsigned long pv_native_read_cr2(void)
-{
-	return native_read_cr2();
-}
-
 static noinstr void pv_native_write_cr2(unsigned long val)
 {
 	native_write_cr2(val);
@@ -222,16 +217,6 @@ noinstr void pv_native_wbinvd(void)
 	native_wbinvd();
 }
 
-static noinstr void pv_native_irq_enable(void)
-{
-	native_irq_enable();
-}
-
-static noinstr void pv_native_irq_disable(void)
-{
-	native_irq_disable();
-}
-
 static noinstr void pv_native_safe_halt(void)
 {
 	native_safe_halt();
@@ -298,7 +283,7 @@ struct paravirt_patch_template pv_ops = {
 	.cpu.end_context_switch		= paravirt_nop,
 
 	/* Irq ops. */
-	.irq.save_fl		= __PV_IS_CALLEE_SAVE(native_save_fl),
+	.irq.save_fl		= __PV_IS_CALLEE_SAVE(pv_native_save_fl),
 	.irq.irq_disable	= __PV_IS_CALLEE_SAVE(pv_native_irq_disable),
 	.irq.irq_enable		= __PV_IS_CALLEE_SAVE(pv_native_irq_enable),
 	.irq.safe_halt		= pv_native_safe_halt,
-- 
2.35.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
