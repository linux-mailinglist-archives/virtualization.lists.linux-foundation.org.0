Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 148C422C9B9
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 18:04:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B947388A5F;
	Fri, 24 Jul 2020 16:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m8NppWFTFkHn; Fri, 24 Jul 2020 16:04:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 474F788A6C;
	Fri, 24 Jul 2020 16:04:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B443C004D;
	Fri, 24 Jul 2020 16:04:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7BE2C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 74485870CD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGcNZRs6_3HT
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 86478870B2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:00 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id B1ABB7CB;
 Fri, 24 Jul 2020 18:03:57 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v5 03/75] KVM: SVM: Use __packed shorthand
Date: Fri, 24 Jul 2020 18:02:24 +0200
Message-Id: <20200724160336.5435-4-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724160336.5435-1-joro@8bytes.org>
References: <20200724160336.5435-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>,
 Mike Stunes <mstunes@vmware.com>, linux-kernel@vger.kernel.org,
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

From: Borislav Petkov <bp@alien8.de>

Use the shorthand to make it more readable.

No functional changes.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/svm.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
index 0420250b008b..af91ced0f370 100644
--- a/arch/x86/include/asm/svm.h
+++ b/arch/x86/include/asm/svm.h
@@ -150,14 +150,14 @@ struct __attribute__ ((__packed__)) vmcb_control_area {
 #define SVM_NESTED_CTL_NP_ENABLE	BIT(0)
 #define SVM_NESTED_CTL_SEV_ENABLE	BIT(1)
 
-struct __attribute__ ((__packed__)) vmcb_seg {
+struct vmcb_seg {
 	u16 selector;
 	u16 attrib;
 	u32 limit;
 	u64 base;
-};
+} __packed;
 
-struct __attribute__ ((__packed__)) vmcb_save_area {
+struct vmcb_save_area {
 	struct vmcb_seg es;
 	struct vmcb_seg cs;
 	struct vmcb_seg ss;
@@ -231,9 +231,9 @@ struct __attribute__ ((__packed__)) vmcb_save_area {
 	u64 xcr0;
 	u8 valid_bitmap[16];
 	u64 x87_state_gpa;
-};
+} __packed;
 
-struct __attribute__ ((__packed__)) ghcb {
+struct ghcb {
 	struct vmcb_save_area save;
 	u8 reserved_save[2048 - sizeof(struct vmcb_save_area)];
 
@@ -242,7 +242,7 @@ struct __attribute__ ((__packed__)) ghcb {
 	u8 reserved_1[10];
 	u16 protocol_version;	/* negotiated SEV-ES/GHCB protocol version */
 	u32 ghcb_usage;
-};
+} __packed;
 
 
 static inline void __unused_size_checks(void)
@@ -252,11 +252,11 @@ static inline void __unused_size_checks(void)
 	BUILD_BUG_ON(sizeof(struct ghcb) != 4096);
 }
 
-struct __attribute__ ((__packed__)) vmcb {
+struct vmcb {
 	struct vmcb_control_area control;
 	u8 reserved_control[1024 - sizeof(struct vmcb_control_area)];
 	struct vmcb_save_area save;
-};
+} __packed;
 
 #define SVM_CPUID_FUNC 0x8000000a
 
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
