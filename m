Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBCE2A420C
	for <lists.virtualization@lfdr.de>; Tue,  3 Nov 2020 11:33:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE95A860EA;
	Tue,  3 Nov 2020 10:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ptnD4UG6aY3R; Tue,  3 Nov 2020 10:33:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3D41A860C4;
	Tue,  3 Nov 2020 10:33:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2885CC0889;
	Tue,  3 Nov 2020 10:33:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 958E9C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 80E0586DE7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kerYiXqShHEt
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9306286E2F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:33 +0000 (UTC)
Message-Id: <20201103095857.268258322@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=mZznvRq2pjMB0UxfV7Tofiw+ZX8bqdvzvy1elzwqCM0=;
 b=iJ/nMPZ/ADH458Z97fsOSw5wf904BzHADYKEdaFCBP8jKIH9j+SxmjzGepeQQmEuDdNCyA
 XxWrtJu+F6lu3Lp7uDpoRKHumZPJMpKU0JAHitmBCq936hqJimtruAT0Rlh/aJD2nJW2U2
 sNv+WzdDOcpqWuWjf03Z6cFdbYts7znLi/vRFm9Inq1DOBuw4Cv5ZvCTAkemTzZPRqX9Us
 A/gXqaxzBtunufmgE+J6ou52fpkTr0wPHTsN2lG/n5pspmhs9CquSUQH5jaynAXffSMhb0
 Y/avkAR9q97xAA+G8lllFeR3zkhF27Vtrd+kwqZDO8mrS5ZturOc+6Mxv/CPoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=mZznvRq2pjMB0UxfV7Tofiw+ZX8bqdvzvy1elzwqCM0=;
 b=YkjV/BXfl1xf/PJwkxxRp2il3aCsOfTo0zpayVu8o2qPQTr7lA/QrCtxb7deyA8IfhHH+y
 cIngF4mt/rXTgQCg==
Date: Tue, 03 Nov 2020 10:27:19 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 07/37] highmem: Make DEBUG_HIGHMEM functional
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

For some obscure reason when CONFIG_DEBUG_HIGHMEM is enabled the stack
depth is increased from 20 to 41. But the only thing DEBUG_HIGHMEM does is
to enable a few BUG_ON()'s in the mapping code.

That's a leftover from the historical mapping code which had fixed entries
for various purposes. DEBUG_HIGHMEM inserted guard mappings between the map
types. But that got all ditched when kmap_atomic() switched to a stack
based map management. Though the WITH_KM_FENCE magic survived without being
functional. All the thing does today is to increase the stack depth.

Add a working implementation to the generic kmap_local* implementation.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V3: New patch
---
 mm/highmem.c |   14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -374,9 +374,19 @@ EXPORT_SYMBOL(kunmap_high);
 
 static DEFINE_PER_CPU(int, __kmap_local_idx);
 
+/*
+ * With DEBUG_HIGHMEM the stack depth is doubled and every second
+ * slot is unused which acts as a guard page
+ */
+#ifdef CONFIG_DEBUG_HIGHMEM
+# define KM_INCR	2
+#else
+# define KM_INCR	1
+#endif
+
 static inline int kmap_local_idx_push(void)
 {
-	int idx = __this_cpu_inc_return(__kmap_local_idx) - 1;
+	int idx = __this_cpu_add_return(__kmap_local_idx, KM_INCR) - 1;
 
 	WARN_ON_ONCE(in_irq() && !irqs_disabled());
 	BUG_ON(idx >= KM_MAX_IDX);
@@ -390,7 +400,7 @@ static inline int kmap_local_idx(void)
 
 static inline void kmap_local_idx_pop(void)
 {
-	int idx = __this_cpu_dec_return(__kmap_local_idx);
+	int idx = __this_cpu_sub_return(__kmap_local_idx, KM_INCR);
 
 	BUG_ON(idx < 0);
 }

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
