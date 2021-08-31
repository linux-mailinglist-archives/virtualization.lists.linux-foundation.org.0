Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9743FCE68
	for <lists.virtualization@lfdr.de>; Tue, 31 Aug 2021 22:22:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F20C605FC;
	Tue, 31 Aug 2021 20:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ux8PgayRqNf1; Tue, 31 Aug 2021 20:22:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 622D4606CB;
	Tue, 31 Aug 2021 20:22:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E34E7C000E;
	Tue, 31 Aug 2021 20:22:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45F8EC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 20:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27C2182675
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 20:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRvZRDxKSRks
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 20:21:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D914814A1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 20:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630441315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=uZxqGuQje81ADCZ63+jKstcc7DkOvzy6fvXKAVNR7aM=;
 b=Zkn+cHPJxNiAeFbaM0YMOH8rfN8OOaRXkHDGTGLOqkVEXLDzItPpgO29LfAvzkPOvU/OHS
 SHydmCxbkNaMJOj7CQMhAbooOyTY/rLsLo32YXoddyKQ4Yu/i5J8/oRzKoiBIkraDQ4a7F
 2FC+CaNIFsP9o9eVYuB5+htOJPVlaIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-38Rga71YN_SbSIAwL7BGvw-1; Tue, 31 Aug 2021 16:21:54 -0400
X-MC-Unique: 38Rga71YN_SbSIAwL7BGvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7527EC1A0;
 Tue, 31 Aug 2021 20:21:52 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CE9318649;
 Tue, 31 Aug 2021 20:21:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] virtio-mem: disallow mapping virtio-mem memory via
 /dev/mem
Date: Tue, 31 Aug 2021 22:21:38 +0200
Message-Id: <20210831202141.13846-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Hanjun Guo <guohanjun@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
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

I think this might be a good fit for the -mm tree, as the actual virtio-mem
changes are rather small.

--

Let's add the basic infrastructure to exclude some physical memory
regions marked as "IORESOURCE_SYSTEM_RAM" completely from /dev/mem access,
even though they are not marked IORESOURCE_BUSY and even though
"iomem=relaxed" is set. Resource IORESOURCE_EXCLUSIVE for that purpose
instead of adding new flags to express something similar to
"soft-busy" or "not busy yet, but already prepared by a driver and not
to be mapped by user space".

Use it for virtio-mem, to disallow mapping any virtio-mem memory via
/dev/mem to user space after the virtio-mem driver was loaded.

Details can be found in patch #2 and #3.

v2 -> v3:
- "kernel/resource: clean up and optimize iomem_is_exclusive()"
-- Reshuffled and moved for_each_resource() etc. into this patch
- "kernel/resource: disallow access to exclusive system RAM regions"
-- Leave CONFIG_STRICT_DEVMEM=n alone. Hoog into iomem_is_exclusive()
   instead.
-- Improve comments
- "virtio-mem: disallow mapping virtio-mem memory via /dev/mem"
-- Don't allow building virtio_mem without CONFIG_STRICT_DEVMEM when we
   have CONFIG_DEVMEM, where we don't have any guarantees.
- Rework all patch descriptions

v1 -> v2:
- "/dev/mem: disallow access to explicitly excluded system RAM regions"
-- Introduce and use for_each_resource() and next_resource_skip_children()
-- s/iomem_range_contains_excluded/iomem_range_contains_excluded_devmem/
- "kernel/resource: cleanup and optimize iomem_is_exclusive()"
-- Use for_each_resource()

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Hanjun Guo <guohanjun@huawei.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: virtualization@lists.linux-foundation.org
Cc: linux-mm@kvack.org

David Hildenbrand (3):
  kernel/resource: clean up and optimize iomem_is_exclusive()
  kernel/resource: disallow access to exclusive system RAM regions
  virtio-mem: disallow mapping virtio-mem memory via /dev/mem

 drivers/virtio/Kconfig      |  1 +
 drivers/virtio/virtio_mem.c |  4 ++-
 kernel/resource.c           | 54 ++++++++++++++++++++++++++-----------
 3 files changed, 43 insertions(+), 16 deletions(-)


base-commit: 7d2a07b769330c34b4deabeed939325c77a7ec2f
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
