Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5400157FE6
	for <lists.virtualization@lfdr.de>; Thu, 27 Jun 2019 12:06:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1F452E93;
	Thu, 27 Jun 2019 10:06:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E5B65E7D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 10:06:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6ADF384C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 10:06:00 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v19so5034414wmj.5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 03:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=l1NwZTpnYPouG/Q6w8KVsqVGc7B8RfSH5Nd1fRhhCTg=;
	b=jCDRJJd5fbacJFRut3GGTpG9cqECfF16sRpPWaelypwPNp9b022LVLSD653kepoKuk
	9InhpGz+PHpG7KXryknc3/yrHHKtb1PCbuILHRAg669vMgyHva4BgEETvStxK/aLDoSS
	LW9qcj6P+5C2X8vva2R7wO5E7LzFMtl3Tt+WIVj+/M6ll25S2XudyEjkVWB/FovUECsb
	baTh+Ozf9ojOxa5tyi46jyvTFlnaQMExf2QbvhPIcA6ScCvmU+Qi1prZs4mzE94Uhsm2
	/V4apkZxqIV09I7YboFpmClFHHiLCGZzfiZZ8iCsdXbZ3ZvPTjNA4IjXbQzfhV7RlVdo
	Be4A==
X-Gm-Message-State: APjAAAWBzra9/vGd12mWHuEkufcqHjpuqYJHWRVKxriH+iuupZomNtei
	AFjjSBxRjFucM6/5Lqo6lR5mrQ==
X-Google-Smtp-Source: APXvYqzQ0sKIY6ZChWYC2WJ9R3q0SreK0ALQXZZlzrAyFs4jZYqRQY8Nns9g7u2vtKtU2ORhMeHCKQ==
X-Received: by 2002:a1c:4484:: with SMTP id r126mr2685540wma.27.1561629959060; 
	Thu, 27 Jun 2019 03:05:59 -0700 (PDT)
Received: from steredhat.homenet.telecomitalia.it
	(host21-207-dynamic.52-79-r.retail.telecomitalia.it. [79.52.207.21])
	by smtp.gmail.com with ESMTPSA id
	l12sm3249628wrb.81.2019.06.27.03.05.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 03:05:57 -0700 (PDT)
Date: Thu, 27 Jun 2019 12:05:55 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH 0/4] vsock/virtio: several fixes in the .probe() and
	.remove()
Message-ID: <20190627100555.pmnecffewzsopxyw@steredhat.homenet.telecomitalia.it>
References: <20190528105623.27983-1-sgarzare@redhat.com>
	<20190610130945.GL14257@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610130945.GL14257@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
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

On Mon, Jun 10, 2019 at 02:09:45PM +0100, Stefan Hajnoczi wrote:
> On Tue, May 28, 2019 at 12:56:19PM +0200, Stefano Garzarella wrote:
> > During the review of "[PATCH] vsock/virtio: Initialize core virtio vsock
> > before registering the driver", Stefan pointed out some possible issues
> > in the .probe() and .remove() callbacks of the virtio-vsock driver.
> > 
> > This series tries to solve these issues:
> > - Patch 1 postpones the 'the_virtio_vsock' assignment at the end of the
> >   .probe() to avoid that some sockets queue works when the initialization
> >   is not finished.
> > - Patches 2 and 3 stop workers before to call vdev->config->reset(vdev) to
> >   be sure that no one is accessing the device, and adds another flush at the
> >   end of the .remove() to avoid use after free.
> > - Patch 4 free also used buffers in the virtqueues during the .remove().
> > 
> > Stefano Garzarella (4):
> >   vsock/virtio: fix locking around 'the_virtio_vsock'
> >   vsock/virtio: stop workers during the .remove()
> >   vsock/virtio: fix flush of works during the .remove()
> >   vsock/virtio: free used buffers during the .remove()
> > 
> >  net/vmw_vsock/virtio_transport.c | 105 ++++++++++++++++++++++++++-----
> >  1 file changed, 90 insertions(+), 15 deletions(-)
> 
> Looking forward to v2.  I took a look at the discussion and I'll review
> v2 from scratch.  Just keep in mind that the mutex is used more for
> mutual exclusion of the init/exit code than to protect the_virtio_vsock,
> so we'll still need protection of init/exit code even with RCU.

Thanks for the advice! I'll send the v2 ASAP.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
