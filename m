Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 38589AE55D
	for <lists.virtualization@lfdr.de>; Tue, 10 Sep 2019 10:20:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4A91DE80;
	Tue, 10 Sep 2019 08:20:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CB0DFE70
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 08:20:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8148189C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 08:20:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 00549309BF15;
	Tue, 10 Sep 2019 08:20:25 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-188.pek2.redhat.com [10.72.12.188])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD7560A35;
	Tue, 10 Sep 2019 08:20:11 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: [RFC PATCH 2/4] mdev: introduce helper to set per device dma ops
Date: Tue, 10 Sep 2019 16:19:33 +0800
Message-Id: <20190910081935.30516-3-jasowang@redhat.com>
In-Reply-To: <20190910081935.30516-1-jasowang@redhat.com>
References: <20190910081935.30516-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 10 Sep 2019 08:20:25 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: idos@mellanox.com, cohuck@redhat.com, kwankhede@nvidia.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	xiao.w.wang@intel.com, zhihong.wang@intel.com,
	haotian.wang@sifive.com, rob.miller@broadcom.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This patch introduces mdev_set_dma_ops() which allows parent to set
per device DMA ops. This help for the kernel driver to setup a correct
DMA mappings.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vfio/mdev/mdev_core.c | 7 +++++++
 include/linux/mdev.h          | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index b558d4cfd082..eb28552082d7 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -13,6 +13,7 @@
 #include <linux/uuid.h>
 #include <linux/sysfs.h>
 #include <linux/mdev.h>
+#include <linux/dma-mapping.h>
 
 #include "mdev_private.h"
 
@@ -27,6 +28,12 @@ static struct class_compat *mdev_bus_compat_class;
 static LIST_HEAD(mdev_list);
 static DEFINE_MUTEX(mdev_list_lock);
 
+void mdev_set_dma_ops(struct mdev_device *mdev, struct dma_map_ops *ops)
+{
+	set_dma_ops(&mdev->dev, ops);
+}
+EXPORT_SYMBOL(mdev_set_dma_ops);
+
 struct device *mdev_parent_dev(struct mdev_device *mdev)
 {
 	return mdev->parent->dev;
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 0ce30ca78db0..7195f40bf8bf 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -145,4 +145,6 @@ struct device *mdev_parent_dev(struct mdev_device *mdev);
 struct device *mdev_dev(struct mdev_device *mdev);
 struct mdev_device *mdev_from_dev(struct device *dev);
 
+void mdev_set_dma_ops(struct mdev_device *mdev, struct dma_map_ops *ops);
+
 #endif /* MDEV_H */
-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
