Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3795C1B7
	for <lists.virtualization@lfdr.de>; Mon,  1 Jul 2019 19:04:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5D4AB2114;
	Mon,  1 Jul 2019 17:04:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 499CF1DD8
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 17:04:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1AA0D84F
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 17:04:02 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 207so263209wma.1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 01 Jul 2019 10:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ld/S+VVZs8pmZedqdnP/S9bHBpKYWy8WRk/m3Q5+2LI=;
	b=sZ2p2gp8m8wQ771Pb5WiNH1cjLhx2XAegTjExwU3WfJiVgDTtcDuF3fNdpwfaFzr60
	iIc3Z/lb588CKRDZGgoLUW8jiQuHHwou4mWhs79XWk3eQa7zhGImO4jojhiOj3+0DB5Z
	4ll8/ueXUCHrofbFLzgb2i0hiaJYPslQSo3txEWUGEVkS7uOp+pOf+as6urqjtqS+M3O
	zXLuRwmxlF50agmE0MrHsMcNk9T0U/hwrUANyLtjT8wGBlaJQIdcIUjjnvhv/ZNi0Lc+
	d8Hd5j9wa1YhR3PC+qiNDbxsTJdHY7BPsJU1V6Ni+phuUImbBcJhfGKJs172tNrhxxKR
	+/ug==
X-Gm-Message-State: APjAAAVsCGHy2w3QqJbu3JVULj9x8ajUlWhPy2q9YxUGff9WOv5Ki+zd
	mtQVGjvSQfGlXVnZqZr2L2DbJA==
X-Google-Smtp-Source: APXvYqwBOYSxwelsum2oddoo+4pw1dZnLt7m1hYtVtolWxEgwL2beWLJsaejVTIBg02GC95ss28lWA==
X-Received: by 2002:a1c:7503:: with SMTP id o3mr183987wmc.170.1562000640687;
	Mon, 01 Jul 2019 10:04:00 -0700 (PDT)
Received: from steredhat (host21-207-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.207.21]) by smtp.gmail.com with ESMTPSA id
	q18sm9950224wrj.65.2019.07.01.10.03.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 10:04:00 -0700 (PDT)
Date: Mon, 1 Jul 2019 19:03:57 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH v2 0/3] vsock/virtio: several fixes in the .probe() and
	.remove()
Message-ID: <20190701170357.jtuhy3ank7mv6izb@steredhat>
References: <20190628123659.139576-1-sgarzare@redhat.com>
	<20190701151113.GE11900@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701151113.GE11900@stefanha-x1.localdomain>
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

On Mon, Jul 01, 2019 at 04:11:13PM +0100, Stefan Hajnoczi wrote:
> On Fri, Jun 28, 2019 at 02:36:56PM +0200, Stefano Garzarella wrote:
> > During the review of "[PATCH] vsock/virtio: Initialize core virtio vsock
> > before registering the driver", Stefan pointed out some possible issues
> > in the .probe() and .remove() callbacks of the virtio-vsock driver.
> > 
> > This series tries to solve these issues:
> > - Patch 1 adds RCU critical sections to avoid use-after-free of
> >   'the_virtio_vsock' pointer.
> > - Patch 2 stops workers before to call vdev->config->reset(vdev) to
> >   be sure that no one is accessing the device.
> > - Patch 3 moves the works flush at the end of the .remove() to avoid
> >   use-after-free of 'vsock' object.
> > 
> > v2:
> > - Patch 1: use RCU to protect 'the_virtio_vsock' pointer
> > - Patch 2: no changes
> > - Patch 3: flush works only at the end of .remove()
> > - Removed patch 4 because virtqueue_detach_unused_buf() returns all the buffers
> >   allocated.
> > 
> > v1: https://patchwork.kernel.org/cover/10964733/
> 
> This looks good to me.

Thanks for the review!

> 
> Did you run any stress tests?  For example an SMP guest constantly
> connecting and sending packets together with a script that
> hotplug/unplugs vhost-vsock-pci from the host side.

Yes, I started an SMP guest (-smp 4 -monitor tcp:127.0.0.1:1234,server,nowait)
and I run these scripts to stress the .probe()/.remove() path:

- guest
  while true; do
      cat /dev/urandom | nc-vsock -l 4321 > /dev/null &
      cat /dev/urandom | nc-vsock -l 5321 > /dev/null &
      cat /dev/urandom | nc-vsock -l 6321 > /dev/null &
      cat /dev/urandom | nc-vsock -l 7321 > /dev/null &
      wait
  done

- host
  while true; do
      cat /dev/urandom | nc-vsock 3 4321 > /dev/null &
      cat /dev/urandom | nc-vsock 3 5321 > /dev/null &
      cat /dev/urandom | nc-vsock 3 6321 > /dev/null &
      cat /dev/urandom | nc-vsock 3 7321 > /dev/null &
      sleep 2
      echo "device_del v1" | nc 127.0.0.1 1234
      sleep 1
      echo "device_add vhost-vsock-pci,id=v1,guest-cid=3" | nc 127.0.0.1 1234
      sleep 1
  done

Do you think is enough or is better to have a test more accurate?

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
