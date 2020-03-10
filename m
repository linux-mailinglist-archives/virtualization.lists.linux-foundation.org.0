Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFF317F6C4
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 12:54:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 98AB3882FB;
	Tue, 10 Mar 2020 11:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jwN+k88qha5N; Tue, 10 Mar 2020 11:54:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 26D56882F8;
	Tue, 10 Mar 2020 11:54:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 097DCC0177;
	Tue, 10 Mar 2020 11:54:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17844C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 074D185F7E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIiGyBoldORd
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:54:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4956D85F67
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583841264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8ZrT3AGCzTG+Qy7MOUd23n+FQWkwGC2qeOIFrLWjTqo=;
 b=g0JP3FUAORsSYol2Ql+cDkfMsaNhG56ahuvjcRw0mbcWWvjaijVX5AZjq19uNlNCGbwGk4
 6Zmc2+Gi4CDRwOpEiwYJjarujdJIRR2W5ifArubb6xFlUkpuqQWsboSwMUzf8DXkAQ6PJX
 RzLoVRP7vjxIyWSkz1fODAY5zTvPp+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-vglXSBiuN_2Pq7iSbeCokA-1; Tue, 10 Mar 2020 07:54:23 -0400
X-MC-Unique: vglXSBiuN_2Pq7iSbeCokA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCD56100F287;
 Tue, 10 Mar 2020 11:54:21 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.36.118.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48CB95C28D;
 Tue, 10 Mar 2020 11:54:12 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1] MAINTAINERS: Add myself as virtio-balloon co-maintainer
Date: Tue, 10 Mar 2020 12:54:11 +0100
Message-Id: <20200310115411.12760-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Luiz Capitulino <lcapitulino@redhat.com>,
 virtualization@lists.linux-foundation.org
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

As suggested by Michael, let's add me as co-maintainer of virtio-balloon.
While at it, also add "include/linux/balloon_compaction.h" to the file
list.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c555f4be8c4e..da9f53a05d0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17800,6 +17800,15 @@ F:	drivers/block/virtio_blk.c
 F:	include/linux/virtio*.h
 F:	include/uapi/linux/virtio_*.h
 F:	drivers/crypto/virtio/
+
+VIRTIO BALLOON
+M:	"Michael S. Tsirkin" <mst@redhat.com>
+M:	David Hildenbrand <david@redhat.com>
+L:	virtualization@lists.linux-foundation.org
+S:	Maintained
+F:	drivers/virtio/virtio_balloon.c
+F:	include/uapi/linux/virtio_balloon.h
+F:	include/linux/balloon_compaction.h
 F:	mm/balloon_compaction.c
 
 VIRTIO BLOCK AND SCSI DRIVERS
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
