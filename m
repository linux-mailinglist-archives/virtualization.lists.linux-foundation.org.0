Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 604543346F5
	for <lists.virtualization@lfdr.de>; Wed, 10 Mar 2021 19:40:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50BF742FC6;
	Wed, 10 Mar 2021 18:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rffMqpUWzVOl; Wed, 10 Mar 2021 18:40:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED932431CC;
	Wed, 10 Mar 2021 18:40:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30A03C0001;
	Wed, 10 Mar 2021 18:40:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFBC4C0001;
 Wed, 10 Mar 2021 18:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE1116E56C;
 Wed, 10 Mar 2021 18:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNbmdUZNL4L1; Wed, 10 Mar 2021 18:40:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71629605B2;
 Wed, 10 Mar 2021 18:40:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 837CE1FB;
 Wed, 10 Mar 2021 10:40:06 -0800 (PST)
Received: from [10.57.52.136] (unknown [10.57.52.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A6053F800;
 Wed, 10 Mar 2021 10:40:03 -0800 (PST)
Subject: Re: [PATCH 14/17] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
To: Christoph Hellwig <hch@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-15-hch@lst.de>
 <1658805c-ed28-b650-7385-a56fab3383e3@arm.com> <20210310091501.GC5928@lst.de>
 <20210310092533.GA6819@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <fdacf87a-be14-c92c-4084-1d1dd4fc7766@arm.com>
Date: Wed, 10 Mar 2021 18:39:57 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310092533.GA6819@lst.de>
Content-Language: en-GB
Cc: kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-msm@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 2021-03-10 09:25, Christoph Hellwig wrote:
> On Wed, Mar 10, 2021 at 10:15:01AM +0100, Christoph Hellwig wrote:
>> On Thu, Mar 04, 2021 at 03:25:27PM +0000, Robin Murphy wrote:
>>> On 2021-03-01 08:42, Christoph Hellwig wrote:
>>>> Use explicit methods for setting and querying the information instead.
>>>
>>> Now that everyone's using iommu-dma, is there any point in bouncing this
>>> through the drivers at all? Seems like it would make more sense for the x86
>>> drivers to reflect their private options back to iommu_dma_strict (and
>>> allow Intel's caching mode to override it as well), then have
>>> iommu_dma_init_domain just test !iommu_dma_strict &&
>>> domain->ops->flush_iotlb_all.
>>
>> Hmm.  I looked at this, and kill off ->dma_enable_flush_queue for
>> the ARM drivers and just looking at iommu_dma_strict seems like a
>> very clear win.
>>
>> OTOH x86 is a little more complicated.  AMD and intel defaul to lazy
>> mode, so we'd have to change the global iommu_dma_strict if they are
>> initialized.  Also Intel has not only a "static" option to disable
>> lazy mode, but also a "dynamic" one where it iterates structure.  So
>> I think on the get side we're stuck with the method, but it still
>> simplifies the whole thing.
> 
> Actually... Just mirroring the iommu_dma_strict value into
> struct iommu_domain should solve all of that with very little
> boilerplate code.

Yes, my initial thought was to directly replace the attribute with a
common flag at iommu_domain level, but since in all cases the behaviour
is effectively global rather than actually per-domain, it seemed
reasonable to take it a step further. This passes compile-testing for
arm64 and x86, what do you think?

Robin.

----->8-----
Subject: [PATCH] iommu: Consolidate strict invalidation handling

Now that everyone is using iommu-dma, the global invalidation policy
really doesn't need to be woven through several parts of the core API
and individual drivers, we can just look it up directly at the one point
that we now make the flush queue decision. If the x86 drivers reflect
their internal options and overrides back to iommu_dma_strict, that can
become the canonical source.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
  drivers/iommu/amd/iommu.c   |  2 ++
  drivers/iommu/dma-iommu.c   |  8 +-------
  drivers/iommu/intel/iommu.c | 12 ++++++++++++
  drivers/iommu/iommu.c       | 35 +++++++++++++++++++++++++++--------
  include/linux/iommu.h       |  2 ++
  5 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index a69a8b573e40..1db29e59d468 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1856,6 +1856,8 @@ int __init amd_iommu_init_dma_ops(void)
  	else
  		pr_info("Lazy IO/TLB flushing enabled\n");
  
+	iommu_set_dma_strict(amd_iommu_unmap_flush);
+
  	return 0;
  
  }
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index af765c813cc8..789a950cc125 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -304,10 +304,6 @@ static void iommu_dma_flush_iotlb_all(struct iova_domain *iovad)
  
  	cookie = container_of(iovad, struct iommu_dma_cookie, iovad);
  	domain = cookie->fq_domain;
-	/*
-	 * The IOMMU driver supporting DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
-	 * implies that ops->flush_iotlb_all must be non-NULL.
-	 */
  	domain->ops->flush_iotlb_all(domain);
  }
  
@@ -334,7 +330,6 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
  	struct iommu_dma_cookie *cookie = domain->iova_cookie;
  	unsigned long order, base_pfn;
  	struct iova_domain *iovad;
-	int attr;
  
  	if (!cookie || cookie->type != IOMMU_DMA_IOVA_COOKIE)
  		return -EINVAL;
@@ -371,8 +366,7 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
  	init_iova_domain(iovad, 1UL << order, base_pfn);
  
  	if (!cookie->fq_domain && (!dev || !dev_is_untrusted(dev)) &&
-	    !iommu_domain_get_attr(domain, DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE, &attr) &&
-	    attr) {
+	    domain->ops->flush_iotlb_all && !iommu_get_dma_strict()) {
  		if (init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
  					  iommu_dma_entry_dtor))
  			pr_warn("iova flush queue initialization failed\n");
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index b5c746f0f63b..f5b452cd1266 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4377,6 +4377,17 @@ int __init intel_iommu_init(void)
  
  	down_read(&dmar_global_lock);
  	for_each_active_iommu(iommu, drhd) {
+		if (!intel_iommu_strict && cap_caching_mode(iommu->cap)) {
+			/*
+			 * The flush queue implementation does not perform page-selective
+			 * invalidations that are required for efficient TLB flushes in
+			 * virtual environments. The benefit of batching is likely to be
+			 * much lower than the overhead of synchronizing the virtual and
+			 * physical IOMMU page-tables.
+			 */
+			pr_warn("IOMMU batching is disabled due to virtualization");
+			intel_iommu_strict = 1;
+		}
  		iommu_device_sysfs_add(&iommu->iommu, NULL,
  				       intel_iommu_groups,
  				       "%s", iommu->name);
@@ -4384,6 +4395,7 @@ int __init intel_iommu_init(void)
  	}
  	up_read(&dmar_global_lock);
  
+	iommu_set_dma_strict(intel_iommu_strict);
  	bus_set_iommu(&pci_bus_type, &intel_iommu_ops);
  	if (si_domain && !hw_pass_through)
  		register_memory_notifier(&intel_iommu_memory_nb);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 2f3399203813..80afcf50cd3c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -69,6 +69,7 @@ static const char * const iommu_group_resv_type_string[] = {
  };
  
  #define IOMMU_CMD_LINE_DMA_API		BIT(0)
+#define IOMMU_CMD_LINE_STRICT		BIT(1)
  
  static void iommu_set_cmd_line_dma_api(void)
  {
@@ -80,6 +81,16 @@ static bool iommu_cmd_line_dma_api(void)
  	return !!(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API);
  }
  
+static void iommu_set_cmd_line_strict(void)
+{
+	iommu_cmd_line |= IOMMU_CMD_LINE_STRICT;
+}
+
+static bool iommu_cmd_line_strict(void)
+{
+	return !!(iommu_cmd_line & IOMMU_CMD_LINE_STRICT);
+}
+
  static int iommu_alloc_default_domain(struct iommu_group *group,
  				      struct device *dev);
  static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
@@ -337,10 +348,25 @@ early_param("iommu.passthrough", iommu_set_def_domain_type);
  
  static int __init iommu_dma_setup(char *str)
  {
-	return kstrtobool(str, &iommu_dma_strict);
+	int ret = kstrtobool(str, &iommu_dma_strict);
+
+	if (!ret)
+		iommu_set_cmd_line_strict();
+	return ret;
  }
  early_param("iommu.strict", iommu_dma_setup);
  
+void iommu_set_dma_strict(bool val)
+{
+	if (val || !iommu_cmd_line_strict())
+		iommu_dma_strict = val;
+}
+
+bool iommu_get_dma_strict(void)
+{
+	return iommu_dma_strict;
+}
+
  static ssize_t iommu_group_attr_show(struct kobject *kobj,
  				     struct attribute *__attr, char *buf)
  {
@@ -1520,13 +1546,6 @@ static int iommu_group_alloc_default_domain(struct bus_type *bus,
  	if (!group->domain)
  		group->domain = dom;
  
-	if (!iommu_dma_strict) {
-		int attr = 1;
-		iommu_domain_set_attr(dom,
-				      DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
-				      &attr);
-	}
-
  	return 0;
  }
  
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index eb5e3f14c5ad..11bbfa273d98 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -495,6 +495,8 @@ extern int iommu_domain_get_attr(struct iommu_domain *domain, enum iommu_attr,
  				 void *data);
  extern int iommu_domain_set_attr(struct iommu_domain *domain, enum iommu_attr,
  				 void *data);
+extern void iommu_set_dma_strict(bool val);
+extern bool iommu_get_dma_strict(void);
  
  /* Window handling function prototypes */
  extern int iommu_domain_window_enable(struct iommu_domain *domain, u32 wnd_nr,
-- 
2.21.0.dirty

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
