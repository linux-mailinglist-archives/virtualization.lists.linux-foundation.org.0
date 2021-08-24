Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2B23F5468
	for <lists.virtualization@lfdr.de>; Tue, 24 Aug 2021 02:55:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A19F280BEC;
	Tue, 24 Aug 2021 00:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1xQONfeKFDO; Tue, 24 Aug 2021 00:54:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6456E80CB3;
	Tue, 24 Aug 2021 00:54:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE019C000E;
	Tue, 24 Aug 2021 00:54:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EAAF8C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAA5D80B14
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7HSMMB2sSl8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:54:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9733F80C2E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:54:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDE2C613D0;
 Tue, 24 Aug 2021 00:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629766483;
 bh=MX15jXYsKAQSTdXzIGLldkw4vbzR57DqkIQBOCZI4Xc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tOSj2mViMaS1xntPPjB5rFIaw/W0mfydfVy9ZQ78Hr/bmOGrD6DMc4+Qid2s6t0nR
 ClToeWggnMweTfZ7e3759y5TwgUBeZQgq+rspeJUpBtX3dPIFg0SooTTXvgzX0wEs+
 jTijcr/T9d23p/IadsGmKtdcrZgFMzqb6Mgjy3CD5RJt5wL7Yl6Ul8o6qOucLxJ5D9
 FU7nDyCpd+gdnnHLMA0TFPStRCV5Il1FOVmRHfeW2I/TF39PdsadlrYauC0nB5fkBK
 oIySNUlIh4E9wy5+ZYKFEJSJqDYx871iALFZdZtK+SBdPvF0zendaYvr7evvH8Vp6u
 9RsDbKT2tJIJw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 08/18] tools/virtio: fix build
Date: Mon, 23 Aug 2021 20:54:22 -0400
Message-Id: <20210824005432.631154-8-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824005432.631154-1-sashal@kernel.org>
References: <20210824005432.631154-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

From: "Michael S. Tsirkin" <mst@redhat.com>

[ Upstream commit a24ce06c70fe7df795a846ad713ccaa9b56a7666 ]

We use a spinlock now so add a stub.
Ignore bogus uninitialized variable warnings.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/virtio/Makefile         |  3 +-
 tools/virtio/linux/spinlock.h | 56 +++++++++++++++++++++++++++++++++++
 tools/virtio/linux/virtio.h   |  2 ++
 3 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 tools/virtio/linux/spinlock.h

diff --git a/tools/virtio/Makefile b/tools/virtio/Makefile
index b587b9a7a124..0d7bbe49359d 100644
--- a/tools/virtio/Makefile
+++ b/tools/virtio/Makefile
@@ -4,7 +4,8 @@ test: virtio_test vringh_test
 virtio_test: virtio_ring.o virtio_test.o
 vringh_test: vringh_test.o vringh.o virtio_ring.o
 
-CFLAGS += -g -O2 -Werror -Wall -I. -I../include/ -I ../../usr/include/ -Wno-pointer-sign -fno-strict-overflow -fno-strict-aliasing -fno-common -MMD -U_FORTIFY_SOURCE -include ../../include/linux/kconfig.h
+CFLAGS += -g -O2 -Werror -Wno-maybe-uninitialized -Wall -I. -I../include/ -I ../../usr/include/ -Wno-pointer-sign -fno-strict-overflow -fno-strict-aliasing -fno-common -MMD -U_FORTIFY_SOURCE -include ../../include/linux/kconfig.h
+LDFLAGS += -lpthread
 vpath %.c ../../drivers/virtio ../../drivers/vhost
 mod:
 	${MAKE} -C `pwd`/../.. M=`pwd`/vhost_test V=${V}
diff --git a/tools/virtio/linux/spinlock.h b/tools/virtio/linux/spinlock.h
new file mode 100644
index 000000000000..028e3cdcc5d3
--- /dev/null
+++ b/tools/virtio/linux/spinlock.h
@@ -0,0 +1,56 @@
+#ifndef SPINLOCK_H_STUB
+#define SPINLOCK_H_STUB
+
+#include <pthread.h>
+
+typedef pthread_spinlock_t  spinlock_t;
+
+static inline void spin_lock_init(spinlock_t *lock)
+{
+	int r = pthread_spin_init(lock, 0);
+	assert(!r);
+}
+
+static inline void spin_lock(spinlock_t *lock)
+{
+	int ret = pthread_spin_lock(lock);
+	assert(!ret);
+}
+
+static inline void spin_unlock(spinlock_t *lock)
+{
+	int ret = pthread_spin_unlock(lock);
+	assert(!ret);
+}
+
+static inline void spin_lock_bh(spinlock_t *lock)
+{
+	spin_lock(lock);
+}
+
+static inline void spin_unlock_bh(spinlock_t *lock)
+{
+	spin_unlock(lock);
+}
+
+static inline void spin_lock_irq(spinlock_t *lock)
+{
+	spin_lock(lock);
+}
+
+static inline void spin_unlock_irq(spinlock_t *lock)
+{
+	spin_unlock(lock);
+}
+
+static inline void spin_lock_irqsave(spinlock_t *lock, unsigned long f)
+{
+	spin_lock(lock);
+}
+
+static inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long f)
+{
+	spin_unlock(lock);
+}
+
+#endif
diff --git a/tools/virtio/linux/virtio.h b/tools/virtio/linux/virtio.h
index 5d90254ddae4..363b98228301 100644
--- a/tools/virtio/linux/virtio.h
+++ b/tools/virtio/linux/virtio.h
@@ -3,6 +3,7 @@
 #define LINUX_VIRTIO_H
 #include <linux/scatterlist.h>
 #include <linux/kernel.h>
+#include <linux/spinlock.h>
 
 struct device {
 	void *parent;
@@ -12,6 +13,7 @@ struct virtio_device {
 	struct device dev;
 	u64 features;
 	struct list_head vqs;
+	spinlock_t vqs_list_lock;
 };
 
 struct virtqueue {
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
