Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D128A70446
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 17:45:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DF95BD83;
	Mon, 22 Jul 2019 15:45:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B44ACC9A;
	Mon, 22 Jul 2019 15:45:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 572C5102;
	Mon, 22 Jul 2019 15:45:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E684C034DF3;
	Mon, 22 Jul 2019 15:45:35 +0000 (UTC)
Received: from redhat.com (ovpn-124-54.rdu2.redhat.com [10.10.124.54])
	by smtp.corp.redhat.com (Postfix) with SMTP id 954295B681;
	Mon, 22 Jul 2019 15:45:28 +0000 (UTC)
Date: Mon, 22 Jul 2019 11:45:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/2] virtio/virtio_ring: Fix the dma_max_mapping_size call
Message-ID: <20190722114117-mutt-send-email-mst@kernel.org>
References: <20190722145509.1284-1-eric.auger@redhat.com>
	<20190722145509.1284-3-eric.auger@redhat.com>
	<e4a288f2-a93a-5ce4-32da-f5434302551f@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4a288f2-a93a-5ce4-32da-f5434302551f@arm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 22 Jul 2019 15:45:35 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Eric Auger <eric.auger@redhat.com>,
	iommu@lists.linux-foundation.org, eric.auger.pro@gmail.com,
	hch@lst.de, m.szyprowski@samsung.com
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

On Mon, Jul 22, 2019 at 04:36:09PM +0100, Robin Murphy wrote:
> On 22/07/2019 15:55, Eric Auger wrote:
> > Do not call dma_max_mapping_size for devices that have no DMA
> > mask set, otherwise we can hit a NULL pointer dereference.
> > 
> > This occurs when a virtio-blk-pci device is protected with
> > a virtual IOMMU.
> > 
> > Fixes: e6d6dd6c875e ("virtio: Introduce virtio_max_dma_size()")
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Suggested-by: Christoph Hellwig <hch@lst.de>
> > ---
> >   drivers/virtio/virtio_ring.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index c8be1c4f5b55..37c143971211 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -262,7 +262,7 @@ size_t virtio_max_dma_size(struct virtio_device *vdev)
> >   {
> >   	size_t max_segment_size = SIZE_MAX;
> > -	if (vring_use_dma_api(vdev))
> > +	if (vring_use_dma_api(vdev) && vdev->dev.dma_mask)
> 
> Hmm, might it make sense to roll that check up into vring_use_dma_api()
> itself? After all, if the device has no mask then it's likely that other DMA
> API ops wouldn't really work as expected either.
> 
> Robin.

Nope, Eric pointed out it's just dma_addressing_limited that is broken.

Other APIs call dma_get_mask which handles the NULL mask case fine.


> >   		max_segment_size = dma_max_mapping_size(&vdev->dev);
> >   	return max_segment_size;
> > 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
