Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE184E683A
	for <lists.virtualization@lfdr.de>; Thu, 24 Mar 2022 18:58:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4018340275;
	Thu, 24 Mar 2022 17:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ao3iO3IgXUp; Thu, 24 Mar 2022 17:58:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 759E4401AF;
	Thu, 24 Mar 2022 17:58:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDB5CC0082;
	Thu, 24 Mar 2022 17:58:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E05BAC000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Mar 2022 17:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF7DC6101D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Mar 2022 17:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPtIt6yWBDNC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Mar 2022 17:58:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2A64607F2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Mar 2022 17:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648144714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=24B/XtKE+i9R/9Z1L/twF0hYRAX8SqxHW1nZtqCuuqk=;
 b=CpIM11ITuaXp44n5lKJRlRB7x1FXrejO9ld+XjJ2CsG5FLG3KswteKp+4AFK8BvA/4xYQV
 l2gT5qvTHDet60BtcWLqDiPSr3RWLwXhq0AmfD6AQkI7V/3bmmhDQP7krxYJOuuDiTST9t
 kqrpNQmGC9kHJ0VrzHQLKpQJBl/0PT0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-UiDlLc4YO1-qO6ZAzNnKqw-1; Thu, 24 Mar 2022 13:58:33 -0400
X-MC-Unique: UiDlLc4YO1-qO6ZAzNnKqw-1
Received: by mail-wm1-f72.google.com with SMTP id
 2-20020a1c0202000000b0038c71e8c49cso4326271wmc.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Mar 2022 10:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=24B/XtKE+i9R/9Z1L/twF0hYRAX8SqxHW1nZtqCuuqk=;
 b=dDs388CgyLN0fUi4HOfjIMbUyel7/NGyy7ufHNtRzDmwQzdHBJSQEzn5HwBv7VgIQb
 JsBg3oDJdx6IDCm6/EKZANqdYYq768bStAtecV0wt0ZJ77GfiwPeFc+zIbWP4pveh1uc
 IiWF1U5NaR1rKXU6Irhh9u7I3hVXWIESUBYDmINMYbfLlr5zA5dPbqbeRmE+2tdJXUA5
 U/ZFmLrfGA0k1XNNmK+QvnG4kI3Czvi7cmuUMJOj/vhkym83I7TFt1tU09YukaNdcsbs
 tDKrycuwxdroYg7Omm1CX6H9BOALdOrgqaUGBAPh+EJGJsXEbfDjCH2FDS3nVRF1tKFO
 K0Xw==
X-Gm-Message-State: AOAM531qCF4h00X5WuW1F82iltnEEIzv2/H6p1DMPtMLFyT+zyrZEwMc
 dhpx8gR27DCo1Rec1yDvPqprCyFQD3tiE4HN1m8LCrBsfRKSdvuVU8Wh+DUkUY2QN9xsVlawvPc
 6Jsa3nV90qu1j7ZbhEispuNFjyCSpFfb9VKjDXCb1fg==
X-Received: by 2002:a7b:cd88:0:b0:38c:9d04:d794 with SMTP id
 y8-20020a7bcd88000000b0038c9d04d794mr5722750wmj.140.1648144712435; 
 Thu, 24 Mar 2022 10:58:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhZbiSeR68cODSxSS5FyJbBKt66eFyYTyW3evQ31ppjLV03LBggfH5LAwCSzlxfiskD0H8dA==
X-Received: by 2002:a7b:cd88:0:b0:38c:9d04:d794 with SMTP id
 y8-20020a7bcd88000000b0038c9d04d794mr5722725wmj.140.1648144712108; 
 Thu, 24 Mar 2022 10:58:32 -0700 (PDT)
Received: from redhat.com ([2.55.151.118]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d588a000000b002052e4aaf89sm3289829wrf.80.2022.03.24.10.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:58:31 -0700 (PDT)
Date: Thu, 24 Mar 2022 13:58:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Suwan Kim <suwan.kim027@gmail.com>
Subject: Re: [PATCH v3 1/2] virtio-blk: support polling I/O
Message-ID: <20220324135647-mutt-send-email-mst@kernel.org>
References: <20220324140450.33148-1-suwan.kim027@gmail.com>
 <20220324140450.33148-2-suwan.kim027@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220324140450.33148-2-suwan.kim027@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: mgurtovoy@nvidia.com, kernel test robot <lkp@intel.com>,
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

On Thu, Mar 24, 2022 at 11:04:49PM +0900, Suwan Kim wrote:
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
> 	-- numjobs=1 : IOPS = 380K, avg latency = 167.87us
> 	-- numjobs=2 : IOPS = 409K, avg latency = 312.6us
> 	-- numjobs=4 : IOPS = 413K, avg latency = 619.72us
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Suwan Kim <suwan.kim027@gmail.com>
> ---
>  drivers/block/virtio_blk.c | 101 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 97 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 8c415be86732..3d16f8b753e7 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -37,6 +37,10 @@ MODULE_PARM_DESC(num_request_queues,
>  		 "0 for no limit. "
>  		 "Values > nr_cpu_ids truncated to nr_cpu_ids.");
>  
> +static unsigned int num_poll_queues;
> +module_param(num_poll_queues, uint, 0644);
> +MODULE_PARM_DESC(num_poll_queues, "The number of dedicated virtqueues for polling I/O");
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
> @@ -565,6 +572,13 @@ static int init_vq(struct virtio_blk *vblk)
>  			min_not_zero(num_request_queues, nr_cpu_ids),
>  			num_vqs);
>  
> +	num_poll_vqs = min_t(unsigned int, num_poll_queues, num_vqs - 1);
> +
> +	memset(vblk->io_queues, 0, sizeof(int) * HCTX_MAX_TYPES);
> +	vblk->io_queues[HCTX_TYPE_DEFAULT] = num_vqs - num_poll_vqs;
> +	vblk->io_queues[HCTX_TYPE_READ] = 0;
> +	vblk->io_queues[HCTX_TYPE_POLL] = num_poll_vqs;
> +
>  	vblk->vqs = kmalloc_array(num_vqs, sizeof(*vblk->vqs), GFP_KERNEL);
>  	if (!vblk->vqs)
>  		return -ENOMEM;
> @@ -578,8 +592,13 @@ static int init_vq(struct virtio_blk *vblk)
>  	}
>  
>  	for (i = 0; i < num_vqs; i++) {
> -		callbacks[i] = virtblk_done;
> -		snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req.%d", i);
> +		if (i < num_vqs - num_poll_vqs) {
> +			callbacks[i] = virtblk_done;
> +			snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req.%d", i);
> +		} else {
> +			callbacks[i] = NULL;
> +			snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req_poll.%d", i);
> +		}
>  		names[i] = vblk->vqs[i].name;
>  	}
>  
> @@ -728,16 +747,87 @@ static const struct attribute_group *virtblk_attr_groups[] = {
>  static int virtblk_map_queues(struct blk_mq_tag_set *set)
>  {
>  	struct virtio_blk *vblk = set->driver_data;
> +	int i, qoff;
> +
> +	for (i = 0, qoff = 0; i < set->nr_maps; i++) {
> +		struct blk_mq_queue_map *map = &set->map[i];
> +
> +		map->nr_queues = vblk->io_queues[i];
> +		map->queue_offset = qoff;
> +		qoff += map->nr_queues;
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
> +			blk_mq_virtio_map_queues(&set->map[i], vblk->vdev, 0);
> +		else
> +			blk_mq_map_queues(&set->map[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static void virtblk_complete_batch(struct io_comp_batch *iob)
> +{
> +	struct request *req;
> +	struct virtblk_req *vbr;
>  
> -	return blk_mq_virtio_map_queues(&set->map[HCTX_TYPE_DEFAULT],
> -					vblk->vdev, 0);
> +	rq_list_for_each(&iob->req_list, req) {
> +		vbr = blk_mq_rq_to_pdu(req);
> +		virtblk_unmap_data(req, vbr);
> +		virtblk_cleanup_cmd(req);
> +	}
> +	blk_mq_end_request_batch(iob);
> +}
> +
> +static int virtblk_poll(struct blk_mq_hw_ctx *hctx, struct io_comp_batch *iob)
> +{
> +	struct virtio_blk_vq *vq = hctx->driver_data;
> +	struct virtblk_req *vbr;
> +	unsigned long flags;
> +	unsigned int len;
> +	int found = 0;
> +
> +	spin_lock_irqsave(&vq->lock, flags);
> +
> +	while ((vbr = virtqueue_get_buf(vq->vq, &len)) != NULL) {
> +		struct request *req = blk_mq_rq_from_pdu(vbr);
> +
> +		found++;
> +		if (!blk_mq_add_to_batch(req, iob, vbr->status,
> +						virtblk_complete_batch))
> +			blk_mq_complete_request(req);
> +	}
> +
> +	spin_unlock_irqrestore(&vq->lock, flags);
> +
> +	return found;
> +}
> +
> +static int virtblk_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
> +			  unsigned int hctx_idx)
> +{
> +	struct virtio_blk *vblk = data;
> +	struct virtio_blk_vq *vq = &vblk->vqs[hctx_idx];
> +
> +	WARN_ON(vblk->tag_set.tags[hctx_idx] != hctx->tags);
> +	hctx->driver_data = vq;
> +	return 0;
>  }
>  
>  static const struct blk_mq_ops virtio_mq_ops = {
>  	.queue_rq	= virtio_queue_rq,
>  	.commit_rqs	= virtio_commit_rqs,
> +	.init_hctx	= virtblk_init_hctx,
>  	.complete	= virtblk_request_done,
>  	.map_queues	= virtblk_map_queues,
> +	.poll		= virtblk_poll,
>  };
>  
>  static unsigned int virtblk_queue_depth;
> @@ -816,6 +906,9 @@ static int virtblk_probe(struct virtio_device *vdev)
>  		sizeof(struct scatterlist) * VIRTIO_BLK_INLINE_SG_CNT;
>  	vblk->tag_set.driver_data = vblk;
>  	vblk->tag_set.nr_hw_queues = vblk->num_vqs;
> +	vblk->tag_set.nr_maps = 1;
> +	if (vblk->io_queues[HCTX_TYPE_POLL])
> +		vblk->tag_set.nr_maps = 3;
>  
>  	err = blk_mq_alloc_tag_set(&vblk->tag_set);
>  	if (err)



So wrt cleanup, does something poll for all buffers to be
used when device is removed?

> -- 
> 2.26.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
