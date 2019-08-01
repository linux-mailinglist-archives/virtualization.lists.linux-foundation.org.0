Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 666887DCB3
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 15:42:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8264313F8;
	Thu,  1 Aug 2019 13:39:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B4BE1B1F1
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 13:21:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 355307ED
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 13:21:24 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 201so51926368qkm.9
	for <virtualization@lists.linux-foundation.org>;
	Thu, 01 Aug 2019 06:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=OarH4MGoiUzfGjFt4JlhO3847Zf6iFLmY9ihGc4jX/c=;
	b=CD0XUj61pFtNPv8nDKmzut6SrIwKLP7WAmCyghCwHSB7sMLZWCKV/+co4yiN+USu25
	CcJIcxKzLg5YIcMPdMUDrTnhszwhlz8mvpPJcptqgN1367E5hVRiSZqNEZt9dOfW9yZ9
	1mr68/STBNg0j5L0B1WxZ93y4Axgv4s413ap79NPd10Al+m78xk9dhq7ccCDkBbIcfCf
	kMDgkIO61ZGaAJ829vkBL0GrZrOqD6d6EOmKCJhC1kmq2gFrF/vhGuQl+ZxSi9Mzng+N
	Uj0tjVkIEFYCToGyxKZb6IsXqthpBWBKELS6fqntoC4FGBLUuuTVBzRev307JfoCFw2C
	8pSA==
X-Gm-Message-State: APjAAAUnn3xd2VcHKEs/QS5G4SizH8vN33JB2jRP6Bq32GlYlxYeAS4F
	bwv4QbiwzeuOPB6ADi6JMoC4yQ==
X-Google-Smtp-Source: APXvYqyYRLicuzFzqTF12WwnRbyEXTh4lTFYhUy0rhdQUw4OnykYSR/cOQf5ecxmZB/mPxkhrv0g4A==
X-Received: by 2002:ae9:ea06:: with SMTP id f6mr81509370qkg.262.1564665683354; 
	Thu, 01 Aug 2019 06:21:23 -0700 (PDT)
Received: from redhat.com ([147.234.38.1]) by smtp.gmail.com with ESMTPSA id
	j8sm30433876qki.85.2019.08.01.06.21.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 01 Aug 2019 06:21:22 -0700 (PDT)
Date: Thu, 1 Aug 2019 09:21:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190801091106-mutt-send-email-mst@kernel.org>
References: <20190717113030.163499-2-sgarzare@redhat.com>
	<20190729095956-mutt-send-email-mst@kernel.org>
	<20190729153656.zk4q4rob5oi6iq7l@steredhat>
	<20190729114302-mutt-send-email-mst@kernel.org>
	<20190729161903.yhaj5rfcvleexkhc@steredhat>
	<20190729165056.r32uzj6om3o6vfvp@steredhat>
	<20190729143622-mutt-send-email-mst@kernel.org>
	<20190730093539.dcksure3vrykir3g@steredhat>
	<20190730163807-mutt-send-email-mst@kernel.org>
	<20190801104754.lb3ju5xjfmnxioii@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801104754.lb3ju5xjfmnxioii@steredhat>
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

On Thu, Aug 01, 2019 at 12:47:54PM +0200, Stefano Garzarella wrote:
> On Tue, Jul 30, 2019 at 04:42:25PM -0400, Michael S. Tsirkin wrote:
> > On Tue, Jul 30, 2019 at 11:35:39AM +0200, Stefano Garzarella wrote:
> 
> (...)
> 
> > > 
> > > The problem here is the compatibility. Before this series virtio-vsock
> > > and vhost-vsock modules had the RX buffer size hard-coded
> > > (VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE = 4K). So, if we send a buffer smaller
> > > of 4K, there might be issues.
> > 
> > Shouldn't be if they are following the spec. If not let's fix
> > the broken parts.
> > 
> > > 
> > > Maybe it is the time to add add 'features' to virtio-vsock device.
> > > 
> > > Thanks,
> > > Stefano
> > 
> > Why would a remote care about buffer sizes?
> > 
> > Let's first see what the issues are. If they exist
> > we can either fix the bugs, or code the bug as a feature in spec.
> > 
> 
> The vhost_transport '.stream_enqueue' callback
> [virtio_transport_stream_enqueue()] calls the virtio_transport_send_pkt_info(),
> passing the user message. This function allocates a new packet, copying
> the user message, but (before this series) it limits the packet size to
> the VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE (4K):
> 
> static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
> 					  struct virtio_vsock_pkt_info *info)
> {
>  ...
> 	/* we can send less than pkt_len bytes */
> 	if (pkt_len > VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE)
> 		pkt_len = VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE;
> 
> 	/* virtio_transport_get_credit might return less than pkt_len credit */
> 	pkt_len = virtio_transport_get_credit(vvs, pkt_len);
> 
> 	/* Do not send zero length OP_RW pkt */
> 	if (pkt_len == 0 && info->op == VIRTIO_VSOCK_OP_RW)
> 		return pkt_len;
>  ...
> }
> 
> then it queues the packet for the TX worker calling .send_pkt()
> [vhost_transport_send_pkt() in the vhost_transport case]
> 
> The main function executed by the TX worker is
> vhost_transport_do_send_pkt() that picks up a buffer from the virtqueue
> and it tries to copy the packet (up to 4K) on it.  If the buffer
> allocated from the guest will be smaller then 4K, I think here it will
> be discarded with an error:
> 
> static void
> vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 				struct vhost_virtqueue *vq)
> {
>  ...
> 		nbytes = copy_to_iter(pkt->buf, pkt->len, &iov_iter);

isn't pck len the actual length though?

> 		if (nbytes != pkt->len) {
> 			virtio_transport_free_pkt(pkt);
> 			vq_err(vq, "Faulted on copying pkt buf\n");
> 			break;
> 		}
>  ...
> }
> 
> 
> This series changes this behavior since now we will split the packet in
> vhost_transport_do_send_pkt() depending on the buffer found in the
> virtqueue.
> 
> We didn't change the buffer size in this series, so we still backward
> compatible, but if we will use buffers smaller than 4K, we should
> encounter the error described above.
> 
> How do you suggest we proceed if we want to change the buffer size?
> Maybe adding a feature to "support any buffer size"?
> 
> Thanks,
> Stefano


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
