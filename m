Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F7833379F
	for <lists.virtualization@lfdr.de>; Wed, 10 Mar 2021 09:44:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47CFD84368;
	Wed, 10 Mar 2021 08:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6rWb4H_ZhyH; Wed, 10 Mar 2021 08:44:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 012B682E90;
	Wed, 10 Mar 2021 08:44:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98263C0001;
	Wed, 10 Mar 2021 08:44:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9596CC0010
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 08:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AD424314A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 08:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTQYoEhbQlMh
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 08:43:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A58A43194
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 08:43:56 +0000 (UTC)
Received: from cap.home.8bytes.org (p549adcf6.dip0.t-ipconnect.de
 [84.154.220.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 01E094CA;
 Wed, 10 Mar 2021 09:43:52 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v2 3/7] x86/boot/compressed/64: Setup IDT in startup_32 boot
 path
Date: Wed, 10 Mar 2021 09:43:21 +0100
Message-Id: <20210310084325.12966-4-joro@8bytes.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310084325.12966-1-joro@8bytes.org>
References: <20210310084325.12966-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
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

This boot path needs exception handling when it is used with SEV-ES.
Setup an IDT and provide a helper function to write IDT entries for
use in 32-bit protected mode.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/head_64.S | 72 ++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/x86/boot/compressed/head_64.S b/arch/x86/boot/compressed/head_64.S
index c59c80ca546d..2001c3bf0748 100644
--- a/arch/x86/boot/compressed/head_64.S
+++ b/arch/x86/boot/compressed/head_64.S
@@ -116,6 +116,9 @@ SYM_FUNC_START(startup_32)
 	lretl
 1:
 
+	/* Setup Exception handling for SEV-ES */
+	call	startup32_load_idt
+
 	/* Make sure cpu supports long mode. */
 	call	verify_cpu
 	testl	%eax, %eax
@@ -701,6 +704,19 @@ SYM_DATA_START(boot_idt)
 	.endr
 SYM_DATA_END_LABEL(boot_idt, SYM_L_GLOBAL, boot_idt_end)
 
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+SYM_DATA_START(boot32_idt_desc)
+	.word   boot32_idt_end - boot32_idt - 1
+	.long   0
+SYM_DATA_END(boot32_idt_desc)
+	.balign 8
+SYM_DATA_START(boot32_idt)
+	.rept 32
+	.quad 0
+	.endr
+SYM_DATA_END_LABEL(boot32_idt, SYM_L_GLOBAL, boot32_idt_end)
+#endif
+
 #ifdef CONFIG_EFI_STUB
 SYM_DATA(image_offset, .long 0)
 #endif
@@ -793,6 +809,62 @@ SYM_DATA_START_LOCAL(loaded_image_proto)
 SYM_DATA_END(loaded_image_proto)
 #endif
 
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+	__HEAD
+	.code32
+/*
+ * Write an IDT entry into boot32_idt
+ *
+ * Parameters:
+ *
+ * %eax:	Handler address
+ * %edx:	Vector number
+ *
+ * Physical offset is expected in %ebp
+ */
+SYM_FUNC_START(startup32_set_idt_entry)
+	push    %ebx
+	push    %ecx
+
+	/* IDT entry address to %ebx */
+	leal    rva(boot32_idt)(%ebp), %ebx
+	shl	$3, %edx
+	addl    %edx, %ebx
+
+	/* Build IDT entry, lower 4 bytes */
+	movl    %eax, %edx
+	andl    $0x0000ffff, %edx	# Target code segment offset [15:0]
+	movl    $__KERNEL32_CS, %ecx	# Target code segment selector
+	shl     $16, %ecx
+	orl     %ecx, %edx
+
+	/* Store lower 4 bytes to IDT */
+	movl    %edx, (%ebx)
+
+	/* Build IDT entry, upper 4 bytes */
+	movl    %eax, %edx
+	andl    $0xffff0000, %edx	# Target code segment offset [31:16]
+	orl     $0x00008e00, %edx	# Present, Type 32-bit Interrupt Gate
+
+	/* Store upper 4 bytes to IDT */
+	movl    %edx, 4(%ebx)
+
+	pop     %ecx
+	pop     %ebx
+	ret
+SYM_FUNC_END(startup32_set_idt_entry)
+#endif
+
+SYM_FUNC_START(startup32_load_idt)
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+	/* Load IDT */
+	leal	rva(boot32_idt)(%ebp), %eax
+	movl	%eax, rva(boot32_idt_desc+2)(%ebp)
+	lidt    rva(boot32_idt_desc)(%ebp)
+#endif
+	ret
+SYM_FUNC_END(startup32_load_idt)
+
 /*
  * Stack and heap for uncompression
  */
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
