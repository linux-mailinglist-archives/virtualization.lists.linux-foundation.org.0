Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 218D01734AD
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 10:58:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7054B880F4;
	Fri, 28 Feb 2020 09:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7rO6FwG2cTLJ; Fri, 28 Feb 2020 09:57:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C09D6880E2;
	Fri, 28 Feb 2020 09:57:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B14C2C0177;
	Fri, 28 Feb 2020 09:57:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 122A7C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 09:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0DE69880CC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 09:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IkWWgIDK-X8b
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 09:57:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 329A487B62
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 09:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582883874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GPbQbSnoNIR6NB2KmPCWbBbobv0Ny01rSEGtvs/xj88=;
 b=CuenHnSTADyrYMn9XuDRzNh+V8y8zDywz+sTu7L2e5G3mHbgbff1G81ggDK9xXY2GSc3qT
 OZUQJJykf8NDEhnwXN/5E8+5v2SDl8df8/rVMEbLt2u92kuk5j2LMUSBv6halbLJ1PdV0S
 vFWDZ5wyyj2zad0d/jfJmaGZsQ/gxmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-vssKmzpaPymKpi8qdrE8vA-1; Fri, 28 Feb 2020 04:57:51 -0500
X-MC-Unique: vssKmzpaPymKpi8qdrE8vA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DF1C800D53;
 Fri, 28 Feb 2020 09:57:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE3F319C7F;
 Fri, 28 Feb 2020 09:57:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 183EF17447; Fri, 28 Feb 2020 10:57:48 +0100 (CET)
Date: Fri, 28 Feb 2020 10:57:48 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH] drm/bochs: Remove vga write
Message-ID: <20200228095748.uu4sqkz6y477eabc@sirius.home.kraxel.org>
References: <20200227210454.18217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227210454.18217-1-alistair.francis@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: airlied@linux.ie, Khem Raj <raj.khem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, daniel@ffwll.ch,
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

On Thu, Feb 27, 2020 at 01:04:54PM -0800, Alistair Francis wrote:
> The QEMU model for the Bochs display has no VGA memory section at offset
> 0x400 [1]. By writing to this register Linux can create a write to
> unassigned memory which depending on machine and architecture can result
> in a store fault.
> 
> I don't see any reference to this address at OSDev [2] or in the Bochs
> source code.
> 
> Removing this write still allows graphics to work inside QEMU with
> the bochs-display.

It's not that simple.  The driver also handles the qemu stdvga (-device
VGA, -device secondary-vga) which *does* need the vga port write.
There is no way for the guest to figure whenever the device is
secondary-vga or bochs-display.

So how about fixing things on the host side?  Does qemu patch below
help?

Maybe another possible approach is to enable/disable vga access per
arch.  On x86 this doesn't cause any problems.  I guess you are on
risc-v?

cheers,
  Gerd

diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 62085f9fc063..e93e838243b8 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -151,6 +151,26 @@ static const MemoryRegionOps bochs_display_qext_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static uint64_t dummy_read(void *ptr, hwaddr addr, unsigned size)
+{
+    return -1;
+}
+
+static void dummy_write(void *ptr, hwaddr addr,
+                        uint64_t val, unsigned size)
+{
+}
+
+static const MemoryRegionOps dummy_ops = {
+    .read = dummy_read,
+    .write = dummy_write,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
+    .impl.min_access_size = 1,
+    .impl.max_access_size = 1,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
 static int bochs_display_get_mode(BochsDisplayState *s,
                                    BochsDisplayMode *mode)
 {
@@ -284,8 +304,8 @@ static void bochs_display_realize(PCIDevice *dev, Error **errp)
     memory_region_init_io(&s->qext, obj, &bochs_display_qext_ops, s,
                           "qemu extended regs", PCI_VGA_QEXT_SIZE);
 
-    memory_region_init(&s->mmio, obj, "bochs-display-mmio",
-                       PCI_VGA_MMIO_SIZE);
+    memory_region_init_io(&s->mmio, obj, &dummy_ops, NULL,
+                          "bochs-display-mmio", PCI_VGA_MMIO_SIZE);
     memory_region_add_subregion(&s->mmio, PCI_VGA_BOCHS_OFFSET, &s->vbe);
     memory_region_add_subregion(&s->mmio, PCI_VGA_QEXT_OFFSET, &s->qext);
 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
