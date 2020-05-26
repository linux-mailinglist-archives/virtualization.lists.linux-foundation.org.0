Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B696E1BE362
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 18:08:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 594142044D;
	Wed, 29 Apr 2020 16:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Efr523PmugiB; Wed, 29 Apr 2020 16:08:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8F96A2034B;
	Wed, 29 Apr 2020 16:08:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68566C0865;
	Wed, 29 Apr 2020 16:08:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89673C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 16:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 78BEB84DFD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 16:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id renzXasFQF-i
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 16:08:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ABB14856F4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 16:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588176528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZEMgwn0RdunIfg2yunfCJF8r1H9z41yqLf2sGNY0wM=;
 b=BAPsDUNnjYcJILzI3D/q+mRNaaMhbBU6Gf6j8WdHV7t5xN2t39JbzadOiXE+bikRG8sM7i
 FKkJH0AO9EbbmzS/acg71LQi8HzgnUkR/I74BS/G+fjw3Z263TOND622hqSqXIWYRjujyx
 hhelJvxQnARjFp4Q8PPZo9fNwjEHMQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-pvtDQR0OOPCL64QlN-zLcg-1; Wed, 29 Apr 2020 12:08:46 -0400
X-MC-Unique: pvtDQR0OOPCL64QlN-zLcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B80BA107ACCA;
 Wed, 29 Apr 2020 16:08:44 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-55.ams2.redhat.com [10.36.114.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D1E3605F7;
 Wed, 29 Apr 2020 16:08:41 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] virtio-mem: Add memory with MHP_DRIVER_MANAGED
Date: Wed, 29 Apr 2020 18:08:03 +0200
Message-Id: <20200429160803.109056-4-david@redhat.com>
In-Reply-To: <20200429160803.109056-1-david@redhat.com>
References: <20200429160803.109056-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: virtio-dev@lists.oasis-open.org, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, linux-acpi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Eric Biederman <ebiederm@xmission.com>, xen-devel@lists.xenproject.org,
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

We don't want /sys/firmware/memmap entries and we want to indicate
our memory as "System RAM (driver managed)" in /proc/iomem. This is
especially relevant for kexec-tools, which have to be updated to
support dumping virtio-mem memory after this patch. Expected behavior in
kexec-tools:
- Don't use this memory when creating a fixed-up firmware memmap. Works
  now out of the box on x86-64.
- Don't use this memory for placing kexec segments. Works now out of the
  box on x86-64.
- Consider "System RAM (driver managed)" when creating the elfcorehdr
  for kdump. This memory has to be dumped. Needs update of kexec-tools.

With this patch on x86-64:

/proc/iomem:
	00000000-00000fff : Reserved
	00001000-0009fbff : System RAM
	[...]
	fffc0000-ffffffff : Reserved
	100000000-13fffffff : System RAM
	140000000-147ffffff : System RAM (driver managed)
	340000000-347ffffff : System RAM (driver managed)
	348000000-34fffffff : System RAM (driver managed)
	[..]
	3280000000-32ffffffff : PCI Bus 0000:00

/sys/firmware/memmap:
	0000000000000000-000000000009fc00 (System RAM)
	000000000009fc00-00000000000a0000 (Reserved)
	00000000000f0000-0000000000100000 (Reserved)
	0000000000100000-00000000bffe0000 (System RAM)
	00000000bffe0000-00000000c0000000 (Reserved)
	00000000feffc000-00000000ff000000 (Reserved)
	00000000fffc0000-0000000100000000 (Reserved)
	0000000100000000-0000000140000000 (System RAM)

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Eric Biederman <ebiederm@xmission.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 3101cbf9e59d..6f658d1aeac4 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -421,7 +421,8 @@ static int virtio_mem_mb_add(struct virtio_mem *vm, unsigned long mb_id)
 		nid = memory_add_physaddr_to_nid(addr);
 
 	dev_dbg(&vm->vdev->dev, "adding memory block: %lu\n", mb_id);
-	return add_memory(nid, addr, memory_block_size_bytes(), 0);
+	return add_memory(nid, addr, memory_block_size_bytes(),
+			  MHP_DRIVER_MANAGED);
 }
 
 /*
-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
