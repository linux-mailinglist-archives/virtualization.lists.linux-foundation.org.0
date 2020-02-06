Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B851540AC
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 09:52:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 144BA84083;
	Thu,  6 Feb 2020 08:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oqzvv-WZA8eE; Thu,  6 Feb 2020 08:52:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 933DB85DC7;
	Thu,  6 Feb 2020 08:52:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 587E5C013E;
	Thu,  6 Feb 2020 08:52:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9534C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AE96F20436
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8B35LiIRhtkO
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:52:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by silver.osuosl.org (Postfix) with ESMTPS id EAA3C20243
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:52:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 00:52:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,409,1574150400"; d="scan'208";a="264531173"
Received: from devel-ww.sh.intel.com ([10.239.48.128])
 by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2020 00:52:10 -0800
From: Wei Wang <wei.w.wang@intel.com>
To: linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH RFC] virtio_balloon: conservative balloon page shrinking
Date: Thu,  6 Feb 2020 16:01:47 +0800
Message-Id: <1580976107-16013-1-git-send-email-wei.w.wang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: penguin-kernel@I-love.SAKURA.ne.jp, mst@redhat.com, mhocko@kernel.org,
 tysand@google.com, namit@vmware.com, rientjes@google.com,
 alexander.h.duyck@linux.intel.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

There are cases that users want to shrink balloon pages after the
pagecache depleted. The conservative_shrinker lets the shrinker
shrink balloon pages when all the pagecache has been reclaimed.

Signed-off-by: Wei Wang <wei.w.wang@intel.com>
---
 drivers/virtio/virtio_balloon.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 93f995f6cf36..b4c5bb13a867 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -42,6 +42,10 @@
 static struct vfsmount *balloon_mnt;
 #endif
 
+static bool conservative_shrinker = true;
+module_param(conservative_shrinker, bool, 0644);
+MODULE_PARM_DESC(conservative_shrinker, "conservatively shrink balloon pages");
+
 enum virtio_balloon_vq {
 	VIRTIO_BALLOON_VQ_INFLATE,
 	VIRTIO_BALLOON_VQ_DEFLATE,
@@ -796,6 +800,10 @@ static unsigned long shrink_balloon_pages(struct virtio_balloon *vb,
 {
 	unsigned long pages_freed = 0;
 
+	/* Balloon pages only gets shrunk when the pagecache depleted */
+	if (conservative_shrinker && global_node_page_state(NR_FILE_PAGES))
+		return 0;
+
 	/*
 	 * One invocation of leak_balloon can deflate at most
 	 * VIRTIO_BALLOON_ARRAY_PFNS_MAX balloon pages, so we call it
@@ -837,7 +845,11 @@ static unsigned long virtio_balloon_shrinker_count(struct shrinker *shrinker,
 					struct virtio_balloon, shrinker);
 	unsigned long count;
 
-	count = vb->num_pages / VIRTIO_BALLOON_PAGES_PER_PAGE;
+	if (conservative_shrinker && global_node_page_state(NR_FILE_PAGES))
+		count = 0;
+	else
+		count = vb->num_pages / VIRTIO_BALLOON_PAGES_PER_PAGE;
+
 	count += vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
 
 	return count;
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
