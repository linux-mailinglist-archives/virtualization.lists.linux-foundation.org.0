Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BE362106D24
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:57:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 70CD4868C0;
	Fri, 22 Nov 2019 10:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPo0kPKWrraV; Fri, 22 Nov 2019 10:57:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D416186205;
	Fri, 22 Nov 2019 10:57:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEE43C18DA;
	Fri, 22 Nov 2019 10:57:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD073C18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 94ED288B3D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mxFXTEeKTgaM
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:57:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2BBA488B39
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:57:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t1so8087946wrv.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 02:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O8FVNRvH5irJ2zDaBsxloUo7UX0pFrVUzjUZiLfKvwU=;
 b=KE4FZyVJ7oTMaqEmjpbPlG5DZcuerskPQmr4Oz+oBjjiJHvGL6H8exZ0GXrlPmDu4L
 fjock0LX/ANKXLc2tQLf8axKFLTKAmNc1cOarXAmF0mUTryD4ji2KpaeIUDw6KdwzCw2
 MxmVyNC6Z760rlRWN+O0jtt5nJoCB5GWkiGoJq9XOXrGI1Q2/py21NNS6EZZJTYshlH1
 dixx5JojDpj/FfGb3I7ZZgOUrdLQ8kn2WEIgbTcnNR0ah1Bdppb6CTCz4NURwPA8aLfS
 EJmBtSrx3Y1mMzNCGoqbw/42Xt3due4SSZ7dusRabMT5A8dSeghZrBgyRs8JtWKzrXen
 CdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O8FVNRvH5irJ2zDaBsxloUo7UX0pFrVUzjUZiLfKvwU=;
 b=YGvV4I4n3oM3hvL/hzclWSeLWmbvgyYL6bFPm/baqUBDU72WfM+KjvkkmkOfYaJMaF
 rv0TZw+hAt9G3JrkDYbL0YwnB6JZ+IbAcwRbludNxHseAIpF3ew3CNgHEJO5+vlZk4mV
 GZ60QhCqaN1AQgDZNk13W4QqVWTaDwMi/HTgHCht+rCBY0tHetbICXXINlLqxnPi0iNU
 aiqFDaq54FnVCB7UXTXHx8iusYjHo5vd7YTb4d21L7uIj9cu/yL2zer8kW8sTAPmGAvX
 NOhxshnUWJtOPDt35dpjrJrQWEhWJGJTEOG8fFIfCqXo8jujJFlYMxTZEXtqWcWfoUo5
 4H3w==
X-Gm-Message-State: APjAAAV+7tii+N4RNdtzmGuDjfvg3vAhdtO6f1dbaZBewz7wnYg4Pnvp
 r7lAS2Z2Ndpt5wGwCfmoWSH6Gw==
X-Google-Smtp-Source: APXvYqxupzAk9/+hAGuqo2zCmryiXsqWB8zdfYtdzuCH8fYncJHID5ipVvqg0xilqWNq9KeWUZb/LQ==
X-Received: by 2002:adf:de0a:: with SMTP id b10mr17179236wrm.268.1574419862914; 
 Fri, 22 Nov 2019 02:51:02 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-204-106.adslplus.ch.
 [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id o133sm2088197wmb.4.2019.11.22.02.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:51:02 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC 09/13] iommu/virtio: Create fwnode if necessary
Date: Fri, 22 Nov 2019 11:49:56 +0100
Message-Id: <20191122105000.800410-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191122105000.800410-1-jean-philippe@linaro.org>
References: <20191122105000.800410-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: lorenzo.pieralisi@arm.com, mst@redhat.com, gregkh@linuxfoundation.org,
 joro@8bytes.org, sudeep.holla@arm.com, rjw@rjwysocki.net,
 eric.auger@redhat.com, sebastien.boeuf@intel.com, jacob.jun.pan@intel.com,
 guohanjun@huawei.com, bhelgaas@google.com, lenb@kernel.org
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

The presence of a fwnode on a PCI device depends on the platform. QEMU
q35, for example, creates an ACPI description for each PCI slot, but
QEMU virt (aarch64) doesn't. Since the IOMMU subsystem relies heavily on
fwnode to discover the DMA topology, create a fwnode for the
virtio-iommu if necessary, using the software_node framework.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/virtio-iommu.c | 56 ++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 3ea9d7682999..8efa368134c0 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -966,6 +966,48 @@ static struct iommu_ops viommu_ops = {
 	.of_xlate		= viommu_of_xlate,
 };
 
+static int viommu_set_fwnode(struct viommu_dev *viommu)
+{
+	/*
+	 * viommu->dev is the virtio device, its parent is the associated
+	 * transport device.
+	 */
+	struct device *dev = viommu->dev->parent;
+
+	/*
+	 * With device tree a fwnode is always present. With ACPI, on some
+	 * platforms a PCI device has a DSDT node describing the slot. On other
+	 * platforms, no fwnode is created and we have to do it ourselves.
+	 */
+	if (!dev->fwnode) {
+		struct fwnode_handle *fwnode;
+
+		fwnode = fwnode_create_software_node(NULL, NULL);
+		if (IS_ERR(fwnode))
+			return PTR_ERR(fwnode);
+
+		set_primary_fwnode(dev, fwnode);
+	}
+
+	iommu_device_set_fwnode(&viommu->iommu, dev->fwnode);
+	return 0;
+}
+
+static void viommu_clear_fwnode(struct viommu_dev *viommu)
+{
+	struct device *dev = viommu->dev->parent;
+
+	if (!dev->fwnode)
+		return;
+
+	if (is_software_node(dev->fwnode)) {
+		struct fwnode_handle *fwnode = dev->fwnode;
+
+		set_primary_fwnode(dev, NULL);
+		fwnode_remove_software_node(fwnode);
+	}
+}
+
 static int viommu_init_vqs(struct viommu_dev *viommu)
 {
 	struct virtio_device *vdev = dev_to_virtio(viommu->dev);
@@ -1004,7 +1046,6 @@ static int viommu_fill_evtq(struct viommu_dev *viommu)
 
 static int viommu_probe(struct virtio_device *vdev)
 {
-	struct device *parent_dev = vdev->dev.parent;
 	struct viommu_dev *viommu = NULL;
 	struct device *dev = &vdev->dev;
 	u64 input_start = 0;
@@ -1084,9 +1125,11 @@ static int viommu_probe(struct virtio_device *vdev)
 	if (ret)
 		goto err_free_vqs;
 
-	iommu_device_set_ops(&viommu->iommu, &viommu_ops);
-	iommu_device_set_fwnode(&viommu->iommu, parent_dev->fwnode);
+	ret = viommu_set_fwnode(viommu);
+	if (ret)
+		goto err_sysfs_remove;
 
+	iommu_device_set_ops(&viommu->iommu, &viommu_ops);
 	iommu_device_register(&viommu->iommu);
 
 #ifdef CONFIG_PCI
@@ -1119,8 +1162,10 @@ static int viommu_probe(struct virtio_device *vdev)
 	return 0;
 
 err_unregister:
-	iommu_device_sysfs_remove(&viommu->iommu);
 	iommu_device_unregister(&viommu->iommu);
+	viommu_clear_fwnode(viommu);
+err_sysfs_remove:
+	iommu_device_sysfs_remove(&viommu->iommu);
 err_free_vqs:
 	vdev->config->del_vqs(vdev);
 
@@ -1131,8 +1176,9 @@ static void viommu_remove(struct virtio_device *vdev)
 {
 	struct viommu_dev *viommu = vdev->priv;
 
-	iommu_device_sysfs_remove(&viommu->iommu);
 	iommu_device_unregister(&viommu->iommu);
+	viommu_clear_fwnode(viommu);
+	iommu_device_sysfs_remove(&viommu->iommu);
 
 	/* Stop all virtqueues */
 	vdev->config->reset(vdev);
-- 
2.24.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
