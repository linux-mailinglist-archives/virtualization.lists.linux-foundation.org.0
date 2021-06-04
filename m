Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CA77739B1C6
	for <lists.virtualization@lfdr.de>; Fri,  4 Jun 2021 07:03:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF30684360;
	Fri,  4 Jun 2021 05:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbJd6IXvcWPs; Fri,  4 Jun 2021 05:03:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2286484373;
	Fri,  4 Jun 2021 05:03:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C862C001C;
	Fri,  4 Jun 2021 05:03:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E2E1C0001
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 229E284360
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-9bJX7eMSU1
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:03:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0C6A84340
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622782982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+hDkFi5ZYUZ3jBb2V5PsH7ZZDofu/h3dA2rI7yC8vcI=;
 b=TsXt32rDfLLzy9Ez09vx/iman3L/qcCNqAV8vcZ+NERbWWcnGfqfy29dI7OkBqAus5EG1h
 qpvDlZXmMYDt+5YGgMywb+yxyPqp5cVqNIOvHKTNW77jzSkiMMdM7O2IjUJFOgoUdb3bsp
 vcUHy9fha3qDHWlBWWqRYpzvvN1dWfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-bfAASkkwO5ODTcXbC1j1hw-1; Fri, 04 Jun 2021 01:03:00 -0400
X-MC-Unique: bfAASkkwO5ODTcXbC1j1hw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E206D8042AD;
 Fri,  4 Jun 2021 05:02:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-212.pek2.redhat.com
 [10.72.12.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A234E5E275;
 Fri,  4 Jun 2021 05:02:53 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH] vdpa: mandate 1.0 device
Date: Fri,  4 Jun 2021 13:02:51 +0800
Message-Id: <20210604050251.57834-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: elic@nvidia.com, linux-kernel@vger.kernel.org,
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

This patch mandates 1.0 for vDPA devices. The plan is never to support
transitional devices for vDPA devices in the future.

The reasons are:

- To have the semantic of normative statement in the virtio spec and
  eliminate the burden of transitional device for both vDPA bus and
  vDPA parent
- Eliminate the efforts for dealing with endian conversion in the
  management tool
- Mandate vDPA vendor to ship modern device instead of transitional
  device which is easily broken and unsafe
- Transitional device never work since the first day of vDPA

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/linux/vdpa.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index f311d227aa1b..11dd05b805a7 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/vhost_iotlb.h>
+#include <uapi/linux/virtio_config.h>
 
 /**
  * struct vdpa_calllback - vDPA callback definition.
@@ -328,6 +329,11 @@ static inline int vdpa_set_features(struct vdpa_device *vdev, u64 features)
 {
         const struct vdpa_config_ops *ops = vdev->config;
 
+        /* Mandating 1.0 to have semantics of normative statements in
+         * the spec. */
+        if (!(features & BIT_ULL(VIRTIO_F_VERSION_1)))
+		return -EINVAL;
+
 	vdev->features_valid = true;
         return ops->set_features(vdev, features);
 }
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
