Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BEED8A58
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 09:55:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 87265AB9;
	Wed, 16 Oct 2019 07:55:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C57C7949
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 07:55:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5052E6C5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 07:55:39 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x9G7gQ7b126482 for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 03:55:38 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2vnx1u2pay-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 03:55:37 -0400
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<linuxram@us.ibm.com>; Wed, 16 Oct 2019 08:55:35 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 16 Oct 2019 08:55:29 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x9G7tSFt45154546
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 16 Oct 2019 07:55:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1818AE063;
	Wed, 16 Oct 2019 07:55:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0871AE051;
	Wed, 16 Oct 2019 07:55:24 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.142.84])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Oct 2019 07:55:24 +0000 (GMT)
Date: Wed, 16 Oct 2019 00:55:21 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Christoph Hellwig <hch@lst.de>
References: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
	<1570843519-8696-2-git-send-email-linuxram@us.ibm.com>
	<1570843519-8696-3-git-send-email-linuxram@us.ibm.com>
	<20191015073501.GA32345@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015073501.GA32345@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19101607-0012-0000-0000-000003587DE7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101607-0013-0000-0000-000021939633
Message-Id: <20191016075521.GA5201@oc0525413822.ibm.com>
Subject: RE: [PATCH 2/2] virtio_ring: Use DMA API if memory is encrypted
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-10-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1908290000 definitions=main-1910160072
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: andmike@us.ibm.com, sukadev@linux.vnet.ibm.com, b.zolnierkie@samsung.com,
	benh@kernel.crashing.org, aik@linux.ibm.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, paulus@ozlabs.org,
	iommu@lists.linux-foundation.org, paul.burton@mips.com,
	mpe@ellerman.id.au, robin.murphy@arm.com,
	m.szyprowski@samsung.com, linuxppc-dev@lists.ozlabs.org,
	david@gibson.dropbear.id.au
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, Oct 15, 2019 at 09:35:01AM +0200, Christoph Hellwig wrote:
> On Fri, Oct 11, 2019 at 06:25:19PM -0700, Ram Pai wrote:
> > From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> > 
> > Normally, virtio enables DMA API with VIRTIO_F_IOMMU_PLATFORM, which must
> > be set by both device and guest driver. However, as a hack, when DMA API
> > returns physical addresses, guest driver can use the DMA API; even though
> > device does not set VIRTIO_F_IOMMU_PLATFORM and just uses physical
> > addresses.
> 
> Sorry, but this is a complete bullshit hack.  Driver must always use
> the DMA API if they do DMA, and if virtio devices use physical addresses
> that needs to be returned through the platform firmware interfaces for
> the dma setup.  If you don't do that yet (which based on previous
> informations you don't), you need to fix it, and we can then quirk
> old implementations that already are out in the field.
> 
> In other words: we finally need to fix that virtio mess and not pile
> hacks on top of hacks.

So force all virtio devices to use DMA API, except when
VIRTIO_F_IOMMU_PLATFORM is not enabled?

Any help detailing the idea, will enable us fix this issue once for all.

Will something like below work? It removes the prior hacks, and
always uses DMA API; except when VIRTIO_F_IOMMU_PLATFORM is not enabled.

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index c8be1c4..b593d3d 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -240,22 +240,10 @@ static inline bool virtqueue_use_indirect(struct virtqueue *_vq,
 
 static bool vring_use_dma_api(struct virtio_device *vdev)
 {
-	if (!virtio_has_iommu_quirk(vdev))
-		return true;
-
-	/* Otherwise, we are left to guess. */
-	/*
-	 * In theory, it's possible to have a buggy QEMU-supposed
-	 * emulated Q35 IOMMU and Xen enabled at the same time.  On
-	 * such a configuration, virtio has never worked and will
-	 * not work without an even larger kludge.  Instead, enable
-	 * the DMA API if we're a Xen guest, which at least allows
-	 * all of the sensible Xen configurations to work correctly.
-	 */
-	if (xen_domain())
-		return true;
+	if (virtio_has_iommu_quirk(vdev))
+		return false;
 
-	return false;
+	return true;
 }
 
 size_t virtio_max_dma_size(struct virtio_device *vdev)


-- 
Ram Pai

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
