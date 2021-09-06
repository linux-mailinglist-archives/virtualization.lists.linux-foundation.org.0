Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id C42204018A4
	for <lists.virtualization@lfdr.de>; Mon,  6 Sep 2021 11:12:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9A49607D0;
	Mon,  6 Sep 2021 09:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DPyjeF5PkLSg; Mon,  6 Sep 2021 09:12:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B4AFC607D1;
	Mon,  6 Sep 2021 09:12:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32DC3C0022;
	Mon,  6 Sep 2021 09:12:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97F9BC001B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Sep 2021 09:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EF87607D0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Sep 2021 09:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xyu655Advpml
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Sep 2021 09:12:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F7B4607CB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Sep 2021 09:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630919533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=g7Vz7xsBycQVIBWbmyiFw6LYlCPl58bQ6OL/32Oz/04=;
 b=btkg78HvwgjGNnWSEWqJciA/S2lHggkGbRW0G6dcm8eUJAAnWYvhJcLy5sTkwtSBJXQQHI
 ZsJphNksy0wavnQS4+GAZzkBI9h/h3RlVmrhuDxsnn7ZazoqSxMe/Hun1qL3pqrzIQhDZI
 HtHDDWF9LsbvXLeifpneapjo+huia+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-v5_BC4pzNhqyMg0DiVFx_Q-1; Mon, 06 Sep 2021 05:12:12 -0400
X-MC-Unique: v5_BC4pzNhqyMg0DiVFx_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4776D801A93;
 Mon,  6 Sep 2021 09:12:11 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.192.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06EFB60861;
 Mon,  6 Sep 2021 09:12:00 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH] MAINTAINERS: add VM SOCKETS (AF_VSOCK) entry
Date: Mon,  6 Sep 2021 11:11:59 +0200
Message-Id: <20210906091159.66181-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jorgen Hansen <jhansen@vmware.com>
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

Add a new entry for VM Sockets (AF_VSOCK) that covers vsock core,
tests, and headers. Move some general vsock stuff from virtio-vsock
entry into this new more general vsock entry.

I've been reviewing and contributing for the last few years,
so I'm available to help maintain this code.

Cc: Dexuan Cui <decui@microsoft.com>
Cc: Jorgen Hansen <jhansen@vmware.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---

Dexuan, Jorgen, Stefan, would you like to co-maintain or
be added as a reviewer?

Thanks,
Stefano
---
 MAINTAINERS | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4278b389218e..12d535eabf95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19763,18 +19763,11 @@ L:	kvm@vger.kernel.org
 L:	virtualization@lists.linux-foundation.org
 L:	netdev@vger.kernel.org
 S:	Maintained
-F:	drivers/net/vsockmon.c
 F:	drivers/vhost/vsock.c
 F:	include/linux/virtio_vsock.h
 F:	include/uapi/linux/virtio_vsock.h
-F:	include/uapi/linux/vm_sockets_diag.h
-F:	include/uapi/linux/vsockmon.h
-F:	net/vmw_vsock/af_vsock_tap.c
-F:	net/vmw_vsock/diag.c
 F:	net/vmw_vsock/virtio_transport.c
 F:	net/vmw_vsock/virtio_transport_common.c
-F:	net/vmw_vsock/vsock_loopback.c
-F:	tools/testing/vsock/
 
 VIRTIO BLOCK AND SCSI DRIVERS
 M:	"Michael S. Tsirkin" <mst@redhat.com>
@@ -19970,6 +19963,19 @@ F:	drivers/staging/vme/
 F:	drivers/vme/
 F:	include/linux/vme*
 
+VM SOCKETS (AF_VSOCK)
+M:	Stefano Garzarella <sgarzare@redhat.com>
+L:	virtualization@lists.linux-foundation.org
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/net/vsockmon.c
+F:	include/net/af_vsock.h
+F:	include/uapi/linux/vm_sockets.h
+F:	include/uapi/linux/vm_sockets_diag.h
+F:	include/uapi/linux/vsockmon.h
+F:	net/vmw_vsock/
+F:	tools/testing/vsock/
+
 VMWARE BALLOON DRIVER
 M:	Nadav Amit <namit@vmware.com>
 M:	"VMware, Inc." <pv-drivers@vmware.com>
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
