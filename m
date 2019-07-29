Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EBB7939D
	for <lists.virtualization@lfdr.de>; Mon, 29 Jul 2019 21:15:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 419161DCC;
	Mon, 29 Jul 2019 19:14:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 65EFF1AAE
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 19:10:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 573BD2C6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 19:10:23 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id o19so12284873vkb.6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 12:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=okCdMq9mPshN0DGM4+W0kc8Ipb0i9EdacMckArHhxzo=;
	b=WZonqXCLJbyK9FoTGFBmBgI4gl+9a6mLDj4YWYF5FI1mbkfrnesyB0xQU4OF/NlpPm
	XH4cyfhF/n8fxLkRU6avX1wTwfo2JFDafe2ENVWjranC/G/w9xkDqGQ8VcS7ieaAOR1k
	oqDCa1qsSj4GUu7Xa+oUbAJ31tX3sw7muXGb6wurcPSIotzbM93AIT5cei6dTc/f3Oz3
	tCFp+oE3VJIe0Ap0LipWO1233bETKEnZFvcb5NfRfcqxYkpEukrX2qsA/wbQqjEBU4A4
	K7T6stiFEreryd6Y+qLLLXMSaXse1dwY8HuMmhibNz8qEPdWphy8C6TItauJZc3+Acwx
	e1iQ==
X-Gm-Message-State: APjAAAW4n8B95dkXXEyVzBONLRPivkzDngDN+9In7gkAMxrmIz5ZiLWG
	LJp6uqEUTLvPoAne7IBd8YNugg==
X-Google-Smtp-Source: APXvYqxJuGfM/8WOBGep+SmJ6LLdsnWULNoYX2FfsgUCqsSEV+3gjCfQbmSagDu0KtvY3LdWGK3TWw==
X-Received: by 2002:a1f:728b:: with SMTP id n133mr42422085vkc.84.1564427422314;
	Mon, 29 Jul 2019 12:10:22 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	i137sm29091929vkd.24.2019.07.29.12.10.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 12:10:21 -0700 (PDT)
Date: Mon, 29 Jul 2019 15:10:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190729143622-mutt-send-email-mst@kernel.org>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-2-sgarzare@redhat.com>
	<20190729095956-mutt-send-email-mst@kernel.org>
	<20190729153656.zk4q4rob5oi6iq7l@steredhat>
	<20190729114302-mutt-send-email-mst@kernel.org>
	<20190729161903.yhaj5rfcvleexkhc@steredhat>
	<20190729165056.r32uzj6om3o6vfvp@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729165056.r32uzj6om3o6vfvp@steredhat>
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

On Mon, Jul 29, 2019 at 06:50:56PM +0200, Stefano Garzarella wrote:
> On Mon, Jul 29, 2019 at 06:19:03PM +0200, Stefano Garzarella wrote:
> > On Mon, Jul 29, 2019 at 11:49:02AM -0400, Michael S. Tsirkin wrote:
> > > On Mon, Jul 29, 2019 at 05:36:56PM +0200, Stefano Garzarella wrote:
> > > > On Mon, Jul 29, 2019 at 10:04:29AM -0400, Michael S. Tsirkin wrote:
> > > > > On Wed, Jul 17, 2019 at 01:30:26PM +0200, Stefano Garzarella wrote:
> > > > > > Since virtio-vsock was introduced, the buffers filled by the host
> > > > > > and pushed to the guest using the vring, are directly queued in
> > > > > > a per-socket list. These buffers are preallocated by the guest
> > > > > > with a fixed size (4 KB).
> > > > > > 
> > > > > > The maximum amount of memory used by each socket should be
> > > > > > controlled by the credit mechanism.
> > > > > > The default credit available per-socket is 256 KB, but if we use
> > > > > > only 1 byte per packet, the guest can queue up to 262144 of 4 KB
> > > > > > buffers, using up to 1 GB of memory per-socket. In addition, the
> > > > > > guest will continue to fill the vring with new 4 KB free buffers
> > > > > > to avoid starvation of other sockets.
> > > > > > 
> > > > > > This patch mitigates this issue copying the payload of small
> > > > > > packets (< 128 bytes) into the buffer of last packet queued, in
> > > > > > order to avoid wasting memory.
> > > > > > 
> > > > > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > > 
> > > > > This is good enough for net-next, but for net I think we
> > > > > should figure out how to address the issue completely.
> > > > > Can we make the accounting precise? What happens to
> > > > > performance if we do?
> > > > > 
> > > > 
> > > > In order to do more precise accounting maybe we can use the buffer size,
> > > > instead of payload size when we update the credit available.
> > > > In this way, the credit available for each socket will reflect the memory
> > > > actually used.
> > > > 
> > > > I should check better, because I'm not sure what happen if the peer sees
> > > > 1KB of space available, then it sends 1KB of payload (using a 4KB
> > > > buffer).
> > > > 
> > > > The other option is to copy each packet in a new buffer like I did in
> > > > the v2 [2], but this forces us to make a copy for each packet that does
> > > > not fill the entire buffer, perhaps too expensive.
> > > > 
> > > > [2] https://patchwork.kernel.org/patch/10938741/
> > > > 
> > > > 
> > > > Thanks,
> > > > Stefano
> > > 
> > > Interesting. You are right, and at some level the protocol forces copies.
> > > 
> > > We could try to detect that the actual memory is getting close to
> > > admin limits and force copies on queued packets after the fact.
> > > Is that practical?
> > 
> > Yes, I think it is doable!
> > We can decrease the credit available with the buffer size queued, and
> > when the buffer size of packet to queue is bigger than the credit
> > available, we can copy it.
> > 
> > > 
> > > And yes we can extend the credit accounting to include buffer size.
> > > That's a protocol change but maybe it makes sense.
> > 
> > Since we send to the other peer the credit available, maybe this
> > change can be backwards compatible (I'll check better this).
> 
> What I said was wrong.
> 
> We send a counter (increased when the user consumes the packets) and the
> "buf_alloc" (the max memory allowed) to the other peer.
> It makes a difference between a local counter (increased when the
> packets are sent) and the remote counter to calculate the credit available:
> 
>     u32 virtio_transport_get_credit(struct virtio_vsock_sock *vvs, u32 credit)
>     {
>     	u32 ret;
> 
>     	spin_lock_bh(&vvs->tx_lock);
>     	ret = vvs->peer_buf_alloc - (vvs->tx_cnt - vvs->peer_fwd_cnt);
>     	if (ret > credit)
>     		ret = credit;
>     	vvs->tx_cnt += ret;
>     	spin_unlock_bh(&vvs->tx_lock);
> 
>     	return ret;
>     }
> 
> Maybe I can play with "buf_alloc" to take care of bytes queued but not
> used.
> 
> Thanks,
> Stefano

Right. And the idea behind it all was that if we send a credit
to remote then we have space for it.
I think the basic idea was that if we have actual allocated
memory and can copy data there, then we send the credit to
remote.

Of course that means an extra copy every packet.
So as an optimization, it seems that we just assume
that we will be able to allocate a new buffer.

First this is not the best we can do. We can actually do
allocate memory in the socket before sending credit.
If packet is small then we copy it there.
If packet is big then we queue the packet,
take the buffer out of socket and add it to the virtqueue.

Second question is what to do about medium sized packets.
Packet is 1K but buffer is 4K, what do we do?
And here I wonder - why don't we add the 3K buffer
to the vq?



-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
