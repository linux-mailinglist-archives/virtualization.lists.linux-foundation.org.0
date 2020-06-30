Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4752120FABB
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 19:38:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E87C988573;
	Tue, 30 Jun 2020 17:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzuQunB0LtMa; Tue, 30 Jun 2020 17:38:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 62D50884D9;
	Tue, 30 Jun 2020 17:38:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B233C016E;
	Tue, 30 Jun 2020 17:38:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB5EAC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C55AB87E81
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDPIFqpyLFZH
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C8E4087E9D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:09 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15E0320775;
 Tue, 30 Jun 2020 17:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593538689;
 bh=E1Ph3cAM0mY7L1JWC8UA/II6dSTm9kJ1ebZbi07WtBg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vj/KrWTnlk4XAguMyTOraTs+gMe5ReW5aFYgFgpnOE2GOjJg7HPA/8nPH2EwqmY6b
 aMvCLHU4CBn9eq91Y7dJej2UXQ3Nmd5KJbrCl7n+OdzQY1BYWXlUW3M/WnTtNipoJQ
 1fvmhXcC5jTnuR4yg2PceePJsdSFxM0NHWXDmk/8=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/18] vhost: Remove redundant use of read_barrier_depends()
 barrier
Date: Tue, 30 Jun 2020 18:37:22 +0100
Message-Id: <20200630173734.14057-7-will@kernel.org>
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

Since commit 76ebbe78f739 ("locking/barriers: Add implicit
smp_read_barrier_depends() to READ_ONCE()"), there is no need to use
smp_read_barrier_depends() outside of the Alpha architecture code.

Unfortunately, there is precisely _one_ user in the vhost code, and
there isn't an obvious READ_ONCE() access making the barrier
redundant. However, on closer inspection (thanks, Jason), it appears
that vring synchronisation between the producer and consumer occurs via
the 'avail_idx' field, which is followed up by an rmb() in
vhost_get_vq_desc(), making the read_barrier_depends() redundant on
Alpha.

Jason says:

  | I'm also confused about the barrier here, basically in driver side
  | we did:
  |
  | 1) allocate pages
  | 2) store pages in indirect->addr
  | 3) smp_wmb()
  | 4) increase the avail idx (somehow a tail pointer of vring)
  |
  | in vhost we did:
  |
  | 1) read avail idx
  | 2) smp_rmb()
  | 3) read indirect->addr
  | 4) read from indirect->addr
  |
  | It looks to me even the data dependency barrier is not necessary
  | since we have rmb() which is sufficient for us to the correct
  | indirect->addr and driver are not expected to do any writing to
  | indirect->addr after avail idx is increased

Remove the redundant barrier invocation.

Suggested-by: Jason Wang <jasowang@redhat.com>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/vhost/vhost.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index d7b8df3edffc..74d135ee7e26 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2092,11 +2092,6 @@ static int get_indirect(struct vhost_virtqueue *vq,
 		return ret;
 	}
 	iov_iter_init(&from, READ, vq->indirect, ret, len);
-
-	/* We will use the result as an address to read from, so most
-	 * architectures only need a compiler barrier here. */
-	read_barrier_depends();
-
 	count = len / sizeof desc;
 	/* Buffers are chained via a 16 bit next field, so
 	 * we can have at most 2^16 of these. */
-- 
2.27.0.212.ge8ba1cc988-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
