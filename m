Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C04520FAC4
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 19:38:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED44187F39;
	Tue, 30 Jun 2020 17:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pk-OI0HmwQSl; Tue, 30 Jun 2020 17:38:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 227EA87DD7;
	Tue, 30 Jun 2020 17:38:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 064BBC016E;
	Tue, 30 Jun 2020 17:38:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A57D0C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A167287DCC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JqZdYew3s-K
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BB45E87DD7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:21 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B1162083E;
 Tue, 30 Jun 2020 17:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593538701;
 bh=bP3p7dVexcSkteyD/dA+wmwP54RNKmjexoS8VX/yL5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QdbuWMrkMfSwq4uJ0dE+MaBUXfWAXh4mUItpEYk3m3ySP5Ykil0SoWaDHGKe4AiaC
 la5/K0HaSktEtvbrsQE4tBkfI7p4ADAZX8LRUg7jiqX69JQDIH670SxaFC6z+ZnYgr
 GkiwruxZBoqBoqCmBhyJFi/VqHNWjElPMsoOSr/g=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/18] Documentation/barriers: Remove references to
 [smp_]read_barrier_depends()
Date: Tue, 30 Jun 2020 18:37:25 +0100
Message-Id: <20200630173734.14057-10-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200630173734.14057-1-will@kernel.org>
References: <20200630173734.14057-1-will@kernel.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 virtualization@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>,
 Sami Tolvanen <samitolvanen@google.com>, Matt Turner <mattst88@gmail.com>,
 kernel-team@android.com, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-alpha@vger.kernel.org
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

The [smp_]read_barrier_depends() barrier macros no longer exist as
part of the Linux memory model, so remove all references to them from
the Documentation/ directory.

Although this is fairly mechanical on the whole, we drop the "CACHE
COHERENCY" section entirely from 'memory-barriers.txt' as it doesn't
make any sense now that the dependency barriers have been removed.

Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 .../RCU/Design/Requirements/Requirements.rst  |   2 +-
 Documentation/memory-barriers.txt             | 156 +-----------------
 2 files changed, 9 insertions(+), 149 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index 75b8ca007a11..50d5c43c48b0 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -463,7 +463,7 @@ again without disrupting RCU readers.
 This guarantee was only partially premeditated. DYNIX/ptx used an
 explicit memory barrier for publication, but had nothing resembling
 ``rcu_dereference()`` for subscription, nor did it have anything
-resembling the ``smp_read_barrier_depends()`` that was later subsumed
+resembling the dependency-ordering barrier that was later subsumed
 into ``rcu_dereference()`` and later still into ``READ_ONCE()``. The
 need for these operations made itself known quite suddenly at a
 late-1990s meeting with the DEC Alpha architects, back in the days when
diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
index eaabc3134294..4e55aba3eb4a 100644
--- a/Documentation/memory-barriers.txt
+++ b/Documentation/memory-barriers.txt
@@ -553,12 +553,12 @@ There are certain things that the Linux kernel memory barriers do not guarantee:
 DATA DEPENDENCY BARRIERS (HISTORICAL)
 -------------------------------------
 
-As of v4.15 of the Linux kernel, an smp_read_barrier_depends() was
-added to READ_ONCE(), which means that about the only people who
-need to pay attention to this section are those working on DEC Alpha
-architecture-specific code and those working on READ_ONCE() itself.
-For those who need it, and for those who are interested in the history,
-here is the story of data-dependency barriers.
+As of v4.15 of the Linux kernel, an smp_mb() was added to READ_ONCE() for
+DEC Alpha, which means that about the only people who need to pay attention
+to this section are those working on DEC Alpha architecture-specific code
+and those working on READ_ONCE() itself.  For those who need it, and for
+those who are interested in the history, here is the story of
+data-dependency barriers.
 
 The usage requirements of data dependency barriers are a little subtle, and
 it's not always obvious that they're needed.  To illustrate, consider the
@@ -2708,144 +2708,6 @@ the properties of the memory window through which devices are accessed and/or
 the use of any special device communication instructions the CPU may have.
 
 
-CACHE COHERENCY
----------------
-
-Life isn't quite as simple as it may appear above, however: for while the
-caches are expected to be coherent, there's no guarantee that that coherency
-will be ordered.  This means that while changes made on one CPU will
-eventually become visible on all CPUs, there's no guarantee that they will
-become apparent in the same order on those other CPUs.
-
-
-Consider dealing with a system that has a pair of CPUs (1 & 2), each of which
-has a pair of parallel data caches (CPU 1 has A/B, and CPU 2 has C/D):
-
-	            :
-	            :                          +--------+
-	            :      +---------+         |        |
-	+--------+  : +--->| Cache A |<------->|        |
-	|        |  : |    +---------+         |        |
-	|  CPU 1 |<---+                        |        |
-	|        |  : |    +---------+         |        |
-	+--------+  : +--->| Cache B |<------->|        |
-	            :      +---------+         |        |
-	            :                          | Memory |
-	            :      +---------+         | System |
-	+--------+  : +--->| Cache C |<------->|        |
-	|        |  : |    +---------+         |        |
-	|  CPU 2 |<---+                        |        |
-	|        |  : |    +---------+         |        |
-	+--------+  : +--->| Cache D |<------->|        |
-	            :      +---------+         |        |
-	            :                          +--------+
-	            :
-
-Imagine the system has the following properties:
-
- (*) an odd-numbered cache line may be in cache A, cache C or it may still be
-     resident in memory;
-
- (*) an even-numbered cache line may be in cache B, cache D or it may still be
-     resident in memory;
-
- (*) while the CPU core is interrogating one cache, the other cache may be
-     making use of the bus to access the rest of the system - perhaps to
-     displace a dirty cacheline or to do a speculative load;
-
- (*) each cache has a queue of operations that need to be applied to that cache
-     to maintain coherency with the rest of the system;
-
- (*) the coherency queue is not flushed by normal loads to lines already
-     present in the cache, even though the contents of the queue may
-     potentially affect those loads.
-
-Imagine, then, that two writes are made on the first CPU, with a write barrier
-between them to guarantee that they will appear to reach that CPU's caches in
-the requisite order:
-
-	CPU 1		CPU 2		COMMENT
-	===============	===============	=======================================
-					u == 0, v == 1 and p == &u, q == &u
-	v = 2;
-	smp_wmb();			Make sure change to v is visible before
-					 change to p
-	<A:modify v=2>			v is now in cache A exclusively
-	p = &v;
-	<B:modify p=&v>			p is now in cache B exclusively
-
-The write memory barrier forces the other CPUs in the system to perceive that
-the local CPU's caches have apparently been updated in the correct order.  But
-now imagine that the second CPU wants to read those values:
-
-	CPU 1		CPU 2		COMMENT
-	===============	===============	=======================================
-	...
-			q = p;
-			x = *q;
-
-The above pair of reads may then fail to happen in the expected order, as the
-cacheline holding p may get updated in one of the second CPU's caches while
-the update to the cacheline holding v is delayed in the other of the second
-CPU's caches by some other cache event:
-
-	CPU 1		CPU 2		COMMENT
-	===============	===============	=======================================
-					u == 0, v == 1 and p == &u, q == &u
-	v = 2;
-	smp_wmb();
-	<A:modify v=2>	<C:busy>
-			<C:queue v=2>
-	p = &v;		q = p;
-			<D:request p>
-	<B:modify p=&v>	<D:commit p=&v>
-			<D:read p>
-			x = *q;
-			<C:read *q>	Reads from v before v updated in cache
-			<C:unbusy>
-			<C:commit v=2>
-
-Basically, while both cachelines will be updated on CPU 2 eventually, there's
-no guarantee that, without intervention, the order of update will be the same
-as that committed on CPU 1.
-
-
-To intervene, we need to interpolate a data dependency barrier or a read
-barrier between the loads (which as of v4.15 is supplied unconditionally
-by the READ_ONCE() macro).  This will force the cache to commit its
-coherency queue before processing any further requests:
-
-	CPU 1		CPU 2		COMMENT
-	===============	===============	=======================================
-					u == 0, v == 1 and p == &u, q == &u
-	v = 2;
-	smp_wmb();
-	<A:modify v=2>	<C:busy>
-			<C:queue v=2>
-	p = &v;		q = p;
-			<D:request p>
-	<B:modify p=&v>	<D:commit p=&v>
-			<D:read p>
-			smp_read_barrier_depends()
-			<C:unbusy>
-			<C:commit v=2>
-			x = *q;
-			<C:read *q>	Reads from v after v updated in cache
-
-
-This sort of problem can be encountered on DEC Alpha processors as they have a
-split cache that improves performance by making better use of the data bus.
-While most CPUs do imply a data dependency barrier on the read when a memory
-access depends on a read, not all do, so it may not be relied on.
-
-Other CPUs may also have split caches, but must coordinate between the various
-cachelets for normal memory accesses.  The semantics of the Alpha removes the
-need for hardware coordination in the absence of memory barriers, which
-permitted Alpha to sport higher CPU clock rates back in the day.  However,
-please note that (again, as of v4.15) smp_read_barrier_depends() should not
-be used except in Alpha arch-specific code and within the READ_ONCE() macro.
-
-
 CACHE COHERENCY VS DMA
 ----------------------
 
@@ -3009,10 +2871,8 @@ caches with the memory coherence system, thus making it seem like pointer
 changes vs new data occur in the right order.
 
 The Alpha defines the Linux kernel's memory model, although as of v4.15
-the Linux kernel's addition of smp_read_barrier_depends() to READ_ONCE()
-greatly reduced Alpha's impact on the memory model.
-
-See the subsection on "Cache Coherency" above.
+the Linux kernel's addition of smp_mb() to READ_ONCE() on Alpha greatly
+reduced its impact on the memory model.
 
 
 VIRTUAL MACHINE GUESTS
-- 
2.27.0.212.ge8ba1cc988-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
