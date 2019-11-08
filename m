Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F228F51EF
	for <lists.virtualization@lfdr.de>; Fri,  8 Nov 2019 18:03:01 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 93942EED;
	Fri,  8 Nov 2019 17:01:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 63860EDC
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:01:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1FF128B7
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:01:57 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E234B206BA;
	Fri,  8 Nov 2019 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573232517;
	bh=TGLqDVac68mvf/WbG83M5yme7mDwFa4WdUlKKdhy5x0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qlhI/we2Irq3NDViFLm9ozqF9YrV/0VR2W+CFGc0A8vNcDHROki/mpP89a/qG36+i
	IYQuiiidDWzlPxvhWUOgwDXqYXSPGXY6pTKSAuH8r6WkEVetuHuRrRNhrEEwMFxNcV
	Ri5A53vHOddu4c5TwrAqHa4LarO/cbe9jKi+rH4E=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] locking/barriers: Remove definitions for
	[smp_]read_barrier_depends()
Date: Fri,  8 Nov 2019 17:01:15 +0000
Message-Id: <20191108170120.22331-9-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108170120.22331-1-will@kernel.org>
References: <20191108170120.22331-1-will@kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Josh Triplett <josh@joshtriplett.org>, Yunjae Lee <lyj7694@gmail.com>,
	SeongJae Park <sj38.park@gmail.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	linux-alpha@vger.kernel.org, Joe Perches <joe@perches.com>,
	Alan Stern <stern@rowland.harvard.edu>, Matt Turner <mattst88@gmail.com>,
	virtualization@lists.linux-foundation.org,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Richard Henderson <rth@twiddle.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

There are no remaining users of '[smp_]read_barrier_depends()', so
remove it from the generic implementation of 'barrier.h'.

Signed-off-by: Will Deacon <will@kernel.org>
---
 include/asm-generic/barrier.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
index 85b28eb80b11..4b2a60f738b2 100644
--- a/include/asm-generic/barrier.h
+++ b/include/asm-generic/barrier.h
@@ -46,10 +46,6 @@
 #define dma_wmb()	wmb()
 #endif
 
-#ifndef read_barrier_depends
-#define read_barrier_depends()		do { } while (0)
-#endif
-
 #ifndef __smp_mb
 #define __smp_mb()	mb()
 #endif
@@ -62,10 +58,6 @@
 #define __smp_wmb()	wmb()
 #endif
 
-#ifndef __smp_read_barrier_depends
-#define __smp_read_barrier_depends()	read_barrier_depends()
-#endif
-
 #ifdef CONFIG_SMP
 
 #ifndef smp_mb
@@ -80,10 +72,6 @@
 #define smp_wmb()	__smp_wmb()
 #endif
 
-#ifndef smp_read_barrier_depends
-#define smp_read_barrier_depends()	__smp_read_barrier_depends()
-#endif
-
 #else	/* !CONFIG_SMP */
 
 #ifndef smp_mb
@@ -98,10 +86,6 @@
 #define smp_wmb()	barrier()
 #endif
 
-#ifndef smp_read_barrier_depends
-#define smp_read_barrier_depends()	do { } while (0)
-#endif
-
 #endif	/* CONFIG_SMP */
 
 #ifndef __smp_store_mb
@@ -196,7 +180,6 @@ do {									\
 #define virt_mb() __smp_mb()
 #define virt_rmb() __smp_rmb()
 #define virt_wmb() __smp_wmb()
-#define virt_read_barrier_depends() __smp_read_barrier_depends()
 #define virt_store_mb(var, value) __smp_store_mb(var, value)
 #define virt_mb__before_atomic() __smp_mb__before_atomic()
 #define virt_mb__after_atomic()	__smp_mb__after_atomic()
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
