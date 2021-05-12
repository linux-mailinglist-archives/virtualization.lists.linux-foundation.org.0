Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDE337B72B
	for <lists.virtualization@lfdr.de>; Wed, 12 May 2021 09:55:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A864E404E7;
	Wed, 12 May 2021 07:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzU_sGJtiPAN; Wed, 12 May 2021 07:55:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42344402F4;
	Wed, 12 May 2021 07:55:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD558C0001;
	Wed, 12 May 2021 07:55:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BA94C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 May 2021 07:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A3F0831F1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 May 2021 07:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7Huy2ZptBX6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 May 2021 07:55:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1C1C83096
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 May 2021 07:55:12 +0000 (UTC)
Received: from cap.home.8bytes.org (p549ad305.dip0.t-ipconnect.de
 [84.154.211.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id A32B141D;
 Wed, 12 May 2021 09:55:09 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org,
	Hyunwook Baek <baekhw@google.com>
Subject: [PATCH 4/6] Revert "x86/sev-es: Handle string port IO to kernel
 memory properly"
Date: Wed, 12 May 2021 09:54:43 +0200
Message-Id: <20210512075445.18935-5-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512075445.18935-1-joro@8bytes.org>
References: <20210512075445.18935-1-joro@8bytes.org>
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
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
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

From: Joerg Roedel <jroedel@suse.de>

This reverts commit 7024f60d655272bd2ca1d3a4c9e0a63319b1eea1.

The commit reverted here introduces a short-cut into the #VC handlers
memory access code which only works reliably in task context. But the
kernels #VC handler can be invoked from any context, making the
access_ok() call trigger a warning with CONFIG_DEBUG_ATOMIC_SLEEP
enabled.

Also the memcpy() used in the reverted patch is wrong, as it has no
page-fault handling. Access to kernel memory can also fault due to
kernel bugs, and those should not be reported as faults from the #VC
handler but as bugs of their real call-site, which is correctly later
done from vc_forward_exception().

Fixes: 7024f60d6552 ("x86/sev-es: Handle string port IO to kernel memory properly")
Cc: stable@vger.kernel.org # v5.11
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 110b39345b40..f4f319004713 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -333,12 +333,6 @@ static enum es_result vc_write_mem(struct es_em_ctxt *ctxt,
 	u16 d2;
 	u8  d1;
 
-	/* If instruction ran in kernel mode and the I/O buffer is in kernel space */
-	if (!user_mode(ctxt->regs) && !access_ok(target, size)) {
-		memcpy(dst, buf, size);
-		return ES_OK;
-	}
-
 	switch (size) {
 	case 1:
 		memcpy(&d1, buf, 1);
@@ -388,12 +382,6 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
 	u16 d2;
 	u8  d1;
 
-	/* If instruction ran in kernel mode and the I/O buffer is in kernel space */
-	if (!user_mode(ctxt->regs) && !access_ok(s, size)) {
-		memcpy(buf, src, size);
-		return ES_OK;
-	}
-
 	switch (size) {
 	case 1:
 		if (__get_user(d1, s))
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
