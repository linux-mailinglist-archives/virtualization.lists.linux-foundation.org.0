Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B320C759
	for <lists.virtualization@lfdr.de>; Sun, 28 Jun 2020 11:59:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F3C1E20481;
	Sun, 28 Jun 2020 09:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfZmJu17Blnw; Sun, 28 Jun 2020 09:59:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 240182041B;
	Sun, 28 Jun 2020 09:59:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE7C6C016E;
	Sun, 28 Jun 2020 09:59:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AC71C016E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 09:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5281085C28
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 09:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t6Pd1a-wJbYX
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 09:59:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2476585BF7
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593338352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VmSihHJRj6X8vfWMwTG8/icIb3ExyfDOJEc1XTXVyYA=;
 b=jHCc6DpOagpjF9Cv8WR0+3enIRAruR6KZ1VjQ9ieqEvMjgFEgZb9LwJ6JBH9AGkif40hHQ
 ol46PW0x+SHyiVLx7n1xYdKYfrkYxscDXjfcG9JAh7vSTYqKUUWY0SzR9sPGQI4DPaAvEQ
 gUC3jWHygR8C8sR/6b/d96i7ZDAm7UA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-XQeYgwWIPnabgrX1nbH7KQ-1; Sun, 28 Jun 2020 05:58:28 -0400
X-MC-Unique: XQeYgwWIPnabgrX1nbH7KQ-1
Received: by mail-wr1-f71.google.com with SMTP id o25so14494036wro.16
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 02:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VmSihHJRj6X8vfWMwTG8/icIb3ExyfDOJEc1XTXVyYA=;
 b=A2lYCXjs7wafSDzzZQRQvuwIoPVahjLWV1beWgu4E5A21q76RIRmN0uFmgayVUZO8q
 6fRW7ya+Dg0gTPMYRFWfC52pCT+Yr+JIO7tj2LzsDwjDwW/4CpVYZ6aWaQchpIbkgTz2
 NYj/I7bEoRvqW24Bhh9UtxJ9DvMoX3vCGAEHusEDPvEu55tDddKokcknyZWN17VOKBwb
 K/+PJEnNS0dbY6RzQw96QvbAucS0t/aD3/Ko1TsWiLjkLt0SP1O6pMo+ctTPrJOdEbV5
 nbnQBcoFRwsDWgi2uPf17B2TMgHw0CBO4693Gdzkbcfbdm99T8ARNH1/2OWdjK/0D4vd
 XBYw==
X-Gm-Message-State: AOAM532yar/jML5jR+c87M3vLOTe1pqLG3Zvl/63XkrnG/ijS4o629QT
 LZRTWRTdAWzzMFpiJShnRhypx7anRnC3+Rwc2aEfH7kvzrG70SKKtTvZHbnSCF7RywbFhlIIAmb
 rCa03cXMyafyGp01YkAbsaMvnVtpBKnQiX/KVQRHhZg==
X-Received: by 2002:adf:ecce:: with SMTP id s14mr12293776wro.154.1593338306924; 
 Sun, 28 Jun 2020 02:58:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9zm7MNbBULJ/q06u6nf6JrJYcvmC9jXJrOUZHqizqHorPmWVxe68u5oIzlPaBHTjmt4L6Kw==
X-Received: by 2002:adf:ecce:: with SMTP id s14mr12293754wro.154.1593338306643; 
 Sun, 28 Jun 2020 02:58:26 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 f2sm23259420wmj.39.2020.06.28.02.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 02:58:25 -0700 (PDT)
Date: Sun, 28 Jun 2020 05:58:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC 4/5] vhost-vdpa: support IOTLB batching hints
Message-ID: <20200628054940-mutt-send-email-mst@kernel.org>
References: <20200618055626.25660-1-jasowang@redhat.com>
 <20200618055626.25660-5-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200618055626.25660-5-jasowang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: shahafs@mellanox.com, lulu@redhat.com, saugatm@xilinx.com,
 mhabets@solarflare.com, vmireyno@marvell.com, linux-kernel@vger.kernel.org,
 gdawar@xilinx.com, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, hanand@xilinx.com, zhangweining@ruijie.com.cn,
 eli@mellanox.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

On Thu, Jun 18, 2020 at 01:56:25PM +0800, Jason Wang wrote:
> This patches extend the vhost IOTLB API to accept batch updating hints
> form userspace. When userspace wants update the device IOTLB in a
> batch, it may do:
> 
> 1) Write vhost_iotlb_msg with VHOST_IOTLB_BATCH_BEGIN flag
> 2) Perform a batch of IOTLB updating via VHOST_IOTLB_UPDATE/INVALIDATE
> 3) Write vhost_iotlb_msg with VHOST_IOTLB_BATCH_END flag

As long as we are extending the interface,
is there some way we could cut down the number of system calls needed
here?


> 
> Vhost-vdpa may decide to batch the IOMMU/IOTLB updating in step 3 when
> vDPA device support set_map() ops. This is useful for the vDPA device
> that want to know all the mappings to tweak their own DMA translation
> logic.
> 
> For vDPA device that doesn't require set_map(), no behavior changes.
> 
> This capability is advertised via VHOST_BACKEND_F_IOTLB_BATCH capability.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/vhost/vdpa.c             | 30 +++++++++++++++++++++++-------
>  include/uapi/linux/vhost.h       |  2 ++
>  include/uapi/linux/vhost_types.h |  7 +++++++
>  3 files changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 453057421f80..8f624bbafee7 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -56,7 +56,9 @@ enum {
>  };
>  
>  enum {
> -	VHOST_VDPA_BACKEND_FEATURES = (1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2)
> +	VHOST_VDPA_BACKEND_FEATURES =
> +	(1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2) |
> +	(1ULL << VHOST_BACKEND_F_IOTLB_BATCH),
>  };
>  
>  /* Currently, only network backend w/o multiqueue is supported. */
> @@ -77,6 +79,7 @@ struct vhost_vdpa {
>  	int virtio_id;
>  	int minor;
>  	struct eventfd_ctx *config_ctx;
> +	int in_batch;
>  };
>  
>  static DEFINE_IDA(vhost_vdpa_ida);
> @@ -125,6 +128,7 @@ static void vhost_vdpa_reset(struct vhost_vdpa *v)
>  	const struct vdpa_config_ops *ops = vdpa->config;
>  
>  	ops->set_status(vdpa, 0);
> +	v->in_batch = 0;
>  }
>  
>  static long vhost_vdpa_get_device_id(struct vhost_vdpa *v, u8 __user *argp)
> @@ -540,9 +544,10 @@ static int vhost_vdpa_map(struct vhost_vdpa *v,
>  
>  	if (ops->dma_map)
>  		r = ops->dma_map(vdpa, iova, size, pa, perm);
> -	else if (ops->set_map)
> -		r = ops->set_map(vdpa, dev->iotlb);
> -	else
> +	else if (ops->set_map) {
> +		if (!v->in_batch)
> +			r = ops->set_map(vdpa, dev->iotlb);
> +	} else
>  		r = iommu_map(v->domain, iova, pa, size,
>  			      perm_to_iommu_flags(perm));
>  
> @@ -559,9 +564,10 @@ static void vhost_vdpa_unmap(struct vhost_vdpa *v, u64 iova, u64 size)
>  
>  	if (ops->dma_map)
>  		ops->dma_unmap(vdpa, iova, size);
> -	else if (ops->set_map)
> -		ops->set_map(vdpa, dev->iotlb);
> -	else
> +	else if (ops->set_map) {
> +		if (!v->in_batch)
> +			ops->set_map(vdpa, dev->iotlb);
> +	} else
>  		iommu_unmap(v->domain, iova, size);
>  }
>  
> @@ -655,6 +661,8 @@ static int vhost_vdpa_process_iotlb_msg(struct vhost_dev *dev,
>  					struct vhost_iotlb_msg *msg)
>  {
>  	struct vhost_vdpa *v = container_of(dev, struct vhost_vdpa, vdev);
> +	struct vdpa_device *vdpa = v->vdpa;
> +	const struct vdpa_config_ops *ops = vdpa->config;
>  	int r = 0;
>  
>  	r = vhost_dev_check_owner(dev);
> @@ -668,6 +676,14 @@ static int vhost_vdpa_process_iotlb_msg(struct vhost_dev *dev,
>  	case VHOST_IOTLB_INVALIDATE:
>  		vhost_vdpa_unmap(v, msg->iova, msg->size);
>  		break;
> +	case VHOST_IOTLB_BATCH_BEGIN:
> +		v->in_batch = true;
> +		break;
> +	case VHOST_IOTLB_BATCH_END:
> +		if (v->in_batch && ops->set_map)
> +			ops->set_map(vdpa, dev->iotlb);
> +		v->in_batch = false;
> +		break;
>  	default:
>  		r = -EINVAL;
>  		break;
> diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
> index 0c2349612e77..565da96f55d5 100644
> --- a/include/uapi/linux/vhost.h
> +++ b/include/uapi/linux/vhost.h
> @@ -91,6 +91,8 @@
>  
>  /* Use message type V2 */
>  #define VHOST_BACKEND_F_IOTLB_MSG_V2 0x1
> +/* IOTLB can accpet batching hints */

typo

> +#define VHOST_BACKEND_F_IOTLB_BATCH  0x2
>  
>  #define VHOST_SET_BACKEND_FEATURES _IOW(VHOST_VIRTIO, 0x25, __u64)
>  #define VHOST_GET_BACKEND_FEATURES _IOR(VHOST_VIRTIO, 0x26, __u64)
> diff --git a/include/uapi/linux/vhost_types.h b/include/uapi/linux/vhost_types.h
> index 669457ce5c48..5c12faffdde9 100644
> --- a/include/uapi/linux/vhost_types.h
> +++ b/include/uapi/linux/vhost_types.h
> @@ -60,6 +60,13 @@ struct vhost_iotlb_msg {
>  #define VHOST_IOTLB_UPDATE         2
>  #define VHOST_IOTLB_INVALIDATE     3
>  #define VHOST_IOTLB_ACCESS_FAIL    4
> +/* VHOST_IOTLB_BATCH_BEGIN is a hint that userspace will update
> + * several mappings afterwards. VHOST_IOTLB_BATCH_END is a hint that
> + * userspace had finished the mapping updating.


Well not just hints - in fact updates do not take place
until _END.

How about:

/* VHOST_IOTLB_BATCH_BEGIN and VHOST_IOTLB_BATCH_END allow modifying
 * multiple mappings in one go: beginning with
 * VHOST_IOTLB_BATCH_BEGIN, followed by any number of
   VHOST_IOTLB_UPDATE messages, and ending with VHOST_IOTLB_BATCH_END.
 */


> When those two flags
> + * were set, kernel will ignore the rest fileds of the IOTLB message.

how about:

when one of these two values is used as the message type, the
rest of the fields in the message are ignored.

> + */
> +#define VHOST_IOTLB_BATCH_BEGIN    5
> +#define VHOST_IOTLB_BATCH_END      6
>  	__u8 type;
>  };
>  
> -- 
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
