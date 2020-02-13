Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A00215BE8A
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 13:38:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1FF7786D82;
	Thu, 13 Feb 2020 12:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9+SRSDeNv0w8; Thu, 13 Feb 2020 12:38:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5D82A86CDB;
	Thu, 13 Feb 2020 12:38:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34B3FC0177;
	Thu, 13 Feb 2020 12:38:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 724FCC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 12:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 618D285EBE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 12:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9YDfN9fPZtf
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 12:38:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A896385910
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 12:38:13 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01DCb6wY155973 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 07:38:12 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1tn68d9v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 07:38:12 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <pasic@linux.ibm.com>;
 Thu, 13 Feb 2020 12:38:09 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 13 Feb 2020 12:38:05 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01DCb9Cr43778406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Feb 2020 12:37:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 277075204E;
 Thu, 13 Feb 2020 12:38:04 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A8B1452051;
 Thu, 13 Feb 2020 12:38:03 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH 1/2] virtio-blk: fix hw_queue stopped on arbitrary error
Date: Thu, 13 Feb 2020 13:37:27 +0100
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200213123728.61216-1-pasic@linux.ibm.com>
References: <20200213123728.61216-1-pasic@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20021312-0020-0000-0000-000003A9C690
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021312-0021-0000-0000-00002201B136
Message-Id: <20200213123728.61216-2-pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_04:2020-02-12,
 2020-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002130098
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-s390@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>
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

Since nobody else is going to restart our hw_queue for us, the
blk_mq_start_stopped_hw_queues() is in virtblk_done() is not sufficient
necessarily sufficient to ensure that the queue will get started again.
In case of global resource outage (-ENOMEM because mapping failure,
because of swiotlb full) our virtqueue may be empty and we can get
stuck with a stopped hw_queue.

Let us not stop the queue on arbitrary errors, but only on -EONSPC which
indicates a full virtqueue, where the hw_queue is guaranteed to get
started by virtblk_done() before when it makes sense to carry on
submitting requests. Let us also remove a stale comment.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Cc: Jens Axboe <axboe@kernel.dk>
Fixes: f7728002c1c7 ("virtio_ring: fix return code on DMA mapping fails")
---

I'm in doubt with regards to the Fixes tag. The thing is, virtio-blk
probably made an assumption on virtqueue_add: the failure is either
because the virtqueue is full, or the failure is fatal. In both cases it
seems acceptable to stop the queue, although the fatal case is arguable.
Since commit f7728002c1c7 it the dma mapping has failed returns -ENOMEM
and not -EIO, and thus we have a recoverable failure that ain't
virtqueue full. So I lean towards to a fixes tag that references that
commit, although it ain't broken. Alternatively one could say 'Fixes:
e467cde23818 ("Block driver using virtio.")', if the aforementioned
assumption shouldn't have made in the first place.
---
 drivers/block/virtio_blk.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 54158766334b..adfe43f5ffe4 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -245,10 +245,12 @@ static blk_status_t virtio_queue_rq(struct blk_mq_hw_ctx *hctx,
 	err = virtblk_add_req(vblk->vqs[qid].vq, vbr, vbr->sg, num);
 	if (err) {
 		virtqueue_kick(vblk->vqs[qid].vq);
-		blk_mq_stop_hw_queue(hctx);
+		/* Don't stop the queue if -ENOMEM: we may have failed to
+		 * bounce the buffer due to global resource outage.
+		 */
+		if (err == -ENOSPC)
+			blk_mq_stop_hw_queue(hctx);
 		spin_unlock_irqrestore(&vblk->vqs[qid].lock, flags);
-		/* Out of mem doesn't actually happen, since we fall back
-		 * to direct descriptors */
 		if (err == -ENOMEM || err == -ENOSPC)
 			return BLK_STS_DEV_RESOURCE;
 		return BLK_STS_IOERR;
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
