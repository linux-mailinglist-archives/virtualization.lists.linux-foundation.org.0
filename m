Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A72AA12A84
	for <lists.virtualization@lfdr.de>; Fri,  3 May 2019 11:32:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D0E0E38AC;
	Fri,  3 May 2019 09:32:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 13CF438A7
	for <virtualization@lists.linux-foundation.org>;
	Fri,  3 May 2019 09:31:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B484B79
	for <virtualization@lists.linux-foundation.org>;
	Fri,  3 May 2019 09:31:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A959130F11B7;
	Fri,  3 May 2019 09:31:50 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E85D1001E87;
	Fri,  3 May 2019 09:31:44 +0000 (UTC)
Date: Fri, 3 May 2019 11:31:42 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 02/10] virtio/s390: DMA support for virtio-ccw
Message-ID: <20190503113142.7a93da81.cohuck@redhat.com>
In-Reply-To: <20190426183245.37939-3-pasic@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-3-pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 03 May 2019 09:31:50 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
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

On Fri, 26 Apr 2019 20:32:37 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> Currently virtio-ccw devices do not work if the device has
> VIRTIO_F_IOMMU_PLATFORM. In future we do want to support DMA API with
> virtio-ccw.
> 
> Let us do the plumbing, so the feature VIRTIO_F_IOMMU_PLATFORM works
> with virtio-ccw.
> 
> Let us also switch from legacy avail/used accessors to the DMA aware
> ones (even if it isn't strictly necessary), and remove the legacy
> accessors (we were the last users).
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> ---
>  drivers/s390/virtio/virtio_ccw.c | 22 +++++++++++++++-------
>  include/linux/virtio.h           | 17 -----------------
>  2 files changed, 15 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> index 2c66941ef3d0..42832a164546 100644
> --- a/drivers/s390/virtio/virtio_ccw.c
> +++ b/drivers/s390/virtio/virtio_ccw.c

(...)

> @@ -1258,6 +1257,16 @@ static int virtio_ccw_online(struct ccw_device *cdev)
>  		ret = -ENOMEM;
>  		goto out_free;
>  	}
> +
> +	vcdev->vdev.dev.parent = &cdev->dev;
> +	cdev->dev.dma_mask = &vcdev->dma_mask;
> +	/* we are fine with common virtio infrastructure using 64 bit DMA */
> +	ret = dma_set_mask_and_coherent(&cdev->dev, DMA_BIT_MASK(64));
> +	if (ret) {
> +		dev_warn(&cdev->dev, "Failed to enable 64-bit DMA.\n");

Drop the trailing period?

> +		goto out_free;
> +	}
> +
>  	vcdev->config_block = kzalloc(sizeof(*vcdev->config_block),
>  				   GFP_DMA | GFP_KERNEL);
>  	if (!vcdev->config_block) {

(...)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Also 5.2 material, I think.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
