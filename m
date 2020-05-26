Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9161BF577
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 12:30:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2026B86C77;
	Thu, 30 Apr 2020 10:30:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x47w5M11LGBS; Thu, 30 Apr 2020 10:30:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9DC5B86C43;
	Thu, 30 Apr 2020 10:30:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91655C0864;
	Thu, 30 Apr 2020 10:30:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2767CC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1762388611
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:29:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9icrBeuOydSI
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:29:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 785B68868C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588242596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBxdneYzv1oFt6rUtmxHP8L8tmn6FMG5Rn0MO+hCbf0=;
 b=GRc1AOxPVSP5nuHEWrXjyi/msXQ0zbqJmYJrnrUMnBMgWRZeMevzIvGaFLkugFIFcgkVrV
 QVgvBqje0bXGeEMvcM98GRSr1ODO6I1j6l2GA54ykkDm7wIHNH/tL3iW/6Q7blEJBradq6
 erGTZhdH6d8APCUbHXTN2O1RqAEuTzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-ZkDsTUQ-OxW7sjqOoV_anw-1; Thu, 30 Apr 2020 06:29:51 -0400
X-MC-Unique: ZkDsTUQ-OxW7sjqOoV_anw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 920BB45F;
 Thu, 30 Apr 2020 10:29:49 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B43035EDEB;
 Thu, 30 Apr 2020 10:29:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] mm/memory_hotplug: Introduce MHP_NO_FIRMWARE_MEMMAP
Date: Thu, 30 Apr 2020 12:29:07 +0200
Message-Id: <20200430102908.10107-3-david@redhat.com>
In-Reply-To: <20200430102908.10107-1-david@redhat.com>
References: <20200430102908.10107-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: virtio-dev@lists.oasis-open.org, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, linux-acpi@vger.kernel.org,
 Baoquan He <bhe@redhat.com>, linux-nvdimm@lists.01.org,
 linux-s390@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Wei Yang <richard.weiyang@gmail.com>, Eric Biederman <ebiederm@xmission.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

Some devices/drivers that add memory via add_memory() and friends (e.g.,
dax/kmem, but also virtio-mem in the future) don't want to create entries
in /sys/firmware/memmap/ - primarily to hinder kexec from adding this
memory to the boot memmap of the kexec kernel.

In fact, such memory is never exposed via the firmware memmap as System
RAM (e.g., e820), so exposing this memory via /sys/firmware/memmap/ is
wrong:
 "kexec needs the raw firmware-provided memory map to setup the
  parameter segment of the kernel that should be booted with
  kexec. Also, the raw memory map is useful for debugging. For
  that reason, /sys/firmware/memmap is an interface that provides
  the raw memory map to userspace." [1]

We don't have to worry about firmware_map_remove() on the removal path.
If there is no entry, it will simply return with -EINVAL.

[1] https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-memmap

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Wei Yang <richard.weiyang@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Eric Biederman <ebiederm@xmission.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memory_hotplug.h | 8 ++++++++
 mm/memory_hotplug.c            | 3 ++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 0151fb935c09..4ca418a731eb 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -68,6 +68,14 @@ struct mhp_params {
 	pgprot_t pgprot;
 };
 
+/* Flags used for add_memory() and friends. */
+
+/*
+ * Don't create entries in /sys/firmware/memmap/. The memory is detected and
+ * added via a device driver, not via the initial (firmware) memmap.
+ */
+#define MHP_NO_FIRMWARE_MEMMAP		1
+
 /*
  * Zone resizing functions
  *
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index c01be92693e3..e94ede9cad00 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1062,7 +1062,8 @@ int __ref add_memory_resource(int nid, struct resource *res,
 	BUG_ON(ret);
 
 	/* create new memmap entry */
-	firmware_map_add_hotplug(start, start + size, "System RAM");
+	if (!(flags & MHP_NO_FIRMWARE_MEMMAP))
+		firmware_map_add_hotplug(start, start + size, "System RAM");
 
 	/* device_online() will take the lock when calling online_pages() */
 	mem_hotplug_done();
-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
