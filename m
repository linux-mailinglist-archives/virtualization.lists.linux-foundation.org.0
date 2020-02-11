Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 28993159165
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 15:04:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 74CE287327;
	Tue, 11 Feb 2020 14:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPxFl-7ZA3Uj; Tue, 11 Feb 2020 14:04:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE200877E1;
	Tue, 11 Feb 2020 14:04:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A32B6C07FE;
	Tue, 11 Feb 2020 14:04:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13C80C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 01AD2204E4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lPwReqsG2VVb
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 4A75C204E0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:57 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E2484EAD; Tue, 11 Feb 2020 14:53:17 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 60/62] x86/sev-es: Support CPU offline/online
Date: Tue, 11 Feb 2020 14:52:54 +0100
Message-Id: <20200211135256.24617-61-joro@8bytes.org>
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

Add a play_dead handler when running under SEV-ES. This is needed
because the hypervisor can't deliver an SIPI request to restart the AP.
Instead the kernel has to issue a VMGEXIT to halt the VCPU. When the
hypervisor would deliver and SIPI is wakes up the VCPU instead.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/uapi/asm/svm.h |  1 +
 arch/x86/kernel/sev-es.c        | 46 +++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
index a19ce9681ec2..20a05839dd9a 100644
--- a/arch/x86/include/uapi/asm/svm.h
+++ b/arch/x86/include/uapi/asm/svm.h
@@ -84,6 +84,7 @@
 /* SEV-ES software-defined VMGEXIT events */
 #define SVM_VMGEXIT_MMIO_READ			0x80000001
 #define SVM_VMGEXIT_MMIO_WRITE			0x80000002
+#define SVM_VMGEXIT_AP_HLT_LOOP			0x80000004
 #define SVM_VMGEXIT_AP_JUMP_TABLE		0x80000005
 #define		SVM_VMGEXIT_SET_AP_JUMP_TABLE			0
 #define		SVM_VMGEXIT_GET_AP_JUMP_TABLE			1
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index d8193d37ed2b..755708f72824 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -22,6 +22,8 @@
 #include <asm/processor.h>
 #include <asm/traps.h>
 #include <asm/svm.h>
+#include <asm/smp.h>
+#include <asm/cpu.h>
 
 #define DR7_RESET_VALUE        0x400
 
@@ -252,6 +254,48 @@ static bool __init setup_ghcb(void)
 	return true;
 }
 
+#ifdef CONFIG_HOTPLUG_CPU
+static void sev_es_ap_hlt_loop(void)
+{
+	struct ghcb *ghcb;
+
+	ghcb = this_cpu_ptr(&ghcb_page);
+
+	while (true) {
+		ghcb_invalidate(ghcb);
+		ghcb_set_sw_exit_code(ghcb, SVM_VMGEXIT_AP_HLT_LOOP);
+		ghcb_set_sw_exit_info_1(ghcb, 0);
+		ghcb_set_sw_exit_info_2(ghcb, 0);
+
+		write_ghcb_msr(__pa(ghcb));
+		VMGEXIT();
+
+		/* Wakup Signal? */
+		if (ghcb_is_valid_sw_exit_info_2(ghcb) &&
+		    ghcb->save.sw_exit_info_2 != 0)
+			break;
+	}
+}
+
+void sev_es_play_dead(void)
+{
+	play_dead_common();
+
+	/* IRQs now disabled */
+
+	sev_es_ap_hlt_loop();
+
+	/*
+	 * If we get here, the VCPU was woken up again. Jump to CPU
+	 * startup code to get it back online.
+	 */
+
+	start_cpu();
+}
+#else  /* CONFIG_HOTPLUG_CPU */
+#define sev_es_play_dead	native_play_dead
+#endif /* CONFIG_HOTPLUG_CPU */
+
 void encrypted_state_init_ghcbs(void)
 {
 	int cpu;
@@ -267,6 +311,8 @@ void encrypted_state_init_ghcbs(void)
 				     sizeof(ghcb_page) >> PAGE_SHIFT);
 		memset(ghcb, 0, sizeof(*ghcb));
 	}
+
+	smp_ops.play_dead = sev_es_play_dead;
 }
 
 static void __init early_forward_exception(struct es_em_ctxt *ctxt)
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
