Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A700E1612AC
	for <lists.virtualization@lfdr.de>; Mon, 17 Feb 2020 14:08:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4F88C203BF;
	Mon, 17 Feb 2020 13:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4B0F1dBW1xa4; Mon, 17 Feb 2020 13:08:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4CBD8203D1;
	Mon, 17 Feb 2020 13:08:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2504AC013E;
	Mon, 17 Feb 2020 13:08:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A79AC013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 13:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EAB6E872E8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 13:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ps1PG+lDrVUu
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 13:08:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 81BE985B3C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 13:08:16 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01HD4659014152 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 08:08:15 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y6dq5v488-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 08:08:15 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <pasic@linux.ibm.com>;
 Mon, 17 Feb 2020 13:08:12 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 17 Feb 2020 13:08:09 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01HD87Fn18874400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Feb 2020 13:08:07 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA9D0A405C;
 Mon, 17 Feb 2020 13:08:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6ADAFA405F;
 Mon, 17 Feb 2020 13:08:07 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.110])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Feb 2020 13:08:07 +0000 (GMT)
Date: Mon, 17 Feb 2020 14:08:05 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: dongli.zhang@oracle.com
Subject: Re: [PATCH 1/2] virtio-blk: fix hw_queue stopped on arbitrary error
In-Reply-To: <d46e3fc1-9637-b82c-f986-3889fb0ca612@oracle.com>
References: <20200213123728.61216-1-pasic@linux.ibm.com>
 <20200213123728.61216-2-pasic@linux.ibm.com>
 <d46e3fc1-9637-b82c-f986-3889fb0ca612@oracle.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20021713-0028-0000-0000-000003DBC406
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021713-0029-0000-0000-000024A0CA04
Message-Id: <20200217140805.1f3fa378.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-17_07:2020-02-17,
 2020-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=1 impostorscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002170110
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, 14 Feb 2020 10:20:44 -0800
dongli.zhang@oracle.com wrote:

> Hi Halil,
> 
> When swiotlb full is hit for virtio_blk, there is below warning for once (the
> warning is not by this patch set). Is this expected or just false positive?

The warning is kind of expected. Certainly not a false positive, but it
probably looks more dramatic than I would like it to look.

If swiotlb cmdline parameter can be chosen so that the swiotlb won't
run out of space, that is certainly preferable. But out of swiotlb space
should merely result in performance degradation (provided the device
drivers properly handle the condition).

Thanks for having a look! 

Regards,
Halil

> 
> [   54.767257] virtio-pci 0000:00:04.0: swiotlb buffer is full (sz: 16 bytes),
> total 32768 (slots), used 258 (slots)
> [   54.767260] virtio-pci 0000:00:04.0: overflow 0x0000000075770110+16 of DMA
> mask ffffffffffffffff bus limit 0
> [   54.769192] ------------[ cut here ]------------
> [   54.769200] WARNING: CPU: 3 PID: 102 at kernel/dma/direct.c:35
> report_addr+0x71/0x77
> [   54.769200] Modules linked in:
> [   54.769203] CPU: 3 PID: 102 Comm: kworker/u8:2 Not tainted 5.6.0-rc1+ #2
> [   54.769204] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> [   54.769208] Workqueue: writeback wb_workfn (flush-253:0)
> [   54.769211] RIP: 0010:report_addr+0x71/0x77
> ... ...
> [   54.769226] Call Trace:
> [   54.769241]  dma_direct_map_page+0xc9/0xe0
> [   54.769245]  virtqueue_add+0x172/0xaa0
> [   54.769248]  virtqueue_add_sgs+0x85/0xa0
> [   54.769251]  virtio_queue_rq+0x292/0x480
> [   54.769255]  __blk_mq_try_issue_directly+0x13e/0x1f0
> [   54.769257]  blk_mq_request_issue_directly+0x48/0xa0
> [   54.769259]  blk_mq_try_issue_list_directly+0x3c/0xb0
> [   54.769261]  blk_mq_sched_insert_requests+0xb6/0x100
> [   54.769263]  blk_mq_flush_plug_list+0x146/0x210
> [   54.769264]  blk_flush_plug_list+0xba/0xe0
> [   54.769266]  blk_mq_make_request+0x331/0x5b0
> [   54.769268]  generic_make_request+0x10d/0x2e0
> [   54.769270]  submit_bio+0x69/0x130
> [   54.769273]  ext4_io_submit+0x44/0x50
> [   54.769275]  ext4_writepages+0x56f/0xd30
> [   54.769278]  ? cpumask_next_and+0x19/0x20
> [   54.769280]  ? find_busiest_group+0x11a/0xa40
> [   54.769283]  do_writepages+0x15/0x70
> [   54.769288]  __writeback_single_inode+0x38/0x330
> [   54.769290]  writeback_sb_inodes+0x219/0x4c0
> [   54.769292]  __writeback_inodes_wb+0x82/0xb0
> [   54.769293]  wb_writeback+0x267/0x300
> [   54.769295]  wb_workfn+0x1aa/0x430
> [   54.769298]  process_one_work+0x156/0x360
> [   54.769299]  worker_thread+0x41/0x3b0
> [   54.769300]  kthread+0xf3/0x130
> [   54.769302]  ? process_one_work+0x360/0x360
> [   54.769303]  ? kthread_bind+0x10/0x10
> [   54.769305]  ret_from_fork+0x35/0x40
> [   54.769307] ---[ end trace 923a87a9ce0e777a ]---
> 
> Thank you very much!
> 
> Dongli Zhang
> 
> On 2/13/20 4:37 AM, Halil Pasic wrote:
> > Since nobody else is going to restart our hw_queue for us, the
> > blk_mq_start_stopped_hw_queues() is in virtblk_done() is not sufficient
> > necessarily sufficient to ensure that the queue will get started again.
> > In case of global resource outage (-ENOMEM because mapping failure,
> > because of swiotlb full) our virtqueue may be empty and we can get
> > stuck with a stopped hw_queue.
> > 
> > Let us not stop the queue on arbitrary errors, but only on -EONSPC which
> > indicates a full virtqueue, where the hw_queue is guaranteed to get
> > started by virtblk_done() before when it makes sense to carry on
> > submitting requests. Let us also remove a stale comment.
> > 
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Cc: Jens Axboe <axboe@kernel.dk>
> > Fixes: f7728002c1c7 ("virtio_ring: fix return code on DMA mapping fails")
> > ---
> > 
> > I'm in doubt with regards to the Fixes tag. The thing is, virtio-blk
> > probably made an assumption on virtqueue_add: the failure is either
> > because the virtqueue is full, or the failure is fatal. In both cases it
> > seems acceptable to stop the queue, although the fatal case is arguable.
> > Since commit f7728002c1c7 it the dma mapping has failed returns -ENOMEM
> > and not -EIO, and thus we have a recoverable failure that ain't
> > virtqueue full. So I lean towards to a fixes tag that references that
> > commit, although it ain't broken. Alternatively one could say 'Fixes:
> > e467cde23818 ("Block driver using virtio.")', if the aforementioned
> > assumption shouldn't have made in the first place.
> > ---
> >  drivers/block/virtio_blk.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > index 54158766334b..adfe43f5ffe4 100644
> > --- a/drivers/block/virtio_blk.c
> > +++ b/drivers/block/virtio_blk.c
> > @@ -245,10 +245,12 @@ static blk_status_t virtio_queue_rq(struct blk_mq_hw_ctx *hctx,
> >  	err = virtblk_add_req(vblk->vqs[qid].vq, vbr, vbr->sg, num);
> >  	if (err) {
> >  		virtqueue_kick(vblk->vqs[qid].vq);
> > -		blk_mq_stop_hw_queue(hctx);
> > +		/* Don't stop the queue if -ENOMEM: we may have failed to
> > +		 * bounce the buffer due to global resource outage.
> > +		 */
> > +		if (err == -ENOSPC)
> > +			blk_mq_stop_hw_queue(hctx);
> >  		spin_unlock_irqrestore(&vblk->vqs[qid].lock, flags);
> > -		/* Out of mem doesn't actually happen, since we fall back
> > -		 * to direct descriptors */
> >  		if (err == -ENOMEM || err == -ENOSPC)
> >  			return BLK_STS_DEV_RESOURCE;
> >  		return BLK_STS_IOERR;
> > 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
