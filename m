Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C98C921550
	for <lists.virtualization@lfdr.de>; Fri, 17 May 2019 10:25:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EAB8AA49;
	Fri, 17 May 2019 08:25:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ECD94941
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 08:25:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3D9C287B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 08:25:10 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c5so6089515wrs.11
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 01:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cULMJDOvF9eVDSo9dp6+c4o/bcGy8xGnvE5CwRJMTP8=;
	b=aGgB7NqyPa6kZeG/tIbiHm/pdGT9D2qTo2EtheH9StYvso2cMuyGkISO+oBAXel5pq
	kgPXKq/0Y6gIk0EIrXSVPKVXwGMnBi6RXwSIgVdspfnOq9dP5hP5w9YPgPkKPv9i0+th
	7XnUDJwMNO5Lm3/xK4+Rrg4c1aNTS8rm0y0CjEivjRqf1FlhxA2ZynuVYA1d+1obR+h+
	eU3fxHX4Mi1HoixkivFgc/Ysg9ZWr6IWybFenjTfIiLB0YP/prU5gc8ZuGTI1zirG7+K
	QzVYJ+ysLrPCM+Nw0zwOJSgfYhqXvhn2R/O2aglBZiycx71Hl/2X2EcKiqOUkDV3mzTd
	8Rug==
X-Gm-Message-State: APjAAAWMS4fKXoJKFHCRq3HeWb83ogwo344EB7fdpxH1yyaoJCExvB01
	CTsWAELWdFGXoEWh5aZUKSXwrQ==
X-Google-Smtp-Source: APXvYqx44DAzcoMxwbPxDzA5zwUNnPhQ9uXSTLL/mcvCVkyoGjdl0B2O21dlBn3vcpThmyUCCK30Hw==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr17663814wru.91.1558081508824; 
	Fri, 17 May 2019 01:25:08 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151]) by smtp.gmail.com with ESMTPSA id
	l18sm7415127wrv.38.2019.05.17.01.25.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 May 2019 01:25:08 -0700 (PDT)
Date: Fri, 17 May 2019 10:25:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 1/8] vsock/virtio: limit the memory used per-socket
Message-ID: <20190517082505.ibjkuh7zibumen77@steredhat>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-2-sgarzare@redhat.com>
	<20190516152533.GB29808@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516152533.GB29808@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
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

On Thu, May 16, 2019 at 04:25:33PM +0100, Stefan Hajnoczi wrote:
> On Fri, May 10, 2019 at 02:58:36PM +0200, Stefano Garzarella wrote:
> > +struct virtio_vsock_buf {
> 
> Please add a comment describing the purpose of this struct and to
> differentiate its use from struct virtio_vsock_pkt.
> 

Sure, I'll fix it.

> > +static struct virtio_vsock_buf *
> > +virtio_transport_alloc_buf(struct virtio_vsock_pkt *pkt, bool zero_copy)
> > +{
> > +	struct virtio_vsock_buf *buf;
> > +
> > +	if (pkt->len == 0)
> > +		return NULL;
> > +
> > +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> > +	if (!buf)
> > +		return NULL;
> > +
> > +	/* If the buffer in the virtio_vsock_pkt is full, we can move it to
> > +	 * the new virtio_vsock_buf avoiding the copy, because we are sure that
> > +	 * we are not use more memory than that counted by the credit mechanism.
> > +	 */
> > +	if (zero_copy && pkt->len == pkt->buf_len) {
> > +		buf->addr = pkt->buf;
> > +		pkt->buf = NULL;
> > +	} else {
> > +		buf->addr = kmalloc(pkt->len, GFP_KERNEL);
> 
> buf and buf->addr could be allocated in a single call, though I'm not
> sure how big an optimization this is.
> 

IIUC, in the case of zero-copy I should allocate only the buf,
otherwise I should allocate both buf and buf->addr in a single call
when I'm doing a full-copy.

Is it correct?

> > @@ -841,20 +882,24 @@ virtio_transport_recv_connected(struct sock *sk,
> >  {
> >  	struct vsock_sock *vsk = vsock_sk(sk);
> >  	struct virtio_vsock_sock *vvs = vsk->trans;
> > +	struct virtio_vsock_buf *buf;
> >  	int err = 0;
> >  
> >  	switch (le16_to_cpu(pkt->hdr.op)) {
> >  	case VIRTIO_VSOCK_OP_RW:
> >  		pkt->len = le32_to_cpu(pkt->hdr.len);
> > -		pkt->off = 0;
> > +		buf = virtio_transport_alloc_buf(pkt, true);
> >  
> > -		spin_lock_bh(&vvs->rx_lock);
> > -		virtio_transport_inc_rx_pkt(vvs, pkt);
> > -		list_add_tail(&pkt->list, &vvs->rx_queue);
> > -		spin_unlock_bh(&vvs->rx_lock);
> > +		if (buf) {
> > +			spin_lock_bh(&vvs->rx_lock);
> > +			virtio_transport_inc_rx_pkt(vvs, pkt->len);
> > +			list_add_tail(&buf->list, &vvs->rx_queue);
> > +			spin_unlock_bh(&vvs->rx_lock);
> >  
> > -		sk->sk_data_ready(sk);
> > -		return err;
> > +			sk->sk_data_ready(sk);
> > +		}
> 
> The return value of this function isn't used but the code still makes an
> effort to return errors.  Please return -ENOMEM when buf == NULL.
> 
> If you'd like to remove the return value that's fine too, but please do
> it for the whole function to be consistent.

I'll return -ENOMEM when the allocation fails.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
