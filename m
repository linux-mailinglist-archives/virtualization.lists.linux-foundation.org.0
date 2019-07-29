Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA62790B4
	for <lists.virtualization@lfdr.de>; Mon, 29 Jul 2019 18:22:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 760CC1AB6;
	Mon, 29 Jul 2019 16:22:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 16D4019EE
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 16:19:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5D9E35E4
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 16:19:08 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n9so62613843wru.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 09:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZKDqUs0ayhzO8fC3NvwV+tCFuuA/FPgD3ePdCx1GJqM=;
	b=h/Vu1i4BXqsU6p+sXWAFxx+P26t6E6BZDK1abdopORyO0p31gtjId883dzVsBWIywK
	4AjO9MOeOx3tDgK9ndyjy9rvm9xnh3GmulsFowkixjnfh71+Y6xRwGkV2vYObpxMWamn
	HWoffjz0lTawDMojkvy88EzmjJAL2ozB2TIqtnsYl2bS3BKgl5hJksruDgCaXO1fp1A+
	2yeC9+aVGkb7uRwQPEe8hUdw5CduVs9bjLy9/Gisfm2Xa2V+TZNH88PpTYw4tPsn3/6e
	ND6UW/SSnWfs3EvmhAIIwFunstWXOsbSBXu69ReGNZ+W9f75ApkEbuZqiZQ/NwacEXV7
	vNzQ==
X-Gm-Message-State: APjAAAWh6WwMUH3M12e8kmkkcGJ7GmHkPLKoxBexmWMzn1tBhGEXllFV
	/c89qicbqUq+4J09jyquTyav6Q==
X-Google-Smtp-Source: APXvYqx0sc12Pv/jNOPaKvwFRyWt3K0PAbYM2mQ0eNUoR5RWLAC9VV53Iw6ZEaEpC4k4BBzOXgmD7Q==
X-Received: by 2002:a5d:4b8b:: with SMTP id b11mr40501951wrt.294.1564417146999;
	Mon, 29 Jul 2019 09:19:06 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	c11sm104255286wrq.45.2019.07.29.09.19.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 09:19:06 -0700 (PDT)
Date: Mon, 29 Jul 2019 18:19:03 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190729161903.yhaj5rfcvleexkhc@steredhat>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-2-sgarzare@redhat.com>
	<20190729095956-mutt-send-email-mst@kernel.org>
	<20190729153656.zk4q4rob5oi6iq7l@steredhat>
	<20190729114302-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729114302-mutt-send-email-mst@kernel.org>
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

On Mon, Jul 29, 2019 at 11:49:02AM -0400, Michael S. Tsirkin wrote:
> On Mon, Jul 29, 2019 at 05:36:56PM +0200, Stefano Garzarella wrote:
> > On Mon, Jul 29, 2019 at 10:04:29AM -0400, Michael S. Tsirkin wrote:
> > > On Wed, Jul 17, 2019 at 01:30:26PM +0200, Stefano Garzarella wrote:
> > > > Since virtio-vsock was introduced, the buffers filled by the host
> > > > and pushed to the guest using the vring, are directly queued in
> > > > a per-socket list. These buffers are preallocated by the guest
> > > > with a fixed size (4 KB).
> > > > 
> > > > The maximum amount of memory used by each socket should be
> > > > controlled by the credit mechanism.
> > > > The default credit available per-socket is 256 KB, but if we use
> > > > only 1 byte per packet, the guest can queue up to 262144 of 4 KB
> > > > buffers, using up to 1 GB of memory per-socket. In addition, the
> > > > guest will continue to fill the vring with new 4 KB free buffers
> > > > to avoid starvation of other sockets.
> > > > 
> > > > This patch mitigates this issue copying the payload of small
> > > > packets (< 128 bytes) into the buffer of last packet queued, in
> > > > order to avoid wasting memory.
> > > > 
> > > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > 
> > > This is good enough for net-next, but for net I think we
> > > should figure out how to address the issue completely.
> > > Can we make the accounting precise? What happens to
> > > performance if we do?
> > > 
> > 
> > In order to do more precise accounting maybe we can use the buffer size,
> > instead of payload size when we update the credit available.
> > In this way, the credit available for each socket will reflect the memory
> > actually used.
> > 
> > I should check better, because I'm not sure what happen if the peer sees
> > 1KB of space available, then it sends 1KB of payload (using a 4KB
> > buffer).
> > 
> > The other option is to copy each packet in a new buffer like I did in
> > the v2 [2], but this forces us to make a copy for each packet that does
> > not fill the entire buffer, perhaps too expensive.
> > 
> > [2] https://patchwork.kernel.org/patch/10938741/
> > 
> > 
> > Thanks,
> > Stefano
> 
> Interesting. You are right, and at some level the protocol forces copies.
> 
> We could try to detect that the actual memory is getting close to
> admin limits and force copies on queued packets after the fact.
> Is that practical?

Yes, I think it is doable!
We can decrease the credit available with the buffer size queued, and
when the buffer size of packet to queue is bigger than the credit
available, we can copy it.

> 
> And yes we can extend the credit accounting to include buffer size.
> That's a protocol change but maybe it makes sense.

Since we send to the other peer the credit available, maybe this
change can be backwards compatible (I'll check better this).

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
