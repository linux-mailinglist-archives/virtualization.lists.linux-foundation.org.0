Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0E720FACC
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 19:38:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30C7A8733B;
	Tue, 30 Jun 2020 17:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehoGjS0Dcp0q; Tue, 30 Jun 2020 17:38:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BF4AD8755A;
	Tue, 30 Jun 2020 17:38:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4398C0865;
	Tue, 30 Jun 2020 17:38:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF947C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AEB498755A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOM32uBIK32A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 458EA8733B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:34 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 796CA2082F;
 Tue, 30 Jun 2020 17:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593538714;
 bh=oJiHZDnxfHIESA4r7ZpM5csHMecWaGiAbn/T6AdGwok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C5PKnvE/0qg3mUSLo1OkrA2DMpJl3hqS6i+J+rfqc59Z/5LR/CrEoUDBnSOCg+pXJ
 MURZlW9AjY2nrCil2XFzo5MnDgeQQ72NR7wDEUr38AnACjmuMHIU0KZPPFV9aSONHK
 wdpJv2VVSzaGnJ0iNdPEQH4by1K0sHNcJvI6akNA=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/18] include/linux: Remove smp_read_barrier_depends() from
 comments
Date: Tue, 30 Jun 2020 18:37:28 +0100
Message-Id: <20200630173734.14057-13-will@kernel.org>
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

smp_read_barrier_depends() doesn't exist any more, so reword the two
comments that mention it to refer to "dependency ordering" instead.

Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 include/linux/percpu-refcount.h | 2 +-
 include/linux/ptr_ring.h        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/percpu-refcount.h b/include/linux/percpu-refcount.h
index 22d9d183950d..87d8a38bdea1 100644
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
index 417db0a79a62..808f9d3ee546 100644
--- a/include/linux/ptr_ring.h
+++ b/include/linux/ptr_ring.h
@@ -107,7 +107,7 @@ static inline int __ptr_ring_produce(struct ptr_ring *r, void *ptr)
 		return -ENOSPC;
 
 	/* Make sure the pointer we are storing points to a valid data. */
-	/* Pairs with smp_read_barrier_depends in __ptr_ring_consume. */
+	/* Pairs with the dependency ordering in __ptr_ring_consume. */
 	smp_wmb();
 
 	WRITE_ONCE(r->queue[r->producer++], ptr);
-- 
2.27.0.212.ge8ba1cc988-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
