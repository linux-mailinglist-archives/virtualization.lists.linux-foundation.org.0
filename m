Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED752F1256
	for <lists.virtualization@lfdr.de>; Mon, 11 Jan 2021 13:34:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1989D204C4;
	Mon, 11 Jan 2021 12:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0n78OCCjWQ1E; Mon, 11 Jan 2021 12:34:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2D9B1214E6;
	Mon, 11 Jan 2021 12:34:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0437DC013A;
	Mon, 11 Jan 2021 12:34:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5070FC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 12:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 228C0214E9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 12:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JxK1SmRNW7u6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 12:34:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by silver.osuosl.org (Postfix) with ESMTPS id 79944204B2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 12:34:04 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 11 Jan 2021 04:18:54 -0800
Received: from sc-dbc2115.eng.vmware.com (sc-dbc2115.eng.vmware.com
 [10.182.28.6])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 6CF5C209BE;
 Mon, 11 Jan 2021 04:18:55 -0800 (PST)
From: Jorgen Hansen <jhansen@vmware.com>
To: <linux-kernel@vger.kernel.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH] VMCI: Enforce queuepair max size for
 IOCTL_VMCI_QUEUEPAIR_ALLOC
Date: Mon, 11 Jan 2021 04:18:53 -0800
Message-ID: <1610367535-4463-1-git-send-email-jhansen@vmware.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: jhansen@vmware.com does not
 designate permitted sender hosts)
Cc: pv-drivers@vmware.com, gregkh@linuxfoundation.org,
 Jorgen Hansen <jhansen@vmware.com>
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

When create the VMCI queue pair tracking data structures on the host
side, the IOCTL for creating the VMCI queue pair didn't validate
the queue pair size parameters. This change adds checks for this.

This avoids a memory allocation issue in qp_host_alloc_queue, as
reported by nslusarek@gmx.net. The check in qp_host_alloc_queue
has also been updated to enforce the maximum queue pair size
as defined by VMCI_MAX_GUEST_QP_MEMORY.

The fix has been verified using sample code supplied by
nslusarek@gmx.net.

Reported-by: nslusarek@gmx.net
Reviewed-by: Vishnu Dasa <vdasa@vmware.com>
Signed-off-by: Jorgen Hansen <jhansen@vmware.com>
---
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 12 ++++++++----
 include/linux/vmw_vmci_defs.h           |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 525ef96..39d2f191 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -237,7 +237,9 @@ static struct qp_list qp_guest_endpoints = {
 #define QPE_NUM_PAGES(_QPE) ((u32) \
 			     (DIV_ROUND_UP(_QPE.produce_size, PAGE_SIZE) + \
 			      DIV_ROUND_UP(_QPE.consume_size, PAGE_SIZE) + 2))
-
+#define QP_SIZES_ARE_VALID(_prod_qsize, _cons_qsize) \
+	((_prod_qsize) + (_cons_qsize) >= max(_prod_qsize, _cons_qsize) && \
+	 (_prod_qsize) + (_cons_qsize) <= VMCI_MAX_GUEST_QP_MEMORY)
 
 /*
  * Frees kernel VA space for a given queue and its queue header, and
@@ -528,7 +530,7 @@ static struct vmci_queue *qp_host_alloc_queue(u64 size)
 	u64 num_pages;
 	const size_t queue_size = sizeof(*queue) + sizeof(*(queue->kernel_if));
 
-	if (size > SIZE_MAX - PAGE_SIZE)
+	if (size > min(VMCI_MAX_GUEST_QP_MEMORY, SIZE_MAX - PAGE_SIZE))
 		return NULL;
 	num_pages = DIV_ROUND_UP(size, PAGE_SIZE) + 1;
 	if (num_pages > (SIZE_MAX - queue_size) /
@@ -1929,6 +1931,9 @@ int vmci_qp_broker_alloc(struct vmci_handle handle,
 			 struct vmci_qp_page_store *page_store,
 			 struct vmci_ctx *context)
 {
+	if (!QP_SIZES_ARE_VALID(produce_size, consume_size))
+		return VMCI_ERROR_NO_RESOURCES;
+
 	return qp_broker_alloc(handle, peer, flags, priv_flags,
 			       produce_size, consume_size,
 			       page_store, context, NULL, NULL, NULL, NULL);
@@ -2685,8 +2690,7 @@ int vmci_qpair_alloc(struct vmci_qp **qpair,
 	 * used by the device is NO_RESOURCES, so use that here too.
 	 */
 
-	if (produce_qsize + consume_qsize < max(produce_qsize, consume_qsize) ||
-	    produce_qsize + consume_qsize > VMCI_MAX_GUEST_QP_MEMORY)
+	if (!QP_SIZES_ARE_VALID(produce_qsize, consume_qsize))
 		return VMCI_ERROR_NO_RESOURCES;
 
 	retval = vmci_route(&src, &dst, false, &route);
diff --git a/include/linux/vmw_vmci_defs.h b/include/linux/vmw_vmci_defs.h
index be0afe6..e36cb11 100644
--- a/include/linux/vmw_vmci_defs.h
+++ b/include/linux/vmw_vmci_defs.h
@@ -66,7 +66,7 @@ enum {
  * consists of at least two pages, the memory limit also dictates the
  * number of queue pairs a guest can create.
  */
-#define VMCI_MAX_GUEST_QP_MEMORY (128 * 1024 * 1024)
+#define VMCI_MAX_GUEST_QP_MEMORY ((size_t)(128 * 1024 * 1024))
 #define VMCI_MAX_GUEST_QP_COUNT  (VMCI_MAX_GUEST_QP_MEMORY / PAGE_SIZE / 2)
 
 /*
@@ -80,7 +80,7 @@ enum {
  * too much kernel memory (especially on vmkernel).  We limit a queuepair to
  * 32 KB, or 16 KB per queue for symmetrical pairs.
  */
-#define VMCI_MAX_PINNED_QP_MEMORY (32 * 1024)
+#define VMCI_MAX_PINNED_QP_MEMORY ((size_t)(32 * 1024))
 
 /*
  * We have a fixed set of resource IDs available in the VMX.
-- 
2.6.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
