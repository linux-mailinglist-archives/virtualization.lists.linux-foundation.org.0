Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2FB4D48BA
	for <lists.virtualization@lfdr.de>; Thu, 10 Mar 2022 15:14:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CECA60E48;
	Thu, 10 Mar 2022 14:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kobpmjN6sk5i; Thu, 10 Mar 2022 14:14:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 173F760D6F;
	Thu, 10 Mar 2022 14:14:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97439C0073;
	Thu, 10 Mar 2022 14:14:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76500C000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Mar 2022 14:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E5D740195
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Mar 2022 14:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEegeGXTHNHv
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Mar 2022 14:14:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBBC64014B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Mar 2022 14:14:27 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=33; SR=0; TI=SMTPD_---0V6onflR_1646921659; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V6onflR_1646921659) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 10 Mar 2022 22:14:20 +0800
Message-ID: <1646921388.7015996-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v7 09/26] virtio_ring: split: implement
 virtqueue_reset_vring_split()
Date: Thu, 10 Mar 2022 22:09:48 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220308123518.33800-1-xuanzhuo@linux.alibaba.com>
 <20220308123518.33800-10-xuanzhuo@linux.alibaba.com>
 <20220310015418-mutt-send-email-mst@kernel.org>
 <1646896623.3794115-2-xuanzhuo@linux.alibaba.com>
 <20220310025930-mutt-send-email-mst@kernel.org>
 <1646900056.7775025-1-xuanzhuo@linux.alibaba.com>
 <20220310071335-mutt-send-email-mst@kernel.org>
 <1646915610.3936472-1-xuanzhuo@linux.alibaba.com>
 <20220310080212-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220310080212-mutt-send-email-mst@kernel.org>
Cc: Vadim Pasternak <vadimp@nvidia.com>, linux-remoteproc@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-s390@vger.kernel.org,
 Johannes Berg <johannes.berg@intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Richard Weinberger <richard@nod.at>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 John Fastabend <john.fastabend@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 platform-driver-x86@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, kvm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, 10 Mar 2022 08:04:27 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Thu, Mar 10, 2022 at 08:33:30PM +0800, Xuan Zhuo wrote:
> > On Thu, 10 Mar 2022 07:17:09 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Thu, Mar 10, 2022 at 04:14:16PM +0800, Xuan Zhuo wrote:
> > > > On Thu, 10 Mar 2022 03:07:22 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > On Thu, Mar 10, 2022 at 03:17:03PM +0800, Xuan Zhuo wrote:
> > > > > > On Thu, 10 Mar 2022 02:00:39 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > > On Tue, Mar 08, 2022 at 08:35:01PM +0800, Xuan Zhuo wrote:
> > > > > > > > virtio ring supports reset.
> > > > > > > >
> > > > > > > > Queue reset is divided into several stages.
> > > > > > > >
> > > > > > > > 1. notify device queue reset
> > > > > > > > 2. vring release
> > > > > > > > 3. attach new vring
> > > > > > > > 4. notify device queue re-enable
> > > > > > > >
> > > > > > > > After the first step is completed, the vring reset operation can be
> > > > > > > > performed. If the newly set vring num does not change, then just reset
> > > > > > > > the vq related value.
> > > > > > > >
> > > > > > > > Otherwise, the vring will be released and the vring will be reallocated.
> > > > > > > > And the vring will be attached to the vq. If this process fails, the
> > > > > > > > function will exit, and the state of the vq will be the vring release
> > > > > > > > state. You can call this function again to reallocate the vring.
> > > > > > > >
> > > > > > > > In addition, vring_align, may_reduce_num are necessary for reallocating
> > > > > > > > vring, so they are retained when creating vq.
> > > > > > > >
> > > > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > > > ---
> > > > > > > >  drivers/virtio/virtio_ring.c | 69 ++++++++++++++++++++++++++++++++++++
> > > > > > > >  1 file changed, 69 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > > > > > index e0422c04c903..148fb1fd3d5a 100644
> > > > > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > > > > @@ -158,6 +158,12 @@ struct vring_virtqueue {
> > > > > > > >  			/* DMA address and size information */
> > > > > > > >  			dma_addr_t queue_dma_addr;
> > > > > > > >  			size_t queue_size_in_bytes;
> > > > > > > > +
> > > > > > > > +			/* The parameters for creating vrings are reserved for
> > > > > > > > +			 * creating new vrings when enabling reset queue.
> > > > > > > > +			 */
> > > > > > > > +			u32 vring_align;
> > > > > > > > +			bool may_reduce_num;
> > > > > > > >  		} split;
> > > > > > > >
> > > > > > > >  		/* Available for packed ring */
> > > > > > > > @@ -217,6 +223,12 @@ struct vring_virtqueue {
> > > > > > > >  #endif
> > > > > > > >  };
> > > > > > > >
> > > > > > > > +static void vring_free(struct virtqueue *vq);
> > > > > > > > +static void __vring_virtqueue_init_split(struct vring_virtqueue *vq,
> > > > > > > > +					 struct virtio_device *vdev);
> > > > > > > > +static int __vring_virtqueue_attach_split(struct vring_virtqueue *vq,
> > > > > > > > +					  struct virtio_device *vdev,
> > > > > > > > +					  struct vring vring);
> > > > > > > >
> > > > > > > >  /*
> > > > > > > >   * Helpers.
> > > > > > > > @@ -1012,6 +1024,8 @@ static struct virtqueue *vring_create_virtqueue_split(
> > > > > > > >  		return NULL;
> > > > > > > >  	}
> > > > > > > >
> > > > > > > > +	to_vvq(vq)->split.vring_align = vring_align;
> > > > > > > > +	to_vvq(vq)->split.may_reduce_num = may_reduce_num;
> > > > > > > >  	to_vvq(vq)->split.queue_dma_addr = vring.dma_addr;
> > > > > > > >  	to_vvq(vq)->split.queue_size_in_bytes = vring.queue_size_in_bytes;
> > > > > > > >  	to_vvq(vq)->we_own_ring = true;
> > > > > > > > @@ -1019,6 +1033,59 @@ static struct virtqueue *vring_create_virtqueue_split(
> > > > > > > >  	return vq;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static int virtqueue_reset_vring_split(struct virtqueue *_vq, u32 num)
> > > > > > > > +{
> > > > > > > > +	struct vring_virtqueue *vq = to_vvq(_vq);
> > > > > > > > +	struct virtio_device *vdev = _vq->vdev;
> > > > > > > > +	struct vring_split vring;
> > > > > > > > +	int err;
> > > > > > > > +
> > > > > > > > +	if (num > _vq->num_max)
> > > > > > > > +		return -E2BIG;
> > > > > > > > +
> > > > > > > > +	switch (vq->vq.reset) {
> > > > > > > > +	case VIRTIO_VQ_RESET_STEP_NONE:
> > > > > > > > +		return -ENOENT;
> > > > > > > > +
> > > > > > > > +	case VIRTIO_VQ_RESET_STEP_VRING_ATTACH:
> > > > > > > > +	case VIRTIO_VQ_RESET_STEP_DEVICE:
> > > > > > > > +		if (vq->split.vring.num == num || !num)
> > > > > > > > +			break;
> > > > > > > > +
> > > > > > > > +		vring_free(_vq);
> > > > > > > > +
> > > > > > > > +		fallthrough;
> > > > > > > > +
> > > > > > > > +	case VIRTIO_VQ_RESET_STEP_VRING_RELEASE:
> > > > > > > > +		if (!num)
> > > > > > > > +			num = vq->split.vring.num;
> > > > > > > > +
> > > > > > > > +		err = vring_create_vring_split(&vring, vdev,
> > > > > > > > +					       vq->split.vring_align,
> > > > > > > > +					       vq->weak_barriers,
> > > > > > > > +					       vq->split.may_reduce_num, num);
> > > > > > > > +		if (err)
> > > > > > > > +			return -ENOMEM;
> > > > > > > > +
> > > > > > > > +		err = __vring_virtqueue_attach_split(vq, vdev, vring.vring);
> > > > > > > > +		if (err) {
> > > > > > > > +			vring_free_queue(vdev, vring.queue_size_in_bytes,
> > > > > > > > +					 vring.queue,
> > > > > > > > +					 vring.dma_addr);
> > > > > > > > +			return -ENOMEM;
> > > > > > > > +		}
> > > > > > > > +
> > > > > > > > +		vq->split.queue_dma_addr = vring.dma_addr;
> > > > > > > > +		vq->split.queue_size_in_bytes = vring.queue_size_in_bytes;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	__vring_virtqueue_init_split(vq, vdev);
> > > > > > > > +	vq->we_own_ring = true;
> > > > > > > > +	vq->vq.reset = VIRTIO_VQ_RESET_STEP_VRING_ATTACH;
> > > > > > > > +
> > > > > > > > +	return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > >
> > > > > > > I kind of dislike this state machine.
> > > > > > >
> > > > > > > Hacks like special-casing num = 0 to mean "reset" are especially
> > > > > > > confusing.
> > > > > >
> > > > > > I'm removing it. I'll say in the function description that this function is
> > > > > > currently only called when vq has been reset. I'm no longer checking it based on
> > > > > > state.
> > > > > >
> > > > > > >
> > > > > > > And as Jason points out, when we want a resize then yes this currently
> > > > > > > implies reset but that is an implementation detail.
> > > > > > >
> > > > > > > There should be a way to just make these cases separate functions
> > > > > > > and then use them to compose consistent external APIs.
> > > > > >
> > > > > > Yes, virtqueue_resize_split() is fine for ethtool -G.
> > > > > >
> > > > > > But in the case of AF_XDP, just execute reset to free the buffer. The name
> > > > > > virtqueue_reset_vring_split() I think can cover both cases. Or we use two apis
> > > > > > to handle both scenarios?
> > > > > >
> > > > > > Or can anyone think of a better name. ^_^
> > > > > >
> > > > > > Thanks.
> > > > >
> > > > >
> > > > > I'd say resize should be called resize and reset should be called reset.
> > > >
> > > >
> > > > OK, I'll change it to resize here.
> > > >
> > > > But I want to know that when I implement virtio-net to support AF_XDP, its
> > > > requirement is to release all submitted buffers. Then should I add a new api
> > > > such as virtqueue_reset_vring()?
> > >
> > > Sounds like a reasonable name.
> > >
> > > > >
> > > > > The big issue is a sane API for resize. Ideally it would resubmit
> > > > > buffers which did not get used. Question is what to do
> > > > > about buffers which don't fit (if ring has been downsized)?
> > > > > Maybe a callback that will handle them?
> > > > > And then what? Queue them up and readd later? Drop?
> > > > > If we drop we should drop from the head not the tail ...
> > > >
> > > > It's a good idea, let's implement it later.
> > > >
> > > > Thanks.
> > >
> > > Well ... not sure how you are going to support resize
> > > if you don't know what to do with buffers that were
> > > in the ring.
> >
> > The current solution is to call virtqueue_detach_unused_buf() to release buffers
> > before resize ring.
> >
> > Thanks.
>
> This requires basically a richer api:
> - stop
> - detach
> - resize
> - start

Yes, that's how it is currently implemented.

>
> with a callback you would just have a resize, and the fact
> it resets internally becomes an implementation detail.


I think, I understand what you mean, we encapsulate the following code into a
function as an external interface.

int virtqueue_resize(vq, callback)
{
	err = virtqueue_reset(sq->vq);
	if (err) {
		netif_start_subqueue(vi->dev, qindex);
		goto err;
	}

	/* detach */
	while ((buf = virtqueue_detach_unused_buf(sq->vq)) != NULL) {
		callback(vq, buf);
	}

	err = virtqueue_resize(sq->vq, ring_num);
	if (err)
		goto err;

	err = virtqueue_enable_resetq(sq->vq);
	if (err)
		goto err;
}

Thanks.

>
> --
> MST
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
