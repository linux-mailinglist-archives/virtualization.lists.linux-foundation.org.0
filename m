Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7C2B4039
	for <lists.virtualization@lfdr.de>; Mon, 16 Nov 2020 10:51:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3BE358713A;
	Mon, 16 Nov 2020 09:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfCwcDMz0520; Mon, 16 Nov 2020 09:50:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4395F87095;
	Mon, 16 Nov 2020 09:50:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E570C07FF;
	Mon, 16 Nov 2020 09:50:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2251C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 09:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D83028562D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 09:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kV4jLbpy37Ut
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 09:50:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0CD688560C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 09:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605520252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1tFy2QDhVKk++GXQ1cATriAqBAtzlx74HcCkbk1BOfw=;
 b=iFBBmKte/L6/xUlGy8hSTKElKdJKfSNZ7JXgLQEGOlREXjbUtqLa7HxwRUc2p7OKIoQ80y
 VuQUHLt011tVK41/hhYvHLYd8gTPPG+03f3eDu9dfKzyKabWN2dM7GyQGqDfGgFGjzxlzB
 RoPXOQ2877yAleLik839SoXZhFkr8hI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-bODsbyh9Pwe1rD3vq2vakg-1; Mon, 16 Nov 2020 04:50:48 -0500
X-MC-Unique: bODsbyh9Pwe1rD3vq2vakg-1
Received: by mail-wr1-f70.google.com with SMTP id r15so10924608wrn.15
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 01:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1tFy2QDhVKk++GXQ1cATriAqBAtzlx74HcCkbk1BOfw=;
 b=HUwQYOCmZlgNkBH7kphLFIRo0p0U5gE4194dtMckZsDeoK0wtLQZyTQWW+pN65RpXb
 SVV1BJ6Z4lzcEL36hsrpyoDrJNMYzRi5cMGswn67pf+0SN1UNzoMKmYvO2jslgRd8g/o
 EuuddFb0Prktdhj0x1dbb24CJ18oQlq81CIlo/vDG5+2qcbz101BUDKq4dcnfgFRyHwu
 zj4iUfWNs7Qd8kPFpMUnLpZ7vnyk+9zhZqzh8nnlEkCBTo2/0t6YUdIdTvtG/Oz6ivyW
 H3fvr9gYPs1Ih1pwS8CALbdndN2T6ndSpJnWOtpIdV5nJA3otE+3Rj79PVnqx/zj3F+C
 C08Q==
X-Gm-Message-State: AOAM530APJ5B/YviYr1ONAO/2NyKxPeGeLDOejN6vJ7Gzm3qAXYefnMM
 jwbT67L4uTnUDuhEX4VaXtRzMHV1RVUisr0WFdtet8ZAq1h/egqwlmvlNXWY0o8kayuAZZ4tYdF
 q14/ar/hSBY/+unMDDK2mM7N+L/reFA9Wl6FlckmUxw==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr14438505wmr.179.1605520247241; 
 Mon, 16 Nov 2020 01:50:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysy4H0AGXU4sqyTmIIkBPHVyFghUL0GznzWcsb550MbEY/P8U+UOZWEvnSZRrYpKJEFvf6wg==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr14438489wmr.179.1605520247024; 
 Mon, 16 Nov 2020 01:50:47 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id a144sm5284763wmd.47.2020.11.16.01.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 01:50:46 -0800 (PST)
Date: Mon, 16 Nov 2020 04:50:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH RFC 12/12] vdpa_sim_blk: implement ramdisk behaviour
Message-ID: <20201116045029-mutt-send-email-mst@kernel.org>
References: <20201113134712.69744-1-sgarzare@redhat.com>
 <20201113134712.69744-13-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113134712.69744-13-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>
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

On Fri, Nov 13, 2020 at 02:47:12PM +0100, Stefano Garzarella wrote:
> The previous implementation wrote only the status of each request.
> This patch implements a more accurate block device simulator,
> providing a ramdisk-like behavior.
> 
> Also handle VIRTIO_BLK_T_GET_ID request, always answering the
> "vdpa_blk_sim" string.

Maybe an ioctl to specify the id makes more sense.

> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  drivers/vdpa/vdpa_sim/vdpa_sim_blk.c | 151 +++++++++++++++++++++++----
>  1 file changed, 133 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
> index 8e41b3ab98d5..68e74383322f 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/module.h>
> +#include <linux/blkdev.h>
>  #include <uapi/linux/virtio_blk.h>
>  
>  #include "vdpa_sim.h"
> @@ -24,10 +25,137 @@
>  
>  static struct vdpasim *vdpasim_blk_dev;
>  
> +static int vdpasim_blk_handle_req(struct vdpasim *vdpasim,
> +				  struct vdpasim_virtqueue *vq)
> +{
> +	size_t wrote = 0, to_read = 0, to_write = 0;
> +	struct virtio_blk_outhdr hdr;
> +	uint8_t status;
> +	uint32_t type;
> +	ssize_t bytes;
> +	loff_t offset;
> +	int i, ret;
> +
> +	vringh_kiov_cleanup(&vq->riov);
> +	vringh_kiov_cleanup(&vq->wiov);
> +
> +	ret = vringh_getdesc_iotlb(&vq->vring, &vq->riov, &vq->wiov,
> +				   &vq->head, GFP_ATOMIC);
> +	if (ret != 1)
> +		return ret;
> +
> +	for (i = 0; i < vq->wiov.used; i++)
> +		to_write += vq->wiov.iov[i].iov_len;
> +	to_write -= 1; /* last byte is the status */
> +
> +	for (i = 0; i < vq->riov.used; i++)
> +		to_read += vq->riov.iov[i].iov_len;
> +
> +	bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->riov, &hdr, sizeof(hdr));
> +	if (bytes != sizeof(hdr))
> +		return 0;
> +
> +	to_read -= bytes;
> +
> +	type = le32_to_cpu(hdr.type);
> +	offset = le64_to_cpu(hdr.sector) << SECTOR_SHIFT;
> +	status = VIRTIO_BLK_S_OK;
> +
> +	switch (type) {
> +	case VIRTIO_BLK_T_IN:
> +		if (offset + to_write > VDPASIM_BLK_CAPACITY << SECTOR_SHIFT) {
> +			dev_err(&vdpasim->vdpa.dev,
> +				"reading over the capacity - offset: 0x%llx len: 0x%lx\n",
> +				offset, to_write);
> +			status = VIRTIO_BLK_S_IOERR;
> +			break;
> +		}
> +
> +		bytes = vringh_iov_push_iotlb(&vq->vring, &vq->wiov,
> +					      vdpasim->buffer + offset,
> +					      to_write);
> +		if (bytes < 0) {
> +			dev_err(&vdpasim->vdpa.dev,
> +				"vringh_iov_push_iotlb() error: %ld offset: 0x%llx len: 0x%lx\n",
> +				bytes, offset, to_write);
> +			status = VIRTIO_BLK_S_IOERR;
> +			break;
> +		}
> +
> +		wrote += bytes;
> +		break;
> +
> +	case VIRTIO_BLK_T_OUT:
> +		if (offset + to_read > VDPASIM_BLK_CAPACITY << SECTOR_SHIFT) {
> +			dev_err(&vdpasim->vdpa.dev,
> +				"writing over the capacity - offset: 0x%llx len: 0x%lx\n",
> +				offset, to_read);
> +			status = VIRTIO_BLK_S_IOERR;
> +			break;
> +		}
> +
> +		bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->riov,
> +					      vdpasim->buffer + offset,
> +					      to_read);
> +		if (bytes < 0) {
> +			dev_err(&vdpasim->vdpa.dev,
> +				"vringh_iov_pull_iotlb() error: %ld offset: 0x%llx len: 0x%lx\n",
> +				bytes, offset, to_read);
> +			status = VIRTIO_BLK_S_IOERR;
> +			break;
> +		}
> +		break;
> +
> +	case VIRTIO_BLK_T_GET_ID: {
> +		char id[VIRTIO_BLK_ID_BYTES] = "vdpa_blk_sim";
> +
> +		bytes = vringh_iov_push_iotlb(&vq->vring,
> +					      &vq->wiov, id,
> +					      VIRTIO_BLK_ID_BYTES);
> +		if (bytes < 0) {
> +			dev_err(&vdpasim->vdpa.dev,
> +				"vringh_iov_push_iotlb() error: %ld\n", bytes);
> +			status = VIRTIO_BLK_S_IOERR;
> +			break;
> +		}
> +
> +		wrote += bytes;
> +		break;
> +	}
> +
> +	default:
> +		dev_warn(&vdpasim->vdpa.dev,
> +			 "Unsupported request type %d\n", type);
> +		status = VIRTIO_BLK_S_IOERR;
> +		break;
> +	}
> +
> +	/* if VIRTIO_BLK_T_IN or VIRTIO_BLK_T_GET_ID fail, we need to skip
> +	 * the remaining bytes to put the status in the last byte
> +	 */
> +	if (to_write - wrote > 0) {
> +		vringh_iov_push_iotlb(&vq->vring, &vq->wiov, NULL,
> +				      to_write - wrote);
> +	}
> +
> +	/* last byte is the status */
> +	bytes = vringh_iov_push_iotlb(&vq->vring, &vq->wiov, &status, 1);
> +	if (bytes != 1)
> +		return 0;
> +
> +	wrote += bytes;
> +
> +	/* Make sure data is wrote before advancing index */
> +	smp_wmb();
> +
> +	vringh_complete_iotlb(&vq->vring, vq->head, wrote);
> +
> +	return ret;
> +}
> +
>  static void vdpasim_blk_work(struct work_struct *work)
>  {
>  	struct vdpasim *vdpasim = container_of(work, struct vdpasim, work);
> -	u8 status = VIRTIO_BLK_S_OK;
>  	int i;
>  
>  	spin_lock(&vdpasim->lock);
> @@ -41,21 +169,7 @@ static void vdpasim_blk_work(struct work_struct *work)
>  		if (!vq->ready)
>  			continue;
>  
> -		while (vringh_getdesc_iotlb(&vq->vring, &vq->riov, &vq->wiov,
> -					    &vq->head, GFP_ATOMIC) > 0) {
> -
> -			int write;
> -
> -			vq->wiov.i = vq->wiov.used - 1;
> -			write = vringh_iov_push_iotlb(&vq->vring, &vq->wiov, &status, 1);
> -			if (write <= 0)
> -				break;
> -
> -			/* Make sure data is wrote before advancing index */
> -			smp_wmb();
> -
> -			vringh_complete_iotlb(&vq->vring, vq->head, write);
> -
> +		while (vdpasim_blk_handle_req(vdpasim, vq) > 0) {
>  			/* Make sure used is visible before rasing the interrupt. */
>  			smp_wmb();
>  
> @@ -67,6 +181,7 @@ static void vdpasim_blk_work(struct work_struct *work)
>  				vq->cb(vq->private);
>  			local_bh_enable();
>  		}
> +
>  	}
>  out:
>  	spin_unlock(&vdpasim->lock);
> @@ -84,7 +199,7 @@ static void vdpasim_blk_update_config(struct vdpasim *vdpasim)
>  	config->num_queues = cpu_to_vdpasim16(vdpasim, VDPASIM_BLK_VQ_NUM);
>  	config->min_io_size = cpu_to_vdpasim16(vdpasim, 1);
>  	config->opt_io_size = cpu_to_vdpasim32(vdpasim, 1);
> -	config->blk_size = cpu_to_vdpasim32(vdpasim, 512);
> +	config->blk_size = cpu_to_vdpasim32(vdpasim, SECTOR_SIZE);
>  }
>  
>  static int __init vdpasim_blk_init(void)
> @@ -100,7 +215,7 @@ static int __init vdpasim_blk_init(void)
>  	attr.device.update_config = vdpasim_blk_update_config;
>  
>  	attr.work_fn = vdpasim_blk_work;
> -	attr.buffer_size = PAGE_SIZE;
> +	attr.buffer_size = VDPASIM_BLK_CAPACITY << SECTOR_SHIFT;
>  
>  	vdpasim_blk_dev = vdpasim_create(&attr);
>  	if (IS_ERR(vdpasim_blk_dev)) {
> -- 
> 2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
