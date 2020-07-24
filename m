Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BA422CAC0
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 18:15:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 431F78798E;
	Fri, 24 Jul 2020 16:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vy9pDy8PI14L; Fri, 24 Jul 2020 16:15:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 200A5888E5;
	Fri, 24 Jul 2020 16:14:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB3AEC004C;
	Fri, 24 Jul 2020 16:14:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF65AC004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2CF5C23BC0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r+5wOKxnLnWz
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 576F523E84
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:32 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id D0EB9FE8;
 Fri, 24 Jul 2020 18:04:35 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v5 66/75] x86/vmware: Add VMware specific handling for VMMCALL
 under SEV-ES
Date: Fri, 24 Jul 2020 18:03:27 +0200
Message-Id: <20200724160336.5435-67-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724160336.5435-1-joro@8bytes.org>
References: <20200724160336.5435-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, Doug Covelli <dcovelli@vmware.com>,
 hpa@zytor.com, Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

From: Doug Covelli <dcovelli@vmware.com>

Add VMware specific handling for #VC faults caused by VMMCALL
instructions.

Signed-off-by: Doug Covelli <dcovelli@vmware.com>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
[ jroedel@suse.de: - Adapt to different paravirt interface ]
Co-developed-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/cpu/vmware.c | 50 ++++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 9b6fafa69be9..d2129d5e8373 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -33,6 +33,7 @@
 #include <asm/timer.h>
 #include <asm/apic.h>
 #include <asm/vmware.h>
+#include <asm/svm.h>
 
 #undef pr_fmt
 #define pr_fmt(fmt)	"vmware: " fmt
@@ -476,10 +477,49 @@ static bool __init vmware_legacy_x2apic_available(void)
 	       (eax & (1 << VMWARE_CMD_LEGACY_X2APIC)) != 0;
 }
 
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+static void vmware_sev_es_hcall_prepare(struct ghcb *ghcb,
+					struct pt_regs *regs)
+{
+	/* Copy VMWARE specific Hypercall parameters to the GHCB */
+	ghcb_set_rip(ghcb, regs->ip);
+	ghcb_set_rbx(ghcb, regs->bx);
+	ghcb_set_rcx(ghcb, regs->cx);
+	ghcb_set_rdx(ghcb, regs->dx);
+	ghcb_set_rsi(ghcb, regs->si);
+	ghcb_set_rdi(ghcb, regs->di);
+	ghcb_set_rbp(ghcb, regs->bp);
+}
+
+static bool vmware_sev_es_hcall_finish(struct ghcb *ghcb, struct pt_regs *regs)
+{
+	if (!(ghcb_is_valid_rbx(ghcb) &&
+	      ghcb_is_valid_rcx(ghcb) &&
+	      ghcb_is_valid_rdx(ghcb) &&
+	      ghcb_is_valid_rsi(ghcb) &&
+	      ghcb_is_valid_rdi(ghcb) &&
+	      ghcb_is_valid_rbp(ghcb)))
+		return false;
+
+	regs->bx = ghcb->save.rbx;
+	regs->cx = ghcb->save.rcx;
+	regs->dx = ghcb->save.rdx;
+	regs->si = ghcb->save.rsi;
+	regs->di = ghcb->save.rdi;
+	regs->bp = ghcb->save.rbp;
+
+	return true;
+}
+#endif
+
 const __initconst struct hypervisor_x86 x86_hyper_vmware = {
-	.name			= "VMware",
-	.detect			= vmware_platform,
-	.type			= X86_HYPER_VMWARE,
-	.init.init_platform	= vmware_platform_setup,
-	.init.x2apic_available	= vmware_legacy_x2apic_available,
+	.name				= "VMware",
+	.detect				= vmware_platform,
+	.type				= X86_HYPER_VMWARE,
+	.init.init_platform		= vmware_platform_setup,
+	.init.x2apic_available		= vmware_legacy_x2apic_available,
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+	.runtime.sev_es_hcall_prepare	= vmware_sev_es_hcall_prepare,
+	.runtime.sev_es_hcall_finish	= vmware_sev_es_hcall_finish,
+#endif
 };
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
