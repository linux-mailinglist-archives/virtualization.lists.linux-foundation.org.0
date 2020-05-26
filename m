Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 512661BE367
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 18:09:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C0D14865D3;
	Wed, 29 Apr 2020 16:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBMbiLEZ8gDg; Wed, 29 Apr 2020 16:08:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A7CC785899;
	Wed, 29 Apr 2020 16:08:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CDBEC0172;
	Wed, 29 Apr 2020 16:08:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0ABA8C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 16:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0063384977
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 16:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4CVk4iyevHiD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 16:08:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6D4EE8528B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588176527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhuWZGDE9ZNfsUlRzjnVfD2BmrQPIPuqvz9+u5pM+h4=;
 b=iAt9ZbRTwyAierkY82djN/bjTNfedMKw9wi6s7saue4KzVLJOa/zuKTdkryJJzrip1GMEc
 2kIMs8u6KjBBxqt1la983q/woNfO3s+A7pMf9wGV4arVFvhMSmMB8c61nYK+o+n2gi2DpF
 7MHEPZuPmq8FUwIV9dgkLqVG2s+QuyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-JfUNgq6rMea1vtiPscJa6Q-1; Wed, 29 Apr 2020 12:08:43 -0400
X-MC-Unique: JfUNgq6rMea1vtiPscJa6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C4CC462;
 Wed, 29 Apr 2020 16:08:41 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-55.ams2.redhat.com [10.36.114.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BC8E60621;
 Wed, 29 Apr 2020 16:08:32 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] mm/memory_hotplug: Introduce MHP_DRIVER_MANAGED
Date: Wed, 29 Apr 2020 18:08:02 +0200
Message-Id: <20200429160803.109056-3-david@redhat.com>
In-Reply-To: <20200429160803.109056-1-david@redhat.com>
References: <20200429160803.109056-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Some paravirtualized devices that add memory via add_memory() and
friends (esp. virtio-mem) don't want to create entries in
/sys/firmware/memmap/ - primarily to hinder kexec from adding this
memory to the boot memmap of the kexec kernel.

In fact, such memory is never exposed via the firmware (e.g., e820), but
only via the device, so exposing this memory via /sys/firmware/memmap/ is
wrong:
 "kexec needs the raw firmware-provided memory map to setup the
  parameter segment of the kernel that should be booted with
  kexec. Also, the raw memory map is useful for debugging. For
  that reason, /sys/firmware/memmap is an interface that provides
  the raw memory map to userspace." [1]

We want to let user space know that memory which is always detected,
added, and managed via a (device) driver - like memory managed by
virtio-mem - is special. It cannot be used for placing kexec segments
and the (device) driver is responsible for re-adding memory that
(eventually shrunk/grown/defragmented) memory after a reboot/kexec. It
should e.g., not be added to a fixed up firmware memmap. However, it should
be dumped by kdump.

Also, such memory could behave differently than an ordinary DIMM - e.g.,
memory managed by virtio-mem can have holes inside added memory resource,
which should not be touched, especially for writing.

Let's expose that memory as "System RAM (driver managed)" e.g., via
/pro/iomem.

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
 include/linux/memory_hotplug.h |  8 ++++++++
 mm/memory_hotplug.c            | 20 ++++++++++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index bf0e3edb8688..cc538584b39e 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -68,6 +68,14 @@ struct mhp_params {
 	pgprot_t pgprot;
 };
 
+/* Flags used for add_memory() and friends. */
+
+/*
+ * Don't create entries in /sys/firmware/memmap/ and expose memory as
+ * "System RAM (driver managed)" in e.g., /proc/iomem
+ */
+#define MHP_DRIVER_MANAGED		1
+
 /*
  * Zone resizing functions
  *
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index ebdf6541d074..cfa0721280aa 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -98,11 +98,11 @@ void mem_hotplug_done(void)
 u64 max_mem_size = U64_MAX;
 
 /* add this memory to iomem resource */
-static struct resource *register_memory_resource(u64 start, u64 size)
+static struct resource *register_memory_resource(u64 start, u64 size,
+						 const char *resource_name)
 {
 	struct resource *res;
 	unsigned long flags =  IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
-	char *resource_name = "System RAM";
 
 	/*
 	 * Make sure value parsed from 'mem=' only restricts memory adding
@@ -1058,7 +1058,8 @@ int __ref add_memory_resource(int nid, struct resource *res,
 	BUG_ON(ret);
 
 	/* create new memmap entry */
-	firmware_map_add_hotplug(start, start + size, "System RAM");
+	if (!(flags & MHP_DRIVER_MANAGED))
+		firmware_map_add_hotplug(start, start + size, "System RAM");
 
 	/* device_online() will take the lock when calling online_pages() */
 	mem_hotplug_done();
@@ -1081,10 +1082,21 @@ int __ref add_memory_resource(int nid, struct resource *res,
 /* requires device_hotplug_lock, see add_memory_resource() */
 int __ref __add_memory(int nid, u64 start, u64 size, unsigned long flags)
 {
+	const char *resource_name = "System RAM";
 	struct resource *res;
 	int ret;
 
-	res = register_memory_resource(start, size);
+	/*
+	 * Indicate that memory managed by a driver is special. It's always
+	 * detected and added via a driver, should not be given to the kexec
+	 * kernel for booting when manually crafting the firmware memmap, and
+	 * no kexec segments should be placed on it. However, kdump should
+	 * dump this memory.
+	 */
+	if (flags & MHP_DRIVER_MANAGED)
+		resource_name = "System RAM (driver managed)";
+
+	res = register_memory_resource(start, size, resource_name);
 	if (IS_ERR(res))
 		return PTR_ERR(res);
 
-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
