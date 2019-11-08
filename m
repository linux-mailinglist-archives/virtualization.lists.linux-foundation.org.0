Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 64975F51ED
	for <lists.virtualization@lfdr.de>; Fri,  8 Nov 2019 18:02:40 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2A820E7C;
	Fri,  8 Nov 2019 17:01:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7993FE7C
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:01:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 111828C7
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:01:50 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 89DF1206BA;
	Fri,  8 Nov 2019 17:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573232509;
	bh=QmHkYOpw1KGgzE2tChTjH11DwvScC47O6EYYkdjmNZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oiUzlVfUY9/EMo4arLdR3YvvgWtVrcBioNWxyo4tDqVikPDfd/hMfuNPavpmeFf5b
	fiotcwLuwgXiNdGNjLCGDs4cH4YGNrU4D2GdrgLklRE5kQEyEWDKv6ShvlqifQtJp8
	C/qEBtT80YOw5LyKOpZZ03WsFbgZ4XIOvxTT9/+E=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] READ_ONCE: Remove smp_read_barrier_depends() invocation
Date: Fri,  8 Nov 2019 17:01:13 +0000
Message-Id: <20191108170120.22331-7-will@kernel.org>
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

Alpha overrides '__read_once_size_n()' directly, so there's no need to
use 'smp_read_barrier_depends()' in the core code.

Signed-off-by: Will Deacon <will@kernel.org>
---
 include/asm-generic/rwonce.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index 2c2ac0948c94..2e3289268a89 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -102,7 +102,6 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
 		__read_once_size(&(x), __u.__c, sizeof(x));		\
 	else								\
 		__read_once_size_nocheck(&(x), __u.__c, sizeof(x));	\
-	smp_read_barrier_depends(); /* Enforce dependency ordering from x */ \
 	__u.__val;							\
 })
 #define READ_ONCE(x) __READ_ONCE(x, 1)
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
