Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DA37215915D
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 15:04:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4161C856E8;
	Tue, 11 Feb 2020 14:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Alh7GqHxuSCh; Tue, 11 Feb 2020 14:03:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 69DFD85712;
	Tue, 11 Feb 2020 14:03:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B92EC07FE;
	Tue, 11 Feb 2020 14:03:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57EDEC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 44B28870F6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6f+inC9GNof
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 82019857DC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:55 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 919D6EA8; Tue, 11 Feb 2020 14:53:17 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 58/62] x86/head/64: Don't call verify_cpu() on starting APs
Date: Tue, 11 Feb 2020 14:52:52 +0100
Message-Id: <20200211135256.24617-59-joro@8bytes.org>
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

The APs are not ready to handle exceptions when verify_cpu() is called
in secondary_startup_64.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/realmode.h | 1 +
 arch/x86/kernel/head_64.S       | 1 +
 arch/x86/realmode/init.c        | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/arch/x86/include/asm/realmode.h b/arch/x86/include/asm/realmode.h
index 6590394af309..5c97807c38a4 100644
--- a/arch/x86/include/asm/realmode.h
+++ b/arch/x86/include/asm/realmode.h
@@ -69,6 +69,7 @@ extern unsigned char startup_32_smp[];
 extern unsigned char boot_gdt[];
 #else
 extern unsigned char secondary_startup_64[];
+extern unsigned char secondary_startup_64_no_verify[];
 #endif
 
 static inline size_t real_mode_size_needed(void)
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 13ebf7d3af2c..9dd602bd6244 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -144,6 +144,7 @@ SYM_CODE_START(secondary_startup_64)
 	/* Sanitize CPU configuration */
 	call verify_cpu
 
+SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
 	/*
 	 * Retrieve the modifier (SME encryption mask if SME is active) to be
 	 * added to the initial pgdir entry that will be programmed into CR3.
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index 1c5cbfd102d5..030c38268069 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -109,6 +109,12 @@ static void __init setup_real_mode(void)
 		trampoline_header->flags |= TH_FLAGS_SME_ACTIVE;
 
 	if (sev_es_active()) {
+		/*
+		 * Skip the call to verify_cpu() in secondary_startup_64 as it
+		 * will cause #VC exceptions when the AP can't handle them yet.
+		 */
+		trampoline_header->start = (u64) secondary_startup_64_no_verify;
+
 		if (sev_es_setup_ap_jump_table(real_mode_header))
 			panic("Failed to update SEV-ES AP Jump Table");
 	}
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
