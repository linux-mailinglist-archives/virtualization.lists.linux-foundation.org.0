Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38E7B486
	for <lists.virtualization@lfdr.de>; Tue, 30 Jul 2019 22:50:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C3CA23343;
	Tue, 30 Jul 2019 20:50:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7385B311D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 20:42:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B30AEA8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 20:42:32 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id g11so3509082uak.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 13:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=h4kyAN8zAS9Uf4irFUDSjqH9ZWhN5E7zurQwgpnPXwU=;
	b=ZiSwJNSzWWgzlddcwMoXqqnVqKA9wML7X7azUb1ZqRjK3v17WqDnkpODhh7AfxXHxu
	2DmgKdKf7nZKIReUaSvtN5zukX/Z6+AHGtl8m3myA+RGv87HDPWzA1kqDeo+eoGM26Vb
	yfcwfaIxZksLQ2zlTuPsr1dIqoBACE4elwVDRPPJ3Rsfz3xFJRI+muENywMvgLtkgI9z
	SfcSXj/fHVeCBMAjr4iQkhfPfHco5QMEFxMzZiBqY+yNo6Ju8kweT3SLcaWmLL05c/72
	WHyDeG/RA9Jllmfc8TpHcoOdr6xICssJ0ZmD4LAuknNPPPnEnYP8fL3KxUiqQDSs+ctQ
	LCzg==
X-Gm-Message-State: APjAAAUrCSk5rrYr64k9hjB0SKGk/NyfyLEAMsQZsvh0U1ETFMjeZgCf
	fu0BFvAsabl9ZcZEJoyW6lRIjQ==
X-Google-Smtp-Source: APXvYqzuofIoIgW0NFQRZMAF5gCoA5QsmaeHY7a5l8LrRfDIeWZx1zRIzcCUI7+E/DfBxSmEXTf/9g==
X-Received: by 2002:ab0:64cc:: with SMTP id j12mr25828664uaq.110.1564519351815;
	Tue, 30 Jul 2019 13:42:31 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	i137sm31392254vkd.24.2019.07.30.13.42.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 30 Jul 2019 13:42:30 -0700 (PDT)
Date: Tue, 30 Jul 2019 16:42:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190730163807-mutt-send-email-mst@kernel.org>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-2-sgarzare@redhat.com>
	<20190729095956-mutt-send-email-mst@kernel.org>
	<20190729153656.zk4q4rob5oi6iq7l@steredhat>
	<20190729114302-mutt-send-email-mst@kernel.org>
	<20190729161903.yhaj5rfcvleexkhc@steredhat>
	<20190729165056.r32uzj6om3o6vfvp@steredhat>
	<20190729143622-mutt-send-email-mst@kernel.org>
	<20190730093539.dcksure3vrykir3g@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730093539.dcksure3vrykir3g@steredhat>
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

On Tue, Jul 30, 2019 at 11:35:39AM +0200, Stefano Garzarella wrote:
> On Mon, Jul 29, 2019 at 03:10:15PM -0400, Michael S. Tsirkin wrote:
> > On Mon, Jul 29, 2019 at 06:50:56PM +0200, Stefano Garzarella wrote:
> > > On Mon, Jul 29, 2019 at 06:19:03PM +0200, Stefano Garzarella wrote:
> > > > On Mon, Jul 29, 2019 at 11:49:02AM -0400, Michael S. Tsirkin wrote:
> > > > > On Mon, Jul 29, 2019 at 05:36:56PM +0200, Stefano Garzarella wrote:
> > > > > > On Mon, Jul 29, 2019 at 10:04:29AM -0400, Michael S. Tsirkin wrote:
> > > > > > > On Wed, Jul 17, 2019 at 01:30:26PM +0200, Stefano Garzarella wrote:
> > > > > > > > Since virtio-vsock was introduced, the buffers filled by the host
> > > > > > > > and pushed to the guest using the vring, are directly queued in
> > > > > > > > a per-socket list. These buffers are preallocated by the guest
> > > > > > > > with a fixed size (4 KB).
> > > > > > > > 
> > > > > > > > The maximum amount of memory used by each socket should be
> > > > > > > > controlled by the credit mechanism.
> > > > > > > > The default credit available per-socket is 256 KB, but if we use
> > > > > > > > only 1 byte per packet, the guest can queue up to 262144 of 4 KB
> > > > > > > > buffers, using up to 1 GB of memory per-socket. In addition, the
> > > > > > > > guest will continue to fill the vring with new 4 KB free buffers
> > > > > > > > to avoid starvation of other sockets.
> > > > > > > > 
> > > > > > > > This patch mitigates this issue copying the payload of small
> > > > > > > > packets (< 128 bytes) into the buffer of last packet queued, in
> > > > > > > > order to avoid wasting memory.
> > > > > > > > 
> > > > > > > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > > > > 
> > > > > > > This is good enough for net-next, but for net I think we
> > > > > > > should figure out how to address the issue completely.
> > > > > > > Can we make the accounting precise? What happens to
> > > > > > > performance if we do?
> > > > > > > 
> > > > > > 
> > > > > > In order to do more precise accounting maybe we can use the buffer size,
> > > > > > instead of payload size when we update the credit available.
> > > > > > In this way, the credit available for each socket will reflect the memory
> > > > > > actually used.
> > > > > > 
> > > > > > I should check better, because I'm not sure what happen if the peer sees
> > > > > > 1KB of space available, then it sends 1KB of payload (using a 4KB
> > > > > > buffer).
> > > > > > 
> > > > > > The other option is to copy each packet in a new buffer like I did in
> > > > > > the v2 [2], but this forces us to make a copy for each packet that does
> > > > > > not fill the entire buffer, perhaps too expensive.
> > > > > > 
> > > > > > [2] https://patchwork.kernel.org/patch/10938741/
> > > > > > 
> > > > > > 
> > > > > > Thanks,
> > > > > > Stefano
> > > > > 
> > > > > Interesting. You are right, and at some level the protocol forces copies.
> > > > > 
> > > > > We could try to detect that the actual memory is getting close to
> > > > > admin limits and force copies on queued packets after the fact.
> > > > > Is that practical?
> > > > 
> > > > Yes, I think it is doable!
> > > > We can decrease the credit available with the buffer size queued, and
> > > > when the buffer size of packet to queue is bigger than the credit
> > > > available, we can copy it.
> > > > 
> > > > > 
> > > > > And yes we can extend the credit accounting to include buffer size.
> > > > > That's a protocol change but maybe it makes sense.
> > > > 
> > > > Since we send to the other peer the credit available, maybe this
> > > > change can be backwards compatible (I'll check better this).
> > > 
> > > What I said was wrong.
> > > 
> > > We send a counter (increased when the user consumes the packets) and the
> > > "buf_alloc" (the max memory allowed) to the other peer.
> > > It makes a difference between a local counter (increased when the
> > > packets are sent) and the remote counter to calculate the credit available:
> > > 
> > >     u32 virtio_transport_get_credit(struct virtio_vsock_sock *vvs, u32 credit)
> > >     {
> > >     	u32 ret;
> > > 
> > >     	spin_lock_bh(&vvs->tx_lock);
> > >     	ret = vvs->peer_buf_alloc - (vvs->tx_cnt - vvs->peer_fwd_cnt);
> > >     	if (ret > credit)
> > >     		ret = credit;
> > >     	vvs->tx_cnt += ret;
> > >     	spin_unlock_bh(&vvs->tx_lock);
> > > 
> > >     	return ret;
> > >     }
> > > 
> > > Maybe I can play with "buf_alloc" to take care of bytes queued but not
> > > used.
> > > 
> > > Thanks,
> > > Stefano
> > 
> > Right. And the idea behind it all was that if we send a credit
> > to remote then we have space for it.
> 
> Yes.
> 
> > I think the basic idea was that if we have actual allocated
> > memory and can copy data there, then we send the credit to
> > remote.
> > 
> > Of course that means an extra copy every packet.
> > So as an optimization, it seems that we just assume
> > that we will be able to allocate a new buffer.
> 
> Yes, we refill the virtqueue when half of the buffers were used.
> 
> > 
> > First this is not the best we can do. We can actually do
> > allocate memory in the socket before sending credit.
> 
> In this case, IIUC we should allocate an entire buffer (4KB),
> so we can reuse it if the packet is big.
> 
> > If packet is small then we copy it there.
> > If packet is big then we queue the packet,
> > take the buffer out of socket and add it to the virtqueue.
> > 
> > Second question is what to do about medium sized packets.
> > Packet is 1K but buffer is 4K, what do we do?
> > And here I wonder - why don't we add the 3K buffer
> > to the vq?
> 
> This would allow us to have an accurate credit account.
> 
> The problem here is the compatibility. Before this series virtio-vsock
> and vhost-vsock modules had the RX buffer size hard-coded
> (VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE = 4K). So, if we send a buffer smaller
> of 4K, there might be issues.

Shouldn't be if they are following the spec. If not let's fix
the broken parts.

> 
> Maybe it is the time to add add 'features' to virtio-vsock device.
> 
> Thanks,
> Stefano

Why would a remote care about buffer sizes?

Let's first see what the issues are. If they exist
we can either fix the bugs, or code the bug as a feature in spec.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
