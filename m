Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F1F1FCB3C
	for <lists.virtualization@lfdr.de>; Wed, 17 Jun 2020 12:48:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C32E1884FD;
	Wed, 17 Jun 2020 10:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSPjlmnCfOnG; Wed, 17 Jun 2020 10:48:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2ADEB88515;
	Wed, 17 Jun 2020 10:48:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 074AFC016E;
	Wed, 17 Jun 2020 10:48:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AA20C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 10:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 82E9C88553
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 10:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Su3Axt9VkPdH
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 10:48:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BD39F88517
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592390889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rL7vM9X5R7rzCkf4aWP47i5M17Wpex2MeAc4fEf3LAk=;
 b=abUfTcNoO47gXlT3I4YRJmGySvKNZnfH3cflo4QIpn7uAykmSvZLdV6jkYR06Wj0gZvTHG
 m5DEFAssk2CaE++a+vZBtCLt0GLPQzz9FCEi0kcoP3LCD/YWzELZou5z6rsR/8wi68ZMne
 r9GFzRjgaooEeUUGnWHCl3z3+KQVURU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-trWxPL4hMDG7xdUqBz0QUA-1; Wed, 17 Jun 2020 06:48:06 -0400
X-MC-Unique: trWxPL4hMDG7xdUqBz0QUA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3694680B71D;
 Wed, 17 Jun 2020 10:48:05 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B85065D9D3;
 Wed, 17 Jun 2020 10:47:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1] MAINTAINERS: add URL for virtio-mem
Date: Wed, 17 Jun 2020 12:47:56 +0200
Message-Id: <20200617104756.6312-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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

Let's add the status/info page, which is still under construction, however,
already contains valuable documentation/information.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 301330e02bca7..3470c5bfbdc7b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18234,6 +18234,7 @@ VIRTIO MEM DRIVER
 M:	David Hildenbrand <david@redhat.com>
 L:	virtualization@lists.linux-foundation.org
 S:	Maintained
+W:	https://virtio-mem.gitlab.io/
 F:	drivers/virtio/virtio_mem.c
 F:	include/uapi/linux/virtio_mem.h
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
