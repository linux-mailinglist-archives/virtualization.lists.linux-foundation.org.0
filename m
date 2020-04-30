Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6261BF564
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 12:29:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 936CA87E08;
	Thu, 30 Apr 2020 10:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aiScM+W7vvJN; Thu, 30 Apr 2020 10:29:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EE12A87CEC;
	Thu, 30 Apr 2020 10:29:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3345C016F;
	Thu, 30 Apr 2020 10:29:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19EB6C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 084F686C43
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cuolRGK3fEg8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:29:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2F02D86C32
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588242584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=F00GW0IDxO2YtXf8I1Htd7Li0LSvuJyIHlJhh9ba9cc=;
 b=OVSlYlCZ2E3cHN0Js+7WHt5F1UfPjr1sI639y5jPoY/o5E2c0Rjfcnc2i8iymUtQTxujJU
 R+c8aNGTDnYlI+DGUp6GNvmaDED+6ot8ymJwCGYeaYi7oJAPClpWpT89FDlvlR406D2UAR
 zZTExmFEMkIxhq2XFZIg53dVl5iwqwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-F5xrMv_8M0upE38nqrJ6fA-1; Thu, 30 Apr 2020 06:29:37 -0400
X-MC-Unique: F5xrMv_8M0upE38nqrJ6fA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BD301899521;
 Thu, 30 Apr 2020 10:29:32 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 963F15D780;
 Thu, 30 Apr 2020 10:29:16 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] mm/memory_hotplug: Allow to not create firmware memmap
 entries
Date: Thu, 30 Apr 2020 12:29:05 +0200
Message-Id: <20200430102908.10107-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Pingfan Liu <kernelfans@gmail.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Dan Williams <dan.j.williams@intel.com>,
 virtio-dev@lists.oasis-open.org, Wei Liu <wei.liu@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Baoquan He <bhe@redhat.com>, linux-nvdimm@lists.01.org,
 Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, xen-devel@lists.xenproject.org,
 Len Brown <lenb@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Leonardo Bras <leobras.c@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Michal Hocko <mhocko@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Thomas Gleixner <tglx@linutronix.de>,
 Eric Biederman <ebiederm@xmission.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
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

This is the follow up of [1]:
	[PATCH v1 0/3] mm/memory_hotplug: Make virtio-mem play nicely with
	kexec-tools

I realized that this is not only helpful for virtio-mem, but also for
dax/kmem - it's a fix for that use case (see patch #3) of persistent
memory.

Also, while testing, I discovered that kexec-tools will *not* add dax/kmem
memory (anything not directly under the root when parsing /proc/iomem) to
the elfcorehdr, so this memory will never get included in a dump. This
probably has to be fixed in kexec-tools - virtio-mem will require this as
well.

v1 -> v2:
- Don't change the resource name
- Rename the flag to MHP_NO_FIRMWARE_MEMMAP to reflect what it is doing
- Rephrase subjects/descriptions
- Use the flag for dax/kmem

I'll have to rebase virtio-mem on these changes, there will be a resend.

[1] https://lkml.kernel.org/r/20200429160803.109056-1-david@redhat.com

David Hildenbrand (3):
  mm/memory_hotplug: Prepare passing flags to add_memory() and friends
  mm/memory_hotplug: Introduce MHP_NO_FIRMWARE_MEMMAP
  device-dax: Add system ram (add_memory()) with MHP_NO_FIRMWARE_MEMMAP

 arch/powerpc/platforms/powernv/memtrace.c       |  2 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c |  2 +-
 drivers/acpi/acpi_memhotplug.c                  |  2 +-
 drivers/base/memory.c                           |  2 +-
 drivers/dax/kmem.c                              |  3 ++-
 drivers/hv/hv_balloon.c                         |  2 +-
 drivers/s390/char/sclp_cmd.c                    |  2 +-
 drivers/xen/balloon.c                           |  2 +-
 include/linux/memory_hotplug.h                  | 15 ++++++++++++---
 mm/memory_hotplug.c                             | 14 ++++++++------
 10 files changed, 29 insertions(+), 17 deletions(-)

-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
