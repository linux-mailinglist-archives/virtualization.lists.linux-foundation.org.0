Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7C26872E
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 12:42:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D93EACDB;
	Mon, 15 Jul 2019 10:42:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 81A47AB5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 10:42:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E171E876
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 10:42:24 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p74so14618887wme.4
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 03:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oyD5SUTkl63HtbjEDszT2KkUVTMpHqfY9Ujle8tjXBw=;
	b=lgPhxVt7JvAQcbXgTjIg4yGXs2tNxuW4rKAq/W2A8m6ReIxsglIoCSjpgpznzJmVdr
	6wf8uqoCeTxtDudf3SB60T/DZkj7D3oUWkcKdZhVOAaj+68kRuef9Mr5Nd+n4AOWfoGv
	/kmXOGtFhakxsChYo/HaICgaf61FrXdu4WvEzQxb77csDSiwaG5Ypbau0HuwAnHAwRwr
	EnvDVrRqhorzTip9DjYVjgTlP5oKOis/ecnGF0uvuBaZ2BNMmDvWmbUrg9QhR3GxqXNq
	xgcHk4zykbIFa43Bv+tkH0laIretTLQo7Vse43KWXGWF4GNsivdAUFrZWc26CQiDb3q7
	/3sg==
X-Gm-Message-State: APjAAAURVfCNG0D4IepUpUl27Rmp32o70p2FBgQaHxGlX9+rxKYjBZ25
	a2EcfEqvpoma04HPLzxtHWijaQ==
X-Google-Smtp-Source: APXvYqwY6ZbOufj9qXWZ3qtrrCMUfkv2NIKI7eH9a/099xy5vRZPB6+AkmVtqZo8yNXLlrQbnqYjrw==
X-Received: by 2002:a1c:200a:: with SMTP id g10mr22582918wmg.160.1563187343491;
	Mon, 15 Jul 2019 03:42:23 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	c7sm13992464wro.70.2019.07.15.03.42.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 15 Jul 2019 03:42:22 -0700 (PDT)
Date: Mon, 15 Jul 2019 12:42:20 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC] virtio-net: share receive_*() and add_recvbuf_*() with
	virtio-vsock
Message-ID: <20190715104220.dy4rty7xzerq2wut@steredhat>
References: <20190710153707.twmzgmwqqw3pstos@steredhat>
	<9574bc38-4c5c-2325-986b-430e4a2b6661@redhat.com>
	<20190711114134.xhmpciyglb2angl6@steredhat>
	<20190711152855-mutt-send-email-mst@kernel.org>
	<20190712100033.xs3xesz2plfwj3ag@steredhat>
	<a514d8a4-3a12-feeb-4467-af7a9fbf5183@redhat.com>
	<20190715074416.a3s2i5ausognotbn@steredhat>
	<880c1ad2-7e02-3d5d-82d7-49076cc8d02b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <880c1ad2-7e02-3d5d-82d7-49076cc8d02b@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
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

On Mon, Jul 15, 2019 at 05:16:09PM +0800, Jason Wang wrote:
> 
> > > > > > > >        struct sk_buff *virtskb_receive_small(struct virtskb *vs, ...);
> > > > > > > >        struct sk_buff *virtskb_receive_big(struct virtskb *vs, ...);
> > > > > > > >        struct sk_buff *virtskb_receive_mergeable(struct virtskb *vs, ...);
> > > > > > > > 
> > > > > > > >        int virtskb_add_recvbuf_small(struct virtskb*vs, ...);
> > > > > > > >        int virtskb_add_recvbuf_big(struct virtskb *vs, ...);
> > > > > > > >        int virtskb_add_recvbuf_mergeable(struct virtskb *vs, ...);
> > > > > > > > 
> > > > > > > > For the Guest->Host path it should be easier, so maybe I can add a
> > > > > > > > "virtskb_send(struct virtskb *vs, struct sk_buff *skb)" with a part of the code
> > > > > > > > of xmit_skb().
> > > > > > > I may miss something, but I don't see any thing that prevents us from using
> > > > > > > xmit_skb() directly.
> > > > > > > 
> > > > > > Yes, but my initial idea was to make it more parametric and not related to the
> > > > > > virtio_net_hdr, so the 'hdr_len' could be a parameter and the
> > > > > > 'num_buffers' should be handled by the caller.
> > > > > > 
> > > > > > > > Let me know if you have in mind better names or if I should put these function
> > > > > > > > in another place.
> > > > > > > > 
> > > > > > > > I would like to leave the control part completely separate, so, for example,
> > > > > > > > the two drivers will negotiate the features independently and they will call
> > > > > > > > the right virtskb_receive_*() function based on the negotiation.
> > > > > > > If it's one the issue of negotiation, we can simply change the
> > > > > > > virtnet_probe() to deal with different devices.
> > > > > > > 
> > > > > > > 
> > > > > > > > I already started to work on it, but before to do more steps and send an RFC
> > > > > > > > patch, I would like to hear your opinion.
> > > > > > > > Do you think that makes sense?
> > > > > > > > Do you see any issue or a better solution?
> > > > > > > I still think we need to seek a way of adding some codes on virtio-net.c
> > > > > > > directly if there's no huge different in the processing of TX/RX. That would
> > > > > > > save us a lot time.
> > > > > > After the reading of the buffers from the virtqueue I think the process
> > > > > > is slightly different, because virtio-net will interface with the network
> > > > > > stack, while virtio-vsock will interface with the vsock-core (socket).
> > > > > > So the virtio-vsock implements the following:
> > > > > > - control flow mechanism to avoid to loose packets, informing the peer
> > > > > >     about the amount of memory available in the receive queue using some
> > > > > >     fields in the virtio_vsock_hdr
> > > > > > - de-multiplexing parsing the virtio_vsock_hdr and choosing the right
> > > > > >     socket depending on the port
> > > > > > - socket state handling
> > > 
> > > I think it's just a branch, for ethernet, go for networking stack. otherwise
> > > go for vsock core?
> > > 
> > Yes, that should work.
> > 
> > So, I should refactor the functions that can be called also from the vsock
> > core, in order to remove "struct net_device *dev" parameter.
> > Maybe creating some wrappers for the network stack.
> > 
> > Otherwise I should create a fake net_device for vsock_core.
> > 
> > What do you suggest?
> 
> 
> I'm not quite sure I get the question. Can you just use the one that created
> by virtio_net?

Sure, sorry but I missed that it is allocated in the virtnet_probe()!

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
