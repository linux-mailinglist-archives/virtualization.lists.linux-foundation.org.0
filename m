Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A58AC6C34E9
	for <lists.virtualization@lfdr.de>; Tue, 21 Mar 2023 15:59:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB495610F7;
	Tue, 21 Mar 2023 14:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB495610F7
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DF4GvHK8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1Kb9Gwdz8bb; Tue, 21 Mar 2023 14:59:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7408A610B4;
	Tue, 21 Mar 2023 14:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7408A610B4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 954C8C007E;
	Tue, 21 Mar 2023 14:59:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61154C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 14:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40B10408B3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 14:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40B10408B3
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=DF4GvHK8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nIa4C_XkJ63A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 14:59:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 875B5408B0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 875B5408B0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679410753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qOIIbtRi2YdRi9h/kU7CZ7/kNGD+yuNaR6Y05A5vIGE=;
 b=DF4GvHK80ONjYpI+qzNO1nQg47m6hZMJRIOUt5KerH9lrRq2Gro0dcQyNa0W59EeDO+haP
 hgDLYY8RVF56sBlu1VI6pW0GSzpTzsinU9wIknKMIGZJSD9OBkF76yuJ+uVukf+W+kdVRs
 pG7PxFLlS0n4vWXLoEQnEnUbBLo7URY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-HVDIsSLjNDez1JOvl18iAg-1; Tue, 21 Mar 2023 10:59:10 -0400
X-MC-Unique: HVDIsSLjNDez1JOvl18iAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63A5E2806042;
 Tue, 21 Mar 2023 14:59:09 +0000 (UTC)
Received: from localhost (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15ACC40C6E67;
 Tue, 21 Mar 2023 14:59:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Viktor Prutyanov <viktor@daynix.com>, mst@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH v3] virtio: add VIRTIO_F_NOTIFICATION_DATA feature support
In-Reply-To: <20230321134410.2097163-1-viktor@daynix.com>
Organization: Red Hat GmbH
References: <20230321134410.2097163-1-viktor@daynix.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 21 Mar 2023 15:59:07 +0100
Message-ID: <87h6uem9qc.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Cc: linux-s390@vger.kernel.org, farman@linux.ibm.com, kvm@vger.kernel.org,
 viktor@daynix.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com, yan@daynix.com
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

On Tue, Mar 21 2023, Viktor Prutyanov <viktor@daynix.com> wrote:

> According to VirtIO spec v1.2, VIRTIO_F_NOTIFICATION_DATA feature
> indicates that the driver passes extra data along with the queue
> notifications.
>
> In a split queue case, the extra data is 16-bit available index. In a
> packed queue case, the extra data is 1-bit wrap counter and 15-bit
> available index.
>
> Add support for this feature for MMIO, PCI and channel I/O transports.
>
> Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> ---
>  v3: support feature in virtio_ccw, remove VM_NOTIFY, use avail_idx_shadow,
>     remove byte swap, rename to vring_notification_data
>  v2: reject the feature in virtio_ccw, replace __le32 with u32
>
>  drivers/s390/virtio/virtio_ccw.c   |  4 +++-
>  drivers/virtio/virtio_mmio.c       | 14 +++++++++++++-
>  drivers/virtio/virtio_pci_common.c | 10 ++++++++++
>  drivers/virtio/virtio_pci_common.h |  4 ++++
>  drivers/virtio/virtio_pci_legacy.c |  2 +-
>  drivers/virtio/virtio_pci_modern.c |  2 +-
>  drivers/virtio/virtio_ring.c       | 17 +++++++++++++++++
>  include/linux/virtio_ring.h        |  2 ++
>  include/uapi/linux/virtio_config.h |  6 ++++++
>  9 files changed, 57 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> index 954fc31b4bc7..c33172c5b8d5 100644
> --- a/drivers/s390/virtio/virtio_ccw.c
> +++ b/drivers/s390/virtio/virtio_ccw.c
> @@ -396,13 +396,15 @@ static bool virtio_ccw_kvm_notify(struct virtqueue *vq)
>  	struct virtio_ccw_vq_info *info = vq->priv;
>  	struct virtio_ccw_device *vcdev;
>  	struct subchannel_id schid;
> +	u32 data = __virtio_test_bit(vq->vdev, VIRTIO_F_NOTIFICATION_DATA) ?
> +			vring_notification_data(vq) : vq->index;
>  
>  	vcdev = to_vc_device(info->vq->vdev);
>  	ccw_device_get_schid(vcdev->cdev, &schid);
>  	BUILD_BUG_ON(sizeof(struct subchannel_id) != sizeof(unsigned int));
>  	info->cookie = kvm_hypercall3(KVM_S390_VIRTIO_CCW_NOTIFY,
>  				      *((unsigned int *)&schid),
> -				      vq->index, info->cookie);
> +				      data, info->cookie);
>  	if (info->cookie < 0)
>  		return false;
>  	return true;
> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> index 3ff746e3f24a..7c16e622c33d 100644
> --- a/drivers/virtio/virtio_mmio.c
> +++ b/drivers/virtio/virtio_mmio.c
> @@ -285,6 +285,16 @@ static bool vm_notify(struct virtqueue *vq)
>  	return true;
>  }
>  
> +static bool vm_notify_with_data(struct virtqueue *vq)
> +{
> +	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vq->vdev);
> +	u32 data = vring_notification_data(vq);
> +
> +	writel(data, vm_dev->base + VIRTIO_MMIO_QUEUE_NOTIFY);

Can't you simply use the same method as for ccw, i.e. use one callback
function that simply writes one value or the other?

> +
> +	return true;
> +}
> +
>  /* Notify all virtqueues on an interrupt. */
>  static irqreturn_t vm_interrupt(int irq, void *opaque)
>  {
> @@ -368,6 +378,8 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
>  	unsigned long flags;
>  	unsigned int num;
>  	int err;
> +	bool (*notify)(struct virtqueue *vq) = __virtio_test_bit(vdev,
> +		VIRTIO_F_NOTIFICATION_DATA) ? vm_notify_with_data : vm_notify;
>  
>  	if (!name)
>  		return NULL;
> @@ -397,7 +409,7 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
>  
>  	/* Create the vring */
>  	vq = vring_create_virtqueue(index, num, VIRTIO_MMIO_VRING_ALIGN, vdev,
> -				 true, true, ctx, vm_notify, callback, name);
> +				 true, true, ctx, notify, callback, name);
>  	if (!vq) {
>  		err = -ENOMEM;
>  		goto error_new_virtqueue;
> diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> index a6c86f916dbd..e915c22f2384 100644
> --- a/drivers/virtio/virtio_pci_common.c
> +++ b/drivers/virtio/virtio_pci_common.c
> @@ -43,6 +43,16 @@ bool vp_notify(struct virtqueue *vq)
>  	/* we write the queue's selector into the notification register to
>  	 * signal the other end */
>  	iowrite16(vq->index, (void __iomem *)vq->priv);
> +
> +	return true;
> +}
> +
> +bool vp_notify_with_data(struct virtqueue *vq)
> +{
> +	u32 data = vring_notification_data(vq);
> +
> +	iowrite32(data, (void __iomem *)vq->priv);

Same for pci.

> +
>  	return true;
>  }
>  

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
