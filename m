Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 448497619BD
	for <lists.virtualization@lfdr.de>; Tue, 25 Jul 2023 15:21:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D79A160B7C;
	Tue, 25 Jul 2023 13:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D79A160B7C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdjaV12I
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixDmN7plwYyJ; Tue, 25 Jul 2023 13:21:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7273160AA8;
	Tue, 25 Jul 2023 13:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7273160AA8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C295DC0DD4;
	Tue, 25 Jul 2023 13:21:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5D04C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Jul 2023 13:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8860B81F08
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Jul 2023 13:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8860B81F08
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdjaV12I
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o3mmeSIJvF1O
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Jul 2023 13:21:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99E7C819E6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Jul 2023 13:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99E7C819E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690291309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z12R1uTDDrV/Hu5AGi/EpYkmK+9JgUWLpfxhqmRlK/Y=;
 b=HdjaV12IVy87MebqsSlt7kpXQJV7RuGt2GA5RzxzyLc803OZ5iQyUemaDGjMUSVTLZAdP7
 /yPxDAIuncSqEpnIKLqzngA34csHiQ/u+LyOQ1rBODnmqLWQuNXuBn2sHPot9HOrBQIloP
 Fofu6dP0sYQRcv2uyYFhUTFM8tJgooI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-Nj2vE1V3NOSmkYXFaeuRBA-1; Tue, 25 Jul 2023 09:21:48 -0400
X-MC-Unique: Nj2vE1V3NOSmkYXFaeuRBA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-94f7a2b21fdso455732566b.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Jul 2023 06:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690291307; x=1690896107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z12R1uTDDrV/Hu5AGi/EpYkmK+9JgUWLpfxhqmRlK/Y=;
 b=MEtdbc9NWAY/5SSRlQxqh1CXLhKdC4lIVIaP3QVqICwZYs5QGvbyR1OFbm94EFFSve
 rqNIyilaDTOK9w/qGLWLW8i/E9c8xl5sXP8+zOZWKfgXI/AfkVvR6mQpRPIXJrI3iV8R
 5caQj45b0n2Hr/BxNB9TGFSKVI1uZHRpDRoWCVHP9GfwnvGjnc4KXY7dOzrQygjP90Xx
 SHVMMwoeZoIkgTKBxeB6R8qT3GeqYJGoDNDyGQk6MuybXAgZp13tkqhD4clLxaW6MYPY
 RbTJ0s/+TZLGKETavdKYMdz1HAoP8tsaomGlP3wx3/9B1wwgTVVmgZMBsqeEI7Ch0Gpi
 GZBw==
X-Gm-Message-State: ABy/qLad5eVKB2H1qgwcWZFAx9EAkZXTbzbmfOj4Ox14XAgmJgh87tVk
 hWFbdguwqD7OJM/DOCdbCo6LRmS9L3F2r3h/ggtWdIT4kVfpJQMpeV/UMkw4KhNY00Z2MpSXSVU
 LH8/Z/1Cc8oQKIuv9+ULJTBUEe+gq0KSc3UrJZ0nfcw==
X-Received: by 2002:a17:906:20d5:b0:982:b920:daad with SMTP id
 c21-20020a17090620d500b00982b920daadmr12140555ejc.71.1690291307229; 
 Tue, 25 Jul 2023 06:21:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFRn0sAnFwAWlcKhnuDzNMk9Jst95MPBPN59RRsDvR+DTd2XraCSN9ovenlgdT9ipetS0ojXA==
X-Received: by 2002:a17:906:20d5:b0:982:b920:daad with SMTP id
 c21-20020a17090620d500b00982b920daadmr12140536ejc.71.1690291306921; 
 Tue, 25 Jul 2023 06:21:46 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.178.30])
 by smtp.gmail.com with ESMTPSA id
 b27-20020a1709062b5b00b00992b71d8f19sm8121153ejg.133.2023.07.25.06.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:21:45 -0700 (PDT)
Date: Tue, 25 Jul 2023 15:21:33 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net-next v3 4/4] vsock/virtio: MSG_ZEROCOPY flag support
Message-ID: <bm7pfgfopsmsznby6inf3ukoialoudom4b4q3yn7uu5z4m7adn@hxb6a3r6n2cv>
References: <20230720214245.457298-1-AVKrasnov@sberdevices.ru>
 <20230720214245.457298-5-AVKrasnov@sberdevices.ru>
 <091c067b-43a0-da7f-265f-30c8c7e62977@sberdevices.ru>
 <20230725042544-mutt-send-email-mst@kernel.org>
 <mul7yiwl2pspfegeanqyezhmw6ol4cxsdshch7ln6w3i2b54bw@7na6bf5kfxwy>
 <20230725090514-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230725090514-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Bobby Eshleman <bobby.eshleman@bytedance.com>, kvm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, oxffffaa@gmail.com,
 Eric Dumazet <edumazet@google.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 kernel@sberdevices.ru, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Jul 25, 2023 at 09:06:02AM -0400, Michael S. Tsirkin wrote:
>On Tue, Jul 25, 2023 at 02:53:39PM +0200, Stefano Garzarella wrote:
>> On Tue, Jul 25, 2023 at 07:50:53AM -0400, Michael S. Tsirkin wrote:
>> > On Fri, Jul 21, 2023 at 08:09:03AM +0300, Arseniy Krasnov wrote:
>> > >
>> > >
>> > > On 21.07.2023 00:42, Arseniy Krasnov wrote:
>> > > > This adds handling of MSG_ZEROCOPY flag on transmission path: if this
>> > > > flag is set and zerocopy transmission is possible (enabled in socket
>> > > > options and transport allows zerocopy), then non-linear skb will be
>> > > > created and filled with the pages of user's buffer. Pages of user's
>> > > > buffer are locked in memory by 'get_user_pages()'. Second thing that
>> > > > this patch does is replace type of skb owning: instead of calling
>> > > > 'skb_set_owner_sk_safe()' it calls 'skb_set_owner_w()'. Reason of this
>> > > > change is that '__zerocopy_sg_from_iter()' increments 'sk_wmem_alloc'
>> > > > of socket, so to decrease this field correctly proper skb destructor is
>> > > > needed: 'sock_wfree()'. This destructor is set by 'skb_set_owner_w()'.
>> > > >
>> > > > Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>> > > > ---
>> > > >  Changelog:
>> > > >  v5(big patchset) -> v1:
>> > > >   * Refactorings of 'if' conditions.
>> > > >   * Remove extra blank line.
>> > > >   * Remove 'frag_off' field unneeded init.
>> > > >   * Add function 'virtio_transport_fill_skb()' which fills both linear
>> > > >     and non-linear skb with provided data.
>> > > >  v1 -> v2:
>> > > >   * Use original order of last four arguments in 'virtio_transport_alloc_skb()'.
>> > > >  v2 -> v3:
>> > > >   * Add new transport callback: 'msgzerocopy_check_iov'. It checks that
>> > > >     provided 'iov_iter' with data could be sent in a zerocopy mode.
>> > > >     If this callback is not set in transport - transport allows to send
>> > > >     any 'iov_iter' in zerocopy mode. Otherwise - if callback returns 'true'
>> > > >     then zerocopy is allowed. Reason of this callback is that in case of
>> > > >     G2H transmission we insert whole skb to the tx virtio queue and such
>> > > >     skb must fit to the size of the virtio queue to be sent in a single
>> > > >     iteration (may be tx logic in 'virtio_transport.c' could be reworked
>> > > >     as in vhost to support partial send of current skb). This callback
>> > > >     will be enabled only for G2H path. For details pls see comment
>> > > >     'Check that tx queue...' below.
>> > > >
>> > > >  include/net/af_vsock.h                  |   3 +
>> > > >  net/vmw_vsock/virtio_transport.c        |  39 ++++
>> > > >  net/vmw_vsock/virtio_transport_common.c | 257 ++++++++++++++++++------
>> > > >  3 files changed, 241 insertions(+), 58 deletions(-)
>> > > >
>> > > > diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>> > > > index 0e7504a42925..a6b346eeeb8e 100644
>> > > > --- a/include/net/af_vsock.h
>> > > > +++ b/include/net/af_vsock.h
>> > > > @@ -177,6 +177,9 @@ struct vsock_transport {
>> > > >
>> > > >  	/* Read a single skb */
>> > > >  	int (*read_skb)(struct vsock_sock *, skb_read_actor_t);
>> > > > +
>> > > > +	/* Zero-copy. */
>> > > > +	bool (*msgzerocopy_check_iov)(const struct iov_iter *);
>> > > >  };
>> > > >
>> > > >  /**** CORE ****/
>> > > > diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>> > > > index 7bbcc8093e51..23cb8ed638c4 100644
>> > > > --- a/net/vmw_vsock/virtio_transport.c
>> > > > +++ b/net/vmw_vsock/virtio_transport.c
>> > > > @@ -442,6 +442,43 @@ static void virtio_vsock_rx_done(struct virtqueue *vq)
>> > > >  	queue_work(virtio_vsock_workqueue, &vsock->rx_work);
>> > > >  }
>> > > >
>> > > > +static bool virtio_transport_msgzerocopy_check_iov(const struct iov_iter *iov)
>> > > > +{
>> > > > +	struct virtio_vsock *vsock;
>> > > > +	bool res = false;
>> > > > +
>> > > > +	rcu_read_lock();
>> > > > +
>> > > > +	vsock = rcu_dereference(the_virtio_vsock);
>> > > > +	if (vsock) {
>> > > > +		struct virtqueue *vq;
>> > > > +		int iov_pages;
>> > > > +
>> > > > +		vq = vsock->vqs[VSOCK_VQ_TX];
>> > > > +
>> > > > +		iov_pages = round_up(iov->count, PAGE_SIZE) / PAGE_SIZE;
>> > > > +
>> > > > +		/* Check that tx queue is large enough to keep whole
>> > > > +		 * data to send. This is needed, because when there is
>> > > > +		 * not enough free space in the queue, current skb to
>> > > > +		 * send will be reinserted to the head of tx list of
>> > > > +		 * the socket to retry transmission later, so if skb
>> > > > +		 * is bigger than whole queue, it will be reinserted
>> > > > +		 * again and again, thus blocking other skbs to be sent.
>> > > > +		 * Each page of the user provided buffer will be added
>> > > > +		 * as a single buffer to the tx virtqueue, so compare
>> > > > +		 * number of pages against maximum capacity of the queue.
>> > > > +		 * +1 means buffer for the packet header.
>> > > > +		 */
>> > > > +		if (iov_pages + 1 <= vq->num_max)
>> > >
>> > > I think this check is actual only for case one we don't have indirect buffer feature.
>> > > With indirect mode whole data to send will be packed into one indirect buffer.
>> > >
>> > > Thanks, Arseniy
>> >
>> > Actually the reverse. With indirect you are limited to num_max.
>> > Without you are limited to whatever space is left in the
>> > queue (which you did not check here, so you should).
>> >
>> >
>> > > > +			res = true;
>> > > > +	}
>> > > > +
>> > > > +	rcu_read_unlock();
>> >
>> > Just curious:
>> > is the point of all this RCU dance to allow vsock
>> > to change from under us? then why is it ok to
>> > have it change? the virtio_transport_msgzerocopy_check_iov
>> > will then refer to the old vsock ...
>>
>> IIRC we introduced the RCU to handle hot-unplug issues:
>> commit 0deab087b16a ("vsock/virtio: use RCU to avoid use-after-free on
>> the_virtio_vsock")
>>
>> When we remove the device, we flush all the works, etc. so we should
>> not be in this case (referring the old vsock), except for an irrelevant
>> transient as the device is disappearing.
>>
>> Stefano
>
>what if old device goes away then new one appears?

In virtio_vsock_remove() (.remove cb) we hold `the_virtio_vsock_mutex`
while flushing all the works/sockets/packets and sync the RCU.

In virtio_vsock_probe (.probe cb) we hold the same lock while adding
the new one and updating the RCU pointer. (only 1 virtio-vsock device
per guest is currently supported)

So when the new one appears, all the previous sockets are closed, all
the queue packets and pending works flushed.

So new packets will see the new vsock device. It looks safe to me.

Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
