Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A442E232F83
	for <lists.virtualization@lfdr.de>; Thu, 30 Jul 2020 11:34:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED6EF8785D;
	Thu, 30 Jul 2020 09:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OqxZeWsbs4qk; Thu, 30 Jul 2020 09:34:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D21CE87890;
	Thu, 30 Jul 2020 09:34:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A43C0C004D;
	Thu, 30 Jul 2020 09:34:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1BF6C004D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A45D48785D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17+pePOzKNe2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F2C8387849
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596101674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VsvIDJ16G7lHMB3EgzcHTDuFE1QcMQBKjWXayv4cmOY=;
 b=EzcZk52TqPl/1WSN5geKU63E9VgJUZn58JJx6PSKAdzOoEPPeZLgWKL2ISs2WEY7ma4vTW
 x3kClGbMOyn1ZVFLnNUwdAIpyZcZd7y/Ze3uRWefECOg9bdfHbo5LayIju92ZKayg0NuDr
 LsDzRz15C15oifTL1l4h2YW8SZo+odY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-2b-Qvm1UP1SdGnMOwUXZzQ-1; Thu, 30 Jul 2020 05:34:32 -0400
X-MC-Unique: 2b-Qvm1UP1SdGnMOwUXZzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14D49100CD1B;
 Thu, 30 Jul 2020 09:34:20 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-185.ams2.redhat.com [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31FF269324;
 Thu, 30 Jul 2020 09:34:17 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] mm / virtio-mem: support ZONE_MOVABLE
Date: Thu, 30 Jul 2020 11:34:10 +0200
Message-Id: <20200730093416.36210-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Michal Hocko <mhocko@suse.com>,
 Baoquan He <bhe@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Qian Cai <cai@lca.pw>, Andrew Morton <akpm@linux-foundation.org>,
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

@Andrew, @Mst, I suggest the whole series (including the virtio-mem
change) goes via the -mm tree.

Currently, virtio-mem does not really support ZONE_MOVABLE. While it allows
to online fully plugged memory blocks to ZONE_MOVABLE, it does not allow
to online partially-plugged memory blocks to ZONE_MOVABLE and will never
consider such memory blocks when unplugging memory. This might be
surprising for users (especially, if onlining suddenly fails).

Let's support partially plugged memory blocks in ZONE_MOVABLE, allowing
partially plugged memory blocks to be online to ZONE_MOVABLE and also
unplugging from such memory blocks.

This is especially helpful for testing, but also paves the way for
virtio-mem optimizations, allowing more memory to get reliably unplugged.

Cleanup has_unmovable_pages() and set_migratetype_isolate(), providing
better documentation of how ZONE_MOVABLE interacts with different kind of
unmovable pages (memory offlining vs. alloc_contig_range()).

v1 -> v2:
- "mm/page_isolation: don't dump_page(NULL) in set_migratetype_isolate()"
-- Move to position 1, add Fixes: tag
-- Drop unused "out:" label
- "mm/page_isolation: drop WARN_ON_ONCE() in set_migratetype_isolate()"
-- Keep curly braces on "else" case
- Replace "[PATCH v1 5/6] mm/page_alloc: restrict ZONE_MOVABLE optimization
           in has_unmovable_pages() to memory offlining"
  by "mm: document semantics of ZONE_MOVABLE"
-- Brain dump of what I know about ZONE_MOVABLE :)

David Hildenbrand (6):
  mm/page_isolation: don't dump_page(NULL) in set_migratetype_isolate()
  mm/page_alloc: tweak comments in has_unmovable_pages()
  mm/page_isolation: drop WARN_ON_ONCE() in set_migratetype_isolate()
  mm/page_isolation: cleanup set_migratetype_isolate()
  virtio-mem: don't special-case ZONE_MOVABLE
  mm: document semantics of ZONE_MOVABLE

 drivers/virtio/virtio_mem.c | 47 +++++++------------------------------
 include/linux/mmzone.h      | 34 +++++++++++++++++++++++++++
 mm/page_alloc.c             | 22 +++++------------
 mm/page_isolation.c         | 39 ++++++++++++++----------------
 4 files changed, 65 insertions(+), 77 deletions(-)

-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
