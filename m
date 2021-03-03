Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D632B895
	for <lists.virtualization@lfdr.de>; Wed,  3 Mar 2021 15:24:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B9698301F;
	Wed,  3 Mar 2021 14:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id myC39PH76i8r; Wed,  3 Mar 2021 14:24:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E3D82DD0;
	Wed,  3 Mar 2021 14:24:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 774BDC000F;
	Wed,  3 Mar 2021 14:24:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57F55C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Mar 2021 14:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3994449B64
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Mar 2021 14:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8cDCgG_TMkp
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Mar 2021 14:24:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56D8B49C71
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Mar 2021 14:24:26 +0000 (UTC)
Received: from cap.home.8bytes.org (p549adcf6.dip0.t-ipconnect.de
 [84.154.220.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 58CC6412;
 Wed,  3 Mar 2021 15:17:23 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 2/5] x86/sev-es: Check if regs->sp is trusted before adjusting
 #VC IST stack
Date: Wed,  3 Mar 2021 15:17:13 +0100
Message-Id: <20210303141716.29223-3-joro@8bytes.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303141716.29223-1-joro@8bytes.org>
References: <20210303141716.29223-1-joro@8bytes.org>
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

The code in the NMI handler to adjust the #VC handler IST stack is
needed in case an NMI hits when the #VC handler is still using its IST
stack.
But the check for this condition also needs to look if the regs->sp
value is trusted, meaning it was not set by user-space. Extend the
check to not use regs->sp when the NMI interrupted user-space code or
the SYSCALL gap.

Reported-by: Andy Lutomirski <luto@kernel.org>
Fixes: 315562c9af3d5 ("x86/sev-es: Adjust #VC IST Stack on entering NMI handler")
Cc: stable@vger.kernel.org # 5.10+
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 1e78f4bd7bf2..28b0144daddd 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -121,8 +121,18 @@ static void __init setup_vc_stacks(int cpu)
 	cea_set_pte((void *)vaddr, pa, PAGE_KERNEL);
 }
 
-static __always_inline bool on_vc_stack(unsigned long sp)
+static __always_inline bool on_vc_stack(struct pt_regs *regs)
 {
+	unsigned long sp = regs->sp;
+
+	/* User-mode RSP is not trusted */
+	if (user_mode(regs))
+		return false;
+
+	/* SYSCALL gap still has user-mode RSP */
+	if (ip_within_syscall_gap(regs))
+		return false;
+
 	return ((sp >= __this_cpu_ist_bottom_va(VC)) && (sp < __this_cpu_ist_top_va(VC)));
 }
 
@@ -144,7 +154,7 @@ void noinstr __sev_es_ist_enter(struct pt_regs *regs)
 	old_ist = __this_cpu_read(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC]);
 
 	/* Make room on the IST stack */
-	if (on_vc_stack(regs->sp))
+	if (on_vc_stack(regs))
 		new_ist = ALIGN_DOWN(regs->sp, 8) - sizeof(old_ist);
 	else
 		new_ist = old_ist - sizeof(old_ist);
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
