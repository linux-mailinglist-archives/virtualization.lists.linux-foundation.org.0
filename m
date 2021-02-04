Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F9630F984
	for <lists.virtualization@lfdr.de>; Thu,  4 Feb 2021 18:24:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8887B85629;
	Thu,  4 Feb 2021 17:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QcPI274iqUjU; Thu,  4 Feb 2021 17:24:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E775D85FED;
	Thu,  4 Feb 2021 17:24:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D282EC013A;
	Thu,  4 Feb 2021 17:24:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDC39C013A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BD24787232
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsf6RmZLApEX
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:24:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0B51E8722B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Ow8Ui/tFO/ZbkvTOqYO2hJWbYHjj15s4LcE1RVwnGY=;
 b=X6sfQfX3RVz098n++i1ab0IDGKHBMH/1KsTP99ElFHcXrox37s97TbY+Fby5ZEMim0lQuu
 PfZLLLCW/lA94SoLeD+MRjh3H6jW+Vxru5qpyWdctA/EOuwQWeZ7ZCSB901xOPht3TqiIe
 Z60r+PWh/OfFc+pbtMzr3FgCq81PKdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-dyWXVz5TOyO19kX9PAThtQ-1; Thu, 04 Feb 2021 12:23:59 -0500
X-MC-Unique: dyWXVz5TOyO19kX9PAThtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B314801960;
 Thu,  4 Feb 2021 17:23:58 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-213.ams2.redhat.com
 [10.36.113.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12CB35D6D7;
 Thu,  4 Feb 2021 17:23:55 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v3 10/13] vhost/vdpa: Remove the restriction that only
 supports virtio-net devices
Date: Thu,  4 Feb 2021 18:22:27 +0100
Message-Id: <20210204172230.85853-11-sgarzare@redhat.com>
In-Reply-To: <20210204172230.85853-1-sgarzare@redhat.com>
References: <20210204172230.85853-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, Xie Yongji <xieyongji@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

From: Xie Yongji <xieyongji@bytedance.com>

Since the config checks are done by the vDPA drivers, we can remove the
virtio-net restriction and we should be able to support all kinds of
virtio devices.

<linux/virtio_net.h> is not needed anymore, but we need to include
<linux/slab.h> to avoid compilation failures.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/vdpa.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index d61e779000a8..3879b1ad12dd 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -16,12 +16,12 @@
 #include <linux/cdev.h>
 #include <linux/device.h>
 #include <linux/mm.h>
+#include <linux/slab.h>
 #include <linux/iommu.h>
 #include <linux/uuid.h>
 #include <linux/vdpa.h>
 #include <linux/nospec.h>
 #include <linux/vhost.h>
-#include <linux/virtio_net.h>
 
 #include "vhost.h"
 
@@ -1006,10 +1006,6 @@ static int vhost_vdpa_probe(struct vdpa_device *vdpa)
 	int minor;
 	int r;
 
-	/* Currently, we only accept the network devices. */
-	if (ops->get_device_id(vdpa) != VIRTIO_ID_NET)
-		return -ENOTSUPP;
-
 	v = kzalloc(sizeof(*v), GFP_KERNEL | __GFP_RETRY_MAYFAIL);
 	if (!v)
 		return -ENOMEM;
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
