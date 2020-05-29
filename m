Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 985251E77AD
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 10:03:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3D9B5883AD;
	Fri, 29 May 2020 08:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jEj8FsPnk8bb; Fri, 29 May 2020 08:03:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 29BE0883B3;
	Fri, 29 May 2020 08:03:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B68CC016F;
	Fri, 29 May 2020 08:03:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4D27C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A39AB883AF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJAoAy7BnQ50
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EE7F5883AD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590739417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qAIlsWcWE5/JkQImrrDajyjydtkLArbDnm909F5raoM=;
 b=U72m7Wsp41utWh1eyAgASujZdV2oc3EwNKSTcdOSHoLXIBl6He+1W5vzZh0mqD47RM509o
 ggDl+gdgJayYZmLAeLLjGtaZD/jllKRBffyF9Q/jn62M0jY7D1qQOaEnWfmnkMNr5gYXMm
 JkcPgyk1VOkalRVfWn2ltwsca+q0weI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-mJ9VqgnuPhSH-R82-jFFpA-1; Fri, 29 May 2020 04:03:36 -0400
X-MC-Unique: mJ9VqgnuPhSH-R82-jFFpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDDD081CBEF;
 Fri, 29 May 2020 08:03:33 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-231.pek2.redhat.com [10.72.13.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEA6999DE6;
 Fri, 29 May 2020 08:03:24 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 2/6] vhost: use mmgrab() instead of mmget() for non worker
 device
Date: Fri, 29 May 2020 16:02:59 +0800
Message-Id: <20200529080303.15449-3-jasowang@redhat.com>
In-Reply-To: <20200529080303.15449-1-jasowang@redhat.com>
References: <20200529080303.15449-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
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

For the device that doesn't use vhost worker and use_mm(), mmget() is
too heavy weight and it may brings troubles for implementing mmap()
support for vDPA device.

This is because, an reference to the address space was held via
mm_get() in vhost_dev_set_owner() and an reference to the file was
held in mmap(). This means when process exits, the mm can not be
released thus we can not release the file.

This patch tries to use mmgrab() instead of mmget(), which allows the
address space to be destroy in process exit without releasing the mm
structure itself. This is sufficient for vDPA device which pin user
pages and does not depend on the address space to work.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vhost.c | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 70105e045768..9642938a7e7c 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -541,6 +541,36 @@ bool vhost_dev_has_owner(struct vhost_dev *dev)
 }
 EXPORT_SYMBOL_GPL(vhost_dev_has_owner);
 
+static void vhost_attach_mm(struct vhost_dev *dev)
+{
+	/* No owner, become one */
+	if (dev->use_worker) {
+		dev->mm = get_task_mm(current);
+	} else {
+		/* vDPA device does not use worker thead, so there's
+		 * no need to hold the address space for mm. This help
+		 * to avoid deadlock in the case of mmap() which may
+		 * held the refcnt of the file and depends on release
+		 * method to remove vma.
+		 */
+		dev->mm = current->mm;
+		mmgrab(dev->mm);
+	}
+}
+
+static void vhost_detach_mm(struct vhost_dev *dev)
+{
+	if (!dev->mm)
+		return;
+
+	if (dev->use_worker)
+		mmput(dev->mm);
+	else
+		mmdrop(dev->mm);
+
+	dev->mm = NULL;
+}
+
 /* Caller should have device mutex */
 long vhost_dev_set_owner(struct vhost_dev *dev)
 {
@@ -553,8 +583,8 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
 		goto err_mm;
 	}
 
-	/* No owner, become one */
-	dev->mm = get_task_mm(current);
+	vhost_attach_mm(dev);
+
 	dev->kcov_handle = kcov_common_handle();
 	if (dev->use_worker) {
 		worker = kthread_create(vhost_worker, dev,
@@ -583,9 +613,7 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
 		dev->worker = NULL;
 	}
 err_worker:
-	if (dev->mm)
-		mmput(dev->mm);
-	dev->mm = NULL;
+	vhost_detach_mm(dev);
 	dev->kcov_handle = 0;
 err_mm:
 	return err;
@@ -682,9 +710,7 @@ void vhost_dev_cleanup(struct vhost_dev *dev)
 		dev->worker = NULL;
 		dev->kcov_handle = 0;
 	}
-	if (dev->mm)
-		mmput(dev->mm);
-	dev->mm = NULL;
+	vhost_detach_mm(dev);
 }
 EXPORT_SYMBOL_GPL(vhost_dev_cleanup);
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
