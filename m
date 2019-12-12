Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0241211D362
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 18:13:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A41D188885;
	Thu, 12 Dec 2019 17:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-55peu0ae0k; Thu, 12 Dec 2019 17:13:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1D5308887B;
	Thu, 12 Dec 2019 17:13:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06D71C0881;
	Thu, 12 Dec 2019 17:13:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88DBDC0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 690D724F43
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8mCl5D63jOG
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 1606824F13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576170802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wdeNKnrtxM4ObNLac44ljwb18ODcIBAtiRL+hFA1/ZQ=;
 b=F1Jq6Qi/b4eUh4H1fbgLIUDolzOYGJI+bwleBsORkOKlcwKd623q0NmAlHpsj33pXi4wIT
 qt4L6NZ8GVCjKaOqQz+Dnwp35n0o5zofUc14ciJvRcQl93sVKbpatefIlRoGjUB/rmb6BW
 QV569DAmCdIollps9LHlTbMWjfUctZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-s80F6KfRNRqjBO-zuYg7Sg-1; Thu, 12 Dec 2019 12:13:17 -0500
X-MC-Unique: s80F6KfRNRqjBO-zuYg7Sg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06391800D53;
 Thu, 12 Dec 2019 17:13:16 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0516D5C1C3;
 Thu, 12 Dec 2019 17:13:07 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 10/13] virtio-mem: Better retry handling
Date: Thu, 12 Dec 2019 18:11:34 +0100
Message-Id: <20191212171137.13872-11-david@redhat.com>
In-Reply-To: <20191212171137.13872-1-david@redhat.com>
References: <20191212171137.13872-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: virtio-dev@lists.oasis-open.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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

Let's start with a retry interval of 30 seconds and double the time until
we reach 30 minutes, in case we keep getting errors. Reset the retry
interval in case we succeeded.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 807d4e393427..3a57434f92ed 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -137,7 +137,9 @@ struct virtio_mem {
 
 	/* Timer for retrying to plug/unplug memory. */
 	struct hrtimer retry_timer;
-#define VIRTIO_MEM_RETRY_TIMER_MS		30000
+	unsigned int retry_timer_ms;
+#define VIRTIO_MEM_RETRY_TIMER_MIN_MS		30000
+#define VIRTIO_MEM_RETRY_TIMER_MAX_MS		1800000
 
 	/* Memory notifier (online/offline events). */
 	struct notifier_block memory_notifier;
@@ -1537,6 +1539,7 @@ static void virtio_mem_run_wq(struct work_struct *work)
 
 	switch (rc) {
 	case 0:
+		vm->retry_timer_ms = VIRTIO_MEM_RETRY_TIMER_MIN_MS;
 		break;
 	case -ENOSPC:
 		/*
@@ -1552,8 +1555,7 @@ static void virtio_mem_run_wq(struct work_struct *work)
 		 */
 	case -ENOMEM:
 		/* Out of memory, try again later. */
-		hrtimer_start(&vm->retry_timer,
-			      ms_to_ktime(VIRTIO_MEM_RETRY_TIMER_MS),
+		hrtimer_start(&vm->retry_timer, ms_to_ktime(vm->retry_timer_ms),
 			      HRTIMER_MODE_REL);
 		break;
 	case -EAGAIN:
@@ -1573,6 +1575,9 @@ static enum hrtimer_restart virtio_mem_timer_expired(struct hrtimer *timer)
 					     retry_timer);
 
 	virtio_mem_retry(vm);
+	/* Racy (with reset in virtio_mem_run_wq), we ignore that for now. */
+	vm->retry_timer_ms = min_t(unsigned int, vm->retry_timer_ms * 2,
+				   VIRTIO_MEM_RETRY_TIMER_MAX_MS);
 	return HRTIMER_NORESTART;
 }
 
@@ -1746,6 +1751,7 @@ static int virtio_mem_probe(struct virtio_device *vdev)
 	spin_lock_init(&vm->removal_lock);
 	hrtimer_init(&vm->retry_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	vm->retry_timer.function = virtio_mem_timer_expired;
+	vm->retry_timer_ms = VIRTIO_MEM_RETRY_TIMER_MIN_MS;
 
 	/* register the virtqueue */
 	rc = virtio_mem_init_vq(vm);
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
