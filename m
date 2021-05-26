Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBB43913C5
	for <lists.virtualization@lfdr.de>; Wed, 26 May 2021 11:31:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D51A04057B;
	Wed, 26 May 2021 09:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMoIutge1hG1; Wed, 26 May 2021 09:31:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6038540583;
	Wed, 26 May 2021 09:31:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D74EC0001;
	Wed, 26 May 2021 09:31:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE101C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 09:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90FE760677
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 09:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWrgUj2Dhqe9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 09:31:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6C9B60660
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 09:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622021506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Ug1zAPLCqnh6GoayNnsPLQvKUErGoEhMFV9yrDkIMc=;
 b=aLEBky8hBJZIKQ///ArH0ebfyKqE/03jTs/DXrgPJ/tm/Nz5sk4V9bQEdH4fdiAUUbQfJT
 927KuGV6FWkhBvF+HSY4Y8r6TOWNie4TW+DDfhRlFgTrdlYn9bmwU8CZNmnrUTZLLhosrp
 OxLN9M9SftkTGSc90cdV99WsXduZod0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-d70cn4qBMKyhYDfqXWiyxg-1; Wed, 26 May 2021 05:31:45 -0400
X-MC-Unique: d70cn4qBMKyhYDfqXWiyxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55FB979EC9;
 Wed, 26 May 2021 09:31:43 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-99.ams2.redhat.com [10.36.113.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62C095D9D3;
 Wed, 26 May 2021 09:31:29 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] virtio-mem: use page_offline_(start|end) when setting
 PageOffline()
Date: Wed, 26 May 2021 11:30:40 +0200
Message-Id: <20210526093041.8800-6-david@redhat.com>
In-Reply-To: <20210526093041.8800-1-david@redhat.com>
References: <20210526093041.8800-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Aili Yao <yaoaili@kingsoft.com>, Michal Hocko <mhocko@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Wei Liu <wei.liu@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Steven Price <steven.price@arm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Jiri Bohac <jbohac@suse.cz>, Haiyang Zhang <haiyangz@microsoft.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@linux.ibm.com>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
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

Let's properly use page_offline_(start|end) to synchronize setting
PageOffline(), so we won't have valid page access to unplugged memory
regions from /proc/kcore.

Existing balloon implementations usually allow reading inflated memory;
doing so might result in unnecessary overhead in the hypervisor, which
is currently the case with virtio-mem.

For future virtio-mem use cases, it will be different when using shmem,
huge pages, !anonymous private mappings, ... as backing storage for a VM.
virtio-mem unplugged memory must no longer be accessed and access might
result in undefined behavior. There will be a virtio spec extension to
document this change, including a new feature flag indicating the
changed behavior. We really don't want to race against PFN walkers
reading random page content.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 10ec60d81e84..dc2a2e2b2ff8 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1065,6 +1065,7 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 static void virtio_mem_set_fake_offline(unsigned long pfn,
 					unsigned long nr_pages, bool onlined)
 {
+	page_offline_begin();
 	for (; nr_pages--; pfn++) {
 		struct page *page = pfn_to_page(pfn);
 
@@ -1075,6 +1076,7 @@ static void virtio_mem_set_fake_offline(unsigned long pfn,
 			ClearPageReserved(page);
 		}
 	}
+	page_offline_end();
 }
 
 /*
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
