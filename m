Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CAADB6A666
	for <lists.virtualization@lfdr.de>; Tue, 16 Jul 2019 12:22:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EE1C1E3F;
	Tue, 16 Jul 2019 10:22:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AC720CC6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 10:22:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0EAD225A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 10:22:16 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p13so20283406wru.10
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 03:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=smhcNCF3QZCjfbSBTphGFkxRSXnqQ2w3E9AxAE5LvCI=;
	b=mk4TEIXHDVrj+nfxb90MU+o2UcUK12NzNGN5IVOADFiC4lTdC2fc1YxvsYLpc1gXru
	RdafNqzFntfKKLxWXya0eZMxvW+Nu1Wu5JNqaPMSryPdyjwr2Y57Ol4xxqFZk4qmm3Lt
	y42TnkSSdNdTnhxhfhUAhHb+AcytkZIQG1wK8id18IdCLp1N4lUTnyIptY+EWMAHqpNI
	UkaLfPRANTOQC68W0agfifi+gt6L4fIUTDL2wh7tYE9sCk/DOm3CWucy9I60Fc4pmCz8
	ln9P7vEj6ydatQmM4+OxlJ7RNf2oMBbSO9jCBjMm0poITY0/w8AncUow1wozkZazYlSC
	1GnQ==
X-Gm-Message-State: APjAAAV/daKUapOw3WmiLadwvXJ8fh5aGm3u+YMvZH251B12bZsXBGTU
	mL6ELiGFezyqsitzydK7e6Zczw==
X-Google-Smtp-Source: APXvYqyg2hrBQwkYKUpfFSVJBuo0b7N0PorjCPKDNYNI7q3PPk8rrBkrfyejKvxdyaYxyU+U5gDF7Q==
X-Received: by 2002:adf:d08e:: with SMTP id y14mr7969596wrh.309.1563272535581; 
	Tue, 16 Jul 2019 03:22:15 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	s12sm18227457wmh.34.2019.07.16.03.22.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 03:22:15 -0700 (PDT)
Date: Tue, 16 Jul 2019 12:22:13 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC] virtio-net: share receive_*() and add_recvbuf_*() with
	virtio-vsock
Message-ID: <20190716102213.b6lerchbwm7rwz54@steredhat>
References: <20190710153707.twmzgmwqqw3pstos@steredhat>
	<9574bc38-4c5c-2325-986b-430e4a2b6661@redhat.com>
	<20190711114134.xhmpciyglb2angl6@steredhat>
	<20190711152855-mutt-send-email-mst@kernel.org>
	<20190712100033.xs3xesz2plfwj3ag@steredhat>
	<a514d8a4-3a12-feeb-4467-af7a9fbf5183@redhat.com>
	<20190715074416.a3s2i5ausognotbn@steredhat>
	<20190715134115-mutt-send-email-mst@kernel.org>
	<20190716094024.ob43g5lxga5uwb7z@steredhat>
	<20190716055837-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190716055837-mutt-send-email-mst@kernel.org>
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

On Tue, Jul 16, 2019 at 06:01:33AM -0400, Michael S. Tsirkin wrote:
> On Tue, Jul 16, 2019 at 11:40:24AM +0200, Stefano Garzarella wrote:
> > On Mon, Jul 15, 2019 at 01:50:28PM -0400, Michael S. Tsirkin wrote:
> > > On Mon, Jul 15, 2019 at 09:44:16AM +0200, Stefano Garzarella wrote:
> > > > On Fri, Jul 12, 2019 at 06:14:39PM +0800, Jason Wang wrote:
> > 
> > [...]
> > 
> > > > > 
> > > > > 
> > > > > I think it's just a branch, for ethernet, go for networking stack. otherwise
> > > > > go for vsock core?
> > > > > 
> > > > 
> > > > Yes, that should work.
> > > > 
> > > > So, I should refactor the functions that can be called also from the vsock
> > > > core, in order to remove "struct net_device *dev" parameter.
> > > > Maybe creating some wrappers for the network stack.
> > > > 
> > > > Otherwise I should create a fake net_device for vsock_core.
> > > > 
> > > > What do you suggest?
> > > 
> > > Neither.
> > > 
> > > I think what Jason was saying all along is this:
> > > 
> > > virtio net doesn't actually lose packets, at least most
> > > of the time. And it actually most of the time
> > > passes all packets to host. So it's possible to use a virtio net
> > > device (possibly with a feature flag that says "does not lose packets,
> > > all packets go to host") and build vsock on top.
> > 
> > Yes, I got it after the latest Jason's reply.
> > 
> > > 
> > > and all of this is nice, but don't expect anything easy,
> > > or any quick results.
> > 
> > I expected this... :-(
> > 
> > > 
> > > Also, in a sense it's a missed opportunity: we could cut out a lot
> > > of fat and see just how fast can a protocol that is completely
> > > new and separate from networking stack go.
> > 
> > In this case, if we will try to do a PoC, what do you think is better?
> >     1. new AF_VSOCK + network-stack + virtio-net modified
> >         Maybe it is allow us to reuse a lot of stuff already written,
> >         but we will go through the network stack
> > 
> >     2. new AF_VSOCK + glue + virtio-net modified
> >         Intermediate approach, similar to Jason's proposal
> > 
> >     3, new AF_VSOCK + new virtio-vsock
> >         Can be the thinnest, but we have to rewrite many things, with the risk
> >         of making the same mistakes as the current implementation.
> > 
> 
> 1 or 3 imho. I wouldn't expect a lot from 2.  I slightly favor 3 and
> Jason 1. So take your pick :)
> 

Yes, I agree :)

Maybe "Jason 1" could be the short term (and an opportunity to study better the
code and sources of overhead) and "new AF_VSOCK + new virtio-vsock" the long
term goal with the multi-transport support in mind.

Thank you so much for your guidance and useful advice,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
