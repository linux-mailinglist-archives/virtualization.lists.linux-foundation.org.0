Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B61420FACA
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 19:38:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 270B287557;
	Tue, 30 Jun 2020 17:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mwFoT4-cZdVS; Tue, 30 Jun 2020 17:38:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0A038733B;
	Tue, 30 Jun 2020 17:38:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82C0BC016E;
	Tue, 30 Jun 2020 17:38:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18204C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EF73A2042E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5Mf-hm6ripg
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 2849222849
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:30 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D7A220829;
 Tue, 30 Jun 2020 17:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593538710;
 bh=qoEfU3b1y4/xeEqvyt+YVXOv4viPb6BcJ15Sl3Ij7bg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q0keKuHsfsfAgKC1LtX9sks7jRJHDQZZ1ezB73t7AIUcDYxJr7j4+9TF1D35lERby
 Nj+pl0uHaslag6jrJXtgEsQmSbKqbY/SCiZy0EA85EepoyuxPrS4RPnoAn9tocRTT0
 faKEZLt+fjG+6/EJXnJJbTOWCm/N3A81o5uuyGgU=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 11/18] tools/memory-model: Remove smp_read_barrier_depends()
 from informal doc
Date: Tue, 30 Jun 2020 18:37:27 +0100
Message-Id: <20200630173734.14057-12-will@kernel.org>
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

smp_read_barrier_depends() has gone the way of mmiowb() and so many
esoteric memory barriers before it. Drop the two mentions of this
deceased barrier from the LKMM informal explanation document.

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 .../Documentation/explanation.txt             | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/tools/memory-model/Documentation/explanation.txt b/tools/memory-model/Documentation/explanation.txt
index e91a2eb19592..01adf9e0ebac 100644
--- a/tools/memory-model/Documentation/explanation.txt
+++ b/tools/memory-model/Documentation/explanation.txt
@@ -1122,12 +1122,10 @@ maintain at least the appearance of FIFO order.
 In practice, this difficulty is solved by inserting a special fence
 between P1's two loads when the kernel is compiled for the Alpha
 architecture.  In fact, as of version 4.15, the kernel automatically
-adds this fence (called smp_read_barrier_depends() and defined as
-nothing at all on non-Alpha builds) after every READ_ONCE() and atomic
-load.  The effect of the fence is to cause the CPU not to execute any
-po-later instructions until after the local cache has finished
-processing all the stores it has already received.  Thus, if the code
-was changed to:
+adds this fence after every READ_ONCE() and atomic load on Alpha.  The
+effect of the fence is to cause the CPU not to execute any po-later
+instructions until after the local cache has finished processing all
+the stores it has already received.  Thus, if the code was changed to:
 
 	P1()
 	{
@@ -1146,14 +1144,14 @@ READ_ONCE() or another synchronization primitive rather than accessed
 directly.
 
 The LKMM requires that smp_rmb(), acquire fences, and strong fences
-share this property with smp_read_barrier_depends(): They do not allow
-the CPU to execute any po-later instructions (or po-later loads in the
-case of smp_rmb()) until all outstanding stores have been processed by
-the local cache.  In the case of a strong fence, the CPU first has to
-wait for all of its po-earlier stores to propagate to every other CPU
-in the system; then it has to wait for the local cache to process all
-the stores received as of that time -- not just the stores received
-when the strong fence began.
+share this property: They do not allow the CPU to execute any po-later
+instructions (or po-later loads in the case of smp_rmb()) until all
+outstanding stores have been processed by the local cache.  In the
+case of a strong fence, the CPU first has to wait for all of its
+po-earlier stores to propagate to every other CPU in the system; then
+it has to wait for the local cache to process all the stores received
+as of that time -- not just the stores received when the strong fence
+began.
 
 And of course, none of this matters for any architecture other than
 Alpha.
-- 
2.27.0.212.ge8ba1cc988-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
