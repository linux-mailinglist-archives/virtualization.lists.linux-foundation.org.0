Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B08624F2939
	for <lists.virtualization@lfdr.de>; Tue,  5 Apr 2022 10:51:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 479BF4088E;
	Tue,  5 Apr 2022 08:51:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wQwb3xr6QaGM; Tue,  5 Apr 2022 08:51:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 768654035E;
	Tue,  5 Apr 2022 08:51:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAE8AC0033;
	Tue,  5 Apr 2022 08:51:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3A95C0012
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Apr 2022 08:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA40A4035E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Apr 2022 08:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSQCtDWZZZSy
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Apr 2022 08:51:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BB374023B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Apr 2022 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ME7eCfclWEIRuct0uqejqJOoYnW+nbwI0+B01pHSEUU=; b=vElwsFHzVnTtZMHng58CrmzhqE
 hzf0lzppsO9dHI3QUs5G1N3RzeMBrp6FkU0rCJFVMwc+Garh9VLXXA5TV5oUK9FfB51nGpisfMcG0
 erbhMVnIPlCvpkWqWSNPpFqGHEf9vtNreWTwftdA4G5o4G639MfcLolZPk7AGfa93/MKXccB0wsR2
 bkkv2vnyZe6aWOBW/MqPZX7D4KCPC74XVBifcBe+SqMQqY6Zig4wb0N183FAMX4QoRfnk/7uAnH/q
 1kHELNgy9Y+o+JgunA2Mk4lYKEb4UUsOg+WXrlXqnYZAF2JCAztYzW2OySsry2FqFg4fMmGnd4wkI
 7BVA8KaA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nbeua-000FlY-Iv; Tue, 05 Apr 2022 08:51:40 +0000
Date: Tue, 5 Apr 2022 01:51:40 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Suwan Kim <suwan.kim027@gmail.com>
Subject: Re: [PATCH v4 1/2] virtio-blk: support polling I/O
Message-ID: <YkwDHGutRLN51hbd@infradead.org>
References: <20220405053122.77626-1-suwan.kim027@gmail.com>
 <20220405053122.77626-2-suwan.kim027@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405053122.77626-2-suwan.kim027@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: mgurtovoy@nvidia.com, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 stefanha@redhat.com, pbonzini@redhat.com
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

On Tue, Apr 05, 2022 at 02:31:21PM +0900, Suwan Kim wrote:
> This patch supports polling I/O via virtio-blk driver. Polling
> feature is enabled by module parameter "num_poll_queues" and it
> sets dedicated polling queues for virtio-blk. This patch improves
> the polling I/O throughput and latency.
> 
> The virtio-blk driver doesn't not have a poll function and a poll
> queue and it has been operating in interrupt driven method even if
> the polling function is called in the upper layer.
> 
> virtio-blk polling is implemented upon 'batched completion' of block
> layer. virtblk_poll() queues completed request to io_comp_batch->req_list
> and later, virtblk_complete_batch() calls unmap function and ends
> the requests in batch.
> 
> virtio-blk reads the number of poll queues from module parameter
> "num_poll_queues". If VM sets queue parameter as below,
> ("num-queues=N" [QEMU property], "num_poll_queues=M" [module parameter])
> It allocates N virtqueues to virtio_blk->vqs[N] and it uses [0..(N-M-1)]
> as default queues and [(N-M)..(N-1)] as poll queues. Unlike the default
> queues, the poll queues have no callback function.
> 
> Regarding HW-SW queue mapping, the default queue mapping uses the
> existing method that condsiders MSI irq vector. But the poll queue
> doesn't have an irq, so it uses the regular blk-mq cpu mapping.
> 
> For verifying the improvement, I did Fio polling I/O performance test
> with io_uring engine with the options below.
> (io_uring, hipri, randread, direct=1, bs=512, iodepth=64 numjobs=N)
> I set 4 vcpu and 4 virtio-blk queues - 2 default queues and 2 poll
> queues for VM.
> 
> As a result, IOPS and average latency improved about 10%.
> 
> Test result:
> 
> - Fio io_uring poll without virtio-blk poll support
> 	-- numjobs=1 : IOPS = 339K, avg latency = 188.33us
> 	-- numjobs=2 : IOPS = 367K, avg latency = 347.33us
> 	-- numjobs=4 : IOPS = 383K, avg latency = 682.06us
> 
> - Fio io_uring poll with virtio-blk poll support
> 	-- numjobs=1 : IOPS = 385K, avg latency = 165.94us
> 	-- numjobs=2 : IOPS = 408K, avg latency = 313.28us
> 	-- numjobs=4 : IOPS = 424K, avg latency = 613.05us
> 
> Signed-off-by: Suwan Kim <suwan.kim027@gmail.com>
> ---
>  drivers/block/virtio_blk.c | 112 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 108 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 8c415be86732..712579dcd3cc 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -37,6 +37,10 @@ MODULE_PARM_DESC(num_request_queues,
>  		 "0 for no limit. "
>  		 "Values > nr_cpu_ids truncated to nr_cpu_ids.");
>  
> +static unsigned int poll_queues;
> +module_param(poll_queues, uint, 0644);
> +MODULE_PARM_DESC(poll_queues, "The number of dedicated virtqueues for polling I/O");
> +
>  static int major;
>  static DEFINE_IDA(vd_index_ida);
>  
> @@ -81,6 +85,7 @@ struct virtio_blk {
>  
>  	/* num of vqs */
>  	int num_vqs;
> +	int io_queues[HCTX_MAX_TYPES];
>  	struct virtio_blk_vq *vqs;
>  };
>  
> @@ -548,6 +553,7 @@ static int init_vq(struct virtio_blk *vblk)
>  	const char **names;
>  	struct virtqueue **vqs;
>  	unsigned short num_vqs;
> +	unsigned int num_poll_vqs;
>  	struct virtio_device *vdev = vblk->vdev;
>  	struct irq_affinity desc = { 0, };
>  
> @@ -556,6 +562,7 @@ static int init_vq(struct virtio_blk *vblk)
>  				   &num_vqs);
>  	if (err)
>  		num_vqs = 1;
> +
>  	if (!err && !num_vqs) {
>  		dev_err(&vdev->dev, "MQ advertised but zero queues reported\n");
>  		return -EINVAL;
> @@ -565,6 +572,18 @@ static int init_vq(struct virtio_blk *vblk)
>  			min_not_zero(num_request_queues, nr_cpu_ids),
>  			num_vqs);
>  
> +	num_poll_vqs = min_t(unsigned int, poll_queues, num_vqs - 1);
> +
> +	memset(vblk->io_queues, 0, sizeof(int) * HCTX_MAX_TYPES);
> +	vblk->io_queues[HCTX_TYPE_DEFAULT] = num_vqs - num_poll_vqs;
> +	vblk->io_queues[HCTX_TYPE_READ] = 0;
> +	vblk->io_queues[HCTX_TYPE_POLL] = num_poll_vqs;
> +
> +	dev_info(&vdev->dev, "%d/%d/%d default/read/poll queues\n",
> +				vblk->io_queues[HCTX_TYPE_DEFAULT],
> +				vblk->io_queues[HCTX_TYPE_READ],
> +				vblk->io_queues[HCTX_TYPE_POLL]);
> +
>  	vblk->vqs = kmalloc_array(num_vqs, sizeof(*vblk->vqs), GFP_KERNEL);
>  	if (!vblk->vqs)
>  		return -ENOMEM;
> @@ -578,8 +597,13 @@ static int init_vq(struct virtio_blk *vblk)
>  	}
>  
>  	for (i = 0; i < num_vqs; i++) {
> +		if (i < num_vqs - num_poll_vqs) {
> +			callbacks[i] = virtblk_done;
> +			snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req.%d", i);
> +		} else {
> +			callbacks[i] = NULL;
> +			snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req_poll.%d", i);
> +		}
>  		names[i] = vblk->vqs[i].name;

This would look a little cleaner with two loops:

 	for (i = 0; i < num_vqs - num_poll_vqs; i++) {
		callbacks[i] = virtblk_done;
		snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req.%d", i);
 		names[i] = vblk->vqs[i].name;
	}
 	for (; i < num_vqs; i++) {
		callbacks[i] = NULL;
		snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req_poll.%d", i);
		names[i] = vblk->vqs[i].name;
	}

> +
> +		if (map->nr_queues == 0)
> +			continue;
> +
> +		/*
> +		 * Regular queues have interrupts and hence CPU affinity is
> +		 * defined by the core virtio code, but polling queues have
> +		 * no interrupts so we let the block layer assign CPU affinity.
> +		 */
> +		if (i == HCTX_TYPE_DEFAULT)

I'd check for
		i != HCTX_TYPE_POLL

here instead to make the check a little more explicit and future proof
for the potential addition of read queues (which would be a Linux only
change without hypervisor or spec changes).  In fact you might as well
add that support now as doing it is completely trivial once a driver
supports multiple map types.

> +static void virtblk_complete_batch(struct io_comp_batch *iob)
> +{
> +	struct request *req;
> +	struct virtblk_req *vbr;
> +
> +	rq_list_for_each(&iob->req_list, req) {
> +		vbr = blk_mq_rq_to_pdu(req);
> +		virtblk_unmap_data(req, vbr);
> +		virtblk_cleanup_cmd(req);

vbr is only used ones, so why not just:

		virtblk_unmap_data(req, blk_mq_rq_to_pdu);
?

Or even better add a cleanup patch to just remove the vbr argument to
virtblk_unmap_data as it is not needed at all.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
