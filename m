Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C664B495DAF
	for <lists.virtualization@lfdr.de>; Fri, 21 Jan 2022 11:22:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45D6A40592;
	Fri, 21 Jan 2022 10:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eeIaHu8EQrR9; Fri, 21 Jan 2022 10:22:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5172B405BB;
	Fri, 21 Jan 2022 10:22:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7754C0077;
	Fri, 21 Jan 2022 10:22:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71BEEC002F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Jan 2022 10:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51E9583478
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Jan 2022 10:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zd5c31VEVoQk
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Jan 2022 10:22:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B161833CD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Jan 2022 10:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642760552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g9AApnPyGCIGtzkwx4knIIOMucC6GnoepBiOBYyLqEY=;
 b=Ex7Eax9N9WNCvob5lcwzULBQQv4iFg9sxGzmUM2aP2yAkK39R1KoUqoXUWTdPGqWFESdFs
 AlUB54kzGnTNQ+nK9gVs47yxTw+tjZiLeuayRpvVTTxvcO2qH+qJGLxzo2uds9fRhngCtj
 zgMlonkQCh69w590yKrckulp3sOT7q0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-7bsvfsx4PGe4QcpC1AZBmw-1; Fri, 21 Jan 2022 05:22:30 -0500
X-MC-Unique: 7bsvfsx4PGe4QcpC1AZBmw-1
Received: by mail-ed1-f69.google.com with SMTP id
 k10-20020a50cb8a000000b00403c8326f2aso8716946edi.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Jan 2022 02:22:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g9AApnPyGCIGtzkwx4knIIOMucC6GnoepBiOBYyLqEY=;
 b=2MVxP3R+T9YOu32/lVxZOBkwKv7Cef/9zgkIGPJzd8zDqmqq0AVgtPCd7ahkmT0NQq
 16raIo3PFY6JSc7RlfZCSkJ1VcZL0lKmiAOSgVPRdukSNBvcdn5oigxrN93c/xOnaiJz
 T+uRAWAyOnCXgKmgeHvRyykXIR+6KJ2v0xbDXgU8lZIHfF8zTTRCx/j6Reyppclwiz3j
 7c3v04q6SUlwwkRJhRzslx4fSApHlVuAtL/5/BZPOx3M9FgXXm2DWe15SvyvepH6PLnr
 e1DZjQtFUztPPp2lVA7YZ0qzVcBYLFuFzvtrkQTTlAEG5Ac/AYH+Id61TJkFqnX/Ireo
 gC2A==
X-Gm-Message-State: AOAM530UqVMPlz03fF8Njed1cXIioE9XpOTyaRm0MRSSA+Hq03acjBs4
 VvyV7nA9UWsPGATxjFO8ZkPF00Ni7+faM0dSVNnBtSS9cfE/SmmkVveB7+LynzcX3oFJ6Xnnnba
 Oyctk8voOztny/8fQDvjc1KD98kg/sEL1XloYmkfSCg==
X-Received: by 2002:a17:906:1c03:: with SMTP id
 k3mr1150288ejg.646.1642760549423; 
 Fri, 21 Jan 2022 02:22:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9arqno6e0zeUKyRgYByBOMfi2aCnxThKS0A8hO8wTUT/ba+1L0TORbJZeOinOQ7ig2C8oyQ==
X-Received: by 2002:a17:906:1c03:: with SMTP id
 k3mr1150273ejg.646.1642760549101; 
 Fri, 21 Jan 2022 02:22:29 -0800 (PST)
Received: from redhat.com ([2.55.158.21])
 by smtp.gmail.com with ESMTPSA id t13sm1890819ejs.187.2022.01.21.02.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 02:22:28 -0800 (PST)
Date: Fri, 21 Jan 2022 05:22:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v2 07/12] virtio: queue_reset: pci: support
 VIRTIO_F_RING_RESET
Message-ID: <20220121052206-mutt-send-email-mst@kernel.org>
References: <20220120100304-mutt-send-email-mst@kernel.org>
 <1642731779.2471316-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1642731779.2471316-1-xuanzhuo@linux.alibaba.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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

On Fri, Jan 21, 2022 at 10:22:59AM +0800, Xuan Zhuo wrote:
> On Thu, 20 Jan 2022 10:03:45 -0500, Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Thu, Jan 20, 2022 at 07:46:20PM +0800, Xuan Zhuo wrote:
> > > On Thu, 20 Jan 2022 05:55:14 -0500, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > On Thu, Jan 20, 2022 at 02:42:58PM +0800, Xuan Zhuo wrote:
> > > > > This patch implements virtio pci support for QUEUE RESET.
> > > > >
> > > > > Performing reset on a queue is divided into two steps:
> > > > >
> > > > > 1. reset_vq: reset one vq
> > > > > 2. enable_reset_vq: re-enable the reset queue
> > > > >
> > > > > In the first step, these tasks will be completed:
> > > > >    1. notify the hardware queue to reset
> > > > >    2. recycle the buffer from vq
> > > > >    3. delete the vq
> > > > >
> > > > > When deleting a vq, vp_del_vq() will be called to release all the memory
> > > > > of the vq. But this does not affect the process of deleting vqs, because
> > > > > that is based on the queue to release all the vqs. During this process,
> > > > > the vq has been removed from the queue.
> > > > >
> > > > > When deleting vq, info and vq will be released, and I save msix_vec in
> > > > > vp_dev->vqs[queue_index]. When re-enable, the current msix_vec can be
> > > > > reused. And based on intx_enabled to determine which method to use to
> > > > > enable this queue.
> > > > >
> > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > >
> > > > There's something I don't understand here. It looks like
> > > > you assume that when you reset a queue, you also
> > > > reset the mapping from queue to event vector.
> > > > The spec does not say it should, and I don't think it's
> > > > useful to extend spec to do it - we already have a simple
> > > > way to tweak the mapping.
> > > >
> > >
> > > Sorry, what is the already existing method you are referring to, I didn't find
> > > it.
> >
> >
> > Write 0xffff into vector number.
> 
> I wonder if there is some misunderstanding here.
> 
> My purpose is to release vq, then for the vector used by vq, I hope that it can
> be reused when re-enable.
> 
> But the vector number is not in a fixed order. When I re-enable it, I don't know
> what the original vector number is. So I found a place to save this number.
> 
> The queue reset I implemented is divided into the following steps:
> 	1. notify the driver to queue reset
> 	2. disable_irq()
> 	3. free unused bufs
> 	4. free irq, free vq, free info
> 
> The process of enable is divided into the following steps:
> 	1. Get the vector number used by the original vq and re-setup vq
> 	2. enable vq
> 	3. enable irq
> 
> If there is anything unreasonable please let me know.
> 
> Thanks.

Why do you free irq?

> >
> > > I think you mean that we don't have to reset the event vector, I think you are
> > > right.
> > >
> > >
> > >
> > > Thanks.
> > >
> > > > Avoid doing that, and things will be much easier, with no need
> > > > to interact with a transport, won't they?
> > > >
> > > >
> > > > > ---
> > > > >  drivers/virtio/virtio_pci_common.c | 49 ++++++++++++++++++++
> > > > >  drivers/virtio/virtio_pci_common.h |  4 ++
> > > > >  drivers/virtio/virtio_pci_modern.c | 73 ++++++++++++++++++++++++++++++
> > > > >  3 files changed, 126 insertions(+)
> > > > >
> > > > > diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> > > > > index 5afe207ce28a..28b5ffde4621 100644
> > > > > --- a/drivers/virtio/virtio_pci_common.c
> > > > > +++ b/drivers/virtio/virtio_pci_common.c
> > > > > @@ -464,6 +464,55 @@ int vp_find_vqs(struct virtio_device *vdev, unsigned nvqs,
> > > > >  	return vp_find_vqs_intx(vdev, nvqs, vqs, callbacks, names, ctx);
> > > > >  }
> > > > >
> > > > > +#define VQ_IS_DELETED(vp_dev, idx) ((unsigned long)vp_dev->vqs[idx] & 1)
> > > > > +#define VQ_RESET_MSIX_VEC(vp_dev, idx) ((unsigned long)vp_dev->vqs[idx] >> 2)
> > > > > +#define VQ_RESET_MARK(msix_vec) ((void *)(long)((msix_vec << 2) + 1))
> > > > > +
> > > > > +void vp_del_reset_vq(struct virtio_device *vdev, u16 queue_index)
> > > > > +{
> > > > > +	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> > > > > +	struct virtio_pci_vq_info *info;
> > > > > +	u16 msix_vec;
> > > > > +
> > > > > +	info = vp_dev->vqs[queue_index];
> > > > > +
> > > > > +	msix_vec = info->msix_vector;
> > > > > +
> > > > > +	/* delete vq */
> > > > > +	vp_del_vq(info->vq);
> > > > > +
> > > > > +	/* Mark the vq has been deleted, and save the msix_vec. */
> > > > > +	vp_dev->vqs[queue_index] = VQ_RESET_MARK(msix_vec);
> > > > > +}
> > > > > +
> > > > > +struct virtqueue *vp_enable_reset_vq(struct virtio_device *vdev,
> > > > > +				     int queue_index,
> > > > > +				     vq_callback_t *callback,
> > > > > +				     const char *name,
> > > > > +				     const bool ctx)
> > > > > +{
> > > > > +	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> > > > > +	struct virtqueue *vq;
> > > > > +	u16 msix_vec;
> > > > > +
> > > > > +	if (!VQ_IS_DELETED(vp_dev, queue_index))
> > > > > +		return ERR_PTR(-EPERM);
> > > > > +
> > > > > +	msix_vec = VQ_RESET_MSIX_VEC(vp_dev, queue_index);
> > > > > +
> > > > > +	if (vp_dev->intx_enabled)
> > > > > +		vq = vp_setup_vq(vdev, queue_index, callback, name, ctx,
> > > > > +				 VIRTIO_MSI_NO_VECTOR);
> > > > > +	else
> > > > > +		vq = vp_enable_vq_msix(vdev, queue_index, callback, name, ctx,
> > > > > +				       msix_vec);
> > > > > +
> > > > > +	if (IS_ERR(vq))
> > > > > +		vp_dev->vqs[queue_index] = VQ_RESET_MARK(msix_vec);
> > > > > +
> > > > > +	return vq;
> > > > > +}
> > > > > +
> > > > >  const char *vp_bus_name(struct virtio_device *vdev)
> > > > >  {
> > > > >  	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> > > > > diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
> > > > > index 23f6c5c678d5..96c13b1398f8 100644
> > > > > --- a/drivers/virtio/virtio_pci_common.h
> > > > > +++ b/drivers/virtio/virtio_pci_common.h
> > > > > @@ -115,6 +115,10 @@ int vp_find_vqs(struct virtio_device *vdev, unsigned nvqs,
> > > > >  		struct virtqueue *vqs[], vq_callback_t *callbacks[],
> > > > >  		const char * const names[], const bool *ctx,
> > > > >  		struct irq_affinity *desc);
> > > > > +void vp_del_reset_vq(struct virtio_device *vdev, u16 queue_index);
> > > > > +struct virtqueue *vp_enable_reset_vq(struct virtio_device *vdev, int queue_index,
> > > > > +				     vq_callback_t *callback, const char *name,
> > > > > +				     const bool ctx);
> > > > >  const char *vp_bus_name(struct virtio_device *vdev);
> > > > >
> > > > >  /* Setup the affinity for a virtqueue:
> > > > > diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
> > > > > index 5455bc041fb6..fbf87239c920 100644
> > > > > --- a/drivers/virtio/virtio_pci_modern.c
> > > > > +++ b/drivers/virtio/virtio_pci_modern.c
> > > > > @@ -34,6 +34,9 @@ static void vp_transport_features(struct virtio_device *vdev, u64 features)
> > > > >  	if ((features & BIT_ULL(VIRTIO_F_SR_IOV)) &&
> > > > >  			pci_find_ext_capability(pci_dev, PCI_EXT_CAP_ID_SRIOV))
> > > > >  		__virtio_set_bit(vdev, VIRTIO_F_SR_IOV);
> > > > > +
> > > > > +	if (features & BIT_ULL(VIRTIO_F_RING_RESET))
> > > > > +		__virtio_set_bit(vdev, VIRTIO_F_RING_RESET);
> > > > >  }
> > > > >
> > > > >  /* virtio config->finalize_features() implementation */
> > > > > @@ -176,6 +179,72 @@ static void vp_reset(struct virtio_device *vdev)
> > > > >  	vp_disable_cbs(vdev);
> > > > >  }
> > > > >
> > > > > +static int vp_modern_reset_vq(struct virtio_device *vdev, u16 queue_index,
> > > > > +			      vq_reset_callback_t *callback, void *data)
> > > > > +{
> > > > > +	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> > > > > +	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
> > > > > +	struct virtio_pci_vq_info *info;
> > > > > +	u16 msix_vec;
> > > > > +	void *buf;
> > > > > +
> > > > > +	if (!virtio_has_feature(vdev, VIRTIO_F_RING_RESET))
> > > > > +		return -ENOENT;
> > > > > +
> > > > > +	vp_modern_set_queue_reset(mdev, queue_index);
> > > > > +
> > > > > +	/* After write 1 to queue reset, the driver MUST wait for a read of
> > > > > +	 * queue reset to return 1.
> > > > > +	 */
> > > > > +	while (vp_modern_get_queue_reset(mdev, queue_index) != 1)
> > > > > +		msleep(1);
> > > > > +
> > > > > +	info = vp_dev->vqs[queue_index];
> > > > > +	msix_vec = info->msix_vector;
> > > > > +
> > > > > +	/* Disable VQ callback. */
> > > > > +	if (vp_dev->per_vq_vectors && msix_vec != VIRTIO_MSI_NO_VECTOR)
> > > > > +		disable_irq(pci_irq_vector(vp_dev->pci_dev, msix_vec));
> > > > > +
> > > > > +	while ((buf = virtqueue_detach_unused_buf(info->vq)) != NULL)
> > > > > +		callback(vdev, buf, data);
> > > > > +
> > > > > +	vp_del_reset_vq(vdev, queue_index);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static struct virtqueue *vp_modern_enable_reset_vq(struct virtio_device *vdev,
> > > > > +						   u16 queue_index,
> > > > > +						   vq_callback_t *callback,
> > > > > +						   const char *name,
> > > > > +						   const bool *ctx)
> > > > > +{
> > > > > +	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> > > > > +	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
> > > > > +	struct virtqueue *vq;
> > > > > +	u16 msix_vec;
> > > > > +
> > > > > +	if (!virtio_has_feature(vdev, VIRTIO_F_RING_RESET))
> > > > > +		return ERR_PTR(-ENOENT);
> > > > > +
> > > > > +	/* check queue reset status */
> > > > > +	if (vp_modern_get_queue_reset(mdev, queue_index) != 1)
> > > > > +		return ERR_PTR(-EBUSY);
> > > > > +
> > > > > +	vq = vp_enable_reset_vq(vdev, queue_index, callback, name, ctx);
> > > > > +	if (IS_ERR(vq))
> > > > > +		return vq;
> > > > > +
> > > > > +	vp_modern_set_queue_enable(&vp_dev->mdev, vq->index, true);
> > > > > +
> > > > > +	msix_vec = vp_dev->vqs[queue_index]->msix_vector;
> > > > > +	if (vp_dev->per_vq_vectors && msix_vec != VIRTIO_MSI_NO_VECTOR)
> > > > > +		enable_irq(pci_irq_vector(vp_dev->pci_dev, msix_vec));
> > > > > +
> > > > > +	return vq;
> > > > > +}
> > > > > +
> > > > >  static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
> > > > >  {
> > > > >  	return vp_modern_config_vector(&vp_dev->mdev, vector);
> > > > > @@ -395,6 +464,8 @@ static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
> > > > >  	.set_vq_affinity = vp_set_vq_affinity,
> > > > >  	.get_vq_affinity = vp_get_vq_affinity,
> > > > >  	.get_shm_region  = vp_get_shm_region,
> > > > > +	.reset_vq	 = vp_modern_reset_vq,
> > > > > +	.enable_reset_vq = vp_modern_enable_reset_vq,
> > > > >  };
> > > > >
> > > > >  static const struct virtio_config_ops virtio_pci_config_ops = {
> > > > > @@ -413,6 +484,8 @@ static const struct virtio_config_ops virtio_pci_config_ops = {
> > > > >  	.set_vq_affinity = vp_set_vq_affinity,
> > > > >  	.get_vq_affinity = vp_get_vq_affinity,
> > > > >  	.get_shm_region  = vp_get_shm_region,
> > > > > +	.reset_vq	 = vp_modern_reset_vq,
> > > > > +	.enable_reset_vq = vp_modern_enable_reset_vq,
> > > > >  };
> > > > >
> > > > >  /* the PCI probing function */
> > > > > --
> > > > > 2.31.0
> > > >
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
