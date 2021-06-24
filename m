Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE43B25E8
	for <lists.virtualization@lfdr.de>; Thu, 24 Jun 2021 05:59:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0038B402F0;
	Thu, 24 Jun 2021 03:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXQeVKXSbmBr; Thu, 24 Jun 2021 03:59:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8D5724027F;
	Thu, 24 Jun 2021 03:59:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0ED6C000E;
	Thu, 24 Jun 2021 03:59:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B016C000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 03:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18C8A6086F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 03:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzV0tKE7Gj-w
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 03:59:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F720607AB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 03:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624507191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y/aDcLvQasDjoayRwKsqlIB2Jm7tIqYYrzgBXVJqDSk=;
 b=McYD3qclN5BJ3QjFvMzz/eW9wH3zgo6+/JVw5sM6zVwkyG3wmD7M/ADw3hVYOIUiMSJ38O
 8T5doQn7DwWavCony9lplQu0XBbapeQ3IYnxY+Ifx3PDsCJnQf79R13ZW5qop8wthAuWcr
 rUiEX9MD9S3RrSSpSs5ddNHRo9j0BSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-o6DLIVecN7qXK7Ht83JJjQ-1; Wed, 23 Jun 2021 23:59:49 -0400
X-MC-Unique: o6DLIVecN7qXK7Ht83JJjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94EE8802C88;
 Thu, 24 Jun 2021 03:59:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-188.pek2.redhat.com
 [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 550E460C05;
 Thu, 24 Jun 2021 03:59:42 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH] vp_vdpa: correct the return value when fail to map
 notification
Date: Thu, 24 Jun 2021 11:59:39 +0800
Message-Id: <20210624035939.26618-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>,
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

We forget to assign a error value when we fail to map the notification
during prove. This patch fixes it.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 11d8ffed00b23 ("vp_vdpa: switch to use vp_modern_map_vq_notify()")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/virtio_pci/vp_vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
index c76ebb531212..9145e0624565 100644
--- a/drivers/vdpa/virtio_pci/vp_vdpa.c
+++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
@@ -442,6 +442,7 @@ static int vp_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			vp_modern_map_vq_notify(mdev, i,
 						&vp_vdpa->vring[i].notify_pa);
 		if (!vp_vdpa->vring[i].notify) {
+			ret = -EINVAL;
 			dev_warn(&pdev->dev, "Fail to map vq notify %d\n", i);
 			goto err;
 		}
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
