Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A64145E5F96
	for <lists.virtualization@lfdr.de>; Thu, 22 Sep 2022 12:15:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A744409A6;
	Thu, 22 Sep 2022 10:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A744409A6
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MqqUnGas
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id af5oxASyZZUG; Thu, 22 Sep 2022 10:15:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B9D4C4051D;
	Thu, 22 Sep 2022 10:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9D4C4051D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEE1CC0077;
	Thu, 22 Sep 2022 10:15:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E2B4C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Sep 2022 10:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B86183417
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Sep 2022 10:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B86183417
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=MqqUnGas
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZpzXBJtviGjb
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Sep 2022 10:15:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E30A831E3
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E30A831E3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Sep 2022 10:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663841708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x8iPf8wB/87tS9tkRsCc4xtqoP66lVcLTCBHykEn53w=;
 b=MqqUnGasGe3i/ztoqV+LUjElymRhxRO1RpqHz6Jip81K4/HCSHxxr12MrJC6eerh6WIORc
 ju0svOUYUJD/L963QMSky/kXjO6ITL9kkiLBtAB3d4RzcPVNhbumjf4M+ZTQAPR9H2WMsJ
 l0cS+4FCn4VLirnN/x4flcMKPquDd3I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-i5biWDkJMBqxYqclptbCrg-1; Thu, 22 Sep 2022 06:15:07 -0400
X-MC-Unique: i5biWDkJMBqxYqclptbCrg-1
Received: by mail-ej1-f70.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso4214482ejb.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Sep 2022 03:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=x8iPf8wB/87tS9tkRsCc4xtqoP66lVcLTCBHykEn53w=;
 b=Aq+dvSAxSnsIiPqEtvtX5ssIepQW8mQ+QKA+TfCKxsj5T0WsEZC3uEJqgCS0VngtqW
 lcxIyQEeMQ2gXReUCjzvfXq4wUKUlMV6PzQa9UwrIvvfOoSojFPJUp9XZ0d3IAteGJnU
 n6uf1HLgn8onkyme+KdH/6b2EsNe9PF1UNhgqO84u5xFwlzCOZdCoNl8js7QhdAKmCgV
 +D6Th7fNYDZfZq1qBBNIHO6Xd/7W3vqNQOEvU4fPeCV7ILPP2OPUIel8fswFj04y3jyP
 DjIBMdvFdc+S7f0sZR2Uma/hot7vcBgrMzx0H+kWK91qy3MgZB5uN8YLTSLuYZw/vOEh
 /zqg==
X-Gm-Message-State: ACrzQf1tWN+8h+y08+EAJlmx8JvfSYbvgkmOOGe3alAABItW9dqvTjx5
 3gzezK0RH4wpaZgnfSs+MkU630b6sMsU9GBVgfRPqjQUOElUZroYHl0lL0JBcW0YMtzBS17mbyf
 qhriWVqsWuti8F15osplhDfYjzENydqHAipaSpYVNDg==
X-Received: by 2002:aa7:c6c4:0:b0:44e:dfc0:224e with SMTP id
 b4-20020aa7c6c4000000b0044edfc0224emr2525683eds.115.1663841705912; 
 Thu, 22 Sep 2022 03:15:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5MP6e8IfaEkizKUdwEwPhWoin1PxYJJHUJkHWD+HBkHyqr0tTKkvBdcvbdMEvB8tgteDy7dw==
X-Received: by 2002:aa7:c6c4:0:b0:44e:dfc0:224e with SMTP id
 b4-20020aa7c6c4000000b0044edfc0224emr2525649eds.115.1663841705664; 
 Thu, 22 Sep 2022 03:15:05 -0700 (PDT)
Received: from redhat.com ([2.55.16.18]) by smtp.gmail.com with ESMTPSA id
 d20-20020a1709067f1400b0073d7b876621sm2353763ejr.205.2022.09.22.03.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 03:15:05 -0700 (PDT)
Date: Thu, 22 Sep 2022 06:14:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v5 2/2] virtio-net: use mtu size as buffer length for big
 packets
Message-ID: <20220922060753-mutt-send-email-mst@kernel.org>
References: <20220901021038.84751-1-gavinl@nvidia.com>
 <20220901021038.84751-3-gavinl@nvidia.com>
 <20220922052734-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481374E6A14EFC39533F9A8DC4E9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481374E6A14EFC39533F9A8DC4E9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "alexander.h.duyck@intel.com" <alexander.h.duyck@intel.com>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "sridhar.samudrala@intel.com" <sridhar.samudrala@intel.com>,
 "jesse.brandeburg@intel.com" <jesse.brandeburg@intel.com>,
 Gavi Teitz <gavi@nvidia.com>, "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "stephen@networkplumber.org" <stephen@networkplumber.org>,
 "loseweigh@gmail.com" <loseweigh@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>, Gavin Li <gavinl@nvidia.com>
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

On Thu, Sep 22, 2022 at 10:04:53AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, September 22, 2022 5:35 AM
> > 
> > On Thu, Sep 01, 2022 at 05:10:38AM +0300, Gavin Li wrote:
> > > Currently add_recvbuf_big() allocates MAX_SKB_FRAGS segments for big
> > > packets even when GUEST_* offloads are not present on the device.
> > > However, if guest GSO is not supported, it would be sufficient to
> > > allocate segments to cover just up the MTU size and no further.
> > > Allocating the maximum amount of segments results in a large waste of
> > > buffer space in the queue, which limits the number of packets that can
> > > be buffered and can result in reduced performance.
> > >
> > > Therefore, if guest GSO is not supported, use the MTU to calculate the
> > > optimal amount of segments required.
> > >
> > > When guest offload is enabled at runtime, RQ already has packets of
> > > bytes less than 64K. So when packet of 64KB arrives, all the packets
> > > of such size will be dropped. and RQ is now not usable.
> > >
> > > So this means that during set_guest_offloads() phase, RQs have to be
> > > destroyed and recreated, which requires almost driver reload.
> > >
> > > If VIRTIO_NET_F_CTRL_GUEST_OFFLOADS has been negotiated, then it
> > > should always treat them as GSO enabled.
> > >
> > > Accordingly, for now the assumption is that if guest GSO has been
> > > negotiated then it has been enabled, even if it's actually been
> > > disabled at runtime through VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> > >
> > > Below is the iperf TCP test results over a Mellanox NIC, using vDPA
> > > for
> > > 1 VQ, queue size 1024, before and after the change, with the iperf
> > > server running over the virtio-net interface.
> > >
> > > MTU(Bytes)/Bandwidth (Gbit/s)
> > >              Before   After
> > >   1500        22.5     22.4
> > >   9000        12.8     25.9
> > >
> > > Signed-off-by: Gavin Li <gavinl@nvidia.com>
> > > Reviewed-by: Gavi Teitz <gavi@nvidia.com>
> > > Reviewed-by: Parav Pandit <parav@nvidia.com>
> > > Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > Reviewed-by: Si-Wei Liu <si-wei.liu@oracle.com>
> > 
> > OK I think the logic is correct, it's just a bit harder to read than necessary.
> > Small improvement suggestions:
> > 
> > 
> > > ---
> > > changelog:
> > > v4->v5
> > > - Addressed comments from Michael S. Tsirkin
> > > - Improve commit message
> > > v3->v4
> > > - Addressed comments from Si-Wei
> > > - Rename big_packets_sg_num with big_packets_num_skbfrags
> > > v2->v3
> > > - Addressed comments from Si-Wei
> > > - Simplify the condition check to enable the optimization
> > > v1->v2
> > > - Addressed comments from Jason, Michael, Si-Wei.
> > > - Remove the flag of guest GSO support, set sg_num for big packets and
> > >   use it directly
> > > - Recalculate sg_num for big packets in virtnet_set_guest_offloads
> > > - Replace the round up algorithm with DIV_ROUND_UP
> > > ---
> > >  drivers/net/virtio_net.c | 37 ++++++++++++++++++++++++-------------
> > >  1 file changed, 24 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c index
> > > f831a0290998..dbffd5f56fb8 100644
> > > --- a/drivers/net/virtio_net.c
> > > +++ b/drivers/net/virtio_net.c
> > > @@ -225,6 +225,9 @@ struct virtnet_info {
> > >  	/* I like... big packets and I cannot lie! */
> > >  	bool big_packets;
> > >
> > > +	/* number of sg entries allocated for big packets */
> > > +	unsigned int big_packets_num_skbfrags;
> > > +
> > >  	/* Host will merge rx buffers for big packets (shake it! shake it!) */
> > >  	bool mergeable_rx_bufs;
> > >
> > 
> > big_packets_num_skbfrags -> big_packet_num_skbfrags
> > 
> > > @@ -1331,10 +1334,10 @@ static int add_recvbuf_big(struct virtnet_info
> > *vi, struct receive_queue *rq,
> > >  	char *p;
> > >  	int i, err, offset;
> > >
> > > -	sg_init_table(rq->sg, MAX_SKB_FRAGS + 2);
> > > +	sg_init_table(rq->sg, vi->big_packets_num_skbfrags + 2);
> > >
> > > -	/* page in rq->sg[MAX_SKB_FRAGS + 1] is list tail */
> > > -	for (i = MAX_SKB_FRAGS + 1; i > 1; --i) {
> > > +	/* page in rq->sg[vi->big_packets_num_skbfrags + 1] is list tail */
> > > +	for (i = vi->big_packets_num_skbfrags + 1; i > 1; --i) {
> > >  		first = get_a_page(rq, gfp);
> > >  		if (!first) {
> > >  			if (list)
> > > @@ -1365,7 +1368,7 @@ static int add_recvbuf_big(struct virtnet_info
> > > *vi, struct receive_queue *rq,
> > >
> > >  	/* chain first in list head */
> > >  	first->private = (unsigned long)list;
> > > -	err = virtqueue_add_inbuf(rq->vq, rq->sg, MAX_SKB_FRAGS + 2,
> > > +	err = virtqueue_add_inbuf(rq->vq, rq->sg,
> > > +vi->big_packets_num_skbfrags + 2,
> > >  				  first, gfp);
> > >  	if (err < 0)
> > >  		give_pages(rq, first);
> > > @@ -3690,13 +3693,27 @@ static bool virtnet_check_guest_gso(const
> > struct virtnet_info *vi)
> > >  		virtio_has_feature(vi->vdev, VIRTIO_NET_F_GUEST_UFO);  }
> > >
> > > +static void virtnet_set_big_packets_fields(struct virtnet_info *vi,
> > > +const int mtu) {
> > > +	bool guest_gso = virtnet_check_guest_gso(vi);
> > > +
> > > +	/* If device can receive ANY guest GSO packets, regardless of mtu,
> > > +	 * allocate packets of maximum size, otherwise limit it to only
> > > +	 * mtu size worth only.
> > > +	 */
> > > +	if (mtu > ETH_DATA_LEN || guest_gso) {
> > > +		vi->big_packets = true;
> > > +		vi->big_packets_num_skbfrags = guest_gso ?
> > MAX_SKB_FRAGS : DIV_ROUND_UP(mtu, PAGE_SIZE);
> > > +	}
> > > +}
> > > +
> > >  static int virtnet_probe(struct virtio_device *vdev)  {
> > >  	int i, err = -ENOMEM;
> > >  	struct net_device *dev;
> > >  	struct virtnet_info *vi;
> > >  	u16 max_queue_pairs;
> > > -	int mtu;
> > > +	int mtu = 0;
> > >
> > 
> > I think it's better to drop this and instead just put the code
> > where we already know the config. So:
> > 
> > >  	/* Find if host supports multiqueue/rss virtio_net device */
> > >  	max_queue_pairs = 1;
> > > @@ -3784,10 +3801,6 @@ static int virtnet_probe(struct virtio_device
> > *vdev)
> > >  	INIT_WORK(&vi->config_work, virtnet_config_changed_work);
> > >  	spin_lock_init(&vi->refill_lock);
> > >
> > > -	/* If we can receive ANY GSO packets, we must allocate large ones.
> > */
> > > -	if (virtnet_check_guest_gso(vi))
> > > -		vi->big_packets = true;
> > > -
> > >  	if (virtio_has_feature(vdev, VIRTIO_NET_F_MRG_RXBUF))
> > >  		vi->mergeable_rx_bufs = true;
> > >
> > > @@ -3853,12 +3866,10 @@ static int virtnet_probe(struct virtio_device
> > *vdev)
> > >
> > >  		dev->mtu = mtu;
> > >  		dev->max_mtu = mtu;
> > > -
> > > -		/* TODO: size buffers correctly in this case. */
> > > -		if (dev->mtu > ETH_DATA_LEN)
> > > -			vi->big_packets = true;
> > 
> >     /* Size buffers to fit mtu. */
> >     if (mtu > ETH_DATA_LEN) {
> >                     vi->big_packets = true;
> >                     vi->big_packets_num_skbfrags = DIV_ROUND_UP(mtu,
> > PAGE_SIZE);
> >     }
> > 
> How doing things twice is better i.e. when mtu is > ETH_DATA_LEN and gso is offered?
> It calculates big_packets variable twice.
> 
> It also easier to read the code at single place where big_packets decision is taken.

I guess it depends on what you want to keep in one place.
I just wanted to reduce the testing burden on the submitter.
What I proposed makes the functional change minimal.

It's nitpicking to be frank. v6 arrived while I was traveling
and I didn't notice it.  I see Jason acked that so I guess I will
just apply as is. Do you ack v6 too?


> > >  	}
> > >
> > > +	virtnet_set_big_packets_fields(vi, mtu);
> > > +
> > 
> > and here:
> >         /* If device can receive guest GSO packets, allocate buffers for
> >          * packets of maximum size, regardless of mtu.
> > 	 */
> > 
> > 	if (virtnet_check_guest_gso(vi)) {
> > 		vi->big_packets = true;
> > 		vi->big_packets_num_skbfrags = MAX_SKB_FRAGS;
> >         }
> > 
> > 
> > >  	if (vi->any_header_sg)
> > >  		dev->needed_headroom = vi->hdr_len;
> > >
> > > --
> > > 2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
