Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 54361262031
	for <lists.virtualization@lfdr.de>; Tue,  8 Sep 2020 22:10:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0493A86EBB;
	Tue,  8 Sep 2020 20:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNdFsLY4a7u1; Tue,  8 Sep 2020 20:10:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8863C86EA4;
	Tue,  8 Sep 2020 20:10:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D295C0051;
	Tue,  8 Sep 2020 20:10:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81DADC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 20:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 67A4D8562A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 20:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FsqpzKQZTGji
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 20:10:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9004F85623
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 20:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599595837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c3EXsANyRQfNPWugjklxVXDT/m3en9wKUY4fM1Sf5tA=;
 b=e7kL1KLPTC0NcQ56BOvHfFkbQJPwH36+0DPCRvptTbit5NPXHvcA7IyAmlIo6SD1WAdjHZ
 N3SC+qGJLWZoecYsGAWt3Q+N3tLXb26/bs8lfm6rBZmRInvH1agGGIM0fSz9DgVPSpnQwU
 t3sHBFe+ct0OWZ8l1DzL7gWw40SOXs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-5kkWOmFZP5m0Qe57B5e2tg-1; Tue, 08 Sep 2020 16:10:34 -0400
X-MC-Unique: 5kkWOmFZP5m0Qe57B5e2tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F25761074667;
 Tue,  8 Sep 2020 20:10:28 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-46.ams2.redhat.com [10.36.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04EEC5D9E8;
 Tue,  8 Sep 2020 20:10:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] mm/memory_hotplug: selective merging of system ram
 resources
Date: Tue,  8 Sep 2020 22:10:05 +0200
Message-Id: <20200908201012.44168-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Pingfan Liu <kernelfans@gmail.com>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Oliver O'Halloran <oohall@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 linux-nvdimm@lists.01.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-acpi@vger.kernel.org,
 Wei Yang <richardw.yang@linux.intel.com>, xen-devel@lists.xenproject.org,
 Anton Blanchard <anton@ozlabs.org>, Heiko Carstens <hca@linux.ibm.com>,
 Len Brown <lenb@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>,
 Julien Grall <julien@xen.org>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Leonardo Bras <leobras.c@gmail.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Juergen Gross <jgross@suse.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Libor Pechacek <lpechacek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>,
 Eric Biederman <ebiederm@xmission.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
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

Some add_memory*() users add memory in small, contiguous memory blocks.
Examples include virtio-mem, hyper-v balloon, and the XEN balloon.

This can quickly result in a lot of memory resources, whereby the actual
resource boundaries are not of interest (e.g., it might be relevant for
DIMMs, exposed via /proc/iomem to user space). We really want to merge
added resources in this scenario where possible.

Resources are effectively stored in a list-based tree. Having a lot of
resources not only wastes memory, it also makes traversing that tree more
expensive, and makes /proc/iomem explode in size (e.g., requiring
kexec-tools to manually merge resources when creating a kdump header. The
current kexec-tools resource count limit does not allow for more than
~100GB of memory with a memory block size of 128MB on x86-64).

Let's allow to selectively merge system ram resources by specifying a
new flag for add_memory*(). Patch #5 contains a /proc/iomem example. Only
tested with virtio-mem.

v1 -> v2:
- I had another look at v1 after vacation and didn't like it - it felt like
  a hack. So I want forward and added a proper flag to add_memory*(), and
  introduce a clean (non-racy) way to mark System RAM resources mergeable.
- "kernel/resource: move and rename IORESOURCE_MEM_DRIVER_MANAGED"
-- Clean that flag up, felt wrong in the PnP section
- "mm/memory_hotplug: prepare passing flags to add_memory() and friends"
-- Previously sent in other context - decided to keep Wei's ack
- "mm/memory_hotplug: MEMHP_MERGE_RESOURCE to specify merging of System
   RAM resources"
-- Cleaner approach to get the job done by using proper flags and only
   merging the single, specified resource
- "virtio-mem: try to merge system ram resources"
  "xen/balloon: try to merge system ram resources"
  "hv_balloon: try to merge system ram resources"
-- Use the new flag MEMHP_MERGE_RESOURCE, much cleaner

RFC -> v1:
- Switch from rather generic "merge_child_mem_resources()" where a resource
  name has to be specified to "merge_system_ram_resources().
- Smaller comment/documentation/patch description changes/fixes

David Hildenbrand (7):
  kernel/resource: make release_mem_region_adjustable() never fail
  kernel/resource: move and rename IORESOURCE_MEM_DRIVER_MANAGED
  mm/memory_hotplug: prepare passing flags to add_memory() and friends
  mm/memory_hotplug: MEMHP_MERGE_RESOURCE to specify merging of System
    RAM resources
  virtio-mem: try to merge system ram resources
  xen/balloon: try to merge system ram resources
  hv_balloon: try to merge system ram resources

 arch/powerpc/platforms/powernv/memtrace.c     |   2 +-
 .../platforms/pseries/hotplug-memory.c        |   2 +-
 drivers/acpi/acpi_memhotplug.c                |   2 +-
 drivers/base/memory.c                         |   2 +-
 drivers/dax/kmem.c                            |   2 +-
 drivers/hv/hv_balloon.c                       |   2 +-
 drivers/s390/char/sclp_cmd.c                  |   2 +-
 drivers/virtio/virtio_mem.c                   |   3 +-
 drivers/xen/balloon.c                         |   2 +-
 include/linux/ioport.h                        |  12 +-
 include/linux/memory_hotplug.h                |  19 ++-
 kernel/kexec_file.c                           |   2 +-
 kernel/resource.c                             | 109 ++++++++++++++----
 mm/memory_hotplug.c                           |  48 +++-----
 14 files changed, 141 insertions(+), 68 deletions(-)

-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
