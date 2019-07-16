Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 281376A611
	for <lists.virtualization@lfdr.de>; Tue, 16 Jul 2019 12:01:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 880F1E41;
	Tue, 16 Jul 2019 10:01:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9C209E2D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 10:01:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 287FE25A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 10:01:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 945A23082E8E;
	Tue, 16 Jul 2019 10:01:39 +0000 (UTC)
Received: from redhat.com (ovpn-120-102.rdu2.redhat.com [10.10.120.102])
	by smtp.corp.redhat.com (Postfix) with SMTP id 2E64C611DC;
	Tue, 16 Jul 2019 10:01:34 +0000 (UTC)
Date: Tue, 16 Jul 2019 06:01:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC] virtio-net: share receive_*() and add_recvbuf_*() with
	virtio-vsock
Message-ID: <20190716055837-mutt-send-email-mst@kernel.org>
References: <20190710153707.twmzgmwqqw3pstos@steredhat>
	<9574bc38-4c5c-2325-986b-430e4a2b6661@redhat.com>
	<20190711114134.xhmpciyglb2angl6@steredhat>
	<20190711152855-mutt-send-email-mst@kernel.org>
	<20190712100033.xs3xesz2plfwj3ag@steredhat>
	<a514d8a4-3a12-feeb-4467-af7a9fbf5183@redhat.com>
	<20190715074416.a3s2i5ausognotbn@steredhat>
	<20190715134115-mutt-send-email-mst@kernel.org>
	<20190716094024.ob43g5lxga5uwb7z@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190716094024.ob43g5lxga5uwb7z@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 16 Jul 2019 10:01:39 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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

On Tue, Jul 16, 2019 at 11:40:24AM +0200, Stefano Garzarella wrote:
> On Mon, Jul 15, 2019 at 01:50:28PM -0400, Michael S. Tsirkin wrote:
> > On Mon, Jul 15, 2019 at 09:44:16AM +0200, Stefano Garzarella wrote:
> > > On Fri, Jul 12, 2019 at 06:14:39PM +0800, Jason Wang wrote:
> 
> [...]
> 
> > > > 
> > > > 
> > > > I think it's just a branch, for ethernet, go for networking stack. otherwise
> > > > go for vsock core?
> > > > 
> > > 
> > > Yes, that should work.
> > > 
> > > So, I should refactor the functions that can be called also from the vsock
> > > core, in order to remove "struct net_device *dev" parameter.
> > > Maybe creating some wrappers for the network stack.
> > > 
> > > Otherwise I should create a fake net_device for vsock_core.
> > > 
> > > What do you suggest?
> > 
> > Neither.
> > 
> > I think what Jason was saying all along is this:
> > 
> > virtio net doesn't actually lose packets, at least most
> > of the time. And it actually most of the time
> > passes all packets to host. So it's possible to use a virtio net
> > device (possibly with a feature flag that says "does not lose packets,
> > all packets go to host") and build vsock on top.
> 
> Yes, I got it after the latest Jason's reply.
> 
> > 
> > and all of this is nice, but don't expect anything easy,
> > or any quick results.
> 
> I expected this... :-(
> 
> > 
> > Also, in a sense it's a missed opportunity: we could cut out a lot
> > of fat and see just how fast can a protocol that is completely
> > new and separate from networking stack go.
> 
> In this case, if we will try to do a PoC, what do you think is better?
>     1. new AF_VSOCK + network-stack + virtio-net modified
>         Maybe it is allow us to reuse a lot of stuff already written,
>         but we will go through the network stack
> 
>     2. new AF_VSOCK + glue + virtio-net modified
>         Intermediate approach, similar to Jason's proposal
> 
>     3, new AF_VSOCK + new virtio-vsock
>         Can be the thinnest, but we have to rewrite many things, with the risk
>         of making the same mistakes as the current implementation.
> 

1 or 3 imho. I wouldn't expect a lot from 2.  I slightly favor 3 and
Jason 1. So take your pick :)

> > Instead vsock implementation carries so much baggage from both
> > networking stack - such as softirq processing - and itself such as
> > workqueues, global state and crude locking - to the point where
> > it's actually slower than TCP.
> 
> I agree, and I'm finding new issues while I'm trying to support nested
> VMs, allowing multiple vsock transports (virtio-vsock and vhost-vsock in
> the KVM case) at runtime.
> 
> > 
> 
> [...]
> 
> > > > 
> > > > I suggest to do this step by step:
> > > > 
> > > > 1) use virtio-net but keep some protocol logic
> > > > 
> > > > 2) separate protocol logic and merge it to exist Linux networking stack
> > > 
> > > Make sense, thanks for the suggestions, I'll try to do these steps!
> > > 
> > > Thanks,
> > > Stefano
> > 
> > 
> > An alternative is look at sources of overhead in vsock and get rid of
> > them, or rewrite it from scratch focusing on performance.
> 
> I started looking at virtio-vsock and vhost-vsock trying to do very
> simple changes [1] to increase the performance. I should send a v4 of that
> series as a very short term, then I'd like to have a deeper look to understand
> if it is better to try to optimize or rewrite it from scratch.
> 
> 
> Thanks,
> Stefano
> 
> [1] https://patchwork.kernel.org/cover/10970145/
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
