Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E927241518
	for <lists.virtualization@lfdr.de>; Tue, 11 Aug 2020 04:57:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D00D285B09;
	Tue, 11 Aug 2020 02:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3lnGgkQBTatu; Tue, 11 Aug 2020 02:57:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DA8B85B0C;
	Tue, 11 Aug 2020 02:57:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D60DC004D;
	Tue, 11 Aug 2020 02:57:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4002C004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 02:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B96CC8704C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 02:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LslZJ-w26X9k
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 02:57:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DADA886ECA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 02:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597114642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=F/gKVte+U3xgCt6SAHir9krIN3/3rbwfcTsHlgshxXU=;
 b=ZNhldIedsuGcaGjuvsjXF/90atFZy46LTpGIwnxdewQbkIUMXAUpVEvCpJOVI/A5EyzHGi
 zJO4OPfFhkPAbdGXu1fjKyUQeHON7ugEj0pRCqjCbJa77TZs4zW22yujOfYX13UTlLFUOf
 5YZG1CubouYZKQPrTX7IjY7FXNncl+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-LKIgnedcOQ64KV0l3WMBMw-1; Mon, 10 Aug 2020 22:57:18 -0400
X-MC-Unique: LKIgnedcOQ64KV0l3WMBMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92C60800465;
 Tue, 11 Aug 2020 02:57:17 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-186.pek2.redhat.com [10.72.13.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB01719D7B;
 Tue, 11 Aug 2020 02:57:12 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 mst@redhat.com, jasowang@redhat.com
Subject: [PATCH 1/2] MAINTAINERS: add a dedicated entry for vDPA
Date: Tue, 11 Aug 2020 10:57:09 +0800
Message-Id: <20200811025710.7775-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

vDPA is an independent subsystem, so use a dedicated entry for that.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 MAINTAINERS | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4e2698cc7e23..314398f0e276 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18173,13 +18173,19 @@ F:	Documentation/devicetree/bindings/virtio/
 F:	drivers/block/virtio_blk.c
 F:	drivers/crypto/virtio/
 F:	drivers/net/virtio_net.c
-F:	drivers/vdpa/
 F:	drivers/virtio/
-F:	include/linux/vdpa.h
 F:	include/linux/virtio*.h
 F:	include/uapi/linux/virtio_*.h
 F:	tools/virtio/
 
+VDPA CORE AND DRIVERS
+M:	"Michael S. Tsirkin" <mst@redhat.com>
+M:	Jason Wang <jasowang@redhat.com>
+L:	virtualization@lists.linux-foundation.org
+S:	Maintained
+F:	drivers/vdpa/
+F:	include/linux/vdpa.h
+
 VIRTIO BALLOON
 M:	"Michael S. Tsirkin" <mst@redhat.com>
 M:	David Hildenbrand <david@redhat.com>
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
