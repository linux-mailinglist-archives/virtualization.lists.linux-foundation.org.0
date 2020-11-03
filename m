Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADD52A4205
	for <lists.virtualization@lfdr.de>; Tue,  3 Nov 2020 11:33:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 96157860C6;
	Tue,  3 Nov 2020 10:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnBzrD7Vb4VU; Tue,  3 Nov 2020 10:33:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 49CE0860C0;
	Tue,  3 Nov 2020 10:33:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C6E2C0051;
	Tue,  3 Nov 2020 10:33:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04CB3C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D3B6A872D7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Ar3gMki1E5l
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4D1F6872A7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:29 +0000 (UTC)
Message-Id: <20201103095856.979798613@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=oF4DYonwtBNvmWHcqJ3amZKMdxENJ+WTSLMv3+rtHDM=;
 b=b6UWG1RXLdBy2bRiDY0A2P6zUTcJ5Ww3Hloamuegv/bL3cd0Jtr2ttgYbbJrW5BYak/rkk
 PIZxdNYfysNFn3hkTOqqRZTgj7HKUJeNhycoOe7m3Id4B0EFsqDbR5SzgKvmyNco7YPeDJ
 7zGBcL24S5tqjz5nUv65X7+akcl8LQTNORQzEg/iFXRbEmU8I/BDt33Ieg2A5XD5DrODpw
 Mks84NTPIQAyqEH3f2oDzt/ae9t4w9OMJO+I7JYrxIGeYRIj6k6PPK6tR2mIaKluksa7bD
 OXSaYC6IDAc3KYdm99Ww55f3jctY1IJoZnRNbxPldLZF+7xYm+DqO5Hw2kBfKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=oF4DYonwtBNvmWHcqJ3amZKMdxENJ+WTSLMv3+rtHDM=;
 b=7x5E7bhvi7aofzhhPh9QlETURgTfsCteOpP5xZ/APbluJpgTom1zgixNGKJtT0nUZF2P72
 bnhVHwiHvnfzpbCg==
Date: Tue, 03 Nov 2020 10:27:16 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 04/37] sh/highmem: Remove all traces of unused cruft
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>
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

For whatever reasons SH has highmem bits all over the place but does
not enable it via Kconfig. Remove the bitrot.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/sh/include/asm/fixmap.h     |    8 --------
 arch/sh/include/asm/kmap_types.h |   15 ---------------
 arch/sh/mm/init.c                |    8 --------
 3 files changed, 31 deletions(-)

--- a/arch/sh/include/asm/fixmap.h
+++ b/arch/sh/include/asm/fixmap.h
@@ -13,9 +13,6 @@
 #include <linux/kernel.h>
 #include <linux/threads.h>
 #include <asm/page.h>
-#ifdef CONFIG_HIGHMEM
-#include <asm/kmap_types.h>
-#endif
 
 /*
  * Here we define all the compile-time 'special' virtual
@@ -53,11 +50,6 @@ enum fixed_addresses {
 	FIX_CMAP_BEGIN,
 	FIX_CMAP_END = FIX_CMAP_BEGIN + (FIX_N_COLOURS * NR_CPUS) - 1,
 
-#ifdef CONFIG_HIGHMEM
-	FIX_KMAP_BEGIN,	/* reserved pte's for temporary kernel mappings */
-	FIX_KMAP_END = FIX_KMAP_BEGIN + (KM_TYPE_NR * NR_CPUS) - 1,
-#endif
-
 #ifdef CONFIG_IOREMAP_FIXED
 	/*
 	 * FIX_IOREMAP entries are useful for mapping physical address
--- a/arch/sh/include/asm/kmap_types.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __SH_KMAP_TYPES_H
-#define __SH_KMAP_TYPES_H
-
-/* Dummy header just to define km_type. */
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-#define  __WITH_KM_FENCE
-#endif
-
-#include <asm-generic/kmap_types.h>
-
-#undef __WITH_KM_FENCE
-
-#endif
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -362,9 +362,6 @@ void __init mem_init(void)
 	mem_init_print_info(NULL);
 	pr_info("virtual kernel memory layout:\n"
 		"    fixmap  : 0x%08lx - 0x%08lx   (%4ld kB)\n"
-#ifdef CONFIG_HIGHMEM
-		"    pkmap   : 0x%08lx - 0x%08lx   (%4ld kB)\n"
-#endif
 		"    vmalloc : 0x%08lx - 0x%08lx   (%4ld MB)\n"
 		"    lowmem  : 0x%08lx - 0x%08lx   (%4ld MB) (cached)\n"
 #ifdef CONFIG_UNCACHED_MAPPING
@@ -376,11 +373,6 @@ void __init mem_init(void)
 		FIXADDR_START, FIXADDR_TOP,
 		(FIXADDR_TOP - FIXADDR_START) >> 10,
 
-#ifdef CONFIG_HIGHMEM
-		PKMAP_BASE, PKMAP_BASE+LAST_PKMAP*PAGE_SIZE,
-		(LAST_PKMAP*PAGE_SIZE) >> 10,
-#endif
-
 		(unsigned long)VMALLOC_START, VMALLOC_END,
 		(VMALLOC_END - VMALLOC_START) >> 20,
 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
