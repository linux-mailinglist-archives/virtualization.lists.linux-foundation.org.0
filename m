Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB424F61E
	for <lists.virtualization@lfdr.de>; Mon, 24 Aug 2020 10:56:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7620187884;
	Mon, 24 Aug 2020 08:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cq+72k+UDDRE; Mon, 24 Aug 2020 08:56:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D9DFE878A1;
	Mon, 24 Aug 2020 08:56:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1812C016F;
	Mon, 24 Aug 2020 08:56:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC67AC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D7F6988171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTU0inx77uhY
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5C148880E7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:10 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2bb8d.dip0.t-ipconnect.de
 [79.242.187.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 939BDF24;
 Mon, 24 Aug 2020 10:56:04 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v6 32/76] x86/head/64: Load GDT after switch to virtual
 addresses
Date: Mon, 24 Aug 2020 10:54:27 +0200
Message-Id: <20200824085511.7553-33-joro@8bytes.org>
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

From: Joerg Roedel <jroedel@suse.de>

Load the GDT right after switching to virtual addresses to make sure
there is a defined GDT for exception handling.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20200724160336.5435-32-joro@8bytes.org
---
 arch/x86/kernel/head_64.S | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 800053219054..f958d4e4ee08 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -166,6 +166,14 @@ SYM_CODE_START(secondary_startup_64)
 1:
 	UNWIND_HINT_EMPTY
 
+	/*
+	 * We must switch to a new descriptor in kernel space for the GDT
+	 * because soon the kernel won't have access anymore to the userspace
+	 * addresses where we're currently running on. We have to do that here
+	 * because in 32bit we couldn't load a 64bit linear address.
+	 */
+	lgdt	early_gdt_descr(%rip)
+
 	/* Check if nx is implemented */
 	movl	$0x80000001, %eax
 	cpuid
@@ -193,14 +201,6 @@ SYM_CODE_START(secondary_startup_64)
 	pushq $0
 	popfq
 
-	/*
-	 * We must switch to a new descriptor in kernel space for the GDT
-	 * because soon the kernel won't have access anymore to the userspace
-	 * addresses where we're currently running on. We have to do that here
-	 * because in 32bit we couldn't load a 64bit linear address.
-	 */
-	lgdt	early_gdt_descr(%rip)
-
 	/* set up data segments */
 	xorl %eax,%eax
 	movl %eax,%ds
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
