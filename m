Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AF715F306
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 19:21:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A141E86958;
	Fri, 14 Feb 2020 18:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACB75VaWe2am; Fri, 14 Feb 2020 18:21:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E93C86943;
	Fri, 14 Feb 2020 18:21:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 789FCC0177;
	Fri, 14 Feb 2020 18:21:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 709A7C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 18:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 581FC22686
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 18:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vpFBpw760Kl2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 18:20:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by silver.osuosl.org (Postfix) with ESMTPS id 09BCC22661
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 18:20:56 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01EI3VHl196053;
 Fri, 14 Feb 2020 18:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=ms4iA00x1ArMuDwrt3pft/x2ZeWkVZEQyNUSw2WaYZo=;
 b=CuD9FNp30w7T8m8ssyzrr4l7sXj3agWAFfoA+VW1bHYkwRIK1RlRyNhswzW81Sdb1Y8q
 PmHuvL9c4ikg6TbxW9vZCLe6166900etUbmnueCaJOzkQXSe1rhWZFsJBa3NH/xG0SiL
 vFdrt6kORzixTMXgPNfcN6JiYgUUCOnXQad7uw2za8cZoio8M4IQfJkmUw7wR00FUB1b
 R6dSIvvDSrovepDq1AbquW1LQSdnmF/8rufm1S0+OnVA4Yrkfmscrazxq6HrEUU772p2
 WBdu4Gf0UPgOu+H1XXxljUnYmNyxDqzqy0G4t7L4SBY8Txte0hWArs6ej6O+MtCc4sDr bw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2y2p3t2w6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 18:20:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01EI1vST040507;
 Fri, 14 Feb 2020 18:20:49 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2y4k82jxf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 18:20:49 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01EIKk7o010802;
 Fri, 14 Feb 2020 18:20:46 GMT
Received: from dhcp-10-211-46-32.usdhcp.oraclecorp.com (/10.211.46.32)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 14 Feb 2020 10:20:45 -0800
Subject: Re: [PATCH 1/2] virtio-blk: fix hw_queue stopped on arbitrary error
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>
References: <20200213123728.61216-1-pasic@linux.ibm.com>
 <20200213123728.61216-2-pasic@linux.ibm.com>
From: dongli.zhang@oracle.com
Organization: Oracle Corporation
Message-ID: <d46e3fc1-9637-b82c-f986-3889fb0ca612@oracle.com>
Date: Fri, 14 Feb 2020 10:20:44 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200213123728.61216-2-pasic@linux.ibm.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9531
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 suspectscore=4 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002140136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9531
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 suspectscore=4 mlxlogscore=999 priorityscore=1501 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002140136
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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

Hi Halil,

When swiotlb full is hit for virtio_blk, there is below warning for once (the
warning is not by this patch set). Is this expected or just false positive?

[   54.767257] virtio-pci 0000:00:04.0: swiotlb buffer is full (sz: 16 bytes),
total 32768 (slots), used 258 (slots)
[   54.767260] virtio-pci 0000:00:04.0: overflow 0x0000000075770110+16 of DMA
mask ffffffffffffffff bus limit 0
[   54.769192] ------------[ cut here ]------------
[   54.769200] WARNING: CPU: 3 PID: 102 at kernel/dma/direct.c:35
report_addr+0x71/0x77
[   54.769200] Modules linked in:
[   54.769203] CPU: 3 PID: 102 Comm: kworker/u8:2 Not tainted 5.6.0-rc1+ #2
[   54.769204] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
[   54.769208] Workqueue: writeback wb_workfn (flush-253:0)
[   54.769211] RIP: 0010:report_addr+0x71/0x77
... ...
[   54.769226] Call Trace:
[   54.769241]  dma_direct_map_page+0xc9/0xe0
[   54.769245]  virtqueue_add+0x172/0xaa0
[   54.769248]  virtqueue_add_sgs+0x85/0xa0
[   54.769251]  virtio_queue_rq+0x292/0x480
[   54.769255]  __blk_mq_try_issue_directly+0x13e/0x1f0
[   54.769257]  blk_mq_request_issue_directly+0x48/0xa0
[   54.769259]  blk_mq_try_issue_list_directly+0x3c/0xb0
[   54.769261]  blk_mq_sched_insert_requests+0xb6/0x100
[   54.769263]  blk_mq_flush_plug_list+0x146/0x210
[   54.769264]  blk_flush_plug_list+0xba/0xe0
[   54.769266]  blk_mq_make_request+0x331/0x5b0
[   54.769268]  generic_make_request+0x10d/0x2e0
[   54.769270]  submit_bio+0x69/0x130
[   54.769273]  ext4_io_submit+0x44/0x50
[   54.769275]  ext4_writepages+0x56f/0xd30
[   54.769278]  ? cpumask_next_and+0x19/0x20
[   54.769280]  ? find_busiest_group+0x11a/0xa40
[   54.769283]  do_writepages+0x15/0x70
[   54.769288]  __writeback_single_inode+0x38/0x330
[   54.769290]  writeback_sb_inodes+0x219/0x4c0
[   54.769292]  __writeback_inodes_wb+0x82/0xb0
[   54.769293]  wb_writeback+0x267/0x300
[   54.769295]  wb_workfn+0x1aa/0x430
[   54.769298]  process_one_work+0x156/0x360
[   54.769299]  worker_thread+0x41/0x3b0
[   54.769300]  kthread+0xf3/0x130
[   54.769302]  ? process_one_work+0x360/0x360
[   54.769303]  ? kthread_bind+0x10/0x10
[   54.769305]  ret_from_fork+0x35/0x40
[   54.769307] ---[ end trace 923a87a9ce0e777a ]---

Thank you very much!

Dongli Zhang

On 2/13/20 4:37 AM, Halil Pasic wrote:
> Since nobody else is going to restart our hw_queue for us, the
> blk_mq_start_stopped_hw_queues() is in virtblk_done() is not sufficient
> necessarily sufficient to ensure that the queue will get started again.
> In case of global resource outage (-ENOMEM because mapping failure,
> because of swiotlb full) our virtqueue may be empty and we can get
> stuck with a stopped hw_queue.
> 
> Let us not stop the queue on arbitrary errors, but only on -EONSPC which
> indicates a full virtqueue, where the hw_queue is guaranteed to get
> started by virtblk_done() before when it makes sense to carry on
> submitting requests. Let us also remove a stale comment.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Fixes: f7728002c1c7 ("virtio_ring: fix return code on DMA mapping fails")
> ---
> 
> I'm in doubt with regards to the Fixes tag. The thing is, virtio-blk
> probably made an assumption on virtqueue_add: the failure is either
> because the virtqueue is full, or the failure is fatal. In both cases it
> seems acceptable to stop the queue, although the fatal case is arguable.
> Since commit f7728002c1c7 it the dma mapping has failed returns -ENOMEM
> and not -EIO, and thus we have a recoverable failure that ain't
> virtqueue full. So I lean towards to a fixes tag that references that
> commit, although it ain't broken. Alternatively one could say 'Fixes:
> e467cde23818 ("Block driver using virtio.")', if the aforementioned
> assumption shouldn't have made in the first place.
> ---
>  drivers/block/virtio_blk.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 54158766334b..adfe43f5ffe4 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -245,10 +245,12 @@ static blk_status_t virtio_queue_rq(struct blk_mq_hw_ctx *hctx,
>  	err = virtblk_add_req(vblk->vqs[qid].vq, vbr, vbr->sg, num);
>  	if (err) {
>  		virtqueue_kick(vblk->vqs[qid].vq);
> -		blk_mq_stop_hw_queue(hctx);
> +		/* Don't stop the queue if -ENOMEM: we may have failed to
> +		 * bounce the buffer due to global resource outage.
> +		 */
> +		if (err == -ENOSPC)
> +			blk_mq_stop_hw_queue(hctx);
>  		spin_unlock_irqrestore(&vblk->vqs[qid].lock, flags);
> -		/* Out of mem doesn't actually happen, since we fall back
> -		 * to direct descriptors */
>  		if (err == -ENOMEM || err == -ENOSPC)
>  			return BLK_STS_DEV_RESOURCE;
>  		return BLK_STS_IOERR;
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
