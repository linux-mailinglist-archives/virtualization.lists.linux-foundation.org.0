Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC9164CCE
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 18:52:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A4BE486B28;
	Wed, 19 Feb 2020 17:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8a84xo1xRnh; Wed, 19 Feb 2020 17:52:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C53486BC4;
	Wed, 19 Feb 2020 17:52:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21BC1C013E;
	Wed, 19 Feb 2020 17:52:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FDB3C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 17:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6E16D85078
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 17:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LaEXbzor0jeW
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 17:52:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0156C8502A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 17:52:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5864A2467D;
 Wed, 19 Feb 2020 17:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582134729;
 bh=iR+Ao5saiVxRTvb2au3o6+lrJj/L8pgoUJPaqHXT/tQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pw+9ejv73mhY1CR0G17KZh3Lsqa5fiV0O/7QI6gk9U2PDs9MO3ClU02Y37BTLXByA
 GN0d182iKI80TD2kQnS9S6hifIyWgmQDeqbf00LTAX3OWcGloRKcgGg2t8jDCWtng+
 jSpnBjCv8a/bUDQcIr+HVIMFPZ9vmp1qxH03hhJk=
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
 Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-ntb@googlegroups.com, virtualization@lists.linux-foundation.org,
 linux-arch@vger.kernel.org
Subject: [RESEND PATCH v2 6/9] drm/mgag200: Constify ioreadX() iomem argument
 (as in generic implementation)
Date: Wed, 19 Feb 2020 18:50:04 +0100
Message-Id: <20200219175007.13627-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200219175007.13627-1-krzk@kernel.org>
References: <20200219175007.13627-1-krzk@kernel.org>
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

---

Changes since v1:
1. Add Thomas' review.
---
 drivers/gpu/drm/mgag200/mgag200_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index aa32aad222c2..6512b3af4fb7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -34,9 +34,9 @@
 
 #define MGAG200FB_CONN_LIMIT 1
 
-#define RREG8(reg) ioread8(((void __iomem *)mdev->rmmio) + (reg))
+#define RREG8(reg) ioread8(((const void __iomem *)mdev->rmmio) + (reg))
 #define WREG8(reg, v) iowrite8(v, ((void __iomem *)mdev->rmmio) + (reg))
-#define RREG32(reg) ioread32(((void __iomem *)mdev->rmmio) + (reg))
+#define RREG32(reg) ioread32(((const void __iomem *)mdev->rmmio) + (reg))
 #define WREG32(reg, v) iowrite32(v, ((void __iomem *)mdev->rmmio) + (reg))
 
 #define ATTR_INDEX 0x1fc0
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
