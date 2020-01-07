Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF5F132BB5
	for <lists.virtualization@lfdr.de>; Tue,  7 Jan 2020 17:54:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2FC1585516;
	Tue,  7 Jan 2020 16:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axvmzbSUzqYk; Tue,  7 Jan 2020 16:54:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9766684EA3;
	Tue,  7 Jan 2020 16:54:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70439C1D82;
	Tue,  7 Jan 2020 16:54:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E99F8C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 16:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D573485F6D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 16:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXR6qCRBM+2E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 16:54:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 363F68473A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 16:54:24 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CEF024672;
 Tue,  7 Jan 2020 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578416064;
 bh=2zmjQSgD8TUd+U/JXCAsWNwzIF8jkVNNKEAA8l1Dcpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IMHrx9nAEiFarSqvtu2/vk+IbnQLQCCvZubru+ApR0+a1II5IMJsKPCvn4CRa7l14
 yGAtxp91v83yR8uq1xCCHKuOxZ3MFe7Ijp0KXA6vwhVdSaK7uN94czACe0FLa1GEHR
 nT8Ol1jedN5+vrv5XQ0Zncq/XEMOIzrFbxYUU5Es=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jiri Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-ntb@googlegroups.com, virtualization@lists.linux-foundation.org,
 linux-arch@vger.kernel.org
Subject: [RFT 04/13] parisc: Constify ioreadX() iomem argument (as in generic
 implementation)
Date: Tue,  7 Jan 2020 17:53:03 +0100
Message-Id: <1578415992-24054-7-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578415992-24054-1-git-send-email-krzk@kernel.org>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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

The ioreadX() helpers have inconsistent interface.  On some architectures
void *__iomem address argument is a pointer to const, on some not.

Implementations of ioreadX() do not modify the memory under the address
so they can be converted to a "const" version for const-safety and
consistency among architectures.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/parisc/include/asm/io.h |  4 ++--
 arch/parisc/lib/iomap.c      | 48 ++++++++++++++++++++++----------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index cab8f64ca4a2..f48fb8d76e15 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -303,8 +303,8 @@ extern void outsl (unsigned long port, const void *src, unsigned long count);
 #define ioread64be ioread64be
 #define iowrite64 iowrite64
 #define iowrite64be iowrite64be
-extern u64 ioread64(void __iomem *addr);
-extern u64 ioread64be(void __iomem *addr);
+extern u64 ioread64(const void __iomem *addr);
+extern u64 ioread64be(const void __iomem *addr);
 extern void iowrite64(u64 val, void __iomem *addr);
 extern void iowrite64be(u64 val, void __iomem *addr);
 
diff --git a/arch/parisc/lib/iomap.c b/arch/parisc/lib/iomap.c
index 0195aec657e2..e01345d2a7d9 100644
--- a/arch/parisc/lib/iomap.c
+++ b/arch/parisc/lib/iomap.c
@@ -43,13 +43,13 @@
 #endif
 
 struct iomap_ops {
-	unsigned int (*read8)(void __iomem *);
-	unsigned int (*read16)(void __iomem *);
-	unsigned int (*read16be)(void __iomem *);
-	unsigned int (*read32)(void __iomem *);
-	unsigned int (*read32be)(void __iomem *);
-	u64 (*read64)(void __iomem *);
-	u64 (*read64be)(void __iomem *);
+	unsigned int (*read8)(const void __iomem *);
+	unsigned int (*read16)(const void __iomem *);
+	unsigned int (*read16be)(const void __iomem *);
+	unsigned int (*read32)(const void __iomem *);
+	unsigned int (*read32be)(const void __iomem *);
+	u64 (*read64)(const void __iomem *);
+	u64 (*read64be)(const void __iomem *);
 	void (*write8)(u8, void __iomem *);
 	void (*write16)(u16, void __iomem *);
 	void (*write16be)(u16, void __iomem *);
@@ -69,17 +69,17 @@ struct iomap_ops {
 
 #define ADDR2PORT(addr) ((unsigned long __force)(addr) & 0xffffff)
 
-static unsigned int ioport_read8(void __iomem *addr)
+static unsigned int ioport_read8(const void __iomem *addr)
 {
 	return inb(ADDR2PORT(addr));
 }
 
-static unsigned int ioport_read16(void __iomem *addr)
+static unsigned int ioport_read16(const void __iomem *addr)
 {
 	return inw(ADDR2PORT(addr));
 }
 
-static unsigned int ioport_read32(void __iomem *addr)
+static unsigned int ioport_read32(const void __iomem *addr)
 {
 	return inl(ADDR2PORT(addr));
 }
@@ -150,37 +150,37 @@ static const struct iomap_ops ioport_ops = {
 
 /* Legacy I/O memory ops */
 
-static unsigned int iomem_read8(void __iomem *addr)
+static unsigned int iomem_read8(const void __iomem *addr)
 {
 	return readb(addr);
 }
 
-static unsigned int iomem_read16(void __iomem *addr)
+static unsigned int iomem_read16(const void __iomem *addr)
 {
 	return readw(addr);
 }
 
-static unsigned int iomem_read16be(void __iomem *addr)
+static unsigned int iomem_read16be(const void __iomem *addr)
 {
 	return __raw_readw(addr);
 }
 
-static unsigned int iomem_read32(void __iomem *addr)
+static unsigned int iomem_read32(const void __iomem *addr)
 {
 	return readl(addr);
 }
 
-static unsigned int iomem_read32be(void __iomem *addr)
+static unsigned int iomem_read32be(const void __iomem *addr)
 {
 	return __raw_readl(addr);
 }
 
-static u64 iomem_read64(void __iomem *addr)
+static u64 iomem_read64(const void __iomem *addr)
 {
 	return readq(addr);
 }
 
-static u64 iomem_read64be(void __iomem *addr)
+static u64 iomem_read64be(const void __iomem *addr)
 {
 	return __raw_readq(addr);
 }
@@ -297,49 +297,49 @@ static const struct iomap_ops *iomap_ops[8] = {
 };
 
 
-unsigned int ioread8(void __iomem *addr)
+unsigned int ioread8(const void __iomem *addr)
 {
 	if (unlikely(INDIRECT_ADDR(addr)))
 		return iomap_ops[ADDR_TO_REGION(addr)]->read8(addr);
 	return *((u8 *)addr);
 }
 
-unsigned int ioread16(void __iomem *addr)
+unsigned int ioread16(const void __iomem *addr)
 {
 	if (unlikely(INDIRECT_ADDR(addr)))
 		return iomap_ops[ADDR_TO_REGION(addr)]->read16(addr);
 	return le16_to_cpup((u16 *)addr);
 }
 
-unsigned int ioread16be(void __iomem *addr)
+unsigned int ioread16be(const void __iomem *addr)
 {
 	if (unlikely(INDIRECT_ADDR(addr)))
 		return iomap_ops[ADDR_TO_REGION(addr)]->read16be(addr);
 	return *((u16 *)addr);
 }
 
-unsigned int ioread32(void __iomem *addr)
+unsigned int ioread32(const void __iomem *addr)
 {
 	if (unlikely(INDIRECT_ADDR(addr)))
 		return iomap_ops[ADDR_TO_REGION(addr)]->read32(addr);
 	return le32_to_cpup((u32 *)addr);
 }
 
-unsigned int ioread32be(void __iomem *addr)
+unsigned int ioread32be(const void __iomem *addr)
 {
 	if (unlikely(INDIRECT_ADDR(addr)))
 		return iomap_ops[ADDR_TO_REGION(addr)]->read32be(addr);
 	return *((u32 *)addr);
 }
 
-u64 ioread64(void __iomem *addr)
+u64 ioread64(const void __iomem *addr)
 {
 	if (unlikely(INDIRECT_ADDR(addr)))
 		return iomap_ops[ADDR_TO_REGION(addr)]->read64(addr);
 	return le64_to_cpup((u64 *)addr);
 }
 
-u64 ioread64be(void __iomem *addr)
+u64 ioread64be(const void __iomem *addr)
 {
 	if (unlikely(INDIRECT_ADDR(addr)))
 		return iomap_ops[ADDR_TO_REGION(addr)]->read64be(addr);
-- 
2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
