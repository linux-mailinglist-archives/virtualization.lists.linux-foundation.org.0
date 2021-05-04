Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C26372B6F
	for <lists.virtualization@lfdr.de>; Tue,  4 May 2021 15:55:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20C548392C;
	Tue,  4 May 2021 13:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CeDq26zGMFRf; Tue,  4 May 2021 13:54:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0776E83CB5;
	Tue,  4 May 2021 13:54:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93776C0001;
	Tue,  4 May 2021 13:54:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B2F4C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 May 2021 13:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35AA760884
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 May 2021 13:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YogiwOgDHAVv
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 May 2021 13:54:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 643496082A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 May 2021 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620136495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=sYJMcb7M+srNSdjRHy6DuLOfiiwc1W8bmdN+X3kOy+Y=;
 b=PqbOJ4981ZgDDMWxDASgf9asjezL8CsuD9xtjd2Ft0dYFxKqMNCARmYKy+Fe5sQIWgdqXU
 DP9VXIARBTDQ40mqxkIDrs7kI2UdoOaBbM9TfVYdAAPWlnd0LxldrZebGpWiP7ZLy3voNv
 5ecYWAYhFbD57lxMR84p+vgYMOC/S64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-TDqT2_DMPJ6x83Hqvy81cg-1; Tue, 04 May 2021 09:54:51 -0400
X-MC-Unique: TDqT2_DMPJ6x83Hqvy81cg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C593107ACCA;
 Tue,  4 May 2021 13:54:50 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-114-107.ams2.redhat.com
 [10.36.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CF7F10016F8;
 Tue,  4 May 2021 13:54:45 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] vhost-iotlb: fix vhost_iotlb_del_range() documentation
Date: Tue,  4 May 2021 15:54:44 +0200
Message-Id: <20210504135444.158716-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

Trivial change for the vhost_iotlb_del_range() documentation,
fixing the function name in the comment block.

Discovered with `make C=2 M=drivers/vhost`:
../drivers/vhost/iotlb.c:92: warning: expecting prototype for vring_iotlb_del_range(). Prototype was for vhost_iotlb_del_range() instead

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/iotlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/iotlb.c b/drivers/vhost/iotlb.c
index 0fd3f87e913c..0582079e4bcc 100644
--- a/drivers/vhost/iotlb.c
+++ b/drivers/vhost/iotlb.c
@@ -83,7 +83,7 @@ int vhost_iotlb_add_range(struct vhost_iotlb *iotlb,
 EXPORT_SYMBOL_GPL(vhost_iotlb_add_range);
 
 /**
- * vring_iotlb_del_range - delete overlapped ranges from vhost IOTLB
+ * vhost_iotlb_del_range - delete overlapped ranges from vhost IOTLB
  * @iotlb: the IOTLB
  * @start: start of the IOVA range
  * @last: last of IOVA range
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
