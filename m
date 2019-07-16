Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EBA6A50E
	for <lists.virtualization@lfdr.de>; Tue, 16 Jul 2019 11:40:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AA6E8E43;
	Tue, 16 Jul 2019 09:40:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D84C2E2D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 09:40:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B7FD463D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 09:40:28 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f17so17955556wme.2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 02:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=G7qEHGieurM6YM0uix2FXgt3bWLkQEvhE+XCjMO9gL4=;
	b=M6Vcj9PXOOEv549lJ9Hx3C3XCPE5Kqb85gEUGb9lYCpfkxZ3t/guoO1AsTNsdg/LXU
	UiAi2U6jffCNXpDekthtu6jdzvrs1cA9cZ1JBseVmu4+jQIeqBOSieo9Gbajy+flWU0L
	oQG1xDovHJU0HBWfuQU385SK9Lg/0BaACMf/OP16nhaCwyniyH3Xvm118VytGvw2DznA
	28hFQurios4zbyYKCvT0Kw2A69Hm4OYEzhVxXgh1Aov6CkJgPsPPQSXNLOll/ayftX0J
	XJkcMyliL3YTFw8LXD7ds+yzqDxf4XLTyM57R/7AbvhHS+dbgZAN91bJPSRrtwmXUvyM
	GrUg==
X-Gm-Message-State: APjAAAXyxxdPrQFfcWJEcqKjo2lc6NX+0bpg12TRiLxzjFgL78XUvAmh
	iDOHKHyANVbDpHLv/mWW+IBOSA==
X-Google-Smtp-Source: APXvYqzkgE02fSqkpO09OcgpakUjs3eVhIEOQ/qW6Awsi+eR/AVHCupes1EPfKEiPidW1Nw+dw5beA==
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr29804721wmj.128.1563270027202;
	Tue, 16 Jul 2019 02:40:27 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	o6sm37931894wra.27.2019.07.16.02.40.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 02:40:26 -0700 (PDT)
Date: Tue, 16 Jul 2019 11:40:24 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC] virtio-net: share receive_*() and add_recvbuf_*() with
	virtio-vsock
Message-ID: <20190716094024.ob43g5lxga5uwb7z@steredhat>
References: <20190710153707.twmzgmwqqw3pstos@steredhat>
	<9574bc38-4c5c-2325-986b-430e4a2b6661@redhat.com>
	<20190711114134.xhmpciyglb2angl6@steredhat>
	<20190711152855-mutt-send-email-mst@kernel.org>
	<20190712100033.xs3xesz2plfwj3ag@steredhat>
	<a514d8a4-3a12-feeb-4467-af7a9fbf5183@redhat.com>
	<20190715074416.a3s2i5ausognotbn@steredhat>
	<20190715134115-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715134115-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
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

On Mon, Jul 15, 2019 at 01:50:28PM -0400, Michael S. Tsirkin wrote:
> On Mon, Jul 15, 2019 at 09:44:16AM +0200, Stefano Garzarella wrote:
> > On Fri, Jul 12, 2019 at 06:14:39PM +0800, Jason Wang wrote:

[...]

> > > 
> > > 
> > > I think it's just a branch, for ethernet, go for networking stack. otherwise
> > > go for vsock core?
> > > 
> > 
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
> Neither.
> 
> I think what Jason was saying all along is this:
> 
> virtio net doesn't actually lose packets, at least most
> of the time. And it actually most of the time
> passes all packets to host. So it's possible to use a virtio net
> device (possibly with a feature flag that says "does not lose packets,
> all packets go to host") and build vsock on top.

Yes, I got it after the latest Jason's reply.

> 
> and all of this is nice, but don't expect anything easy,
> or any quick results.

I expected this... :-(

> 
> Also, in a sense it's a missed opportunity: we could cut out a lot
> of fat and see just how fast can a protocol that is completely
> new and separate from networking stack go.

In this case, if we will try to do a PoC, what do you think is better?
    1. new AF_VSOCK + network-stack + virtio-net modified
        Maybe it is allow us to reuse a lot of stuff already written,
        but we will go through the network stack

    2. new AF_VSOCK + glue + virtio-net modified
        Intermediate approach, similar to Jason's proposal

    3, new AF_VSOCK + new virtio-vsock
        Can be the thinnest, but we have to rewrite many things, with the risk
        of making the same mistakes as the current implementation.


> Instead vsock implementation carries so much baggage from both
> networking stack - such as softirq processing - and itself such as
> workqueues, global state and crude locking - to the point where
> it's actually slower than TCP.

I agree, and I'm finding new issues while I'm trying to support nested
VMs, allowing multiple vsock transports (virtio-vsock and vhost-vsock in
the KVM case) at runtime.

> 

[...]

> > > 
> > > I suggest to do this step by step:
> > > 
> > > 1) use virtio-net but keep some protocol logic
> > > 
> > > 2) separate protocol logic and merge it to exist Linux networking stack
> > 
> > Make sense, thanks for the suggestions, I'll try to do these steps!
> > 
> > Thanks,
> > Stefano
> 
> 
> An alternative is look at sources of overhead in vsock and get rid of
> them, or rewrite it from scratch focusing on performance.

I started looking at virtio-vsock and vhost-vsock trying to do very
simple changes [1] to increase the performance. I should send a v4 of that
series as a very short term, then I'd like to have a deeper look to understand
if it is better to try to optimize or rewrite it from scratch.


Thanks,
Stefano

[1] https://patchwork.kernel.org/cover/10970145/

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
