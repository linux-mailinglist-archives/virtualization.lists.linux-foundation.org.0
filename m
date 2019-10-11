Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 989DDD3AFE
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 10:25:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5677010A8;
	Fri, 11 Oct 2019 08:24:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 64FF3FFB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 08:18:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 203E014D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 08:18:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C2283086E26;
	Fri, 11 Oct 2019 08:18:10 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-241.pek2.redhat.com [10.72.12.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A101100EBDE;
	Fri, 11 Oct 2019 08:17:39 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
	kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
	tiwei.bie@intel.com
Subject: [PATCH V3 2/7] mdev: bus uevent support
Date: Fri, 11 Oct 2019 16:15:52 +0800
Message-Id: <20191011081557.28302-3-jasowang@redhat.com>
In-Reply-To: <20191011081557.28302-1-jasowang@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 11 Oct 2019 08:18:10 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, sebott@linux.ibm.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	virtualization@lists.linux-foundation.org,
	rob.miller@broadcom.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	jani.nikula@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, akrowiak@linux.ibm.com,
	netdev@vger.kernel.org, cohuck@redhat.com, oberpar@linux.ibm.com,
	maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
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

This patch adds bus uevent support for mdev bus in order to allow
cooperation with userspace.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vfio/mdev/mdev_driver.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/vfio/mdev/mdev_driver.c b/drivers/vfio/mdev/mdev_driver.c
index b7c40ce86ee3..319d886ffaf7 100644
--- a/drivers/vfio/mdev/mdev_driver.c
+++ b/drivers/vfio/mdev/mdev_driver.c
@@ -82,9 +82,17 @@ static int mdev_match(struct device *dev, struct device_driver *drv)
 	return 0;
 }
 
+static int mdev_uevent(struct device *dev, struct kobj_uevent_env *env)
+{
+	struct mdev_device *mdev = to_mdev_device(dev);
+
+	return add_uevent_var(env, "MODALIAS=mdev:c%02X", mdev->class_id);
+}
+
 struct bus_type mdev_bus_type = {
 	.name		= "mdev",
 	.match		= mdev_match,
+	.uevent		= mdev_uevent,
 	.probe		= mdev_probe,
 	.remove		= mdev_remove,
 };
-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
