Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7920F717
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 16:26:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B153C87D69;
	Tue, 30 Jun 2020 14:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KQ3spGl9pRq; Tue, 30 Jun 2020 14:26:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB05187D9E;
	Tue, 30 Jun 2020 14:26:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 854F6C016E;
	Tue, 30 Jun 2020 14:26:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DD5BC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0D06D88193
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9dqKaocsHDj
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:26:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 229C988162
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593527211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gU/53Q4tAoN32Y01QPMAepmzJ7LSqVhB1rBWsw7cZSg=;
 b=L5YxGsG1l0JygxbY0J1ftxT0Z4lWZ7M5IJxJIKUWq7/foyUJF50S+eA0qZDH9y/azz4qe4
 G5FovjR/JAcvxnppp3AIuAyRGnSx4ufb2ZMRChB0t5J6g5ES/K96/gv7NNYgRaw1Jrt2Sd
 8XcwLiSErTPRCUxS6PGtz8Kl5mQ+M2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-4CP9VNIcMiS_76sFdXrFRQ-1; Tue, 30 Jun 2020 10:26:49 -0400
X-MC-Unique: 4CP9VNIcMiS_76sFdXrFRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66AAA18A8223;
 Tue, 30 Jun 2020 14:26:48 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-56.ams2.redhat.com [10.36.114.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06CF0282EF;
 Tue, 30 Jun 2020 14:26:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/6] mm / virtio-mem: support ZONE_MOVABLE
Date: Tue, 30 Jun 2020 16:26:33 +0200
Message-Id: <20200630142639.22770-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
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

David Hildenbrand (6):
  mm/page_alloc: tweak comments in has_unmovable_pages()
  mm/page_isolation: don't dump_page(NULL) in set_migratetype_isolate()
  mm/page_isolation: drop WARN_ON_ONCE() in set_migratetype_isolate()
  mm/page_isolation: cleanup set_migratetype_isolate()
  mm/page_alloc: restrict ZONE_MOVABLE optimization in
    has_unmovable_pages() to memory offlining
  virtio-mem: don't special-case ZONE_MOVABLE

 drivers/virtio/virtio_mem.c | 47 +++++++------------------------------
 mm/page_alloc.c             | 29 +++++++++--------------
 mm/page_isolation.c         | 40 ++++++++++++++-----------------
 3 files changed, 36 insertions(+), 80 deletions(-)

-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
