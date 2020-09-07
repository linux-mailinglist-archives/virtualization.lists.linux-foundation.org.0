Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4486225FB31
	for <lists.virtualization@lfdr.de>; Mon,  7 Sep 2020 15:17:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E4338867A8;
	Mon,  7 Sep 2020 13:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jpm7Doba0Omu; Mon,  7 Sep 2020 13:17:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 31EC98671E;
	Mon,  7 Sep 2020 13:17:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22511C0051;
	Mon,  7 Sep 2020 13:17:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05851C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F22C22155D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6BDfFYrPZXbn
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:17:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id B362220500
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:17:02 +0000 (UTC)
Received: from cap.home.8bytes.org (p549add56.dip0.t-ipconnect.de
 [84.154.221.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 8C0C4FF5;
 Mon,  7 Sep 2020 15:16:59 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v7 34/72] x86/idt: Move two function from k/idt.c to i/a/desc.h
Date: Mon,  7 Sep 2020 15:15:35 +0200
Message-Id: <20200907131613.12703-35-joro@8bytes.org>
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

Move these two functions from kernel/idt.c to include/asm/desc.h:

	* init_idt_data()
	* idt_init_desc()

These functions are needed to setup IDT entries very early and need to
be called from head64.c. To be usable this early these functions need to
be compiled without instrumentation and the stack-protector feature.
These features need to be kept enabled for kernel/idt.c, so head64.c
must use its own versions.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/desc.h      | 27 +++++++++++++++++++++++++
 arch/x86/include/asm/desc_defs.h |  7 +++++++
 arch/x86/kernel/idt.c            | 34 --------------------------------
 3 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/x86/include/asm/desc.h b/arch/x86/include/asm/desc.h
index 1ced11d31932..476082a83d1c 100644
--- a/arch/x86/include/asm/desc.h
+++ b/arch/x86/include/asm/desc.h
@@ -383,6 +383,33 @@ static inline void set_desc_limit(struct desc_struct *desc, unsigned long limit)
 
 void alloc_intr_gate(unsigned int n, const void *addr);
 
+static inline void init_idt_data(struct idt_data *data, unsigned int n,
+				 const void *addr)
+{
+	BUG_ON(n > 0xFF);
+
+	memset(data, 0, sizeof(*data));
+	data->vector	= n;
+	data->addr	= addr;
+	data->segment	= __KERNEL_CS;
+	data->bits.type	= GATE_INTERRUPT;
+	data->bits.p	= 1;
+}
+
+static inline void idt_init_desc(gate_desc *gate, const struct idt_data *d)
+{
+	unsigned long addr = (unsigned long) d->addr;
+
+	gate->offset_low	= (u16) addr;
+	gate->segment		= (u16) d->segment;
+	gate->bits		= d->bits;
+	gate->offset_middle	= (u16) (addr >> 16);
+#ifdef CONFIG_X86_64
+	gate->offset_high	= (u32) (addr >> 32);
+	gate->reserved		= 0;
+#endif
+}
+
 extern unsigned long system_vectors[];
 
 extern void load_current_idt(void);
diff --git a/arch/x86/include/asm/desc_defs.h b/arch/x86/include/asm/desc_defs.h
index 5621fb3f2d1a..f7e7099af595 100644
--- a/arch/x86/include/asm/desc_defs.h
+++ b/arch/x86/include/asm/desc_defs.h
@@ -74,6 +74,13 @@ struct idt_bits {
 			p	: 1;
 } __attribute__((packed));
 
+struct idt_data {
+	unsigned int	vector;
+	unsigned int	segment;
+	struct idt_bits	bits;
+	const void	*addr;
+};
+
 struct gate_struct {
 	u16		offset_low;
 	u16		segment;
diff --git a/arch/x86/kernel/idt.c b/arch/x86/kernel/idt.c
index 53946c104fa0..4bb4e3d6099e 100644
--- a/arch/x86/kernel/idt.c
+++ b/arch/x86/kernel/idt.c
@@ -11,13 +11,6 @@
 #include <asm/desc.h>
 #include <asm/hw_irq.h>
 
-struct idt_data {
-	unsigned int	vector;
-	unsigned int	segment;
-	struct idt_bits	bits;
-	const void	*addr;
-};
-
 #define DPL0		0x0
 #define DPL3		0x3
 
@@ -178,20 +171,6 @@ bool idt_is_f00f_address(unsigned long address)
 }
 #endif
 
-static inline void idt_init_desc(gate_desc *gate, const struct idt_data *d)
-{
-	unsigned long addr = (unsigned long) d->addr;
-
-	gate->offset_low	= (u16) addr;
-	gate->segment		= (u16) d->segment;
-	gate->bits		= d->bits;
-	gate->offset_middle	= (u16) (addr >> 16);
-#ifdef CONFIG_X86_64
-	gate->offset_high	= (u32) (addr >> 32);
-	gate->reserved		= 0;
-#endif
-}
-
 static __init void
 idt_setup_from_table(gate_desc *idt, const struct idt_data *t, int size, bool sys)
 {
@@ -205,19 +184,6 @@ idt_setup_from_table(gate_desc *idt, const struct idt_data *t, int size, bool sy
 	}
 }
 
-static void init_idt_data(struct idt_data *data, unsigned int n,
-			  const void *addr)
-{
-	BUG_ON(n > 0xFF);
-
-	memset(data, 0, sizeof(*data));
-	data->vector	= n;
-	data->addr	= addr;
-	data->segment	= __KERNEL_CS;
-	data->bits.type	= GATE_INTERRUPT;
-	data->bits.p	= 1;
-}
-
 static __init void set_intr_gate(unsigned int n, const void *addr)
 {
 	struct idt_data data;
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
