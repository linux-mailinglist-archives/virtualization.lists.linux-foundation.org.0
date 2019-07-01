Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 537491B312
	for <lists.virtualization@lfdr.de>; Mon, 13 May 2019 11:41:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9FB3FC64;
	Mon, 13 May 2019 09:41:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E2015B7D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 09:41:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5EF5C42D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 09:41:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64DBE81F07;
	Mon, 13 May 2019 09:41:44 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C9641001DDE;
	Mon, 13 May 2019 09:41:39 +0000 (UTC)
Date: Mon, 13 May 2019 11:41:36 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 06/10] s390/cio: add basic protected virtualization support
Message-ID: <20190513114136.783c851c.cohuck@redhat.com>
In-Reply-To: <20190426183245.37939-7-pasic@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-7-pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 13 May 2019 09:41:44 +0000 (UTC)
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

On Fri, 26 Apr 2019 20:32:41 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> As virtio-ccw devices are channel devices, we need to use the dma area
> for any communication with the hypervisor.
> 
> This patch addresses the most basic stuff (mostly what is required for
> virtio-ccw), and does take care of QDIO or any devices.

"does not take care of QDIO", surely? (Also, what does "any devices"
mean? Do you mean "every arbitrary device", perhaps?)

> 
> An interesting side effect is that virtio structures are now going to
> get allocated in 31 bit addressable storage.

Hm...

> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> ---
>  arch/s390/include/asm/ccwdev.h   |  4 +++
>  drivers/s390/cio/ccwreq.c        |  8 ++---
>  drivers/s390/cio/device.c        | 65 +++++++++++++++++++++++++++++++++-------
>  drivers/s390/cio/device_fsm.c    | 40 ++++++++++++-------------
>  drivers/s390/cio/device_id.c     | 18 +++++------
>  drivers/s390/cio/device_ops.c    | 21 +++++++++++--
>  drivers/s390/cio/device_pgid.c   | 20 ++++++-------
>  drivers/s390/cio/device_status.c | 24 +++++++--------
>  drivers/s390/cio/io_sch.h        | 21 +++++++++----
>  drivers/s390/virtio/virtio_ccw.c | 10 -------
>  10 files changed, 148 insertions(+), 83 deletions(-)

(...)

> diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> index 6d989c360f38..bb7a92316fc8 100644
> --- a/drivers/s390/virtio/virtio_ccw.c
> +++ b/drivers/s390/virtio/virtio_ccw.c
> @@ -66,7 +66,6 @@ struct virtio_ccw_device {
>  	bool device_lost;
>  	unsigned int config_ready;
>  	void *airq_info;
> -	u64 dma_mask;
>  };
>  
>  struct vq_info_block_legacy {
> @@ -1255,16 +1254,7 @@ static int virtio_ccw_online(struct ccw_device *cdev)
>  		ret = -ENOMEM;
>  		goto out_free;
>  	}
> -
>  	vcdev->vdev.dev.parent = &cdev->dev;
> -	cdev->dev.dma_mask = &vcdev->dma_mask;
> -	/* we are fine with common virtio infrastructure using 64 bit DMA */
> -	ret = dma_set_mask_and_coherent(&cdev->dev, DMA_BIT_MASK(64));
> -	if (ret) {
> -		dev_warn(&cdev->dev, "Failed to enable 64-bit DMA.\n");
> -		goto out_free;
> -	}

This means that vring structures now need to fit into 31 bits as well,
I think? Is there any way to reserve the 31 bit restriction for channel
subsystem structures and keep vring in the full 64 bit range? (Or am I
fundamentally misunderstanding something?)

> -
>  	vcdev->config_block = kzalloc(sizeof(*vcdev->config_block),
>  				   GFP_DMA | GFP_KERNEL);
>  	if (!vcdev->config_block) {

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
