Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBE6562BEA
	for <lists.virtualization@lfdr.de>; Fri,  1 Jul 2022 08:43:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6379607E3;
	Fri,  1 Jul 2022 06:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6379607E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ABb5VCvEGDPk; Fri,  1 Jul 2022 06:43:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 57AD360FBE;
	Fri,  1 Jul 2022 06:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57AD360FBE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A045AC007C;
	Fri,  1 Jul 2022 06:43:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A8CAC002D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 06:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11B5E83F20
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 06:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11B5E83F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4PhAvq8UdfA6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 06:43:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B62483F12
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B62483F12
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 06:43:36 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R801e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=36; SR=0;
 TI=SMTPD_---0VHzJr.6_1656657809; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VHzJr.6_1656657809) by smtp.aliyun-inc.com;
 Fri, 01 Jul 2022 14:43:30 +0800
Message-ID: <1656657725.7418885-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v11 02/40] virtio: struct virtio_config_ops add callbacks
 for queue_reset
Date: Fri, 1 Jul 2022 14:42:05 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220629065656.54420-1-xuanzhuo@linux.alibaba.com>
 <20220629065656.54420-3-xuanzhuo@linux.alibaba.com>
 <20220701022728-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220701022728-mutt-send-email-mst@kernel.org>
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

On Fri, 1 Jul 2022 02:28:46 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Wed, Jun 29, 2022 at 02:56:18PM +0800, Xuan Zhuo wrote:
> > reset can be divided into the following four steps (example):
> >  1. transport: notify the device to reset the queue
> >  2. vring:     recycle the buffer submitted
> >  3. vring:     reset/resize the vring (may re-alloc)
> >  4. transport: mmap vring to device, and enable the queue
> >
> > In order to support queue reset, add two callbacks(reset_vq,
> > enable_reset_vq) in struct virtio_config_ops to implement steps 1 and 4.
> >
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > ---
> >  include/linux/virtio_config.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> > index b47c2e7ed0ee..ded51b0d4823 100644
> > --- a/include/linux/virtio_config.h
> > +++ b/include/linux/virtio_config.h
> > @@ -78,6 +78,16 @@ struct virtio_shm_region {
> >   * @set_vq_affinity: set the affinity for a virtqueue (optional).
> >   * @get_vq_affinity: get the affinity for a virtqueue (optional).
> >   * @get_shm_region: get a shared memory region based on the index.
> > + * @reset_vq: reset a queue individually (optional).
> > + *	vq: the virtqueue
> > + *	Returns 0 on success or error status
> > + *	reset_vq will guarantee that the callbacks are disabled and synchronized.
> > + *	Except for the callback, the caller should guarantee that the vring is
> > + *	not accessed by any functions of virtqueue.
> > + * @enable_reset_vq: enable a reset queue
> > + *	vq: the virtqueue
> > + *	Returns 0 on success or error status
> > + *	If reset_vq is set, then enable_reset_vq must also be set.
> >   */
> >  typedef void vq_callback_t(struct virtqueue *);
> >  struct virtio_config_ops {
> > @@ -104,6 +114,8 @@ struct virtio_config_ops {
> >  			int index);
> >  	bool (*get_shm_region)(struct virtio_device *vdev,
> >  			       struct virtio_shm_region *region, u8 id);
> > +	int (*reset_vq)(struct virtqueue *vq);
> > +	int (*enable_reset_vq)(struct virtqueue *vq);
> >  };
>
> The names need some tweaking.
> I came up with
>  	int (*disable_vq_and_reset)(struct virtqueue *vq);
>  	int (*enable_vq_after_reset)(struct virtqueue *vq);

OK, I will use these two names in the next version.

Hope Jason likes it too.

Thanks.


>
>
> >  /* If driver didn't advertise the feature, it will never appear. */
> > --
> > 2.31.0
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
