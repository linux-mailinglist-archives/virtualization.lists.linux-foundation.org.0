Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF865D618
	for <lists.virtualization@lfdr.de>; Tue,  2 Jul 2019 20:26:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6EA4C1EB0;
	Tue,  2 Jul 2019 18:26:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1F1D21EA6
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 18:24:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CC8CB782
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 18:24:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7343058E5B;
	Tue,  2 Jul 2019 18:23:55 +0000 (UTC)
Received: from redhat.com (ovpn-124-209.rdu2.redhat.com [10.10.124.209])
	by smtp.corp.redhat.com (Postfix) with SMTP id C944F5D968;
	Tue,  2 Jul 2019 18:23:53 +0000 (UTC)
Date: Tue, 2 Jul 2019 14:23:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ihor Matushchak <ihor.matushchak@foobox.net>
Subject: Re: [PATCH v2] virtio-mmio: add error check for platform_get_irq
Message-ID: <20190702142329-mutt-send-email-mst@kernel.org>
References: <156207429000.5051.5975712347598980745@silver>
	<20190702144818.32648-1-ihor.matushchak@foobox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702144818.32648-1-ihor.matushchak@foobox.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 02 Jul 2019 18:23:55 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iivanov.xz@gmail.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

On Tue, Jul 02, 2019 at 05:48:18PM +0300, Ihor Matushchak wrote:
> in vm_find_vqs() irq has a wrong type
> so, in case of no IRQ resource defined,
> wrong parameter will be passed to request_irq()
> 
> Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>

Thanks!
pls don't make v2 a response to v1 in the future though.

> ---
> Changes in v2:
> Don't overwrite error code value.
> 
>  drivers/virtio/virtio_mmio.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> index f363fbeb5ab0..e09edb5c5e06 100644
> --- a/drivers/virtio/virtio_mmio.c
> +++ b/drivers/virtio/virtio_mmio.c
> @@ -463,9 +463,14 @@ static int vm_find_vqs(struct virtio_device *vdev, unsigned nvqs,
>  		       struct irq_affinity *desc)
>  {
>  	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
> -	unsigned int irq = platform_get_irq(vm_dev->pdev, 0);
> +	int irq = platform_get_irq(vm_dev->pdev, 0);
>  	int i, err, queue_idx = 0;
>  
> +	if (irq < 0) {
> +		dev_err(&vdev->dev, "Cannot get IRQ resource\n");
> +		return irq;
> +	}
> +
>  	err = request_irq(irq, vm_interrupt, IRQF_SHARED,
>  			dev_name(&vdev->dev), vm_dev);
>  	if (err)
> -- 
> 2.17.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
