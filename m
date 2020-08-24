Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B624F6FA
	for <lists.virtualization@lfdr.de>; Mon, 24 Aug 2020 11:07:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5101B87D48;
	Mon, 24 Aug 2020 09:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEUJdfIOn-8I; Mon, 24 Aug 2020 09:07:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B46387D7F;
	Mon, 24 Aug 2020 09:06:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37B5AC0051;
	Mon, 24 Aug 2020 09:06:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4276FC0895
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 09:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2DBB388196
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 09:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKzOzbYKA6H4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 09:06:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DDDF88829F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 09:06:51 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2bb8d.dip0.t-ipconnect.de
 [79.242.187.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id C475112DF;
 Mon, 24 Aug 2020 10:56:26 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v6 66/76] x86/kvm: Add KVM specific VMMCALL handling under
 SEV-ES
Date: Mon, 24 Aug 2020 10:55:01 +0200
Message-Id: <20200824085511.7553-67-joro@8bytes.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824085511.7553-1-joro@8bytes.org>
References: <20200824085511.7553-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Joerg Roedel <jroedel@suse.de>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
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

From: Tom Lendacky <thomas.lendacky@amd.com>

Implement the callbacks to copy the processor state required by KVM to
the GHCB.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
[ jroedel@suse.de: - Split out of a larger patch
                   - Adapt to different callback functions ]
Co-developed-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Link: https://lore.kernel.org/r/20200724160336.5435-66-joro@8bytes.org
---
 arch/x86/kernel/kvm.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 08320b0b2b27..0f9597275e9c 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -36,6 +36,8 @@
 #include <asm/hypervisor.h>
 #include <asm/tlb.h>
 #include <asm/cpuidle_haltpoll.h>
+#include <asm/ptrace.h>
+#include <asm/svm.h>
 
 DEFINE_STATIC_KEY_FALSE(kvm_async_pf_enabled);
 
@@ -746,13 +748,34 @@ static void __init kvm_init_platform(void)
 	x86_platform.apic_post_init = kvm_apic_init;
 }
 
+#if defined(CONFIG_AMD_MEM_ENCRYPT)
+static void kvm_sev_es_hcall_prepare(struct ghcb *ghcb, struct pt_regs *regs)
+{
+	/* RAX and CPL are already in the GHCB */
+	ghcb_set_rbx(ghcb, regs->bx);
+	ghcb_set_rcx(ghcb, regs->cx);
+	ghcb_set_rdx(ghcb, regs->dx);
+	ghcb_set_rsi(ghcb, regs->si);
+}
+
+static bool kvm_sev_es_hcall_finish(struct ghcb *ghcb, struct pt_regs *regs)
+{
+	/* No checking of the return state needed */
+	return true;
+}
+#endif
+
 const __initconst struct hypervisor_x86 x86_hyper_kvm = {
-	.name			= "KVM",
-	.detect			= kvm_detect,
-	.type			= X86_HYPER_KVM,
-	.init.guest_late_init	= kvm_guest_init,
-	.init.x2apic_available	= kvm_para_available,
-	.init.init_platform	= kvm_init_platform,
+	.name				= "KVM",
+	.detect				= kvm_detect,
+	.type				= X86_HYPER_KVM,
+	.init.guest_late_init		= kvm_guest_init,
+	.init.x2apic_available		= kvm_para_available,
+	.init.init_platform		= kvm_init_platform,
+#if defined(CONFIG_AMD_MEM_ENCRYPT)
+	.runtime.sev_es_hcall_prepare	= kvm_sev_es_hcall_prepare,
+	.runtime.sev_es_hcall_finish	= kvm_sev_es_hcall_finish,
+#endif
 };
 
 static __init int activate_jump_labels(void)
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
