Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB1E18AF1C
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:14:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0EA55881DE;
	Thu, 19 Mar 2020 09:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2WVa6kBRt1a; Thu, 19 Mar 2020 09:14:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 95EB6882DD;
	Thu, 19 Mar 2020 09:14:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78081C07FF;
	Thu, 19 Mar 2020 09:14:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0647BC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E79D0226D4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHFkp-n9oz6o
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id BB8832051F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:34 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6428B546; Thu, 19 Mar 2020 10:14:21 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 28/70] x86/idt: Move two function from k/idt.c to i/a/desc.h
Date: Thu, 19 Mar 2020 10:13:25 +0100
Message-Id: <20200319091407.1481-29-joro@8bytes.org>
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
index 68a99d2a5f33..80bf63c08007 100644
--- a/arch/x86/include/asm/desc.h
+++ b/arch/x86/include/asm/desc.h
@@ -389,6 +389,33 @@ static inline void set_desc_limit(struct desc_struct *desc, unsigned long limit)
 void update_intr_gate(unsigned int n, const void *addr);
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
 
 #ifdef CONFIG_X86_64
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
index c752027abc9e..4a2c7791c697 100644
--- a/arch/x86/kernel/idt.c
+++ b/arch/x86/kernel/idt.c
@@ -9,13 +9,6 @@
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
 
@@ -204,20 +197,6 @@ const struct desc_ptr debug_idt_descr = {
 };
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
 static void
 idt_setup_from_table(gate_desc *idt, const struct idt_data *t, int size, bool sys)
 {
@@ -231,19 +210,6 @@ idt_setup_from_table(gate_desc *idt, const struct idt_data *t, int size, bool sy
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
 static void set_intr_gate(unsigned int n, const void *addr)
 {
 	struct idt_data data;
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
