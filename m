Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE95300C6
	for <lists.virtualization@lfdr.de>; Thu, 30 May 2019 19:14:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9EED22554;
	Thu, 30 May 2019 17:12:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 71C63254B;
	Thu, 30 May 2019 17:12:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id B777087C;
	Thu, 30 May 2019 17:12:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B51719BF;
	Thu, 30 May 2019 10:12:55 -0700 (PDT)
Received: from ostrya.cambridge.arm.com (ostrya.cambridge.arm.com
	[10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 734BC3F5AF; 
	Thu, 30 May 2019 10:12:52 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
To: joro@8bytes.org,
	mst@redhat.com
Subject: [PATCH v8 6/7] iommu/virtio: Add probe request
Date: Thu, 30 May 2019 18:09:28 +0100
Message-Id: <20190530170929.19366-7-jean-philippe.brucker@arm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530170929.19366-1-jean-philippe.brucker@arm.com>
References: <20190530170929.19366-1-jean-philippe.brucker@arm.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mark.rutland@arm.com, virtio-dev@lists.oasis-open.org,
	Lorenzo.Pieralisi@arm.com, tnowicki@caviumnetworks.com,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	virtualization@lists.linux-foundation.org, eric.auger@redhat.com,
	iommu@lists.linux-foundation.org, robh+dt@kernel.org,
	bhelgaas@google.com, robin.murphy@arm.com, kvmarm@lists.cs.columbia.edu
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

When the device offers the probe feature, send a probe request for each
device managed by the IOMMU. Extract RESV_MEM information. When we
encounter a MSI doorbell region, set it up as a IOMMU_RESV_MSI region.
This will tell other subsystems that there is no need to map the MSI
doorbell in the virtio-iommu, because MSIs bypass it.

Acked-by: Joerg Roedel <jroedel@suse.de>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
---
 drivers/iommu/virtio-iommu.c      | 157 ++++++++++++++++++++++++++++--
 include/uapi/linux/virtio_iommu.h |  36 +++++++
 2 files changed, 187 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index b2719a87c3c5..5d4947c47420 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -49,6 +49,7 @@ struct viommu_dev {
 	u32				last_domain;
 	/* Supported MAP flags */
 	u32				map_flags;
+	u32				probe_size;
 };
 
 struct viommu_mapping {
@@ -71,8 +72,10 @@ struct viommu_domain {
 };
 
 struct viommu_endpoint {
+	struct device			*dev;
 	struct viommu_dev		*viommu;
 	struct viommu_domain		*vdomain;
+	struct list_head		resv_regions;
 };
 
 struct viommu_request {
@@ -125,6 +128,9 @@ static off_t viommu_get_write_desc_offset(struct viommu_dev *viommu,
 {
 	size_t tail_size = sizeof(struct virtio_iommu_req_tail);
 
+	if (req->type == VIRTIO_IOMMU_T_PROBE)
+		return len - viommu->probe_size - tail_size;
+
 	return len - tail_size;
 }
 
@@ -399,6 +405,110 @@ static int viommu_replay_mappings(struct viommu_domain *vdomain)
 	return ret;
 }
 
+static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
+			       struct virtio_iommu_probe_resv_mem *mem,
+			       size_t len)
+{
+	size_t size;
+	u64 start64, end64;
+	phys_addr_t start, end;
+	struct iommu_resv_region *region = NULL;
+	unsigned long prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
+
+	start = start64 = le64_to_cpu(mem->start);
+	end = end64 = le64_to_cpu(mem->end);
+	size = end64 - start64 + 1;
+
+	/* Catch any overflow, including the unlikely end64 - start64 + 1 = 0 */
+	if (start != start64 || end != end64 || size < end64 - start64)
+		return -EOVERFLOW;
+
+	if (len < sizeof(*mem))
+		return -EINVAL;
+
+	switch (mem->subtype) {
+	default:
+		dev_warn(vdev->dev, "unknown resv mem subtype 0x%x\n",
+			 mem->subtype);
+		/* Fall-through */
+	case VIRTIO_IOMMU_RESV_MEM_T_RESERVED:
+		region = iommu_alloc_resv_region(start, size, 0,
+						 IOMMU_RESV_RESERVED);
+		break;
+	case VIRTIO_IOMMU_RESV_MEM_T_MSI:
+		region = iommu_alloc_resv_region(start, size, prot,
+						 IOMMU_RESV_MSI);
+		break;
+	}
+	if (!region)
+		return -ENOMEM;
+
+	list_add(&vdev->resv_regions, &region->list);
+	return 0;
+}
+
+static int viommu_probe_endpoint(struct viommu_dev *viommu, struct device *dev)
+{
+	int ret;
+	u16 type, len;
+	size_t cur = 0;
+	size_t probe_len;
+	struct virtio_iommu_req_probe *probe;
+	struct virtio_iommu_probe_property *prop;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct viommu_endpoint *vdev = fwspec->iommu_priv;
+
+	if (!fwspec->num_ids)
+		return -EINVAL;
+
+	probe_len = sizeof(*probe) + viommu->probe_size +
+		    sizeof(struct virtio_iommu_req_tail);
+	probe = kzalloc(probe_len, GFP_KERNEL);
+	if (!probe)
+		return -ENOMEM;
+
+	probe->head.type = VIRTIO_IOMMU_T_PROBE;
+	/*
+	 * For now, assume that properties of an endpoint that outputs multiple
+	 * IDs are consistent. Only probe the first one.
+	 */
+	probe->endpoint = cpu_to_le32(fwspec->ids[0]);
+
+	ret = viommu_send_req_sync(viommu, probe, probe_len);
+	if (ret)
+		goto out_free;
+
+	prop = (void *)probe->properties;
+	type = le16_to_cpu(prop->type) & VIRTIO_IOMMU_PROBE_T_MASK;
+
+	while (type != VIRTIO_IOMMU_PROBE_T_NONE &&
+	       cur < viommu->probe_size) {
+		len = le16_to_cpu(prop->length) + sizeof(*prop);
+
+		switch (type) {
+		case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
+			ret = viommu_add_resv_mem(vdev, (void *)prop, len);
+			break;
+		default:
+			dev_err(dev, "unknown viommu prop 0x%x\n", type);
+		}
+
+		if (ret)
+			dev_err(dev, "failed to parse viommu prop 0x%x\n", type);
+
+		cur += len;
+		if (cur >= viommu->probe_size)
+			break;
+
+		prop = (void *)probe->properties + cur;
+		type = le16_to_cpu(prop->type) & VIRTIO_IOMMU_PROBE_T_MASK;
+	}
+
+out_free:
+	kfree(probe);
+	return ret;
+}
+
 /* IOMMU API */
 
 static struct iommu_domain *viommu_domain_alloc(unsigned type)
@@ -623,15 +733,34 @@ static void viommu_iotlb_sync(struct iommu_domain *domain)
 
 static void viommu_get_resv_regions(struct device *dev, struct list_head *head)
 {
-	struct iommu_resv_region *region;
+	struct iommu_resv_region *entry, *new_entry, *msi = NULL;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct viommu_endpoint *vdev = fwspec->iommu_priv;
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 
-	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH, prot,
-					 IOMMU_RESV_SW_MSI);
-	if (!region)
-		return;
+	list_for_each_entry(entry, &vdev->resv_regions, list) {
+		if (entry->type == IOMMU_RESV_MSI)
+			msi = entry;
+
+		new_entry = kmemdup(entry, sizeof(*entry), GFP_KERNEL);
+		if (!new_entry)
+			return;
+		list_add_tail(&new_entry->list, head);
+	}
+
+	/*
+	 * If the device didn't register any bypass MSI window, add a
+	 * software-mapped region.
+	 */
+	if (!msi) {
+		msi = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
+					      prot, IOMMU_RESV_SW_MSI);
+		if (!msi)
+			return;
+
+		list_add_tail(&msi->list, head);
+	}
 
-	list_add_tail(&region->list, head);
 	iommu_dma_get_resv_regions(dev, head);
 }
 
@@ -679,9 +808,18 @@ static int viommu_add_device(struct device *dev)
 	if (!vdev)
 		return -ENOMEM;
 
+	vdev->dev = dev;
 	vdev->viommu = viommu;
+	INIT_LIST_HEAD(&vdev->resv_regions);
 	fwspec->iommu_priv = vdev;
 
+	if (viommu->probe_size) {
+		/* Get additional information for this endpoint */
+		ret = viommu_probe_endpoint(viommu, dev);
+		if (ret)
+			goto err_free_dev;
+	}
+
 	ret = iommu_device_link(&viommu->iommu, dev);
 	if (ret)
 		goto err_free_dev;
@@ -703,6 +841,7 @@ static int viommu_add_device(struct device *dev)
 err_unlink_dev:
 	iommu_device_unlink(&viommu->iommu, dev);
 err_free_dev:
+	viommu_put_resv_regions(dev, &vdev->resv_regions);
 	kfree(vdev);
 
 	return ret;
@@ -720,6 +859,7 @@ static void viommu_remove_device(struct device *dev)
 
 	iommu_group_remove_device(dev);
 	iommu_device_unlink(&vdev->viommu->iommu, dev);
+	viommu_put_resv_regions(dev, &vdev->resv_regions);
 	kfree(vdev);
 }
 
@@ -824,6 +964,10 @@ static int viommu_probe(struct virtio_device *vdev)
 			     struct virtio_iommu_config, domain_range.end,
 			     &viommu->last_domain);
 
+	virtio_cread_feature(vdev, VIRTIO_IOMMU_F_PROBE,
+			     struct virtio_iommu_config, probe_size,
+			     &viommu->probe_size);
+
 	viommu->geometry = (struct iommu_domain_geometry) {
 		.aperture_start	= input_start,
 		.aperture_end	= input_end,
@@ -908,6 +1052,7 @@ static unsigned int features[] = {
 	VIRTIO_IOMMU_F_MAP_UNMAP,
 	VIRTIO_IOMMU_F_INPUT_RANGE,
 	VIRTIO_IOMMU_F_DOMAIN_RANGE,
+	VIRTIO_IOMMU_F_PROBE,
 	VIRTIO_IOMMU_F_MMIO,
 };
 
diff --git a/include/uapi/linux/virtio_iommu.h b/include/uapi/linux/virtio_iommu.h
index 5da1818080de..20ead0cadced 100644
--- a/include/uapi/linux/virtio_iommu.h
+++ b/include/uapi/linux/virtio_iommu.h
@@ -14,6 +14,7 @@
 #define VIRTIO_IOMMU_F_DOMAIN_RANGE		1
 #define VIRTIO_IOMMU_F_MAP_UNMAP		2
 #define VIRTIO_IOMMU_F_BYPASS			3
+#define VIRTIO_IOMMU_F_PROBE			4
 #define VIRTIO_IOMMU_F_MMIO			5
 
 struct virtio_iommu_range_64 {
@@ -42,6 +43,7 @@ struct virtio_iommu_config {
 #define VIRTIO_IOMMU_T_DETACH			0x02
 #define VIRTIO_IOMMU_T_MAP			0x03
 #define VIRTIO_IOMMU_T_UNMAP			0x04
+#define VIRTIO_IOMMU_T_PROBE			0x05
 
 /* Status types */
 #define VIRTIO_IOMMU_S_OK			0x00
@@ -107,4 +109,38 @@ struct virtio_iommu_req_unmap {
 	struct virtio_iommu_req_tail		tail;
 };
 
+#define VIRTIO_IOMMU_PROBE_T_NONE		0
+#define VIRTIO_IOMMU_PROBE_T_RESV_MEM		1
+
+#define VIRTIO_IOMMU_PROBE_T_MASK		0xfff
+
+struct virtio_iommu_probe_property {
+	__le16					type;
+	__le16					length;
+};
+
+#define VIRTIO_IOMMU_RESV_MEM_T_RESERVED	0
+#define VIRTIO_IOMMU_RESV_MEM_T_MSI		1
+
+struct virtio_iommu_probe_resv_mem {
+	struct virtio_iommu_probe_property	head;
+	__u8					subtype;
+	__u8					reserved[3];
+	__le64					start;
+	__le64					end;
+};
+
+struct virtio_iommu_req_probe {
+	struct virtio_iommu_req_head		head;
+	__le32					endpoint;
+	__u8					reserved[64];
+
+	__u8					properties[];
+
+	/*
+	 * Tail follows the variable-length properties array. No padding,
+	 * property lengths are all aligned on 8 bytes.
+	 */
+};
+
 #endif
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
