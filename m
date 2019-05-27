Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 177AB2B37D
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 13:50:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BC705182C;
	Mon, 27 May 2019 11:50:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EE89A1826
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 11:49:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 71D17826
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 11:49:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 93B633082231;
	Mon, 27 May 2019 11:49:52 +0000 (UTC)
Received: from gondolin (ovpn-204-109.brq.redhat.com [10.40.204.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40D7560BEC;
	Mon, 27 May 2019 11:49:46 +0000 (UTC)
Date: Mon, 27 May 2019 13:49:41 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Michael Mueller <mimu@linux.ibm.com>
Subject: Re: [PATCH v2 7/8] virtio/s390: use DMA memory for ccw I/O and
	classic notifiers
Message-ID: <20190527134941.5c7555a7.cohuck@redhat.com>
In-Reply-To: <20190523162209.9543-8-mimu@linux.ibm.com>
References: <20190523162209.9543-1-mimu@linux.ibm.com>
	<20190523162209.9543-8-mimu@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 27 May 2019 11:49:52 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>,
	Linux-S390 Mailing List <linux-s390@vger.kernel.org>,
	Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	KVM Mailing List <kvm@vger.kernel.org>,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Pierre Morel <pmorel@linux.ibm.com>, Farhan Ali <alifm@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Thu, 23 May 2019 18:22:08 +0200
Michael Mueller <mimu@linux.ibm.com> wrote:

> From: Halil Pasic <pasic@linux.ibm.com>
> 
> Before virtio-ccw could get away with not using DMA API for the pieces of
> memory it does ccw I/O with. With protected virtualization this has to
> change, since the hypervisor needs to read and sometimes also write these
> pieces of memory.
> 
> The hypervisor is supposed to poke the classic notifiers, if these are
> used, out of band with regards to ccw I/O. So these need to be allocated
> as DMA memory (which is shared memory for protected virtualization
> guests).
> 
> Let us factor out everything from struct virtio_ccw_device that needs to
> be DMA memory in a satellite that is allocated as such.
> 
> Note: The control blocks of I/O instructions do not need to be shared.
> These are marshalled by the ultravisor.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  drivers/s390/virtio/virtio_ccw.c | 177 +++++++++++++++++++++------------------
>  1 file changed, 96 insertions(+), 81 deletions(-)

(...)

> @@ -176,6 +180,22 @@ static struct virtio_ccw_device *to_vc_device(struct virtio_device *vdev)
>  	return container_of(vdev, struct virtio_ccw_device, vdev);
>  }
>  
> +static inline void *__vc_dma_alloc(struct virtio_device *vdev, size_t size)
> +{
> +	return ccw_device_dma_zalloc(to_vc_device(vdev)->cdev, size);
> +}
> +
> +static inline void __vc_dma_free(struct virtio_device *vdev, size_t size,
> +				 void *cpu_addr)
> +{
> +	return ccw_device_dma_free(to_vc_device(vdev)->cdev, cpu_addr, size);
> +}
> +
> +#define vc_dma_alloc_struct(vdev, ptr) \
> +	({ptr = __vc_dma_alloc(vdev, sizeof(*(ptr))); })
> +#define vc_dma_free_struct(vdev, ptr) \
> +	__vc_dma_free(vdev, sizeof(*(ptr)), (ptr))

I really don't like these #defines.

> +
>  static void drop_airq_indicator(struct virtqueue *vq, struct airq_info *info)
>  {
>  	unsigned long i, flags;
> @@ -336,8 +356,7 @@ static void virtio_ccw_drop_indicator(struct virtio_ccw_device *vcdev,
>  	struct airq_info *airq_info = vcdev->airq_info;
>  
>  	if (vcdev->is_thinint) {
> -		thinint_area = kzalloc(sizeof(*thinint_area),
> -				       GFP_DMA | GFP_KERNEL);
> +		vc_dma_alloc_struct(&vcdev->vdev, thinint_area);

Any reason why this takes a detour via the virtio device? The ccw
device is already referenced in vcdev, isn't it?

thinint_area = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*thinint_area));

looks much more obvious to me.


>  		if (!thinint_area)
>  			return;
>  		thinint_area->summary_indicator =

(...)

I did not spot anything obviously broken in the patch.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
