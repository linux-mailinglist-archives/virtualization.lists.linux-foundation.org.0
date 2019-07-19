Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C796D6E285
	for <lists.virtualization@lfdr.de>; Fri, 19 Jul 2019 10:30:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F171C2387;
	Fri, 19 Jul 2019 08:30:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A2D58235A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 08:29:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 14943FE
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 08:29:58 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p17so31331700wrf.11
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 01:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=k1bnFro2XXdwmJgrGLhv6xKBwMHqJtL+pcbxH+NzjmM=;
	b=UOcj+zALMuq61EQEeZecw7a6NzqfA/NUn63IKJXsiPLC/DbwlpTDpyO0wwEIvORXqp
	5rVA3wJ3OLI0Y3hRzuqqutaj1/Ne/uR4UnoslnIPoRIoEJwJoZcpnITMZSjBbBTgaNmN
	cO/ky3rcKRggMVkl5vZFy+7JuUrUq0IyH86ejuwRArdDAYRKQrREsUbov5R9ZWX+rmGP
	bSk5FF5BbjdqyT18B0JRHdP5Re/mZa5MLTa/sp5BhgKrLQnThGfU+5Bgakvm+PzaSF4E
	xgm8OkFvjzzmVepNxjHBFdYd4HbwJUdRWC0WRF01PU1jMQSZNTVzeT/z1FJKAAc7wai+
	GFyQ==
X-Gm-Message-State: APjAAAXRbI2Js5IQFhkpN4BuFS5jyXXkXb2p5Yvgizr26oFnPmehjzrY
	vnczeqta8Cto0otFB+wzM48P1w==
X-Google-Smtp-Source: APXvYqyq9acl68xOlc1ZDifwAYF0lAew9EnZOZvpXAWnTf1hg09lgAOCC1cGT8vja/tQpaOoGLEkHQ==
X-Received: by 2002:a5d:4212:: with SMTP id n18mr53314416wrq.261.1563524997628;
	Fri, 19 Jul 2019 01:29:57 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	l17sm16941335wrr.94.2019.07.19.01.29.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 01:29:56 -0700 (PDT)
Date: Fri, 19 Jul 2019 10:29:54 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 5/5] vsock/virtio: change the maximum packet size
	allowed
Message-ID: <20190719082954.m2lw77adpp5dylxw@steredhat>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-6-sgarzare@redhat.com>
	<20190717105703-mutt-send-email-mst@kernel.org>
	<CAGxU2F5ybg1_8VhS=COMnxSKC4AcW4ZagYwNMi==d6-rNPgzsg@mail.gmail.com>
	<20190718083105-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718083105-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

On Thu, Jul 18, 2019 at 08:33:40AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 18, 2019 at 09:52:41AM +0200, Stefano Garzarella wrote:
> > On Wed, Jul 17, 2019 at 5:00 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Wed, Jul 17, 2019 at 01:30:30PM +0200, Stefano Garzarella wrote:
> > > > Since now we are able to split packets, we can avoid limiting
> > > > their sizes to VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE.
> > > > Instead, we can use VIRTIO_VSOCK_MAX_PKT_BUF_SIZE as the max
> > > > packet size.
> > > >
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > >
> > >
> > > OK so this is kind of like GSO where we are passing
> > > 64K packets to the vsock and then split at the
> > > low level.
> > 
> > Exactly, something like that in the Host->Guest path, instead in the
> > Guest->Host we use the entire 64K packet.
> > 
> > Thanks,
> > Stefano
> 
> btw two allocations for each packet isn't great. How about
> allocating the struct linearly with the data?

Are you referring to the kzalloc() to allocate the 'struct
virtio_vsock_pkt', followed by the kmalloc() to allocate the buffer?

Actually they don't look great, I will try to do a single allocation.

> And all buffers are same length for you - so you can actually
> do alloc_pages.

Yes, also Jason suggested it and we decided to postpone since we will
try to reuse the virtio-net where it comes for free.

> Allocating/freeing pages in a batch should also be considered.

For the allocation of guest rx buffers we do some kind of batching (we
refill the queue when it reaches the half), but only it this case :(

I'll try to do more alloc/free batching.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
