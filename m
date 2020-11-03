Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 985462A4200
	for <lists.virtualization@lfdr.de>; Tue,  3 Nov 2020 11:33:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2C10C86079;
	Tue,  3 Nov 2020 10:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3RVLgrO7KXwr; Tue,  3 Nov 2020 10:33:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B436286088;
	Tue,  3 Nov 2020 10:33:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98DFBC0051;
	Tue,  3 Nov 2020 10:33:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61D06C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4897C86DB2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 56XuhNxPvDgI
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4074586D48
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:27 +0000 (UTC)
Message-Id: <20201103095856.732891880@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=3HwBsgFv26sFcL/ZrR5QT7IdhKdyl722jNSTyAsMfhU=;
 b=rvT54BmES001fwkPfhre2195ODFh8EFwDZYAlKQRhVHUBxAXrQ4jz+GuDaq+7kANpwhtIs
 Odqznja1AON6wOyHEpYXOzN884r1utS39bCLsxNEulHhg56wkK85myPaXmlcyC0Iwy9aJH
 7H/5d1lmCAyZsRrJM2yBsjEdO5LEmhyrq2wZg4iXyHs50gJQuJK3//uDTtWi4cGXwQajhE
 6zcImoXr01WpyQwaIvad1lc/klKtM4lT0KI/sOHFnGRyhXmWoqmmzQFg3YIBBqGRZ2BmRY
 OjwLotmGcs5kT4ELYX86H43ZMMJAy6wm+tJXkQgUfKkVJUPub5l/USgVgx610A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=3HwBsgFv26sFcL/ZrR5QT7IdhKdyl722jNSTyAsMfhU=;
 b=lkKBWdK1CIWHPlUI77sykNxUAemFnakZTPVr751NgUw5N/WO+Qg52P9pTni6F4JYuE0eLl
 4W0KlbICECLDLgCA==
Date: Tue, 03 Nov 2020 10:27:14 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 02/37] highmem: Remove unused functions
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

Nothing uses totalhigh_pages_dec() and totalhigh_pages_set().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V3: New patch
---
 include/linux/highmem.h |   10 ----------
 1 file changed, 10 deletions(-)

--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -104,21 +104,11 @@ static inline void totalhigh_pages_inc(v
 	atomic_long_inc(&_totalhigh_pages);
 }
 
-static inline void totalhigh_pages_dec(void)
-{
-	atomic_long_dec(&_totalhigh_pages);
-}
-
 static inline void totalhigh_pages_add(long count)
 {
 	atomic_long_add(count, &_totalhigh_pages);
 }
 
-static inline void totalhigh_pages_set(long val)
-{
-	atomic_long_set(&_totalhigh_pages, val);
-}
-
 void kmap_flush_unused(void);
 
 struct page *kmap_to_page(void *addr);

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
