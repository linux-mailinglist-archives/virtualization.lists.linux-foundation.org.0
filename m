Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3514121F0F4
	for <lists.virtualization@lfdr.de>; Tue, 14 Jul 2020 14:18:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E673F88EB2;
	Tue, 14 Jul 2020 12:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4qJqxWgYw7E; Tue, 14 Jul 2020 12:18:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 321BD88E8F;
	Tue, 14 Jul 2020 12:18:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A083C0733;
	Tue, 14 Jul 2020 12:18:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C726C0733
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 732562E8EF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EBdETN-XO8Un
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 8715D26E9E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:33 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id E55FFF8C;
 Tue, 14 Jul 2020 14:10:56 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v4 44/75] x86/sev-es: Allocate and setup IST entry for #VC
Date: Tue, 14 Jul 2020 14:08:46 +0200
Message-Id: <20200714120917.11253-45-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714120917.11253-1-joro@8bytes.org>
References: <20200714120917.11253-1-joro@8bytes.org>
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

From: Joerg Roedel <jroedel@suse.de>

Allocate IST entry number 4 for the #VC handler and setup it up in the
per-cpu TSS. This will setup the TSS for all CPUs before they even
start, so that the boot-code for secondary CPUs can handle #VC
exceptions.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/page_64_types.h | 1 +
 arch/x86/kernel/sev-es.c             | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/page_64_types.h b/arch/x86/include/asm/page_64_types.h
index 288b065955b7..d0c6c10c18a0 100644
--- a/arch/x86/include/asm/page_64_types.h
+++ b/arch/x86/include/asm/page_64_types.h
@@ -28,6 +28,7 @@
 #define	IST_INDEX_NMI		1
 #define	IST_INDEX_DB		2
 #define	IST_INDEX_MCE		3
+#define	IST_INDEX_VC		4
 
 /*
  * Set __PAGE_OFFSET to the most negative possible address +
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 64002d86a237..d415368f16ec 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -56,11 +56,13 @@ static void __init sev_es_setup_vc_stacks(int cpu)
 {
 	struct sev_es_runtime_data *data;
 	struct cpu_entry_area *cea;
+	struct tss_struct *tss;
 	unsigned long vaddr;
 	phys_addr_t pa;
 
 	data = per_cpu(runtime_data, cpu);
 	cea  = get_cpu_entry_area(cpu);
+	tss  = per_cpu_ptr(&cpu_tss_rw, cpu);
 
 	/* Map #VC IST stack */
 	vaddr = CEA_ESTACK_BOT(&cea->estacks, VC);
@@ -71,6 +73,9 @@ static void __init sev_es_setup_vc_stacks(int cpu)
 	vaddr = CEA_ESTACK_BOT(&cea->estacks, VC2);
 	pa    = __pa(data->fallback_stack);
 	cea_set_pte((void *)vaddr, pa, PAGE_KERNEL);
+
+	/* Set IST entry in TSS */
+	tss->x86_tss.ist[IST_INDEX_VC] = CEA_ESTACK_TOP(&cea->estacks, VC);
 }
 
 /* Needed in vc_early_forward_exception */
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
