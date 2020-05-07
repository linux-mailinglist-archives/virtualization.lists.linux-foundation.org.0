Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E59E1C8D37
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 16:02:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D401788547;
	Thu,  7 May 2020 14:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzwDi8GKMICA; Thu,  7 May 2020 14:02:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9ABDA8854D;
	Thu,  7 May 2020 14:02:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76CBFC07FF;
	Thu,  7 May 2020 14:02:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03772C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DC35387293
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COJFhRqDLB8T
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:02:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4486987242
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588860132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YnnUFsND7O7jqtL6msM8nwBMUisTSmUw25RGNt2JJrs=;
 b=e09D5jo4dH6Bv/slAOQsYU8nWCYHisbLTsh2G0pgzgeKQuQzh9ie674LCJ2NdPImVZS+fg
 J4YI1kYH88aZQeVPhYojljosOA0K6uuDhP4nlBRp0+CQqCyqAbHKnFZA/dElyOe95swBCZ
 qOh6bO86T1KBaNhFu8FjggTKlP/3VrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-rdP8lYCVMWC9u4yrElCVAQ-1; Thu, 07 May 2020 10:02:03 -0400
X-MC-Unique: rdP8lYCVMWC9u4yrElCVAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4169835B45;
 Thu,  7 May 2020 14:01:58 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-245.ams2.redhat.com [10.36.113.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF26260FB9;
 Thu,  7 May 2020 14:01:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/15] virtio-mem: paravirtualized memory
Date: Thu,  7 May 2020 16:01:24 +0200
Message-Id: <20200507140139.17083-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Pingfan Liu <kernelfans@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtio-dev@lists.oasis-open.org, Mike Rapoport <rppt@linux.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Dave Young <dyoung@redhat.com>,
 Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Qian Cai <cai@lca.pw>,
 Stefan Hajnoczi <stefanha@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Johannes Weiner <hannes@cmpxchg.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>
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

This series is based on v5.7-rc4. The patches are located at:
    https://github.com/davidhildenbrand/linux.git virtio-mem-v4

This is basically a resend of v3 [1], now based on v5.7-rc4 and restested.
One patch was reshuffled and two ACKs I missed to add were added. The
rebase did not require any modifications to patches.

Details about virtio-mem can be found in the cover letter of v2 [2]. A
basic QEMU implementation was posted yesterday [3].

[1] https://lkml.kernel.org/r/20200507103119.11219-1-david@redhat.com
[2] https://lkml.kernel.org/r/20200311171422.10484-1-david@redhat.com
[3] https://lkml.kernel.org/r/20200506094948.76388-1-david@redhat.com

v3 -> v4:
- Move "MAINTAINERS: Add myself as virtio-mem maintainer" to #2
- Add two ACKs from Andrew (in reply to v2)
-- "mm: Allow to offline unmovable PageOffline() pages via ..."
-- "mm/memory_hotplug: Introduce offline_and_remove_memory()"

v2 -> v3:
- "virtio-mem: Paravirtualized memory hotplug"
-- Include "linux/slab.h" to fix build issues
-- Remember the "region_size", helpful for patch #11
-- Minor simplifaction in virtio_mem_overlaps_range()
-- Use notifier_from_errno() instead of notifier_to_errno() in notifier
-- More reliable check for added memory when unloading the driver
- "virtio-mem: Allow to specify an ACPI PXM as nid"
-- Also print the nid
- Added patch #11-#15

David Hildenbrand (15):
  virtio-mem: Paravirtualized memory hotplug
  MAINTAINERS: Add myself as virtio-mem maintainer
  virtio-mem: Allow to specify an ACPI PXM as nid
  virtio-mem: Paravirtualized memory hotunplug part 1
  virtio-mem: Paravirtualized memory hotunplug part 2
  mm: Allow to offline unmovable PageOffline() pages via
    MEM_GOING_OFFLINE
  virtio-mem: Allow to offline partially unplugged memory blocks
  mm/memory_hotplug: Introduce offline_and_remove_memory()
  virtio-mem: Offline and remove completely unplugged memory blocks
  virtio-mem: Better retry handling
  virtio-mem: Add parent resource for all added "System RAM"
  virtio-mem: Drop manual check for already present memory
  virtio-mem: Unplug subblocks right-to-left
  virtio-mem: Use -ETXTBSY as error code if the device is busy
  virtio-mem: Try to unplug the complete online memory block first

 MAINTAINERS                     |    7 +
 drivers/acpi/numa/srat.c        |    1 +
 drivers/virtio/Kconfig          |   17 +
 drivers/virtio/Makefile         |    1 +
 drivers/virtio/virtio_mem.c     | 1962 +++++++++++++++++++++++++++++++
 include/linux/memory_hotplug.h  |    1 +
 include/linux/page-flags.h      |   10 +
 include/uapi/linux/virtio_ids.h |    1 +
 include/uapi/linux/virtio_mem.h |  208 ++++
 mm/memory_hotplug.c             |   81 +-
 mm/page_alloc.c                 |   26 +
 mm/page_isolation.c             |    9 +
 12 files changed, 2314 insertions(+), 10 deletions(-)
 create mode 100644 drivers/virtio/virtio_mem.c
 create mode 100644 include/uapi/linux/virtio_mem.h

-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
