Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D991729F5
	for <lists.virtualization@lfdr.de>; Thu, 27 Feb 2020 22:12:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE1328803E;
	Thu, 27 Feb 2020 21:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-7y1QXR4Sl4; Thu, 27 Feb 2020 21:12:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5849F88075;
	Thu, 27 Feb 2020 21:12:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25591C0177;
	Thu, 27 Feb 2020 21:12:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53290C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 21:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 41C1287954
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 21:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdeVjJ4j1Xhg
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 21:12:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2CCA5878A4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 21:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1582837943; x=1614373943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AZYzhno8a1AffpbwkqfiLIlm+fMZL1Dp81qcUzuHaRE=;
 b=j4NRTqRnsB/C9nEzFtTyaOHUuAS8ude3+XqjAMDKhnQt93PQi8rJnW7M
 +46VzX2gteUBwTqqJE+kBdZYl2kKtAPpQqIsWdsGhB3GJRNbCChw1fmjJ
 k25Z0BL6dsIUMJiFY25dnjEMC73wPk0zgp3AhibA8b9dSfuC6nDZ5ZBKz
 ZoYGGswD84r3ZMQPGfFglTCB4BKqthOVNa0SuhPvJbjN9yarWMwKqQx9X
 qdzHjvBHBOKfGr+9lvzSryjpgaAt0tcoKVMjbDZi6sWRoJVardlodtjGA
 5sxMWlmg6n8XcK0UP9zbADbtlpOLPFKR+hfRghXkX1sJriIqTE9DDAjWt A==;
IronPort-SDR: HvCpG7ZdTjHKFA3oCP3wA1Vz0UWp7HZy0j+DEU0SNxp41eECd79S3kpaM/fPcqpm88BsL6yFwS
 Y7m+zR+QNRspdBLU6m+EIIRyRQQuBpUiAf6wsLFd7lyNJk9AKbSsNgV6pKMXCsft5r943xKxS8
 LI+v4BhVkzRbt5hmxkIWaXC3Lv/IsHWyGT2xqw8zqvIp1FAgkRdVXSxsYOF5BelArv0ohRLDsb
 wtVkuE0y2DuNn9pCh/dsPQE/N4uVn4kWvFHgpOcXdtz0nwFfEgY0BaASE2bbufY6BE0VgQ+v3f
 etg=
X-URL-LookUp-ScanningError: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574092800"; d="scan'208";a="232858613"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Feb 2020 05:12:22 +0800
IronPort-SDR: oYBYrFQ8CWBWqssr2m3EwfEeAD4UFmbwMTRGy0bjn1k8LUkmtR4FYsVfyR6PbNWixhk5VgenzU
 ozVM/luc5w1+4LmJ5RcgfUl/ASiMaTAGfX0Fbdtjdnixn8I6Fe5e0a5qx+pN7SxqBuzRhecqP4
 SpPj1WHx16e+nPB7y6/Cawvd3XLTkGflWr/s+S3cFjdqbANiQQT1Nj26w4jS+DYvl5jl9gHpZs
 ParrRoSh0NvrYUm5iSlQ98ZdbPwM1oDszqi7IGdE06pErWIM1cW7fpo28jLdczJX08ZFnpcpvH
 CCIqT19x+/WQt/Xw7WGxvFTl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 13:04:30 -0800
IronPort-SDR: 13dHDQuDjVqwy8bQJ4BCMMPrMoM5zJFnejUUpuHIR70QwoFMAzTZphl0K1TRDjvt+V0mHY7dIN
 2qrCH9bD+NIRABatKHGwCexrRun/O6kt8oA/zGcHQKKX595Rv+/rS4Ea1pA9iqyzrzH7m/GuSw
 lNiCDt6q370n/YxDOk1tbF4xHMpTdaq65VQNiUB1n7f8ZG5go43b6PXOiwkT3eK/xHacdX0YDt
 nMD/aHbGf8kboB85aZrMza641cM7iDDZd3i74SeIxVcubdbqLaxNjirWa8S9GNKxIRw0RVlDag
 zGg=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Feb 2020 13:12:06 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH] drm/bochs: Remove vga write
Date: Thu, 27 Feb 2020 13:04:54 -0800
Message-Id: <20200227210454.18217-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: airlied@linux.ie, Khem Raj <raj.khem@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, daniel@ffwll.ch,
 alistair23@gmail.com
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

The QEMU model for the Bochs display has no VGA memory section at offset
0x400 [1]. By writing to this register Linux can create a write to
unassigned memory which depending on machine and architecture can result
in a store fault.

I don't see any reference to this address at OSDev [2] or in the Bochs
source code.

Removing this write still allows graphics to work inside QEMU with
the bochs-display.

1: https://gitlab.com/qemu-project/qemu/-/blob/master/hw/display/bochs-display.c#L264
2. https://wiki.osdev.org/Bochs_VBE_Extensions

Reported-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/gpu/drm/bochs/bochs_hw.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
index b615b7dfdd9d..dfb2a5363c62 100644
--- a/drivers/gpu/drm/bochs/bochs_hw.c
+++ b/drivers/gpu/drm/bochs/bochs_hw.c
@@ -10,19 +10,6 @@
 
 /* ---------------------------------------------------------------------- */
 
-static void bochs_vga_writeb(struct bochs_device *bochs, u16 ioport, u8 val)
-{
-	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
-		return;
-
-	if (bochs->mmio) {
-		int offset = ioport - 0x3c0 + 0x400;
-		writeb(val, bochs->mmio + offset);
-	} else {
-		outb(val, ioport);
-	}
-}
-
 static u16 bochs_dispi_read(struct bochs_device *bochs, u16 reg)
 {
 	u16 ret = 0;
@@ -217,8 +204,6 @@ void bochs_hw_setmode(struct bochs_device *bochs,
 			 bochs->xres, bochs->yres, bochs->bpp,
 			 bochs->yres_virtual);
 
-	bochs_vga_writeb(bochs, 0x3c0, 0x20); /* unblank */
-
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,      0);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BPP,         bochs->bpp);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_XRES,        bochs->xres);
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
