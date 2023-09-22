Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0628A7AA6B7
	for <lists.virtualization@lfdr.de>; Fri, 22 Sep 2023 03:51:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9DF840199;
	Fri, 22 Sep 2023 01:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9DF840199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLNP1aOzJK64; Fri, 22 Sep 2023 01:51:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8775540A41;
	Fri, 22 Sep 2023 01:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8775540A41
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5576C0DD3;
	Fri, 22 Sep 2023 01:51:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DE77C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Sep 2023 01:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C969760E29
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Sep 2023 01:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C969760E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v89fR484qsYw
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Sep 2023 01:51:11 +0000 (UTC)
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61D8F607C9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Sep 2023 01:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61D8F607C9
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R521e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=36; SR=0;
 TI=SMTPD_---0Vsa-hC4_1695347462; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vsa-hC4_1695347462) by smtp.aliyun-inc.com;
 Fri, 22 Sep 2023 09:51:04 +0800
Message-ID: <1695347358.2770545-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v14 30/42] virtio_pci: introduce helper to get/set queue
 reset
Date: Fri, 22 Sep 2023 09:49:18 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220801063902.129329-1-xuanzhuo@linux.alibaba.com>
 <20220801063902.129329-31-xuanzhuo@linux.alibaba.com>
 <20230921100112-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230921100112-mutt-send-email-mst@kernel.org>
Cc: Vadim Pasternak <vadimp@nvidia.com>, linux-remoteproc@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Eric Dumazet <edumazet@google.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 Richard Weinberger <richard@nod.at>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 John Fastabend <john.fastabend@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, platform-driver-x86@vger.kernel.org,
 Eric Farman <farman@linux.ibm.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, kangjie.xu@linux.alibaba.com,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 netdev@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 Sven Schnelle <svens@linux.ibm.com>, Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, 21 Sep 2023 10:02:53 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Mon, Aug 01, 2022 at 02:38:50PM +0800, Xuan Zhuo wrote:
> > Introduce new helpers to implement queue reset and get queue reset
> > status.
> >
> >  https://github.com/oasis-tcs/virtio-spec/issues/124
> >  https://github.com/oasis-tcs/virtio-spec/issues/139
> >
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Acked-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  drivers/virtio/virtio_pci_modern_dev.c | 39 ++++++++++++++++++++++++++
> >  include/linux/virtio_pci_modern.h      |  2 ++
> >  2 files changed, 41 insertions(+)
> >
> > diff --git a/drivers/virtio/virtio_pci_modern_dev.c b/drivers/virtio/virtio_pci_modern_dev.c
> > index fa2a9445bb18..869cb46bef96 100644
> > --- a/drivers/virtio/virtio_pci_modern_dev.c
> > +++ b/drivers/virtio/virtio_pci_modern_dev.c
> > @@ -3,6 +3,7 @@
> >  #include <linux/virtio_pci_modern.h>
> >  #include <linux/module.h>
> >  #include <linux/pci.h>
> > +#include <linux/delay.h>
> >
> >  /*
> >   * vp_modern_map_capability - map a part of virtio pci capability
> > @@ -474,6 +475,44 @@ void vp_modern_set_status(struct virtio_pci_modern_device *mdev,
> >  }
> >  EXPORT_SYMBOL_GPL(vp_modern_set_status);
> >
> > +/*
> > + * vp_modern_get_queue_reset - get the queue reset status
> > + * @mdev: the modern virtio-pci device
> > + * @index: queue index
> > + */
> > +int vp_modern_get_queue_reset(struct virtio_pci_modern_device *mdev, u16 index)
> > +{
> > +	struct virtio_pci_modern_common_cfg __iomem *cfg;
> > +
> > +	cfg = (struct virtio_pci_modern_common_cfg __iomem *)mdev->common;
> > +
> > +	vp_iowrite16(index, &cfg->cfg.queue_select);
> > +	return vp_ioread16(&cfg->queue_reset);
> > +}
> > +EXPORT_SYMBOL_GPL(vp_modern_get_queue_reset);
> > +
>
> Actually, this does not validate that the config structure is big
> enough. So it can access some unrelated memory. Don't know whether
> that's exploitable e.g. for CoCo but not nice, anyway.
> Need to validate the size and disable reset if it's too small.


static int vp_modern_disable_vq_and_reset(struct virtqueue *vq)
{
	struct virtio_pci_device *vp_dev = to_vp_device(vq->vdev);
	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
	struct virtio_pci_vq_info *info;
	unsigned long flags;

->	if (!virtio_has_feature(vq->vdev, VIRTIO_F_RING_RESET))
		return -ENOENT;

	vp_modern_set_queue_reset(mdev, vq->index);


I checked VIRTIO_F_RING_RESET before call this.

Do you mean, we should put the check to this function.


Thanks.



>
>
> > +/*
> > + * vp_modern_set_queue_reset - reset the queue
> > + * @mdev: the modern virtio-pci device
> > + * @index: queue index
> > + */
> > +void vp_modern_set_queue_reset(struct virtio_pci_modern_device *mdev, u16 index)
> > +{
> > +	struct virtio_pci_modern_common_cfg __iomem *cfg;
> > +
> > +	cfg = (struct virtio_pci_modern_common_cfg __iomem *)mdev->common;
> > +
> > +	vp_iowrite16(index, &cfg->cfg.queue_select);
> > +	vp_iowrite16(1, &cfg->queue_reset);
> > +
> > +	while (vp_ioread16(&cfg->queue_reset))
> > +		msleep(1);
> > +
> > +	while (vp_ioread16(&cfg->cfg.queue_enable))
> > +		msleep(1);
> > +}
> > +EXPORT_SYMBOL_GPL(vp_modern_set_queue_reset);
> > +
> >  /*
> >   * vp_modern_queue_vector - set the MSIX vector for a specific virtqueue
> >   * @mdev: the modern virtio-pci device
> > diff --git a/include/linux/virtio_pci_modern.h b/include/linux/virtio_pci_modern.h
> > index 05123b9a606f..c4eeb79b0139 100644
> > --- a/include/linux/virtio_pci_modern.h
> > +++ b/include/linux/virtio_pci_modern.h
> > @@ -113,4 +113,6 @@ void __iomem * vp_modern_map_vq_notify(struct virtio_pci_modern_device *mdev,
> >  				       u16 index, resource_size_t *pa);
> >  int vp_modern_probe(struct virtio_pci_modern_device *mdev);
> >  void vp_modern_remove(struct virtio_pci_modern_device *mdev);
> > +int vp_modern_get_queue_reset(struct virtio_pci_modern_device *mdev, u16 index);
> > +void vp_modern_set_queue_reset(struct virtio_pci_modern_device *mdev, u16 index);
> >  #endif
> > --
> > 2.31.0
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
