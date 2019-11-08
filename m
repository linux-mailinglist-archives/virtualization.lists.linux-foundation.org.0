Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EA893F51E6
	for <lists.virtualization@lfdr.de>; Fri,  8 Nov 2019 18:02:08 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 868BCED9;
	Fri,  8 Nov 2019 17:01:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6E9DDED2
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:01:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 25D878A7
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:01:39 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 95EB721D7E;
	Fri,  8 Nov 2019 17:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573232499;
	bh=kzlgTQkG1R1MYvXiLB+EEi+LR7BxeVnjf/aJMUBqADw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VviKsmgq2Tt9rr+MDGQITpsAKGIPvYSnn9a1+KfqrGSBXH1Uj7H7EVsR3P9RoFLRH
	9VjGBZorIo9ijF2ERfJULRCDiDnSR39b39roKT4YooZqYfrBhM7dQWWId5lFyMSnod
	+RnYKmJxOvs9aNXG866OWneGK5uStUPHhLMIHYaQ=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 03/13] READ_ONCE: Allow __READ_ONCE_SIZE cases to be
	overridden by the architecture
Date: Fri,  8 Nov 2019 17:01:10 +0000
Message-Id: <20191108170120.22331-4-will@kernel.org>
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

The meat and potatoes of 'READ_ONCE()' is defined by the
'__READ_ONCE_SIZE()' macro, which uses volatile casts in an attempt to
avoid tearing of byte, halfword, word and double-word accesses. Allow
this to be overridden by the architecture code in the case that things
like memory barriers are also required.

Signed-off-by: Will Deacon <will@kernel.org>
---
 include/asm-generic/rwonce.h | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index abf326634ecd..2c2ac0948c94 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -33,13 +33,29 @@
 
 #include <asm/barrier.h>
 
+#ifndef __read_once_size_1
+#define __read_once_size_1(p)	(*(volatile __u8 *)(p))
+#endif
+
+#ifndef __read_once_size_2
+#define __read_once_size_2(p)	(*(volatile __u16 *)(p))
+#endif
+
+#ifndef __read_once_size_4
+#define __read_once_size_4(p)	(*(volatile __u32 *)(p))
+#endif
+
+#ifndef __read_once_size_8
+#define __read_once_size_8(p)	(*(volatile __u64 *)(p))
+#endif
+
 #define __READ_ONCE_SIZE						\
 ({									\
 	switch (size) {							\
-	case 1: *(__u8 *)res = *(volatile __u8 *)p; break;		\
-	case 2: *(__u16 *)res = *(volatile __u16 *)p; break;		\
-	case 4: *(__u32 *)res = *(volatile __u32 *)p; break;		\
-	case 8: *(__u64 *)res = *(volatile __u64 *)p; break;		\
+	case 1: *(__u8 *)res = __read_once_size_1(p); break;		\
+	case 2: *(__u16 *)res = __read_once_size_2(p); break;		\
+	case 4: *(__u32 *)res = __read_once_size_4(p); break;		\
+	case 8: *(__u64 *)res = __read_once_size_8(p); break;		\
 	default:							\
 		barrier();						\
 		__builtin_memcpy((void *)res, (const void *)p, size);	\
@@ -59,6 +75,10 @@ void __read_once_size_nocheck(const volatile void *p, void *res, int size)
 	__READ_ONCE_SIZE;
 }
 
+#undef __read_once_size_1
+#undef __read_once_size_2
+#undef __read_once_size_4
+#undef __read_once_size_8
 #undef __READ_ONCE_SIZE
 
 static __always_inline void __write_once_size(volatile void *p, void *res, int size)
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
