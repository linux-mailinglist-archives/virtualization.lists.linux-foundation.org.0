Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9AB18AF3A
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:15:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 036FE87B72;
	Thu, 19 Mar 2020 09:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5DbYIlpLpR7; Thu, 19 Mar 2020 09:14:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5C4B087D91;
	Thu, 19 Mar 2020 09:14:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40E67C07FF;
	Thu, 19 Mar 2020 09:14:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 365C0C1D88
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 133B986B21
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1g2-tD1bMqkR
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7411F86B3A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:35 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id F3E0F672; Thu, 19 Mar 2020 10:14:21 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 31/70] x86/head/64: Load segment registers earlier
Date: Thu, 19 Mar 2020 10:13:28 +0100
Message-Id: <20200319091407.1481-32-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319091407.1481-1-joro@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
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

Make sure segments are properly set up before setting up an IDT and
doing anything that might cause a #VC exception. This is later needed
for early exception handling.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/head_64.S | 52 +++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index ebb7d512c9d3..1be178be1566 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -168,6 +168,32 @@ SYM_CODE_START(secondary_startup_64)
 	movq	%rax, boot_gdt_base(%rip)
 	lgdt	boot_gdt_descr(%rip)
 
+	/* set up data segments */
+	xorl %eax,%eax
+	movl %eax,%ds
+	movl %eax,%ss
+	movl %eax,%es
+
+	/*
+	 * We don't really need to load %fs or %gs, but load them anyway
+	 * to kill any stale realmode selectors.  This allows execution
+	 * under VT hardware.
+	 */
+	movl %eax,%fs
+	movl %eax,%gs
+
+	/* Set up %gs.
+	 *
+	 * The base of %gs always points to fixed_percpu_data. If the
+	 * stack protector canary is enabled, it is located at %gs:40.
+	 * Note that, on SMP, the boot cpu uses init data section until
+	 * the per cpu areas are set up.
+	 */
+	movl	$MSR_GS_BASE,%ecx
+	movl	initial_gs(%rip),%eax
+	movl	initial_gs+4(%rip),%edx
+	wrmsr
+
 	/* Check if nx is implemented */
 	movl	$0x80000001, %eax
 	cpuid
@@ -203,32 +229,6 @@ SYM_CODE_START(secondary_startup_64)
 	 */
 	lgdt	early_gdt_descr(%rip)
 
-	/* set up data segments */
-	xorl %eax,%eax
-	movl %eax,%ds
-	movl %eax,%ss
-	movl %eax,%es
-
-	/*
-	 * We don't really need to load %fs or %gs, but load them anyway
-	 * to kill any stale realmode selectors.  This allows execution
-	 * under VT hardware.
-	 */
-	movl %eax,%fs
-	movl %eax,%gs
-
-	/* Set up %gs.
-	 *
-	 * The base of %gs always points to fixed_percpu_data. If the
-	 * stack protector canary is enabled, it is located at %gs:40.
-	 * Note that, on SMP, the boot cpu uses init data section until
-	 * the per cpu areas are set up.
-	 */
-	movl	$MSR_GS_BASE,%ecx
-	movl	initial_gs(%rip),%eax
-	movl	initial_gs+4(%rip),%edx
-	wrmsr
-
 	/* rsi is pointer to real mode structure with interesting info.
 	   pass it to C */
 	movq	%rsi, %rdi
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
