Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD9127670D
	for <lists.virtualization@lfdr.de>; Thu, 24 Sep 2020 05:24:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0BB5D86710;
	Thu, 24 Sep 2020 03:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0S9FHe07L+Gd; Thu, 24 Sep 2020 03:24:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7562E85B9D;
	Thu, 24 Sep 2020 03:24:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C606C0051;
	Thu, 24 Sep 2020 03:24:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6864EC0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 03:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 580D2868EF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 03:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ReBTfNQen12r
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 03:24:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CB840868F3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 03:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600917877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLZxxfoGFHwl3RRF/XeYrXw41P3lCMv/1i4VDUjzn8s=;
 b=G/k5lHRHhn53hrdozUGNrV8HjrVZE+7hvApxtHBdTmK470h3PU7TAzJ2Ihna0EfxOWnsdj
 46Lh244j6C7nvx1FRpp70hDg421M9RVli9fc3yRduzVgLf4oOf0byTr6M6fvzk9IKb+2wC
 VXlZdQu2CYodQHk+sZQbp0NcJRNn97M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-d5JN6TEBMvaxNzeOc9QI4Q-1; Wed, 23 Sep 2020 23:24:35 -0400
X-MC-Unique: d5JN6TEBMvaxNzeOc9QI4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E729E89154F;
 Thu, 24 Sep 2020 03:24:33 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-193.pek2.redhat.com [10.72.13.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A1083782;
 Thu, 24 Sep 2020 03:24:24 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [RFC PATCH 15/24] vhost-vdpa: introduce uAPI to get the number of
 address spaces
Date: Thu, 24 Sep 2020 11:21:16 +0800
Message-Id: <20200924032125.18619-16-jasowang@redhat.com>
In-Reply-To: <20200924032125.18619-1-jasowang@redhat.com>
References: <20200924032125.18619-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: lulu@redhat.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 mhabets@solarflare.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, stefanha@redhat.com, eli@mellanox.com,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

A new uAPI is introduced for the userspace to know the address spaces
that is supported by a specific device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vdpa.c       | 3 +++
 include/uapi/linux/vhost.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 4b8882f55bc9..4d97a59824a1 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -532,6 +532,9 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
 		r = copy_to_user(argp, &v->vdpa->ngroups,
 				 sizeof(v->vdpa->ngroups));
 		break;
+	case VHOST_VDPA_GET_AS_NUM:
+		r = copy_to_user(argp, &v->vdpa->nas, sizeof(v->vdpa->nas));
+		break;
 	case VHOST_SET_LOG_BASE:
 	case VHOST_SET_LOG_FD:
 		r = -ENOIOCTLCMD;
diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
index 19f1acdfe3ea..99bdf50efc50 100644
--- a/include/uapi/linux/vhost.h
+++ b/include/uapi/linux/vhost.h
@@ -145,4 +145,6 @@
 /* Get the number of virtqueue groups. */
 #define VHOST_VDPA_GET_GROUP_NUM	_IOR(VHOST_VIRTIO, 0x78, unsigned int)
 
+/* Get the number of address spaces. */
+#define VHOST_VDPA_GET_AS_NUM		_IOR(VHOST_VIRTIO, 0x79, unsigned int)
 #endif
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
