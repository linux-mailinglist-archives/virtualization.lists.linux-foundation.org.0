Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A130D134C67
	for <lists.virtualization@lfdr.de>; Wed,  8 Jan 2020 21:06:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4D497867F0;
	Wed,  8 Jan 2020 20:06:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12cX2cgFB7gv; Wed,  8 Jan 2020 20:06:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD2C386501;
	Wed,  8 Jan 2020 20:06:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8DC8C0881;
	Wed,  8 Jan 2020 20:06:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BD9FC0881
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 20:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 37250867F0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 20:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q62W6u5lIRgr
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 20:06:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6598586501
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 20:06:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [83.218.167.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E2BE2073A;
 Wed,  8 Jan 2020 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578513965;
 bh=lYWtWdFG1v7IfR5zl1MjYhtyH9xI6vZktihUgkHSwFA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=H5CQ+BGAgkoSQN8Qd3skuqO8AQtR7gSIu6SJnAp5tUSx0GOuOHmcFsnSVlrz5qu60
 I+KrYCyOLJk5hvi2EmTAJT6rlbwZVyYzYDMIjJjEga35wbyx04DMzh1LATCFkAnIq3
 iOtW5KqiN0TYEMTLaK/VBRSXO5MCAwVp1qhY+EaQ=
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
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-ntb@googlegroups.com, virtualization@lists.linux-foundation.org,
 linux-arch@vger.kernel.org
Subject: [PATCH v2 2/9] net: wireless: rtl818x: Constify ioreadX() iomem
 argument (as in generic implementation)
Date: Wed,  8 Jan 2020 21:05:21 +0100
Message-Id: <20200108200528.4614-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108200528.4614-1-krzk@kernel.org>
References: <20200108200528.4614-1-krzk@kernel.org>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---

Changes since v1:
1. Add Geert's review.
---
 drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8180.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8180.h b/drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8180.h
index 7948a2da195a..2ff00800d45b 100644
--- a/drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8180.h
+++ b/drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8180.h
@@ -150,17 +150,17 @@ void rtl8180_write_phy(struct ieee80211_hw *dev, u8 addr, u32 data);
 void rtl8180_set_anaparam(struct rtl8180_priv *priv, u32 anaparam);
 void rtl8180_set_anaparam2(struct rtl8180_priv *priv, u32 anaparam2);
 
-static inline u8 rtl818x_ioread8(struct rtl8180_priv *priv, u8 __iomem *addr)
+static inline u8 rtl818x_ioread8(struct rtl8180_priv *priv, const u8 __iomem *addr)
 {
 	return ioread8(addr);
 }
 
-static inline u16 rtl818x_ioread16(struct rtl8180_priv *priv, __le16 __iomem *addr)
+static inline u16 rtl818x_ioread16(struct rtl8180_priv *priv, const __le16 __iomem *addr)
 {
 	return ioread16(addr);
 }
 
-static inline u32 rtl818x_ioread32(struct rtl8180_priv *priv, __le32 __iomem *addr)
+static inline u32 rtl818x_ioread32(struct rtl8180_priv *priv, const __le32 __iomem *addr)
 {
 	return ioread32(addr);
 }
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
