Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9CA1578C
	for <lists.virtualization@lfdr.de>; Tue,  7 May 2019 04:23:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3A0B93E82;
	Tue,  7 May 2019 02:23:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 88F163E34
	for <virtualization@lists.linux-foundation.org>;
	Tue,  7 May 2019 02:23:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E4C8A834
	for <virtualization@lists.linux-foundation.org>;
	Tue,  7 May 2019 02:23:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F155D81127;
	Tue,  7 May 2019 02:23:35 +0000 (UTC)
Received: from hp-dl380pg8-02.lab.eng.pek2.redhat.com
	(hp-dl380pg8-02.lab.eng.pek2.redhat.com [10.73.8.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C87160BEC;
	Tue,  7 May 2019 02:23:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] vhost: don't use kmap() to log dirty pages
Date: Mon,  6 May 2019 22:23:29 -0400
Message-Id: <1557195809-12373-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 07 May 2019 02:23:36 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Christoph Hellwig <hch@infradead.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Andrea Arcangeli <aarcange@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Vhost log dirty pages directly to a userspace bitmap through GUP and
kmap_atomic() since kernel doesn't have a set_bit_to_user()
helper. This will cause issues for the arch that has virtually tagged
caches. The way to fix is to keep using userspace virtual address.

Fortunately, futex has a cmpxchg to userspace memory helper
futex_atomic_cmpxchg_inatomic(). So switch to use it to exchange the
userspace bitmap with zero, set the bit and then write it back through
put_user().

Note: there're archs (few non popular ones) that don't implement
futex helper, we can't log dirty pages. We can fix them on top or
simply disable LOG_ALL features of vhost.

Cc: Christoph Hellwig <hch@infradead.org>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Fixes: 3a4d5c94e9593 ("vhost_net: a kernel-level virtio server")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vhost.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 351af88..9c94c41 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -31,6 +31,7 @@
 #include <linux/sched/signal.h>
 #include <linux/interval_tree_generic.h>
 #include <linux/nospec.h>
+#include <asm/futex.h>
 
 #include "vhost.h"
 
@@ -1692,25 +1693,27 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
 }
 EXPORT_SYMBOL_GPL(vhost_dev_ioctl);
 
-/* TODO: This is really inefficient.  We need something like get_user()
- * (instruction directly accesses the data, with an exception table entry
- * returning -EFAULT). See Documentation/x86/exception-tables.txt.
- */
-static int set_bit_to_user(int nr, void __user *addr)
+static int set_bit_to_user(int nr, u32 __user *addr)
 {
 	unsigned long log = (unsigned long)addr;
 	struct page *page;
-	void *base;
-	int bit = nr + (log % PAGE_SIZE) * 8;
+	u32 old_log;
 	int r;
 
 	r = get_user_pages_fast(log, 1, 1, &page);
 	if (r < 0)
 		return r;
 	BUG_ON(r != 1);
-	base = kmap_atomic(page);
-	set_bit(bit, base);
-	kunmap_atomic(base);
+
+	r = futex_atomic_cmpxchg_inatomic(&old_log, addr, 0, 0);
+	if (r < 0)
+		return r;
+
+	old_log |= 1 << nr;
+	r = put_user(old_log, addr);
+	if (r < 0)
+		return r;
+
 	set_page_dirty_lock(page);
 	put_page(page);
 	return 0;
@@ -1727,8 +1730,8 @@ static int log_write(void __user *log_base,
 	write_length += write_address % VHOST_PAGE_SIZE;
 	for (;;) {
 		u64 base = (u64)(unsigned long)log_base;
-		u64 log = base + write_page / 8;
-		int bit = write_page % 8;
+		u64 log = base + write_page / 32;
+		int bit = write_page % 32;
 		if ((u64)(unsigned long)log != log)
 			return -EFAULT;
 		r = set_bit_to_user(bit, (void __user *)(unsigned long)log);
-- 
1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
