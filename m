Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F062DBB5E
	for <lists.virtualization@lfdr.de>; Wed, 16 Dec 2020 07:48:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D67708691C;
	Wed, 16 Dec 2020 06:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2MTTMLcbwNCW; Wed, 16 Dec 2020 06:48:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6E57086936;
	Wed, 16 Dec 2020 06:48:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48092C013B;
	Wed, 16 Dec 2020 06:48:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55702C013B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 06:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 44A1F872D5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 06:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YhbP1N8XJj7j
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 06:48:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5844E872D4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 06:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608101320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgtoOZuqafOK0nq8AHmeG/YV/K0PmtXlvUknLye9+3I=;
 b=E/0fBWchbNkpS2f51EJJd+0dHrZOjQ3Tj3R8oBTN0AIvjcZc9h4wdRl0PRzfuMBB+1cQKh
 0jj+kUGmiUd8rDGyhxyCvnoYXVhWHgeWIRg1qtPsis1OCtxs97+aCyiZ6KTy7M5cOB6oji
 xb6RAgxLuZrdOE/S9dBWIb0EZn0xRao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-9E4wkYGZMxiWY1xhbYWvrg-1; Wed, 16 Dec 2020 01:48:36 -0500
X-MC-Unique: 9E4wkYGZMxiWY1xhbYWvrg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 370BE1005513;
 Wed, 16 Dec 2020 06:48:35 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-210.pek2.redhat.com [10.72.12.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A77110013C1;
 Wed, 16 Dec 2020 06:48:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 01/21] vhost: move the backend feature bits to vhost_types.h
Date: Wed, 16 Dec 2020 14:47:58 +0800
Message-Id: <20201216064818.48239-2-jasowang@redhat.com>
In-Reply-To: <20201216064818.48239-1-jasowang@redhat.com>
References: <20201216064818.48239-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kvm@vger.kernel.org, lulu@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, stefanha@redhat.com, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

We should store feature bits in vhost_types.h as what has been done
for e.g VHOST_F_LOG_ALL.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/uapi/linux/vhost.h       | 5 -----
 include/uapi/linux/vhost_types.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
index c998860d7bbc..59c6c0fbaba1 100644
--- a/include/uapi/linux/vhost.h
+++ b/include/uapi/linux/vhost.h
@@ -89,11 +89,6 @@
 
 /* Set or get vhost backend capability */
 
-/* Use message type V2 */
-#define VHOST_BACKEND_F_IOTLB_MSG_V2 0x1
-/* IOTLB can accept batching hints */
-#define VHOST_BACKEND_F_IOTLB_BATCH  0x2
-
 #define VHOST_SET_BACKEND_FEATURES _IOW(VHOST_VIRTIO, 0x25, __u64)
 #define VHOST_GET_BACKEND_FEATURES _IOR(VHOST_VIRTIO, 0x26, __u64)
 
diff --git a/include/uapi/linux/vhost_types.h b/include/uapi/linux/vhost_types.h
index f7f6a3a28977..76ee7016c501 100644
--- a/include/uapi/linux/vhost_types.h
+++ b/include/uapi/linux/vhost_types.h
@@ -153,4 +153,9 @@ struct vhost_vdpa_iova_range {
 /* vhost-net should add virtio_net_hdr for RX, and strip for TX packets. */
 #define VHOST_NET_F_VIRTIO_NET_HDR 27
 
+/* Use message type V2 */
+#define VHOST_BACKEND_F_IOTLB_MSG_V2 0x1
+/* IOTLB can accept batching hints */
+#define VHOST_BACKEND_F_IOTLB_BATCH  0x2
+
 #endif
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
