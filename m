Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3E65E19D
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 12:07:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9B5971185;
	Wed,  3 Jul 2019 10:07:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8C04E117E
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 10:07:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 542D970D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 10:07:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n4so2097064wrs.3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 03 Jul 2019 03:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=VNvFKH5K+pDMmuMUJ4DZzYn2K79WWFEugthw2tWzrCE=;
	b=VvwjMYO6CHGPB91EoycN4nsYeTPUOs4Hoao9kK/BTgnd1J8+rcVHddzGSpfZ8Y3zm3
	HWD6wKONo9HQMghUGgwaefBFWqnLltMR5QF1z4uwZQ7CrZ2HfADelfFYt/4E8LD5hJ0E
	81wUYDs0zo62t6dPg8J3vXaau7hNmHSDWhROACX2iD7hzW9HwsnK9B82Fmq0vIofJSiT
	agTfn6UsVDmwQHdV0GEAPzKK7lj3bjQ3iU4huy+sAS2G2mIOfPHTIitqJwS3VQ/hY+ml
	XZkvfEKXIYBsCmX1mYEmgSJy//3xRjSdeI+dPylzuti0vqE/NwcKJhaGQeqgkE5flCKR
	Xtkg==
X-Gm-Message-State: APjAAAUfMQo2KfRQfdUUeWKxLf0QkqyizR8h7q7irOl8q+vxiCpAAq1y
	6MnycrI8wrYE3E2tRTrbFlXOsA==
X-Google-Smtp-Source: APXvYqzGzHZlSIMty2RhAvvB1Uo0isxGnCtD5XKYMHI9/IRY2pIO6xkm3T2evQoOaleJYQ+jY3ZeIw==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr27669596wrn.54.1562148450882; 
	Wed, 03 Jul 2019 03:07:30 -0700 (PDT)
Received: from steredhat (host21-207-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.207.21])
	by smtp.gmail.com with ESMTPSA id z5sm1183115wmf.48.2019.07.03.03.07.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Jul 2019 03:07:30 -0700 (PDT)
Date: Wed, 3 Jul 2019 12:07:27 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH v2 0/3] vsock/virtio: several fixes in the .probe() and
	.remove()
Message-ID: <20190703100727.kuwpyc5sksrgmoxb@steredhat>
References: <20190628123659.139576-1-sgarzare@redhat.com>
	<20190701151113.GE11900@stefanha-x1.localdomain>
	<20190701170357.jtuhy3ank7mv6izb@steredhat>
	<20190703091453.GA11844@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703091453.GA11844@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Wed, Jul 03, 2019 at 10:14:53AM +0100, Stefan Hajnoczi wrote:
> On Mon, Jul 01, 2019 at 07:03:57PM +0200, Stefano Garzarella wrote:
> > On Mon, Jul 01, 2019 at 04:11:13PM +0100, Stefan Hajnoczi wrote:
> > > On Fri, Jun 28, 2019 at 02:36:56PM +0200, Stefano Garzarella wrote:
> > > > During the review of "[PATCH] vsock/virtio: Initialize core virtio vsock
> > > > before registering the driver", Stefan pointed out some possible issues
> > > > in the .probe() and .remove() callbacks of the virtio-vsock driver.
> > > > 
> > > > This series tries to solve these issues:
> > > > - Patch 1 adds RCU critical sections to avoid use-after-free of
> > > >   'the_virtio_vsock' pointer.
> > > > - Patch 2 stops workers before to call vdev->config->reset(vdev) to
> > > >   be sure that no one is accessing the device.
> > > > - Patch 3 moves the works flush at the end of the .remove() to avoid
> > > >   use-after-free of 'vsock' object.
> > > > 
> > > > v2:
> > > > - Patch 1: use RCU to protect 'the_virtio_vsock' pointer
> > > > - Patch 2: no changes
> > > > - Patch 3: flush works only at the end of .remove()
> > > > - Removed patch 4 because virtqueue_detach_unused_buf() returns all the buffers
> > > >   allocated.
> > > > 
> > > > v1: https://patchwork.kernel.org/cover/10964733/
> > > 
> > > This looks good to me.
> > 
> > Thanks for the review!
> > 
> > > 
> > > Did you run any stress tests?  For example an SMP guest constantly
> > > connecting and sending packets together with a script that
> > > hotplug/unplugs vhost-vsock-pci from the host side.
> > 
> > Yes, I started an SMP guest (-smp 4 -monitor tcp:127.0.0.1:1234,server,nowait)
> > and I run these scripts to stress the .probe()/.remove() path:
> > 
> > - guest
> >   while true; do
> >       cat /dev/urandom | nc-vsock -l 4321 > /dev/null &
> >       cat /dev/urandom | nc-vsock -l 5321 > /dev/null &
> >       cat /dev/urandom | nc-vsock -l 6321 > /dev/null &
> >       cat /dev/urandom | nc-vsock -l 7321 > /dev/null &
> >       wait
> >   done
> > 
> > - host
> >   while true; do
> >       cat /dev/urandom | nc-vsock 3 4321 > /dev/null &
> >       cat /dev/urandom | nc-vsock 3 5321 > /dev/null &
> >       cat /dev/urandom | nc-vsock 3 6321 > /dev/null &
> >       cat /dev/urandom | nc-vsock 3 7321 > /dev/null &
> >       sleep 2
> >       echo "device_del v1" | nc 127.0.0.1 1234
> >       sleep 1
> >       echo "device_add vhost-vsock-pci,id=v1,guest-cid=3" | nc 127.0.0.1 1234
> >       sleep 1
> >   done
> > 
> > Do you think is enough or is better to have a test more accurate?
> 
> That's good when left running overnight so that thousands of hotplug
> events are tested.

Honestly I run the test for ~30 mins (because without the patch the
crash happens in a few seconds), but of course, I'll run it this night :)

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
