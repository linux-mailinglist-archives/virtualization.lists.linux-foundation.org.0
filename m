Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0EE31B912
	for <lists.virtualization@lfdr.de>; Mon, 15 Feb 2021 13:23:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 93D9486841;
	Mon, 15 Feb 2021 12:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id csCWR4w-l6+k; Mon, 15 Feb 2021 12:23:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2450986970;
	Mon, 15 Feb 2021 12:23:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8EE2C013A;
	Mon, 15 Feb 2021 12:23:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B036C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Feb 2021 12:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 873D985A73
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Feb 2021 12:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zOcG3ft_1VTB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Feb 2021 12:23:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A9EF385A37
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Feb 2021 12:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613391787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y+tCfh7p5rS93AyYcRTEfar0U9kSrmpYDnZc3YNOM60=;
 b=hM3mg8V/P44F1i10UfjPpio+2g1w6s24S1TJF55b+alETxkwusQT7+4wEwK0KR4upzxCl1
 ktpav7cTVxztFe6EIwoaKByp14YD1OKvyTEJjAaZZO2OuztonRDOGFj0jzlXlVYspYxrZI
 LfS7nWtf/i+GUBJGUBLR7zOUm3d6qtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-zZCEY8pSOaaGROwdy9wW1Q-1; Mon, 15 Feb 2021 07:21:54 -0500
X-MC-Unique: zZCEY8pSOaaGROwdy9wW1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88A32192CC45;
 Mon, 15 Feb 2021 12:21:52 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A0362BFEC;
 Mon, 15 Feb 2021 12:21:44 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] virito-mem: one fix and
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
Date: Mon, 15 Feb 2021 13:21:41 +0100
Message-Id: <20210215122143.27608-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org, "Boeuf,
 Sebastien" <sebastien.boeuf@intel.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Hui Zhu <teawater@gmail.com>
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

One minor fix and introduction of / support for
VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE.

Looking into supporting file-based memory backends (shmem, hugetlbfs, ...)
for virtio-mem in QEMU cleanly, I realized that we have to indicate that
unplugged memory is completely inaccessible. Otherwise, Linux might in
corner cases read unplugged memory, which is harder to support (and harder
to protect from) in a hypervisor than with anonymous memory where we have
a shared zeropage.

To support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE cleanly, we cannot (un)plug
memory in SBM (Sub Block Mode) and instead, can only support adding/
removing individual Linux memory blocks (e.g., 128MB on x86-64).

While we might still be able to allow for reading unplugged memory with
file-based memory backends in the future (and I have plans/prototypes for
it), at least in the near future we cannot support it.

David Hildenbrand (2):
  virtio-mem: don't read big block size in SBM
  virtio-mem: support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE

 drivers/virtio/virtio_mem.c     | 27 ++++++++++++++++++++-------
 include/uapi/linux/virtio_mem.h | 10 +++++++---
 2 files changed, 27 insertions(+), 10 deletions(-)

-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
