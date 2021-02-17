Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B064231D8FA
	for <lists.virtualization@lfdr.de>; Wed, 17 Feb 2021 13:02:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6888186D53;
	Wed, 17 Feb 2021 12:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y57yENEpdVmP; Wed, 17 Feb 2021 12:02:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0500686D65;
	Wed, 17 Feb 2021 12:02:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C63A2C1DA9;
	Wed, 17 Feb 2021 12:02:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE663C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9DFFF87223
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E17A5vvVKE-e
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:02:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 77E0987232
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:02:12 +0000 (UTC)
Received: from cap.home.8bytes.org (p549adcf6.dip0.t-ipconnect.de
 [84.154.220.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id AD110344;
 Wed, 17 Feb 2021 13:02:08 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 1/3] x86/sev-es: Introduce from_syscall_gap() helper
Date: Wed, 17 Feb 2021 13:01:41 +0100
Message-Id: <20210217120143.6106-2-joro@8bytes.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210217120143.6106-1-joro@8bytes.org>
References: <20210217120143.6106-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Erdem Aktas <erdemaktas@google.com>
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

From: Joerg Roedel <jroedel@suse.de>

Introduce a helper to check whether an exception came from the syscall
gap and use it in the SEV-ES code

Fixes: 315562c9af3d5 ("x86/sev-es: Adjust #VC IST Stack on entering NMI handler")
Cc: stable@vger.kernel.org # 5.10+
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/ptrace.h | 8 ++++++++
 arch/x86/kernel/traps.c       | 3 +--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/ptrace.h b/arch/x86/include/asm/ptrace.h
index d8324a236696..14854b2c4944 100644
--- a/arch/x86/include/asm/ptrace.h
+++ b/arch/x86/include/asm/ptrace.h
@@ -94,6 +94,8 @@ struct pt_regs {
 #include <asm/paravirt_types.h>
 #endif
 
+#include <asm/proto.h>
+
 struct cpuinfo_x86;
 struct task_struct;
 
@@ -175,6 +177,12 @@ static inline bool any_64bit_mode(struct pt_regs *regs)
 #ifdef CONFIG_X86_64
 #define current_user_stack_pointer()	current_pt_regs()->sp
 #define compat_user_stack_pointer()	current_pt_regs()->sp
+
+static inline bool from_syscall_gap(struct pt_regs *regs)
+{
+	return (regs->ip >= (unsigned long)entry_SYSCALL_64 &&
+		regs->ip <  (unsigned long)entry_SYSCALL_64_safe_stack);
+}
 #endif
 
 static inline unsigned long kernel_stack_pointer(struct pt_regs *regs)
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 7f5aec758f0e..b4f2b4e9066d 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -694,8 +694,7 @@ asmlinkage __visible noinstr struct pt_regs *vc_switch_off_ist(struct pt_regs *r
 	 * In the SYSCALL entry path the RSP value comes from user-space - don't
 	 * trust it and switch to the current kernel stack
 	 */
-	if (regs->ip >= (unsigned long)entry_SYSCALL_64 &&
-	    regs->ip <  (unsigned long)entry_SYSCALL_64_safe_stack) {
+	if (from_syscall_gap(regs)) {
 		sp = this_cpu_read(cpu_current_top_of_stack);
 		goto sync;
 	}
-- 
2.30.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
