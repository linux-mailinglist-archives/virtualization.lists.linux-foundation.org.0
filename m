Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 350E25929F4
	for <lists.virtualization@lfdr.de>; Mon, 15 Aug 2022 08:58:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4345E60E51;
	Mon, 15 Aug 2022 06:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4345E60E51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NFCt2rZvb_Lo; Mon, 15 Aug 2022 06:58:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DAF50605A0;
	Mon, 15 Aug 2022 06:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAF50605A0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05F55C0078;
	Mon, 15 Aug 2022 06:58:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C4DFC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 06:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20EF281A5C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 06:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20EF281A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUfINJFO5Sfe
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 06:58:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7628481A24
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7628481A24
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 06:58:21 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=36; SR=0;
 TI=SMTPD_---0VMEFdj9_1660546694; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VMEFdj9_1660546694) by smtp.aliyun-inc.com;
 Mon, 15 Aug 2022 14:58:15 +0800
Message-ID: <1660545303.436073-9-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v14 37/42] virtio_net: set the default max ring size by
 find_vqs()
Date: Mon, 15 Aug 2022 14:35:03 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220801063902.129329-1-xuanzhuo@linux.alibaba.com>
 <20220801063902.129329-38-xuanzhuo@linux.alibaba.com>
 <20220815015405-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220815015405-mutt-send-email-mst@kernel.org>
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

On Mon, 15 Aug 2022 02:00:16 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Mon, Aug 01, 2022 at 02:38:57PM +0800, Xuan Zhuo wrote:
> > Use virtio_find_vqs_ctx_size() to specify the maximum ring size of tx,
> > rx at the same time.
> >
> >                          | rx/tx ring size
> > -------------------------------------------
> > speed == UNKNOWN or < 10G| 1024
> > speed < 40G              | 4096
> > speed >= 40G             | 8192
> >
> > Call virtnet_update_settings() once before calling init_vqs() to update
> > speed.
> >
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Acked-by: Jason Wang <jasowang@redhat.com>
>
> I've been looking at this patchset because of the resent
> reported crashes, and I'm having second thoughts about this.
>
> Do we really want to second-guess the device supplied
> max ring size? If yes why?
>
> Could you please share some performance data that motivated this
> specific set of numbers?


The impact of this value on performance is as follows. The larger the value, the
throughput can be increased, but the delay will also increase accordingly. It is
a maximum limit for the ring size under the corresponding speed. The purpose of
this limitation is not to improve performance, but more to reduce memory usage.

These data come from many other network cards and some network optimization
experience.

For example, in the case of speed = 20G, the impact of ring size greater
than 4096 on performance has no meaning. At this time, if the device supports
8192, we limit it to 4096 through this, the real meaning is to reduce the memory
usage.


>
> Also why do we intepret UNKNOWN as "very low"?
> I'm thinking that should definitely be "don't change anything".
>

Generally speaking, for a network card with a high speed, it will return a
correct speed. But I think it is a good idea to do nothing.


> Finally if all this makes sense then shouldn't we react when
> speed changes?

This is the feedback of the network card when it is started, and theoretically
it should not change in the future.

>
> Could you try reverting this and showing performance results
> before and after please? Thanks!

I hope the above reply can help you, if there is anything else you need me to
cooperate with, I am very happy.

If you think it's ok, I can resubmit a commit with 'UNKNOW' set to unlimited. I
can submit it with the issue of #30.

Thanks.


>
> > ---
> >  drivers/net/virtio_net.c | 42 ++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 38 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > index 8a5810bcb839..40532ecbe7fc 100644
> > --- a/drivers/net/virtio_net.c
> > +++ b/drivers/net/virtio_net.c
> > @@ -3208,6 +3208,29 @@ static unsigned int mergeable_min_buf_len(struct virtnet_info *vi, struct virtqu
> >  		   (unsigned int)GOOD_PACKET_LEN);
> >  }
> >
> > +static void virtnet_config_sizes(struct virtnet_info *vi, u32 *sizes)
> > +{
> > +	u32 i, rx_size, tx_size;
> > +
> > +	if (vi->speed == SPEED_UNKNOWN || vi->speed < SPEED_10000) {
> > +		rx_size = 1024;
> > +		tx_size = 1024;
> > +
> > +	} else if (vi->speed < SPEED_40000) {
> > +		rx_size = 1024 * 4;
> > +		tx_size = 1024 * 4;
> > +
> > +	} else {
> > +		rx_size = 1024 * 8;
> > +		tx_size = 1024 * 8;
> > +	}
> > +
> > +	for (i = 0; i < vi->max_queue_pairs; i++) {
> > +		sizes[rxq2vq(i)] = rx_size;
> > +		sizes[txq2vq(i)] = tx_size;
> > +	}
> > +}
> > +
> >  static int virtnet_find_vqs(struct virtnet_info *vi)
> >  {
> >  	vq_callback_t **callbacks;
> > @@ -3215,6 +3238,7 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
> >  	int ret = -ENOMEM;
> >  	int i, total_vqs;
> >  	const char **names;
> > +	u32 *sizes;
> >  	bool *ctx;
> >
> >  	/* We expect 1 RX virtqueue followed by 1 TX virtqueue, followed by
> > @@ -3242,10 +3266,15 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
> >  		ctx = NULL;
> >  	}
> >
> > +	sizes = kmalloc_array(total_vqs, sizeof(*sizes), GFP_KERNEL);
> > +	if (!sizes)
> > +		goto err_sizes;
> > +
> >  	/* Parameters for control virtqueue, if any */
> >  	if (vi->has_cvq) {
> >  		callbacks[total_vqs - 1] = NULL;
> >  		names[total_vqs - 1] = "control";
> > +		sizes[total_vqs - 1] = 64;
> >  	}
> >
> >  	/* Allocate/initialize parameters for send/receive virtqueues */
> > @@ -3260,8 +3289,10 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
> >  			ctx[rxq2vq(i)] = true;
> >  	}
> >
> > -	ret = virtio_find_vqs_ctx(vi->vdev, total_vqs, vqs, callbacks,
> > -				  names, ctx, NULL);
> > +	virtnet_config_sizes(vi, sizes);
> > +
> > +	ret = virtio_find_vqs_ctx_size(vi->vdev, total_vqs, vqs, callbacks,
> > +				       names, sizes, ctx, NULL);
> >  	if (ret)
> >  		goto err_find;
> >
> > @@ -3281,6 +3312,8 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
> >
> >
> >  err_find:
> > +	kfree(sizes);
> > +err_sizes:
> >  	kfree(ctx);
> >  err_ctx:
> >  	kfree(names);
> > @@ -3630,6 +3663,9 @@ static int virtnet_probe(struct virtio_device *vdev)
> >  		vi->curr_queue_pairs = num_online_cpus();
> >  	vi->max_queue_pairs = max_queue_pairs;
> >
> > +	virtnet_init_settings(dev);
> > +	virtnet_update_settings(vi);
> > +
> >  	/* Allocate/initialize the rx/tx queues, and invoke find_vqs */
> >  	err = init_vqs(vi);
> >  	if (err)
> > @@ -3642,8 +3678,6 @@ static int virtnet_probe(struct virtio_device *vdev)
> >  	netif_set_real_num_tx_queues(dev, vi->curr_queue_pairs);
> >  	netif_set_real_num_rx_queues(dev, vi->curr_queue_pairs);
> >
> > -	virtnet_init_settings(dev);
> > -
> >  	if (virtio_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
> >  		vi->failover = net_failover_create(vi->dev);
> >  		if (IS_ERR(vi->failover)) {
> > --
> > 2.31.0
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
