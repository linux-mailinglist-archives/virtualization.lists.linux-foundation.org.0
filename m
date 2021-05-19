Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A78388F99
	for <lists.virtualization@lfdr.de>; Wed, 19 May 2021 15:53:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD9A540EAD;
	Wed, 19 May 2021 13:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LPZD61WUCTiY; Wed, 19 May 2021 13:53:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B31040EA3;
	Wed, 19 May 2021 13:53:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 697FEC002E;
	Wed, 19 May 2021 13:53:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64955C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 13:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52C5940664
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 13:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8a8R2kuZ3JUi
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 13:53:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 337EB40692
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 13:53:14 +0000 (UTC)
Received: from cap.home.8bytes.org (p549ad305.dip0.t-ipconnect.de
 [84.154.211.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id CEA4C4CA;
 Wed, 19 May 2021 15:53:10 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org,
	Hyunwook Baek <baekhw@google.com>
Subject: [PATCH v2 5/8] x86/sev-es: Leave NMI-mode before sending signals
Date: Wed, 19 May 2021 15:52:48 +0200
Message-Id: <20210519135251.30093-6-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519135251.30093-1-joro@8bytes.org>
References: <20210519135251.30093-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 linux-coco@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>,
 Mike Stunes <mstunes@vmware.com>, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
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

The error path in the runtime #VC handler sends a signal to kill the
current task if the exception was raised from user-space. Some parts of
the #VC handler run in NMI mode, because it is critical that it is not
interrupted (except from an NMI) while the GHCB is in use.

But sending signals in NMI-mode is actually broken and triggers lockdep
warnings. On the other side, when the signal is sent, there is no reason
for the handler to still be in NMI-mode, as the GHCB is not used
anymore.

Leave NMI-mode before entering the error path to get rid of the lockdep
warnings.

Fixes: 62441a1fb532 ("x86/sev-es: Correctly track IRQ states in runtime #VC handler")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 4fd997bbf059..9a64030e74c0 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1343,9 +1343,10 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
 		return;
 	}
 
+	instrumentation_begin();
+
 	irq_state = irqentry_nmi_enter(regs);
 	lockdep_assert_irqs_disabled();
-	instrumentation_begin();
 
 	/*
 	 * This is invoked through an interrupt gate, so IRQs are disabled. The
@@ -1395,13 +1396,19 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
 		BUG();
 	}
 
-out:
-	instrumentation_end();
 	irqentry_nmi_exit(regs, irq_state);
+	instrumentation_end();
 
 	return;
 
 fail:
+	/*
+	 * Leave NMI mode - the GHCB is not busy anymore and depending on where
+	 * the #VC came from this code is about to either kill the task (when in
+	 * task context) or kill the machine.
+	 */
+	irqentry_nmi_exit(regs, irq_state);
+
 	if (user_mode(regs)) {
 		/*
 		 * Do not kill the machine if user-space triggered the
@@ -1423,7 +1430,9 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
 		panic("Returned from Terminate-Request to Hypervisor\n");
 	}
 
-	goto out;
+	instrumentation_end();
+
+	return;
 }
 
 /* This handler runs on the #VC fall-back stack. It can cause further #VC exceptions */
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
