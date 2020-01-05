Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 657B913084A
	for <lists.virtualization@lfdr.de>; Sun,  5 Jan 2020 14:27:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1916B817F3;
	Sun,  5 Jan 2020 13:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y+TP32YGjOnH; Sun,  5 Jan 2020 13:27:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D60E9817F1;
	Sun,  5 Jan 2020 13:27:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4222C0881;
	Sun,  5 Jan 2020 13:27:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AE73C0881
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 02B4120435
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4o2iXwOdp9Q1
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:27:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 6332E20353
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578230856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JUEaOA+E9vqyl1/RDC5OJaaCVIxFrOdgvHfPFgoL+jM=;
 b=Yur91klGrgFUaMz4jOgv83faZbkrqbUjR7sv9ltndXO7Yu0w44PKQ+ehHXJThFgGzYm4MP
 81cS5/4kmeRGuIvojqJB98OgJl9u1ShClB56W3cP08XxQ6s2g17FuZ8sa3KthGtIfKNfOL
 EpNWnuxMt7pTnnqOmXs9tu+Zs43A+F4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-nY-gVtOlPW-xFb96A3lB_Q-1; Sun, 05 Jan 2020 08:27:34 -0500
Received: by mail-qt1-f198.google.com with SMTP id p12so32601977qtu.6
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Jan 2020 05:27:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JUEaOA+E9vqyl1/RDC5OJaaCVIxFrOdgvHfPFgoL+jM=;
 b=SwZBfrXLhSD4exhvKDYb5qxcZwIJQ1/67N9eCeng5XfDSJARdFTtDuXoKYKDTkzc4A
 FdWTgKmfxDrqXBleHiQwccZO7v3MQ5sWQ3wLRX8vij9RxLbvZV7feCUmLd7CAmYyGLwg
 t8iitAgJT/4qDm7iZsjcO4v2Lxgb9u0pIcGJpjR1tZ2P6l62x6Aleom1+FlITuD5KcUc
 iHwQMfZhLiHzEcAfKB0KxWMg9Kqe2vCRx9IOeDHSkN89qYRztlHxJ3HfPhRtMpd6lwBS
 /Zys+CkS1wYIxA+sX8LDVEFeeyEE6uuIUktLeLDrH0MUoKMEs1eDkg0MOE3Gtoo912AD
 pp9w==
X-Gm-Message-State: APjAAAV/x1QEmpWoHb4hpC7+8arS9TxfnUpj8VWOiBOjjDQz+wFDnttS
 YOA4ia5SvCKc0od50pQ4ZyaQR8GJwl2DeWs0PbKrPD7SfDhng9NkLiPteOFBLIwZ78hhdev59X3
 ZFlJMyR6jYeYjKeUk7x+6eYFbrhjOZRqll+OttM5gPA==
X-Received: by 2002:a0c:e4c1:: with SMTP id g1mr77095518qvm.45.1578230853457; 
 Sun, 05 Jan 2020 05:27:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwM2d7NuE9hStQC9VPH7gwYx8UiLnOFaGD7QE2GoAW7ejc9S7A4I/fJxAoPE7+ALqWpkutQ7g==
X-Received: by 2002:a0c:e4c1:: with SMTP id g1mr77095492qvm.45.1578230853019; 
 Sun, 05 Jan 2020 05:27:33 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id 16sm19383756qkj.77.2020.01.05.05.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 05:27:32 -0800 (PST)
Date: Sun, 5 Jan 2020 08:27:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] virtio-blk: remove VIRTIO_BLK_F_SCSI support
Message-ID: <20200105082652-mutt-send-email-mst@kernel.org>
References: <20191212163719.28432-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20191212163719.28432-1-hch@lst.de>
X-MC-Unique: nY-gVtOlPW-xFb96A3lB_Q-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: axboe@kernel.dk, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, stefanha@redhat.com, pbonzini@redhat.com
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

On Thu, Dec 12, 2019 at 05:37:19PM +0100, Christoph Hellwig wrote:
> Since the need for a special flag to support SCSI passthrough on a
> block device was added in May 2017 the SCSI passthrough support in
> virtio-blk has been disabled.  It has always been a bad idea
> (just ask the original author..) and we have virtio-scsi for proper
> passthrough.  The feature also never made it into the virtio 1.0
> or later specifications.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

OK but I'd rather not make such changes with merge window closed.
I'll queue this for next window.

> ---
>  arch/powerpc/configs/guest.config |   1 -
>  drivers/block/Kconfig             |  10 ---
>  drivers/block/virtio_blk.c        | 115 +-----------------------------
>  3 files changed, 1 insertion(+), 125 deletions(-)
> 
> diff --git a/arch/powerpc/configs/guest.config b/arch/powerpc/configs/guest.config
> index 8b8cd18ecd7c..209f58515d88 100644
> --- a/arch/powerpc/configs/guest.config
> +++ b/arch/powerpc/configs/guest.config
> @@ -1,5 +1,4 @@
>  CONFIG_VIRTIO_BLK=y
> -CONFIG_VIRTIO_BLK_SCSI=y
>  CONFIG_SCSI_VIRTIO=y
>  CONFIG_VIRTIO_NET=y
>  CONFIG_NET_FAILOVER=y
> diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
> index 1bb8ec575352..025b1b77b11a 100644
> --- a/drivers/block/Kconfig
> +++ b/drivers/block/Kconfig
> @@ -432,16 +432,6 @@ config VIRTIO_BLK
>  	  This is the virtual block driver for virtio.  It can be used with
>            QEMU based VMMs (like KVM or Xen).  Say Y or M.
>  
> -config VIRTIO_BLK_SCSI
> -	bool "SCSI passthrough request for the Virtio block driver"
> -	depends on VIRTIO_BLK
> -	select BLK_SCSI_REQUEST
> -	---help---
> -	  Enable support for SCSI passthrough (e.g. the SG_IO ioctl) on
> -	  virtio-blk devices.  This is only supported for the legacy
> -	  virtio protocol and not enabled by default by any hypervisor.
> -	  You probably want to use virtio-scsi instead.
> -
>  config BLK_DEV_RBD
>  	tristate "Rados block device (RBD)"
>  	depends on INET && BLOCK
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 7ffd719d89de..54158766334b 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -11,7 +11,6 @@
>  #include <linux/virtio_blk.h>
>  #include <linux/scatterlist.h>
>  #include <linux/string_helpers.h>
> -#include <scsi/scsi_cmnd.h>
>  #include <linux/idr.h>
>  #include <linux/blk-mq.h>
>  #include <linux/blk-mq-virtio.h>
> @@ -56,11 +55,6 @@ struct virtio_blk {
>  };
>  
>  struct virtblk_req {
> -#ifdef CONFIG_VIRTIO_BLK_SCSI
> -	struct scsi_request sreq;	/* for SCSI passthrough, must be first */
> -	u8 sense[SCSI_SENSE_BUFFERSIZE];
> -	struct virtio_scsi_inhdr in_hdr;
> -#endif
>  	struct virtio_blk_outhdr out_hdr;
>  	u8 status;
>  	struct scatterlist sg[];
> @@ -78,80 +72,6 @@ static inline blk_status_t virtblk_result(struct virtblk_req *vbr)
>  	}
>  }
>  
> -/*
> - * If this is a packet command we need a couple of additional headers.  Behind
> - * the normal outhdr we put a segment with the scsi command block, and before
> - * the normal inhdr we put the sense data and the inhdr with additional status
> - * information.
> - */
> -#ifdef CONFIG_VIRTIO_BLK_SCSI
> -static int virtblk_add_req_scsi(struct virtqueue *vq, struct virtblk_req *vbr,
> -		struct scatterlist *data_sg, bool have_data)
> -{
> -	struct scatterlist hdr, status, cmd, sense, inhdr, *sgs[6];
> -	unsigned int num_out = 0, num_in = 0;
> -
> -	sg_init_one(&hdr, &vbr->out_hdr, sizeof(vbr->out_hdr));
> -	sgs[num_out++] = &hdr;
> -	sg_init_one(&cmd, vbr->sreq.cmd, vbr->sreq.cmd_len);
> -	sgs[num_out++] = &cmd;
> -
> -	if (have_data) {
> -		if (vbr->out_hdr.type & cpu_to_virtio32(vq->vdev, VIRTIO_BLK_T_OUT))
> -			sgs[num_out++] = data_sg;
> -		else
> -			sgs[num_out + num_in++] = data_sg;
> -	}
> -
> -	sg_init_one(&sense, vbr->sense, SCSI_SENSE_BUFFERSIZE);
> -	sgs[num_out + num_in++] = &sense;
> -	sg_init_one(&inhdr, &vbr->in_hdr, sizeof(vbr->in_hdr));
> -	sgs[num_out + num_in++] = &inhdr;
> -	sg_init_one(&status, &vbr->status, sizeof(vbr->status));
> -	sgs[num_out + num_in++] = &status;
> -
> -	return virtqueue_add_sgs(vq, sgs, num_out, num_in, vbr, GFP_ATOMIC);
> -}
> -
> -static inline void virtblk_scsi_request_done(struct request *req)
> -{
> -	struct virtblk_req *vbr = blk_mq_rq_to_pdu(req);
> -	struct virtio_blk *vblk = req->q->queuedata;
> -	struct scsi_request *sreq = &vbr->sreq;
> -
> -	sreq->resid_len = virtio32_to_cpu(vblk->vdev, vbr->in_hdr.residual);
> -	sreq->sense_len = virtio32_to_cpu(vblk->vdev, vbr->in_hdr.sense_len);
> -	sreq->result = virtio32_to_cpu(vblk->vdev, vbr->in_hdr.errors);
> -}
> -
> -static int virtblk_ioctl(struct block_device *bdev, fmode_t mode,
> -			     unsigned int cmd, unsigned long data)
> -{
> -	struct gendisk *disk = bdev->bd_disk;
> -	struct virtio_blk *vblk = disk->private_data;
> -
> -	/*
> -	 * Only allow the generic SCSI ioctls if the host can support it.
> -	 */
> -	if (!virtio_has_feature(vblk->vdev, VIRTIO_BLK_F_SCSI))
> -		return -ENOTTY;
> -
> -	return scsi_cmd_blk_ioctl(bdev, mode, cmd,
> -				  (void __user *)data);
> -}
> -#else
> -static inline int virtblk_add_req_scsi(struct virtqueue *vq,
> -		struct virtblk_req *vbr, struct scatterlist *data_sg,
> -		bool have_data)
> -{
> -	return -EIO;
> -}
> -static inline void virtblk_scsi_request_done(struct request *req)
> -{
> -}
> -#define virtblk_ioctl	NULL
> -#endif /* CONFIG_VIRTIO_BLK_SCSI */
> -
>  static int virtblk_add_req(struct virtqueue *vq, struct virtblk_req *vbr,
>  		struct scatterlist *data_sg, bool have_data)
>  {
> @@ -216,13 +136,6 @@ static inline void virtblk_request_done(struct request *req)
>  		      req->special_vec.bv_offset);
>  	}
>  
> -	switch (req_op(req)) {
> -	case REQ_OP_SCSI_IN:
> -	case REQ_OP_SCSI_OUT:
> -		virtblk_scsi_request_done(req);
> -		break;
> -	}
> -
>  	blk_mq_end_request(req, virtblk_result(vbr));
>  }
>  
> @@ -299,10 +212,6 @@ static blk_status_t virtio_queue_rq(struct blk_mq_hw_ctx *hctx,
>  		type = VIRTIO_BLK_T_WRITE_ZEROES;
>  		unmap = !(req->cmd_flags & REQ_NOUNMAP);
>  		break;
> -	case REQ_OP_SCSI_IN:
> -	case REQ_OP_SCSI_OUT:
> -		type = VIRTIO_BLK_T_SCSI_CMD;
> -		break;
>  	case REQ_OP_DRV_IN:
>  		type = VIRTIO_BLK_T_GET_ID;
>  		break;
> @@ -333,10 +242,7 @@ static blk_status_t virtio_queue_rq(struct blk_mq_hw_ctx *hctx,
>  	}
>  
>  	spin_lock_irqsave(&vblk->vqs[qid].lock, flags);
> -	if (blk_rq_is_scsi(req))
> -		err = virtblk_add_req_scsi(vblk->vqs[qid].vq, vbr, vbr->sg, num);
> -	else
> -		err = virtblk_add_req(vblk->vqs[qid].vq, vbr, vbr->sg, num);
> +	err = virtblk_add_req(vblk->vqs[qid].vq, vbr, vbr->sg, num);
>  	if (err) {
>  		virtqueue_kick(vblk->vqs[qid].vq);
>  		blk_mq_stop_hw_queue(hctx);
> @@ -404,7 +310,6 @@ static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
>  }
>  
>  static const struct block_device_operations virtblk_fops = {
> -	.ioctl  = virtblk_ioctl,
>  	.owner  = THIS_MODULE,
>  	.getgeo = virtblk_getgeo,
>  };
> @@ -683,9 +588,6 @@ static int virtblk_init_request(struct blk_mq_tag_set *set, struct request *rq,
>  	struct virtio_blk *vblk = set->driver_data;
>  	struct virtblk_req *vbr = blk_mq_rq_to_pdu(rq);
>  
> -#ifdef CONFIG_VIRTIO_BLK_SCSI
> -	vbr->sreq.sense = vbr->sense;
> -#endif
>  	sg_init_table(vbr->sg, vblk->sg_elems);
>  	return 0;
>  }
> @@ -698,23 +600,11 @@ static int virtblk_map_queues(struct blk_mq_tag_set *set)
>  					vblk->vdev, 0);
>  }
>  
> -#ifdef CONFIG_VIRTIO_BLK_SCSI
> -static void virtblk_initialize_rq(struct request *req)
> -{
> -	struct virtblk_req *vbr = blk_mq_rq_to_pdu(req);
> -
> -	scsi_req_init(&vbr->sreq);
> -}
> -#endif
> -
>  static const struct blk_mq_ops virtio_mq_ops = {
>  	.queue_rq	= virtio_queue_rq,
>  	.commit_rqs	= virtio_commit_rqs,
>  	.complete	= virtblk_request_done,
>  	.init_request	= virtblk_init_request,
> -#ifdef CONFIG_VIRTIO_BLK_SCSI
> -	.initialize_rq_fn = virtblk_initialize_rq,
> -#endif
>  	.map_queues	= virtblk_map_queues,
>  };
>  
> @@ -991,9 +881,6 @@ static const struct virtio_device_id id_table[] = {
>  static unsigned int features_legacy[] = {
>  	VIRTIO_BLK_F_SEG_MAX, VIRTIO_BLK_F_SIZE_MAX, VIRTIO_BLK_F_GEOMETRY,
>  	VIRTIO_BLK_F_RO, VIRTIO_BLK_F_BLK_SIZE,
> -#ifdef CONFIG_VIRTIO_BLK_SCSI
> -	VIRTIO_BLK_F_SCSI,
> -#endif
>  	VIRTIO_BLK_F_FLUSH, VIRTIO_BLK_F_TOPOLOGY, VIRTIO_BLK_F_CONFIG_WCE,
>  	VIRTIO_BLK_F_MQ, VIRTIO_BLK_F_DISCARD, VIRTIO_BLK_F_WRITE_ZEROES,
>  }
> -- 
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
