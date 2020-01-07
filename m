Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DA496132B84
	for <lists.virtualization@lfdr.de>; Tue,  7 Jan 2020 17:53:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 875B483638;
	Tue,  7 Jan 2020 16:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVKaabkSsZAH; Tue,  7 Jan 2020 16:53:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D5EE3834FE;
	Tue,  7 Jan 2020 16:53:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C511FC1D82;
	Tue,  7 Jan 2020 16:53:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A16C9C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 16:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 88AB9876F2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 16:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSQaUGSjzn8J
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 16:53:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C0FBD87762
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 16:53:38 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA79D222D9;
 Tue,  7 Jan 2020 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578416018;
 bh=PNN7dlJTmEky+NUaaDTzRSu4j6j/ysVCFrpoVxYBApA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QRU7+8aH01DNd/5WdDLDp7Pbj60ipcsUgpLo+cZ8VajAsfo0Qt4VKM1JujozBqIWl
 PD+jRlIZn3zE1Vtrsv6uBO54zPRMt8wf0ceqLBjexJiGttZEEvsbe7LzFEiIBPNV76
 pazcEjfjZTeBefPXrZ9ULjqekbqneHZyMwsgOJHM=
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
Subject: [RFT 01/13] iomap: Constify ioreadX() iomem argument (as in generic
 implementation)
Date: Tue,  7 Jan 2020 17:52:58 +0100
Message-Id: <1578415992-24054-2-git-send-email-krzk@kernel.org>
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

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 include/asm-generic/iomap.h           | 22 +++++++++++-----------
 include/linux/io-64-nonatomic-hi-lo.h |  4 ++--
 include/linux/io-64-nonatomic-lo-hi.h |  4 ++--
 lib/iomap.c                           | 18 +++++++++---------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/include/asm-generic/iomap.h b/include/asm-generic/iomap.h
index 9d28a5e82f73..986e894bef49 100644
--- a/include/asm-generic/iomap.h
+++ b/include/asm-generic/iomap.h
@@ -26,14 +26,14 @@
  * in the low address range. Architectures for which this is not
  * true can't use this generic implementation.
  */
-extern unsigned int ioread8(void __iomem *);
-extern unsigned int ioread16(void __iomem *);
-extern unsigned int ioread16be(void __iomem *);
-extern unsigned int ioread32(void __iomem *);
-extern unsigned int ioread32be(void __iomem *);
+extern unsigned int ioread8(const void __iomem *);
+extern unsigned int ioread16(const void __iomem *);
+extern unsigned int ioread16be(const void __iomem *);
+extern unsigned int ioread32(const void __iomem *);
+extern unsigned int ioread32be(const void __iomem *);
 #ifdef CONFIG_64BIT
-extern u64 ioread64(void __iomem *);
-extern u64 ioread64be(void __iomem *);
+extern u64 ioread64(const void __iomem *);
+extern u64 ioread64be(const void __iomem *);
 #endif
 
 #ifdef readq
@@ -41,10 +41,10 @@ extern u64 ioread64be(void __iomem *);
 #define ioread64_hi_lo ioread64_hi_lo
 #define ioread64be_lo_hi ioread64be_lo_hi
 #define ioread64be_hi_lo ioread64be_hi_lo
-extern u64 ioread64_lo_hi(void __iomem *addr);
-extern u64 ioread64_hi_lo(void __iomem *addr);
-extern u64 ioread64be_lo_hi(void __iomem *addr);
-extern u64 ioread64be_hi_lo(void __iomem *addr);
+extern u64 ioread64_lo_hi(const void __iomem *addr);
+extern u64 ioread64_hi_lo(const void __iomem *addr);
+extern u64 ioread64be_lo_hi(const void __iomem *addr);
+extern u64 ioread64be_hi_lo(const void __iomem *addr);
 #endif
 
 extern void iowrite8(u8, void __iomem *);
diff --git a/include/linux/io-64-nonatomic-hi-lo.h b/include/linux/io-64-nonatomic-hi-lo.h
index ae21b72cce85..f32522bb3aa5 100644
--- a/include/linux/io-64-nonatomic-hi-lo.h
+++ b/include/linux/io-64-nonatomic-hi-lo.h
@@ -57,7 +57,7 @@ static inline void hi_lo_writeq_relaxed(__u64 val, volatile void __iomem *addr)
 
 #ifndef ioread64_hi_lo
 #define ioread64_hi_lo ioread64_hi_lo
-static inline u64 ioread64_hi_lo(void __iomem *addr)
+static inline u64 ioread64_hi_lo(const void __iomem *addr)
 {
 	u32 low, high;
 
@@ -79,7 +79,7 @@ static inline void iowrite64_hi_lo(u64 val, void __iomem *addr)
 
 #ifndef ioread64be_hi_lo
 #define ioread64be_hi_lo ioread64be_hi_lo
-static inline u64 ioread64be_hi_lo(void __iomem *addr)
+static inline u64 ioread64be_hi_lo(const void __iomem *addr)
 {
 	u32 low, high;
 
diff --git a/include/linux/io-64-nonatomic-lo-hi.h b/include/linux/io-64-nonatomic-lo-hi.h
index faaa842dbdb9..448a21435dba 100644
--- a/include/linux/io-64-nonatomic-lo-hi.h
+++ b/include/linux/io-64-nonatomic-lo-hi.h
@@ -57,7 +57,7 @@ static inline void lo_hi_writeq_relaxed(__u64 val, volatile void __iomem *addr)
 
 #ifndef ioread64_lo_hi
 #define ioread64_lo_hi ioread64_lo_hi
-static inline u64 ioread64_lo_hi(void __iomem *addr)
+static inline u64 ioread64_lo_hi(const void __iomem *addr)
 {
 	u32 low, high;
 
@@ -79,7 +79,7 @@ static inline void iowrite64_lo_hi(u64 val, void __iomem *addr)
 
 #ifndef ioread64be_lo_hi
 #define ioread64be_lo_hi ioread64be_lo_hi
-static inline u64 ioread64be_lo_hi(void __iomem *addr)
+static inline u64 ioread64be_lo_hi(const void __iomem *addr)
 {
 	u32 low, high;
 
diff --git a/lib/iomap.c b/lib/iomap.c
index e909ab71e995..3b10c0ab2cee 100644
--- a/lib/iomap.c
+++ b/lib/iomap.c
@@ -70,27 +70,27 @@ static void bad_io_access(unsigned long port, const char *access)
 #define mmio_read64be(addr) swab64(readq(addr))
 #endif
 
-unsigned int ioread8(void __iomem *addr)
+unsigned int ioread8(const void __iomem *addr)
 {
 	IO_COND(addr, return inb(port), return readb(addr));
 	return 0xff;
 }
-unsigned int ioread16(void __iomem *addr)
+unsigned int ioread16(const void __iomem *addr)
 {
 	IO_COND(addr, return inw(port), return readw(addr));
 	return 0xffff;
 }
-unsigned int ioread16be(void __iomem *addr)
+unsigned int ioread16be(const void __iomem *addr)
 {
 	IO_COND(addr, return pio_read16be(port), return mmio_read16be(addr));
 	return 0xffff;
 }
-unsigned int ioread32(void __iomem *addr)
+unsigned int ioread32(const void __iomem *addr)
 {
 	IO_COND(addr, return inl(port), return readl(addr));
 	return 0xffffffff;
 }
-unsigned int ioread32be(void __iomem *addr)
+unsigned int ioread32be(const void __iomem *addr)
 {
 	IO_COND(addr, return pio_read32be(port), return mmio_read32be(addr));
 	return 0xffffffff;
@@ -142,26 +142,26 @@ static u64 pio_read64be_hi_lo(unsigned long port)
 	return lo | (hi << 32);
 }
 
-u64 ioread64_lo_hi(void __iomem *addr)
+u64 ioread64_lo_hi(const void __iomem *addr)
 {
 	IO_COND(addr, return pio_read64_lo_hi(port), return readq(addr));
 	return 0xffffffffffffffffULL;
 }
 
-u64 ioread64_hi_lo(void __iomem *addr)
+u64 ioread64_hi_lo(const void __iomem *addr)
 {
 	IO_COND(addr, return pio_read64_hi_lo(port), return readq(addr));
 	return 0xffffffffffffffffULL;
 }
 
-u64 ioread64be_lo_hi(void __iomem *addr)
+u64 ioread64be_lo_hi(const void __iomem *addr)
 {
 	IO_COND(addr, return pio_read64be_lo_hi(port),
 		return mmio_read64be(addr));
 	return 0xffffffffffffffffULL;
 }
 
-u64 ioread64be_hi_lo(void __iomem *addr)
+u64 ioread64be_hi_lo(const void __iomem *addr)
 {
 	IO_COND(addr, return pio_read64be_hi_lo(port),
 		return mmio_read64be(addr));
-- 
2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
