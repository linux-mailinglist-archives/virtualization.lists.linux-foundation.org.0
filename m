Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9096CF51F3
	for <lists.virtualization@lfdr.de>; Fri,  8 Nov 2019 18:03:50 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 69ADAEF3;
	Fri,  8 Nov 2019 17:02:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C20FCDE1
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:02:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 81FEB8A7
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:02:11 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5295D206BA;
	Fri,  8 Nov 2019 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573232531;
	bh=3vyc12aQ3fu+SeD0lMTSciNswbsRVeXAHiot9IWqGvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xdlo0cliQszCKc4t2Mqmv07gu/EtjmdGujKRlItYZPNKg7PznL/g9yalSAA460MAC
	Rrb/XY6LYdnuqxsYmZj0Y8oX/tdSwW7+d9hctGkzw+BBZIWkq1qy0GW+/mjSNw94uT
	i0yQNpHPqpmEP485MUsSL0DX//7r8gbAGUzSnxdU=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] include/linux: Remove smp_read_barrier_depends() from
	comments
Date: Fri,  8 Nov 2019 17:01:19 +0000
Message-Id: <20191108170120.22331-13-will@kernel.org>
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

'smp_read_barrier_depends()' doesn't exist any more, so reword the two
comments that mention it to refer to "dependency ordering" instead.

Signed-off-by: Will Deacon <will@kernel.org>
---
 include/linux/percpu-refcount.h | 2 +-
 include/linux/ptr_ring.h        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/percpu-refcount.h b/include/linux/percpu-refcount.h
index 7aef0abc194a..246760b93715 100644
--- a/include/linux/percpu-refcount.h
+++ b/include/linux/percpu-refcount.h
@@ -155,7 +155,7 @@ static inline bool __ref_is_percpu(struct percpu_ref *ref,
 	 * between contaminating the pointer value, meaning that
 	 * READ_ONCE() is required when fetching it.
 	 *
-	 * The smp_read_barrier_depends() implied by READ_ONCE() pairs
+	 * The dependency ordering from the READ_ONCE() pairs
 	 * with smp_store_release() in __percpu_ref_switch_to_percpu().
 	 */
 	percpu_ptr = READ_ONCE(ref->percpu_count_ptr);
diff --git a/include/linux/ptr_ring.h b/include/linux/ptr_ring.h
index 0abe9a4fc842..b6e94b60fc12 100644
--- a/include/linux/ptr_ring.h
+++ b/include/linux/ptr_ring.h
@@ -106,7 +106,7 @@ static inline int __ptr_ring_produce(struct ptr_ring *r, void *ptr)
 		return -ENOSPC;
 
 	/* Make sure the pointer we are storing points to a valid data. */
-	/* Pairs with smp_read_barrier_depends in __ptr_ring_consume. */
+	/* Pairs with the dependency ordering in __ptr_ring_consume. */
 	smp_wmb();
 
 	WRITE_ONCE(r->queue[r->producer++], ptr);
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
