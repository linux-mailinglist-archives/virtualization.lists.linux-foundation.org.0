Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D64EA25FB2B
	for <lists.virtualization@lfdr.de>; Mon,  7 Sep 2020 15:17:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7FFC08676F;
	Mon,  7 Sep 2020 13:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXUc773KuzRW; Mon,  7 Sep 2020 13:17:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 64CBC867FA;
	Mon,  7 Sep 2020 13:17:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F636C0051;
	Mon,  7 Sep 2020 13:17:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A358BC0859
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8F45C87175
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRI4GiINulSu
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:17:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ECE8087170
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:17:04 +0000 (UTC)
Received: from cap.home.8bytes.org (p549add56.dip0.t-ipconnect.de
 [84.154.221.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 2118C1004;
 Mon,  7 Sep 2020 15:17:01 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v7 37/72] x86/sev-es: Print SEV-ES info into kernel log
Date: Mon,  7 Sep 2020 15:15:38 +0200
Message-Id: <20200907131613.12703-38-joro@8bytes.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907131613.12703-1-joro@8bytes.org>
References: <20200907131613.12703-1-joro@8bytes.org>
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

Refactor the message printed to the kernel log which indicates whether
SEV or SME is active to print a list of enabled encryption features.
This will scale better in the future when more memory encryption
features might be added. Also add SEV-ES to the list of features.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/mm/mem_encrypt.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index d0d4ebcec1be..d6b8f4c1d3fa 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -407,6 +407,31 @@ void __init mem_encrypt_free_decrypted_mem(void)
 	free_init_pages("unused decrypted", vaddr, vaddr_end);
 }
 
+static void print_mem_encrypt_feature_info(void)
+{
+	pr_info("AMD Memory Encryption Features active:");
+
+	/* Secure Memory Encryption */
+	if (sme_active()) {
+		/*
+		 * SME is mutually exclusive with any of the SEV
+		 * features below.
+		 */
+		pr_cont(" SME\n");
+		return;
+	}
+
+	/* Secure Encrypted Virtualization */
+	if (sev_active())
+		pr_cont(" SEV");
+
+	/* Encrypted Register State */
+	if (sev_es_active())
+		pr_cont(" SEV-ES");
+
+	pr_cont("\n");
+}
+
 /* Architecture __weak replacement functions */
 void __init mem_encrypt_init(void)
 {
@@ -422,8 +447,6 @@ void __init mem_encrypt_init(void)
 	if (sev_active())
 		static_branch_enable(&sev_enable_key);
 
-	pr_info("AMD %s active\n",
-		sev_active() ? "Secure Encrypted Virtualization (SEV)"
-			     : "Secure Memory Encryption (SME)");
+	print_mem_encrypt_feature_info();
 }
 
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
