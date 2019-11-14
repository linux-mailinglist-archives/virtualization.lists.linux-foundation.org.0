Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 91253FC684
	for <lists.virtualization@lfdr.de>; Thu, 14 Nov 2019 13:48:12 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 65076E97;
	Thu, 14 Nov 2019 12:48:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7BFC6AE0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 12:48:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 02FA38B7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 12:48:03 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	xAEClf2Y145064 for <virtualization@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 07:48:02 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2w9748ra89-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 07:48:00 -0500
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Thu, 14 Nov 2019 12:47:13 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 14 Nov 2019 12:47:10 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id xAECl9up55509086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Nov 2019 12:47:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31B544C040;
	Thu, 14 Nov 2019 12:47:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4C704C046;
	Thu, 14 Nov 2019 12:47:08 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 14 Nov 2019 12:47:08 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] virtio_ring: fix return code on DMA mapping fails
Date: Thu, 14 Nov 2019 13:46:46 +0100
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 19111412-0008-0000-0000-0000032EF93C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111412-0009-0000-0000-00004A4E07E0
Message-Id: <20191114124646.74790-1-pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-11-14_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1910280000 definitions=main-1911140119
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
	"Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
	Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Andy Lutomirski <luto@kernel.org>, Michael Mueller <mimu@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Commit 780bc7903a32 ("virtio_ring: Support DMA APIs")  makes
virtqueue_add() return -EIO when we fail to map our I/O buffers. This is
a very realistic scenario for guests with encrypted memory, as swiotlb
may run out of space, depending on it's size and the I/O load.

The virtio-blk driver interprets -EIO form virtqueue_add() as an IO
error, despite the fact that swiotlb full is in absence of bugs a
recoverable condition.

Let us change the return code to -ENOMEM, and make the block layer
recover form these failures when virtio-blk encounters the condition
described above.

Fixes: 780bc7903a32 ("virtio_ring: Support DMA APIs")
Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Tested-by: Michael Mueller <mimu@linux.ibm.com>
---

Notes
=====

* When out of descriptors (which might regarded as a similar out of
resources condition) virtio uses -ENOSPC, this however seems wrong,
as ENOSPC is defined as -ENOSPC. Thus I choose -ENOMEM over -ENOSPC.

* In virtio_queue_rq() in virtio_blk.c both -ENOMEM and -ENOSPC are
handled as BLK_STS_DEV_RESOURCE. Returning BLK_STS_RESOURCE however
seems more appropriate for dma mapping failed as we are talking about
a global, and not a device local resource. Both seem to do the trick.

* Mimu tested the patch with virtio-blk and virtio-net (thanks!). We
should look into how other virtio devices behave when DMA mapping fails.
---
 drivers/virtio/virtio_ring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index a8041e451e9e..867c7ebd3f10 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -583,7 +583,7 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 		kfree(desc);
 
 	END_USE(vq);
-	return -EIO;
+	return -ENOMEM;
 }
 
 static bool virtqueue_kick_prepare_split(struct virtqueue *_vq)
@@ -1085,7 +1085,7 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
 	kfree(desc);
 
 	END_USE(vq);
-	return -EIO;
+	return -ENOMEM;
 }
 
 static inline int virtqueue_add_packed(struct virtqueue *_vq,
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
