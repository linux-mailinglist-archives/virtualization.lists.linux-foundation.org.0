Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF11661DB
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 17:08:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9425A8746D;
	Thu, 20 Feb 2020 16:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10BJ4AgBXj5J; Thu, 20 Feb 2020 16:08:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D77A875CF;
	Thu, 20 Feb 2020 16:08:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E00AC1D90;
	Thu, 20 Feb 2020 16:08:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F796C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 16:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0EEE387D41
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 16:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kn1ntWUPkFp7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 16:08:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 399F987D09
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 16:08:03 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KG3xIN027516 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 11:08:02 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y92xehp23-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 11:08:01 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <pasic@linux.ibm.com>;
 Thu, 20 Feb 2020 16:07:59 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 16:07:53 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01KG6btL22020162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 16:06:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE339AE058;
 Thu, 20 Feb 2020 16:06:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D54DAE057;
 Thu, 20 Feb 2020 16:06:37 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 16:06:37 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/2] mm: move force_dma_unencrypted() to mem_encrypt.h
Date: Thu, 20 Feb 2020 17:06:05 +0100
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220160606.53156-1-pasic@linux.ibm.com>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20022016-0008-0000-0000-00000354D0ED
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022016-0009-0000-0000-00004A75E16D
Message-Id: <20200220160606.53156-2-pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_04:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200118
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Michael Mueller <mimu@linux.ibm.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Currently force_dma_unencrypted() is only used by the direct
implementation of the DMA API, and thus resides in dma-direct.h. But
there is nothing dma-direct specific about it: if one was -- for
whatever reason -- to implement custom DMA ops that have to in the
encrypted/protected scenarios dma-direct currently deals with, one would
need exactly this kind of information.

More importantly, virtio has to use DMA API (so that the memory
encryption (x86) or protection (power, s390) is handled) under the very
same circumstances force_dma_unencrypted() returns true. Furthermore,
the in these cases the reason to go via the DMA API is distinct,
compared to the reason indicated by VIRTIO_F_IOMMU_PLATFORM: we need to
use DMA API independently of the device's properties with regards to
access to memory. I.e. the addresses in the descriptors are still guest
physical addresses, the device may still be implemented by a SMP CPU,
and thus the device shall use those without any further translation. See
[1].

Let's move force_dma_unencrypted() the so virtio, or other
implementations of DMA ops can make the right decisions.

[1] https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-4100006
(In the spec VIRTIO_F_IOMMU_PLATFORM is called
VIRTIO_F_ACCESS_PLATFORM).

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Tested-by: Ram Pai <linuxram@us.ibm.com>
Tested-by: Michael Mueller <mimu@linux.ibm.com>
---
 include/linux/dma-direct.h  |  9 ---------
 include/linux/mem_encrypt.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 24b8684aa21d..590b15d881b0 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -26,15 +26,6 @@ static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 }
 #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 
-#ifdef CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED
-bool force_dma_unencrypted(struct device *dev);
-#else
-static inline bool force_dma_unencrypted(struct device *dev)
-{
-	return false;
-}
-#endif /* CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED */
-
 /*
  * If memory encryption is supported, phys_to_dma will set the memory encryption
  * bit in the DMA address, and dma_to_phys will clear it.  The raw __phys_to_dma
diff --git a/include/linux/mem_encrypt.h b/include/linux/mem_encrypt.h
index 5c4a18a91f89..64a48c4b01a2 100644
--- a/include/linux/mem_encrypt.h
+++ b/include/linux/mem_encrypt.h
@@ -22,6 +22,16 @@ static inline bool mem_encrypt_active(void) { return false; }
 
 #endif	/* CONFIG_ARCH_HAS_MEM_ENCRYPT */
 
+struct device;
+#ifdef CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED
+bool force_dma_unencrypted(struct device *dev);
+#else
+static inline bool force_dma_unencrypted(struct device *dev)
+{
+	return false;
+}
+#endif /* CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED */
+
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 /*
  * The __sme_set() and __sme_clr() macros are useful for adding or removing
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
