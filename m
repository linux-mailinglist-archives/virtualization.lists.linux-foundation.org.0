Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA2A6906C3
	for <lists.virtualization@lfdr.de>; Thu,  9 Feb 2023 12:20:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CF2E61122;
	Thu,  9 Feb 2023 11:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CF2E61122
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z/k6QUZi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kmx2jNQWUv7i; Thu,  9 Feb 2023 11:20:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 32CC760E00;
	Thu,  9 Feb 2023 11:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32CC760E00
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80A7DC007C;
	Thu,  9 Feb 2023 11:20:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03E1EC002B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Feb 2023 11:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D22BD60E00
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Feb 2023 11:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D22BD60E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t9JxBa0Sjvaw
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Feb 2023 11:20:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3F0A60D94
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3F0A60D94
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Feb 2023 11:20:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F51E61A2B;
 Thu,  9 Feb 2023 11:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDE3C433EF;
 Thu,  9 Feb 2023 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675941619;
 bh=peFmOTB7hqr4OGOw/24rxoXk8Ti2WnzdQLOpzjvaD9k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z/k6QUZiOJ3szwL7r/84Ln4sHZbgYNrRuCZ+H+jZYZD+y3vrXpggno1gWFygiHtj8
 3A0wL37jzurqI+KCiugBAxDQ6biQoJQPrTShPxFtNUyGFh/bAq288AXNubyEto11HJ
 fwS/EwS9sW2G+xzrqFzdfsqRoIYgdeITg7oJ9gqXj4yLNAytNwTrXM2jjROolfG9fg
 LP0yWpg5lPQqvXQ0XEbOPAGYOa2R7/oZNYTbMH+6L8i93o0twAxQqqA2+gE1RwAxFM
 QePs7Y/zmotu1u2JBrygA+PitENldmmbRute5uI5fpabZaX8ipkwC+Mqn6CLvGKaop
 k+775lnTyTpjQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 2/6] tools/virtio: fix the vringh test for virtio
 ring changes
Date: Thu,  9 Feb 2023 06:19:55 -0500
Message-Id: <20230209111959.1893269-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111959.1893269-1-sashal@kernel.org>
References: <20230209111959.1893269-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, peng.fan@nxp.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 Shunsuke Mie <mie@igel.co.jp>
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

From: Shunsuke Mie <mie@igel.co.jp>

[ Upstream commit 3f7b75abf41cc4143aa295f62acbb060a012868d ]

Fix the build caused by missing kmsan_handle_dma() and is_power_of_2() that
are used in drivers/virtio/virtio_ring.c.

Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
Message-Id: <20230110034310.779744-1-mie@igel.co.jp>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/virtio/linux/bug.h         |  8 +++-----
 tools/virtio/linux/build_bug.h   |  7 +++++++
 tools/virtio/linux/cpumask.h     |  7 +++++++
 tools/virtio/linux/gfp.h         |  7 +++++++
 tools/virtio/linux/kernel.h      |  1 +
 tools/virtio/linux/kmsan.h       | 12 ++++++++++++
 tools/virtio/linux/scatterlist.h |  1 +
 tools/virtio/linux/topology.h    |  7 +++++++
 8 files changed, 45 insertions(+), 5 deletions(-)
 create mode 100644 tools/virtio/linux/build_bug.h
 create mode 100644 tools/virtio/linux/cpumask.h
 create mode 100644 tools/virtio/linux/gfp.h
 create mode 100644 tools/virtio/linux/kmsan.h
 create mode 100644 tools/virtio/linux/topology.h

diff --git a/tools/virtio/linux/bug.h b/tools/virtio/linux/bug.h
index b14c2c3b6b857..74aef964f5099 100644
--- a/tools/virtio/linux/bug.h
+++ b/tools/virtio/linux/bug.h
@@ -1,11 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef BUG_H
-#define BUG_H
+#ifndef _LINUX_BUG_H
+#define _LINUX_BUG_H
 
 #define BUG_ON(__BUG_ON_cond) assert(!(__BUG_ON_cond))
 
-#define BUILD_BUG_ON(x)
-
 #define BUG() abort()
 
-#endif /* BUG_H */
+#endif /* _LINUX_BUG_H */
diff --git a/tools/virtio/linux/build_bug.h b/tools/virtio/linux/build_bug.h
new file mode 100644
index 0000000000000..cdbb75e28a604
--- /dev/null
+++ b/tools/virtio/linux/build_bug.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_BUILD_BUG_H
+#define _LINUX_BUILD_BUG_H
+
+#define BUILD_BUG_ON(x)
+
+#endif	/* _LINUX_BUILD_BUG_H */
diff --git a/tools/virtio/linux/cpumask.h b/tools/virtio/linux/cpumask.h
new file mode 100644
index 0000000000000..307da69d6b26c
--- /dev/null
+++ b/tools/virtio/linux/cpumask.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_CPUMASK_H
+#define _LINUX_CPUMASK_H
+
+#include <linux/kernel.h>
+
+#endif /* _LINUX_CPUMASK_H */
diff --git a/tools/virtio/linux/gfp.h b/tools/virtio/linux/gfp.h
new file mode 100644
index 0000000000000..43d146f236f14
--- /dev/null
+++ b/tools/virtio/linux/gfp.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_GFP_H
+#define __LINUX_GFP_H
+
+#include <linux/topology.h>
+
+#endif
diff --git a/tools/virtio/linux/kernel.h b/tools/virtio/linux/kernel.h
index 7ef45a4a3cba7..0dc38fe2a4f16 100644
--- a/tools/virtio/linux/kernel.h
+++ b/tools/virtio/linux/kernel.h
@@ -10,6 +10,7 @@
 #include <stdarg.h>
 
 #include <linux/compiler.h>
+#include <linux/log2.h>
 #include <linux/types.h>
 #include <linux/printk.h>
 #include <linux/bug.h>
diff --git a/tools/virtio/linux/kmsan.h b/tools/virtio/linux/kmsan.h
new file mode 100644
index 0000000000000..272b5aa285d5a
--- /dev/null
+++ b/tools/virtio/linux/kmsan.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_KMSAN_H
+#define _LINUX_KMSAN_H
+
+#include <linux/gfp.h>
+
+inline void kmsan_handle_dma(struct page *page, size_t offset, size_t size,
+			     enum dma_data_direction dir)
+{
+}
+
+#endif /* _LINUX_KMSAN_H */
diff --git a/tools/virtio/linux/scatterlist.h b/tools/virtio/linux/scatterlist.h
index 369ee308b6686..74d9e1825748e 100644
--- a/tools/virtio/linux/scatterlist.h
+++ b/tools/virtio/linux/scatterlist.h
@@ -2,6 +2,7 @@
 #ifndef SCATTERLIST_H
 #define SCATTERLIST_H
 #include <linux/kernel.h>
+#include <linux/bug.h>
 
 struct scatterlist {
 	unsigned long	page_link;
diff --git a/tools/virtio/linux/topology.h b/tools/virtio/linux/topology.h
new file mode 100644
index 0000000000000..910794afb993a
--- /dev/null
+++ b/tools/virtio/linux/topology.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_TOPOLOGY_H
+#define _LINUX_TOPOLOGY_H
+
+#include <linux/cpumask.h>
+
+#endif /* _LINUX_TOPOLOGY_H */
-- 
2.39.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
