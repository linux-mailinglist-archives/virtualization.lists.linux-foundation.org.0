Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B9611D365
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 18:13:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8D17386473;
	Thu, 12 Dec 2019 17:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MpY3DVabGeFZ; Thu, 12 Dec 2019 17:13:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F256186404;
	Thu, 12 Dec 2019 17:13:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E29EBC0881;
	Thu, 12 Dec 2019 17:13:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21472C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1093286FAE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BU-zrLvMIMGO
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 55FFC86CA5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576170815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/9RPsLV3hmHV/aDZLnceRyys47s4obu7zT1ywSY+3U=;
 b=YTAZqjSCLBiEE8kML0HOJn5E9JOKVc33ekj4DXHQypAKD/iRzyytggRDD8Q9P340+IZhbb
 1cO/fkgBUnhgu1N4vj3T3VILZS86pNh/NSvgpU7yYOCWhbEA+bBpOzsbD8rJfuiDphBQsg
 R17b1xCkZDcGayWbhRQedmmm+AuUXXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-ugnwkmHgMqya7HmLmDbz_g-1; Thu, 12 Dec 2019 12:13:31 -0500
X-MC-Unique: ugnwkmHgMqya7HmLmDbz_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 546F1800053;
 Thu, 12 Dec 2019 17:13:29 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C082A5C1C3;
 Thu, 12 Dec 2019 17:13:25 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 13/13] virtio-mem: Drop slab objects when unplug
 continues to fail
Date: Thu, 12 Dec 2019 18:11:37 +0100
Message-Id: <20191212171137.13872-14-david@redhat.com>
In-Reply-To: <20191212171137.13872-1-david@redhat.com>
References: <20191212171137.13872-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: virtio-dev@lists.oasis-open.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 Igor Mammedov <imammedo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org, Dave Young <dyoung@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>
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

Start dropping slab objects after 30 minutes and repeat every 30 minutes
in case we can't unplug more memory using alloc_contig_range().
Log messages and make it configurable. Enable dropping slab objects as
default (especially, reclaimable slab objects that are not movable).

In the future, we might want to implement+use drop_slab_range(), which
will also come in handy for other users (e.g., offlining, gigantic huge
pages).

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 3a57434f92ed..8f25f7453a08 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -25,6 +25,11 @@ static bool unplug_online = true;
 module_param(unplug_online, bool, 0644);
 MODULE_PARM_DESC(unplug_online, "Try to unplug online memory");
 
+static bool drop_slab_objects = true;
+module_param(drop_slab_objects, bool, 0644);
+MODULE_PARM_DESC(drop_slab_objects,
+		 "Drop slab objects when unplug continues to fail");
+
 enum virtio_mem_mb_state {
 	/* Unplugged, not added to Linux. Can be reused later. */
 	VIRTIO_MEM_MB_STATE_UNUSED = 0,
@@ -1384,6 +1389,7 @@ static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
 static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 {
 	uint64_t nb_sb = diff / vm->subblock_size;
+	bool retried = false;
 	unsigned long mb_id;
 	int rc;
 
@@ -1421,6 +1427,7 @@ static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 		return 0;
 	}
 
+retry_locked:
 	/* Try to unplug subblocks of partially plugged online blocks. */
 	virtio_mem_for_each_mb_state(vm, mb_id,
 				     VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL) {
@@ -1445,6 +1452,29 @@ static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 	}
 
 	mutex_unlock(&vm->hotplug_mutex);
+
+	/*
+	 * If we can't unplug the requested amount of memory for a long time,
+	 * start freeing up memory in caches. This might harm performance,
+	 * is configurable, and we log a message. Retry imemdiately a second
+	 * time - then wait another VIRTIO_MEM_RETRY_TIMER_MAX_MS.
+	 */
+	if (nb_sb && !retried && drop_slab_objects &&
+	    vm->retry_timer_ms == VIRTIO_MEM_RETRY_TIMER_MAX_MS) {
+		if (vm->nid == NUMA_NO_NODE) {
+			dev_info(&vm->vdev->dev, "dropping all slab objects\n");
+			drop_slab();
+		} else {
+			dev_info(&vm->vdev->dev,
+				 "dropping all slab objects on node=%d\n",
+				 vm->nid);
+			drop_slab_node(vm->nid);
+		}
+		retried = true;
+		mutex_lock(&vm->hotplug_mutex);
+		goto retry_locked;
+	}
+
 	return nb_sb ? -EBUSY : 0;
 out_unlock:
 	mutex_unlock(&vm->hotplug_mutex);
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
