Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1BF6C608F
	for <lists.virtualization@lfdr.de>; Thu, 23 Mar 2023 08:23:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A38574176F;
	Thu, 23 Mar 2023 07:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A38574176F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B4poTvOA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CX9Dw-8pS9Qy; Thu, 23 Mar 2023 07:23:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 95C0941811;
	Thu, 23 Mar 2023 07:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95C0941811
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4016C008A;
	Thu, 23 Mar 2023 07:23:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB8BEC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 07:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FC34614FE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 07:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FC34614FE
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=B4poTvOA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Shzm3oYfCy7u
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 07:23:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BC5960D9D
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BC5960D9D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679556192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IKPzOg130yY2/nrQ50CpNSyYcZXu+iR0UPS73wWvAaw=;
 b=B4poTvOAQJ03Cbwfp2S9VSnJmXL3nBxwescnmGHeS5AYNZmncmd2rsUSsPaKOJJ7YlY3f7
 DPADvtitYNnFl30i4MKDa6pojIiY75luOMS7Q8luE4TLwI/TetNOu6ltwek2GFSVCghEKg
 Q5Y92eTvw6ZTCdrW3+eDciGPOiQCHoE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-ZtJBgjy6O_Sy6AjZQfqT2Q-1; Thu, 23 Mar 2023 03:23:11 -0400
X-MC-Unique: ZtJBgjy6O_Sy6AjZQfqT2Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so30693655eda.6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 00:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679556190;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IKPzOg130yY2/nrQ50CpNSyYcZXu+iR0UPS73wWvAaw=;
 b=MRPf3OQLwJ3n2z/5If9qW3sI2M5VpwX67lHEQd1CPxmvMse/jMlky94NUCM+j3+PcR
 rNyrgxintUywIgurLHVBDoYPNpTnXLASvPV3Gpy0gUL3aHb8hN8qplGPYA/L/U0PSdcC
 fF8s4oWoxds7H/tYW0hwpyFg4K9VNf9V78zOLSKyQ0SDbBnWTN3/wecBkWthEKLPVjhw
 pBu06H2MEqR+pfKCD5aPZ7R+wf97kz+8PL9PURHYFd9cMyUTdH6YXfAKfZLuCnW4ARGE
 wnTN+kb7MbQnXg1HhubWqS9GuuJBhEddIeD4Ns23WugIBBUeqc6loX8Ckiliyqqo8zS1
 +Cqw==
X-Gm-Message-State: AO0yUKXbITkYyjTfeToySvVv4zSJzJD8yZDpOdyb5nOCjHXjg4wVR/wX
 NA7RaiW4ivLQqXkyxnR21YjwqwouJZrJuq/KAXU8pE01EY8ywXiGh+IBAngL6qnTM2XaWSu3tu0
 oeY1EqJuD/Mkn8hxLNcinrtZ7chAq5hwSppcFK98wew==
X-Received: by 2002:a05:6402:552:b0:4fa:d2b1:9176 with SMTP id
 i18-20020a056402055200b004fad2b19176mr9046194edx.22.1679556189927; 
 Thu, 23 Mar 2023 00:23:09 -0700 (PDT)
X-Google-Smtp-Source: AK7set/lWgMzq9awcG87ay/J4twbbs8q1FAjYM6WTCDFZVt6nwxWkvfN0ABReeBsw20Ye5EqS/RsRw==
X-Received: by 2002:a05:6402:552:b0:4fa:d2b1:9176 with SMTP id
 i18-20020a056402055200b004fad2b19176mr9046181edx.22.1679556189687; 
 Thu, 23 Mar 2023 00:23:09 -0700 (PDT)
Received: from redhat.com ([2.52.143.71]) by smtp.gmail.com with ESMTPSA id
 e27-20020a50a69b000000b004fb542dd8cdsm8629813edc.29.2023.03.23.00.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 00:23:09 -0700 (PDT)
Date: Thu, 23 Mar 2023 03:23:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v4] virtio: add VIRTIO_F_NOTIFICATION_DATA feature support
Message-ID: <20230323031542-mutt-send-email-mst@kernel.org>
References: <20230322141031.2211141-1-viktor@daynix.com>
 <1679534465.5760474-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1679534465.5760474-1-xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, farman@linux.ibm.com, kvm@vger.kernel.org,
 cohuck@redhat.com, Viktor Prutyanov <viktor@daynix.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 pasic@linux.ibm.com, yan@daynix.com
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

On Thu, Mar 23, 2023 at 09:21:05AM +0800, Xuan Zhuo wrote:
> On Wed, 22 Mar 2023 17:10:31 +0300, Viktor Prutyanov <viktor@daynix.com> wrote:
> > According to VirtIO spec v1.2, VIRTIO_F_NOTIFICATION_DATA feature
> > indicates that the driver passes extra data along with the queue
> > notifications.
> >
> > In a split queue case, the extra data is 16-bit available index. In a
> > packed queue case, the extra data is 1-bit wrap counter and 15-bit
> > available index.
> >
> > Add support for this feature for MMIO, channel I/O and modern PCI
> > transports.
> >
> > Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> > ---
> >  v4: remove VP_NOTIFY macro and legacy PCI support, add
> >     virtio_ccw_kvm_notify_with_data to virtio_ccw
> >  v3: support feature in virtio_ccw, remove VM_NOTIFY, use avail_idx_shadow,
> >     remove byte swap, rename to vring_notification_data
> >  v2: reject the feature in virtio_ccw, replace __le32 with u32
> >
> >  Tested with disabled VIRTIO_F_NOTIFICATION_DATA on qemu-system-s390x
> >  (virtio-blk-ccw), qemu-system-riscv64 (virtio-blk-device,
> >  virtio-rng-device), qemu-system-x86_64 (virtio-blk-pci, virtio-net-pci)
> >  to make sure nothing is broken.
> >  Tested with enabled VIRTIO_F_NOTIFICATION_DATA on 64-bit RISC-V Linux
> >  and my hardware implementation of virtio-rng.
> >
> >  drivers/s390/virtio/virtio_ccw.c   | 19 ++++++++++++++++---
> >  drivers/virtio/virtio_mmio.c       | 14 +++++++++++++-
> >  drivers/virtio/virtio_pci_modern.c | 13 ++++++++++++-
> >  drivers/virtio/virtio_ring.c       | 17 +++++++++++++++++
> >  include/linux/virtio_ring.h        |  2 ++
> >  include/uapi/linux/virtio_config.h |  6 ++++++
> >  6 files changed, 66 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> > index 954fc31b4bc7..3619676effb8 100644
> > --- a/drivers/s390/virtio/virtio_ccw.c
> > +++ b/drivers/s390/virtio/virtio_ccw.c
> > @@ -391,7 +391,7 @@ static void virtio_ccw_drop_indicator(struct virtio_ccw_device *vcdev,
> >  	ccw_device_dma_free(vcdev->cdev, thinint_area, sizeof(*thinint_area));
> >  }
> >
> > -static bool virtio_ccw_kvm_notify(struct virtqueue *vq)
> > +static inline bool virtio_ccw_do_kvm_notify(struct virtqueue *vq, u32 data)
> >  {
> >  	struct virtio_ccw_vq_info *info = vq->priv;
> >  	struct virtio_ccw_device *vcdev;
> > @@ -402,12 +402,22 @@ static bool virtio_ccw_kvm_notify(struct virtqueue *vq)
> >  	BUILD_BUG_ON(sizeof(struct subchannel_id) != sizeof(unsigned int));
> >  	info->cookie = kvm_hypercall3(KVM_S390_VIRTIO_CCW_NOTIFY,
> >  				      *((unsigned int *)&schid),
> > -				      vq->index, info->cookie);
> > +				      data, info->cookie);
> >  	if (info->cookie < 0)
> >  		return false;
> >  	return true;
> >  }
> >
> > +static bool virtio_ccw_kvm_notify(struct virtqueue *vq)
> > +{
> > +	return virtio_ccw_do_kvm_notify(vq, vq->index);
> > +}
> > +
> > +static bool virtio_ccw_kvm_notify_with_data(struct virtqueue *vq)
> > +{
> > +	return virtio_ccw_do_kvm_notify(vq, vring_notification_data(vq));
> > +}
> > +
> >  static int virtio_ccw_read_vq_conf(struct virtio_ccw_device *vcdev,
> >  				   struct ccw1 *ccw, int index)
> >  {
> > @@ -501,6 +511,9 @@ static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
> >  	u64 queue;
> >  	unsigned long flags;
> >  	bool may_reduce;
> > +	bool (*notify)(struct virtqueue *vq) = __virtio_test_bit(vdev,
> > +		VIRTIO_F_NOTIFICATION_DATA) ?
> > +		virtio_ccw_kvm_notify_with_data : virtio_ccw_kvm_notify;
> >
> >  	/* Allocate queue. */
> >  	info = kzalloc(sizeof(struct virtio_ccw_vq_info), GFP_KERNEL);
> > @@ -524,7 +537,7 @@ static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
> >  	may_reduce = vcdev->revision > 0;
> >  	vq = vring_create_virtqueue(i, info->num, KVM_VIRTIO_CCW_RING_ALIGN,
> >  				    vdev, true, may_reduce, ctx,
> > -				    virtio_ccw_kvm_notify, callback, name);
> > +				    notify, callback, name);
> >
> >  	if (!vq) {
> >  		/* For now, we fail if we can't get the requested size. */
> > diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> > index 3ff746e3f24a..7c16e622c33d 100644
> > --- a/drivers/virtio/virtio_mmio.c
> > +++ b/drivers/virtio/virtio_mmio.cv
> > @@ -285,6 +285,16 @@ static bool vm_notify(struct virtqueue *vq)
> >  	return true;
> >  }
> >
> > +static bool vm_notify_with_data(struct virtqueue *vq)
> > +{
> > +	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vq->vdev);
> > +	u32 data = vring_notification_data(vq);
> > +
> > +	writel(data, vm_dev->base + VIRTIO_MMIO_QUEUE_NOTIFY);
> > +
> > +	return true;
> > +}
> > +
> >  /* Notify all virtqueues on an interrupt. */
> >  static irqreturn_t vm_interrupt(int irq, void *opaque)
> >  {
> > @@ -368,6 +378,8 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
> >  	unsigned long flags;
> >  	unsigned int num;
> >  	int err;
> > +	bool (*notify)(struct virtqueue *vq) = __virtio_test_bit(vdev,
> > +		VIRTIO_F_NOTIFICATION_DATA) ? vm_notify_with_data : vm_notify;
> 
> 
> Can we optimize this line?
> 
> Thanks.

why bother? it's setup time ..

> >
> >  	if (!name)
> >  		return NULL;
> > @@ -397,7 +409,7 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
> >
> >  	/* Create the vring */
> >  	vq = vring_create_virtqueue(index, num, VIRTIO_MMIO_VRING_ALIGN, vdev,
> > -				 true, true, ctx, vm_notify, callback, name);
> > +				 true, true, ctx, notify, callback, name);
> >  	if (!vq) {
> >  		err = -ENOMEM;
> >  		goto error_new_virtqueue;
> > diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
> > index 9e496e288cfa..9cc56f463dba 100644
> > --- a/drivers/virtio/virtio_pci_modern.c
> > +++ b/drivers/virtio/virtio_pci_modern.c
> > @@ -288,6 +288,15 @@ static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
> >  	return vp_modern_config_vector(&vp_dev->mdev, vector);
> >  }
> >
> > +static bool vp_notify_with_data(struct virtqueue *vq)
> > +{
> > +	u32 data = vring_notification_data(vq);
> > +
> > +	iowrite32(data, (void __iomem *)vq->priv);
> > +
> > +	return true;
> > +}
> > +
> >  static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
> >  				  struct virtio_pci_vq_info *info,
> >  				  unsigned int index,
> > @@ -301,6 +310,8 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
> >  	struct virtqueue *vq;
> >  	u16 num;
> >  	int err;
> > +	bool (*notify)(struct virtqueue *vq) = __virtio_test_bit(&vp_dev->vdev,
> > +		VIRTIO_F_NOTIFICATION_DATA) ? vp_notify_with_data : vp_notify;
> >
> >  	if (index >= vp_modern_get_num_queues(mdev))
> >  		return ERR_PTR(-EINVAL);
> > @@ -321,7 +332,7 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
> >  	vq = vring_create_virtqueue(index, num,
> >  				    SMP_CACHE_BYTES, &vp_dev->vdev,
> >  				    true, true, ctx,
> > -				    vp_notify, callback, name);
> > +				    notify, callback, name);
> >  	if (!vq)
> >  		return ERR_PTR(-ENOMEM);
> >
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index 4c3bb0ddeb9b..837875cc3190 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -2752,6 +2752,21 @@ void vring_del_virtqueue(struct virtqueue *_vq)
> >  }
> >  EXPORT_SYMBOL_GPL(vring_del_virtqueue);
> >
> > +u32 vring_notification_data(struct virtqueue *_vq)
> > +{
> > +	struct vring_virtqueue *vq = to_vvq(_vq);
> > +	u16 next;
> > +
> > +	if (vq->packed_ring)
> > +		next = (vq->packed.next_avail_idx & ~(1 << 15)) |
> > +			vq->packed.avail_wrap_counter << 15;
> > +	else
> > +		next = vq->split.avail_idx_shadow;
> > +
> > +	return next << 16 | _vq->index;
> > +}
> > +EXPORT_SYMBOL_GPL(vring_notification_data);
> > +
> >  /* Manipulates transport-specific feature bits. */
> >  void vring_transport_features(struct virtio_device *vdev)
> >  {
> > @@ -2771,6 +2786,8 @@ void vring_transport_features(struct virtio_device *vdev)
> >  			break;
> >  		case VIRTIO_F_ORDER_PLATFORM:
> >  			break;
> > +		case VIRTIO_F_NOTIFICATION_DATA:
> > +			break;
> >  		default:
> >  			/* We don't understand this bit. */
> >  			__virtio_clear_bit(vdev, i);
> > diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
> > index 8b95b69ef694..2550c9170f4f 100644
> > --- a/include/linux/virtio_ring.h
> > +++ b/include/linux/virtio_ring.h
> > @@ -117,4 +117,6 @@ void vring_del_virtqueue(struct virtqueue *vq);
> >  void vring_transport_features(struct virtio_device *vdev);
> >
> >  irqreturn_t vring_interrupt(int irq, void *_vq);
> > +
> > +u32 vring_notification_data(struct virtqueue *_vq);
> >  #endif /* _LINUX_VIRTIO_RING_H */
> > diff --git a/include/uapi/linux/virtio_config.h b/include/uapi/linux/virtio_config.h
> > index 3c05162bc988..2c712c654165 100644
> > --- a/include/uapi/linux/virtio_config.h
> > +++ b/include/uapi/linux/virtio_config.h
> > @@ -99,6 +99,12 @@
> >   */
> >  #define VIRTIO_F_SR_IOV			37
> >
> > +/*
> > + * This feature indicates that the driver passes extra data (besides
> > + * identifying the virtqueue) in its device notifications.
> > + */
> > +#define VIRTIO_F_NOTIFICATION_DATA	38
> > +
> >  /*
> >   * This feature indicates that the driver can reset a queue individually.
> >   */
> > --
> > 2.35.1
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
