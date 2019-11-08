Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2CF51DF
	for <lists.virtualization@lfdr.de>; Fri,  8 Nov 2019 18:01:36 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E975DEC9;
	Fri,  8 Nov 2019 17:01:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 00F00E7C
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:01:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3D61D8CA
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:01:28 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F381821848;
	Fri,  8 Nov 2019 17:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573232488;
	bh=HTcHAMijQqVgRO6zCy9ZrheDnl8HQLiX8Rjta3usTZ0=;
	h=From:To:Cc:Subject:Date:From;
	b=ZnWS1X2b0PUCeQpWpi2502WQVdkfXFyqK1xdBOQWZhgk7zTcKcKSAZL/qE4C3Q06o
	rkWqf8YjsJ+izdbJEavvUi+ZRPkK1LjbvsGyHiO1nEhJnG1ewGF22bNKulG62FV4/N
	vsurK/YtoTCaD5wquc8vQ05h7NCU1xoFxOK2VWag=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/13] Finish off [smp_]read_barrier_depends()
Date: Fri,  8 Nov 2019 17:01:07 +0000
Message-Id: <20191108170120.22331-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
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

Hi all,

Although [smp_]read_barrier_depends() became part of READ_ONCE() in
commit 76ebbe78f739 ("locking/barriers: Add implicit
smp_read_barrier_depends() to READ_ONCE()"), it still limps on in the
Linux memory model with the sinister hope of attracting innocent new
users so that it becomes impossible to remove altogether.

Let's strike before it's too late: there's only one user outside of
arch/alpha/ and that lives in the vhost code which I don't think you
can actually compile for Alpha. Even if you could, it appears to be
redundant. The rest of these patches remove any mention of the barrier
from Documentation and comments, as well as removing its use from the
Alpha backend and finally dropping it from the memory model completely.

After this series, there are still two places where it is mentioned:

  1. The Korean translation of memory-barriers.txt. I'd appreciate some
     help fixing this because it's not entirely a straightforward
     deletion.

  2. The virtio vring tests under tools/. This is userspace code so I'm
     not too fussed about it.

There's a chunk of header reshuffling at the start of the series so that
READ_ONCE() can sensibly be overridden by arch code.

Feedback welcome.

Cheers,

Will

Cc: Yunjae Lee <lyj7694@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Joe Perches <joe@perches.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-alpha@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org

--->8

Will Deacon (13):
  compiler.h: Split {READ,WRITE}_ONCE definitions out into rwonce.h
  READ_ONCE: Undefine internal __READ_ONCE_SIZE macro after use
  READ_ONCE: Allow __READ_ONCE_SIZE cases to be overridden by the
    architecture
  vhost: Remove redundant use of read_barrier_depends() barrier
  alpha: Override READ_ONCE() with barriered implementation
  READ_ONCE: Remove smp_read_barrier_depends() invocation
  alpha: Replace smp_read_barrier_depends() usage with smp_[r]mb()
  locking/barriers: Remove definitions for [smp_]read_barrier_depends()
  Documentation/barriers: Remove references to
    [smp_]read_barrier_depends()
  tools/memory-model: Remove smp_read_barrier_depends() from informal
    doc
  powerpc: Remove comment about read_barrier_depends()
  include/linux: Remove smp_read_barrier_depends() from comments
  checkpatch: Remove checks relating to [smp_]read_barrier_depends()

 .../RCU/Design/Requirements/Requirements.html |  11 +-
 Documentation/memory-barriers.txt             | 156 +-----------------
 arch/alpha/include/asm/atomic.h               |  16 +-
 arch/alpha/include/asm/barrier.h              |  61 +------
 arch/alpha/include/asm/pgtable.h              |  10 +-
 arch/alpha/include/asm/rwonce.h               |  22 +++
 arch/powerpc/include/asm/barrier.h            |   2 -
 drivers/vhost/vhost.c                         |   5 -
 include/asm-generic/Kbuild                    |   1 +
 include/asm-generic/barrier.h                 |  17 --
 include/asm-generic/rwonce.h                  | 131 +++++++++++++++
 include/linux/compiler.h                      | 114 +------------
 include/linux/compiler_attributes.h           |  12 ++
 include/linux/percpu-refcount.h               |   2 +-
 include/linux/ptr_ring.h                      |   2 +-
 mm/memory.c                                   |   2 +-
 scripts/checkpatch.pl                         |   9 +-
 .../Documentation/explanation.txt             |  26 ++-
 18 files changed, 217 insertions(+), 382 deletions(-)
 create mode 100644 arch/alpha/include/asm/rwonce.h
 create mode 100644 include/asm-generic/rwonce.h

-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
