Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F393A5A7B
	for <lists.virtualization@lfdr.de>; Mon,  2 Sep 2019 17:24:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 000AFE5A;
	Mon,  2 Sep 2019 15:24:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5DCAFE4F
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 15:24:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B105B8A3
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 15:24:01 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18391C057F20
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 15:24:01 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id e18so16114029qkl.17
	for <virtualization@lists.linux-foundation.org>;
	Mon, 02 Sep 2019 08:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=0dOE/s5aGMTaYQho5LnEBg+diYxedKuGjy+hs3paf9w=;
	b=sFJwwprd0HEQpPAZpadXg8XQSnHsOweR768lvrEjEPMRNyHqZR97gbsJQ45yFh8RgP
	l5LcMKgpQF/USWfo9KLDQWGU0TJVIoVQsgzNX8vCP57pdPsxB7Jn8dh+pEBVFApQzGLd
	m+vOo8jAb/DwoZiFoh7uyaf313omelRLwfLUYajRRkS15QQ0xz2H8zYaPi4nQDbjr1F0
	VDs30Om1FMrFdGD6YLJ0SIWxmvD2O0f1Qb5UHA5cU+6Foe1UZJhXzFMcpjNM3TJUfyYH
	2rfIhqZdOAAfodP5VoU+iIrF6o0fzf8KWR1zIZqU/ZM4gDdODMyI1GWpWMLizDAqpD/C
	WpDA==
X-Gm-Message-State: APjAAAXwWwdBt0/sQLle9iPDBLeHcA62BGu34DY+eKOhfph93h7yvcZR
	5a+79qlQDhTmoL5KxtwerO0mUVy2iqUI5O9MwjAYYjz0juAJFac7AAn2enKenfCdSdpFmw++55P
	FLWddg/imGJfOIQbT3Ou0AmeQ9q/k7RM+mBlZqMLUEg==
X-Received: by 2002:a37:a902:: with SMTP id s2mr7484048qke.239.1567437840442; 
	Mon, 02 Sep 2019 08:24:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdrmSh6InBMfIaGf/YSE3mcHFndLjsfUZ2b3BKi/lKrrfRBzrj9Xma+aSpsn1+nw5QdrjzxQ==
X-Received: by 2002:a37:a902:: with SMTP id s2mr7484034qke.239.1567437840277; 
	Mon, 02 Sep 2019 08:24:00 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
	by smtp.gmail.com with ESMTPSA id
	l206sm7034136qke.33.2019.09.02.08.23.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 08:23:59 -0700 (PDT)
Date: Mon, 2 Sep 2019 11:23:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190902112317-mutt-send-email-mst@kernel.org>
References: <20190729165056.r32uzj6om3o6vfvp@steredhat>
	<20190729143622-mutt-send-email-mst@kernel.org>
	<20190730093539.dcksure3vrykir3g@steredhat>
	<20190730163807-mutt-send-email-mst@kernel.org>
	<20190801104754.lb3ju5xjfmnxioii@steredhat>
	<20190801091106-mutt-send-email-mst@kernel.org>
	<20190801133616.sik5drn6ecesukbb@steredhat>
	<20190901025815-mutt-send-email-mst@kernel.org>
	<20190901061707-mutt-send-email-mst@kernel.org>
	<20190902095723.6vuvp73fdunmiogo@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902095723.6vuvp73fdunmiogo@steredhat>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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

On Mon, Sep 02, 2019 at 11:57:23AM +0200, Stefano Garzarella wrote:
> On Sun, Sep 01, 2019 at 06:17:58AM -0400, Michael S. Tsirkin wrote:
> > On Sun, Sep 01, 2019 at 04:26:19AM -0400, Michael S. Tsirkin wrote:
> > > On Thu, Aug 01, 2019 at 03:36:16PM +0200, Stefano Garzarella wrote:
> > > > On Thu, Aug 01, 2019 at 09:21:15AM -0400, Michael S. Tsirkin wrote:
> > > > > On Thu, Aug 01, 2019 at 12:47:54PM +0200, Stefano Garzarella wrote:
> > > > > > On Tue, Jul 30, 2019 at 04:42:25PM -0400, Michael S. Tsirkin wrote:
> > > > > > > On Tue, Jul 30, 2019 at 11:35:39AM +0200, Stefano Garzarella wrote:
> > > > > > 
> > > > > > (...)
> > > > > > 
> > > > > > > > 
> > > > > > > > The problem here is the compatibility. Before this series virtio-vsock
> > > > > > > > and vhost-vsock modules had the RX buffer size hard-coded
> > > > > > > > (VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE = 4K). So, if we send a buffer smaller
> > > > > > > > of 4K, there might be issues.
> > > > > > > 
> > > > > > > Shouldn't be if they are following the spec. If not let's fix
> > > > > > > the broken parts.
> > > > > > > 
> > > > > > > > 
> > > > > > > > Maybe it is the time to add add 'features' to virtio-vsock device.
> > > > > > > > 
> > > > > > > > Thanks,
> > > > > > > > Stefano
> > > > > > > 
> > > > > > > Why would a remote care about buffer sizes?
> > > > > > > 
> > > > > > > Let's first see what the issues are. If they exist
> > > > > > > we can either fix the bugs, or code the bug as a feature in spec.
> > > > > > > 
> > > > > > 
> > > > > > The vhost_transport '.stream_enqueue' callback
> > > > > > [virtio_transport_stream_enqueue()] calls the virtio_transport_send_pkt_info(),
> > > > > > passing the user message. This function allocates a new packet, copying
> > > > > > the user message, but (before this series) it limits the packet size to
> > > > > > the VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE (4K):
> > > > > > 
> > > > > > static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
> > > > > > 					  struct virtio_vsock_pkt_info *info)
> > > > > > {
> > > > > >  ...
> > > > > > 	/* we can send less than pkt_len bytes */
> > > > > > 	if (pkt_len > VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE)
> > > > > > 		pkt_len = VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE;
> > > > > > 
> > > > > > 	/* virtio_transport_get_credit might return less than pkt_len credit */
> > > > > > 	pkt_len = virtio_transport_get_credit(vvs, pkt_len);
> > > > > > 
> > > > > > 	/* Do not send zero length OP_RW pkt */
> > > > > > 	if (pkt_len == 0 && info->op == VIRTIO_VSOCK_OP_RW)
> > > > > > 		return pkt_len;
> > > > > >  ...
> > > > > > }
> > > > > > 
> > > > > > then it queues the packet for the TX worker calling .send_pkt()
> > > > > > [vhost_transport_send_pkt() in the vhost_transport case]
> > > > > > 
> > > > > > The main function executed by the TX worker is
> > > > > > vhost_transport_do_send_pkt() that picks up a buffer from the virtqueue
> > > > > > and it tries to copy the packet (up to 4K) on it.  If the buffer
> > > > > > allocated from the guest will be smaller then 4K, I think here it will
> > > > > > be discarded with an error:
> > > > > > 
> > > > 
> > > > I'm adding more lines to explain better.
> > > > 
> > > > > > static void
> > > > > > vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> > > > > > 				struct vhost_virtqueue *vq)
> > > > > > {
> > > > 		...
> > > > 
> > > > 		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
> > > > 					 &out, &in, NULL, NULL);
> > > > 
> > > > 		...
> > > > 
> > > > 		len = iov_length(&vq->iov[out], in);
> > > > 		iov_iter_init(&iov_iter, READ, &vq->iov[out], in, len);
> > > > 
> > > > 		nbytes = copy_to_iter(&pkt->hdr, sizeof(pkt->hdr), &iov_iter);
> > > > 		if (nbytes != sizeof(pkt->hdr)) {
> > > > 			virtio_transport_free_pkt(pkt);
> > > > 			vq_err(vq, "Faulted on copying pkt hdr\n");
> > > > 			break;
> > > > 		}
> > > > 
> > > > > >  ...
> > > > > > 		nbytes = copy_to_iter(pkt->buf, pkt->len, &iov_iter);
> > > > > 
> > > > > isn't pck len the actual length though?
> > > > > 
> > > > 
> > > > It is the length of the packet that we are copying in the guest RX
> > > > buffers pointed by the iov_iter. The guest allocates an iovec with 2
> > > > buffers, one for the header and one for the payload (4KB).
> > > 
> > > BTW at the moment that forces another kmalloc within virtio core. Maybe
> > > vsock needs a flag to skip allocation in this case.  Worth benchmarking.
> > > See virtqueue_use_indirect which just does total_sg > 1.
> 
> Okay, I'll take a look at virtqueue_use_indirect and I'll do some
> benchmarking.
> 
> > > 
> > > > 
> > > > > > 		if (nbytes != pkt->len) {
> > > > > > 			virtio_transport_free_pkt(pkt);
> > > > > > 			vq_err(vq, "Faulted on copying pkt buf\n");
> > > > > > 			break;
> > > > > > 		}
> > > > > >  ...
> > > > > > }
> > > > > > 
> > > > > > 
> > > > > > This series changes this behavior since now we will split the packet in
> > > > > > vhost_transport_do_send_pkt() depending on the buffer found in the
> > > > > > virtqueue.
> > > > > > 
> > > > > > We didn't change the buffer size in this series, so we still backward
> > > > > > compatible, but if we will use buffers smaller than 4K, we should
> > > > > > encounter the error described above.
> > > 
> > > So that's an implementation bug then? It made an assumption
> > > of a 4K sized buffer? Or even PAGE_SIZE sized buffer?
> 
> Yes, I think it made an assumption and it used this macro as a limit:
> 
> include/linux/virtio_vsock.h:13:
>     #define VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE        (1024 * 4)
> 
> > 
> > Assuming we miss nothing and buffers < 4K are broken,
> > I think we need to add this to the spec, possibly with
> > a feature bit to relax the requirement that all buffers
> > are at least 4k in size.
> > 
> 
> Okay, should I send a proposal to virtio-dev@lists.oasis-open.org?
> 
> Thanks,
> Stefano

virtio-comment is more appropriate for this.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
