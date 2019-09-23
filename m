Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC2DBBC1E
	for <lists.virtualization@lfdr.de>; Mon, 23 Sep 2019 21:16:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 545D4107B;
	Mon, 23 Sep 2019 19:16:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CB5A31075
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 19:16:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 29E3D108
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 19:16:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x2so11230916wmj.2
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 12:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=N70iF5Ril6x+kuthj8owD8WnByk3GKR1KwVknhgziqU=;
	b=Vtr+dwiIKuQXiTZgLPj4hl0kz+dzNFsR+hqcNBFDW1cVsTXQep+fbZMAU+8ju7Gax6
	KeheXQJmc1K25xdMbr6V+n4XAKwyZDNmqYPR71TD38unLK7dMvP0N8fU/72JpcVTGwxq
	pCowQWgcKtkdGnYId6LE2v0+uGmpauqCD8jtJ/ki6rL6HhmGu0J2Hd7nF/ftTw6XKvoN
	oUXjZYnmm669opWAoZP5rIMP4Y33t2dANKkholNH8D6+ImmZBJ9b2GS5EiCVOWKfieQC
	HSHOt6l0ZYqN5r0OrcrzK2dWYZgDNPTKmcGtfyF2+zFXe2Jk5s8txvAptiNMsZ9dg0L5
	FqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=N70iF5Ril6x+kuthj8owD8WnByk3GKR1KwVknhgziqU=;
	b=qbfeg3XOnkesGybNsxqmJyVWysXFpJlRPksxB2mHPXJ1RyzB5Rjsv/Q0ZnKekx8DlE
	mGINnyjIbTuicSO0ADq0xLXIPuZaikU3+nTqwXwCzei+O2siRGOkRCtvQzqe9QPZ0oNy
	tFoTFG27Kw5qAzvzzWnu9LC6dY7cXRWX0i6Pnkz8jfyBp5H0H1SnydvLi2D7nJP7gb8P
	4srFz6FavSDNJrIOBJpAcs8j0j2b5taGKnqgvGJ6+n2CaWHfYgTn95iTOLrRZIX2kgza
	TnXz0C9no9Ye9Ubv6aEAOSuffiLmYa73ktBl5A07O36FhXCIVIVKkDQi7CE83Y/cV7Gs
	3QMQ==
X-Gm-Message-State: APjAAAWbd7ugfOaToHURy1PrepxPAqsQGWi/76MTtaznpN2NEeU4RfQV
	Up7VA3/ZBA+hUYQ6WQXTQtg=
X-Google-Smtp-Source: APXvYqxljmMAEInhWmJYkQWWGT84zJm46FmLzQjSt99ud97QP62BxVPMRy6+h1u4JbXwo4frrDLQKA==
X-Received: by 2002:a1c:a94b:: with SMTP id s72mr853673wme.9.1569266193606;
	Mon, 23 Sep 2019 12:16:33 -0700 (PDT)
Received: from scw-93ddc8.cloud.online.net ([2001:bc8:4400:2400::302d])
	by smtp.gmail.com with ESMTPSA id
	r28sm24038655wrr.94.2019.09.23.12.16.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Sep 2019 12:16:33 -0700 (PDT)
Date: Mon, 23 Sep 2019 19:16:26 +0000
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC] VSOCK: add support for MSG_PEEK
Message-ID: <20190923191626.GA2342@scw-93ddc8.cloud.online.net>
References: <1569174507-15267-1-git-send-email-matiasevara@gmail.com>
	<20190923075830.a6sjwffnkljmyyqm@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923075830.a6sjwffnkljmyyqm@steredhat>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	davem@davemloft.net
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

On Mon, Sep 23, 2019 at 09:58:30AM +0200, Stefano Garzarella wrote:
> Hi Matias,
> thanks for this patch!
> 
> Since this patch only concerns virtio_transport,
> I'd use the 'vsock/virtio' prefix in the commit title:
> "vsock/virtio: add support for MSG_PEEK"
> 
> Some comments below:
> 
> On Sun, Sep 22, 2019 at 05:48:27PM +0000, Matias Ezequiel Vara Larsen wrote:
> > This patch adds support for MSG_PEEK. In such a case, packets are not
> > removed from the rx_queue and credit updates are not sent.
> > 
> > Signed-off-by: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
> > ---
> >  net/vmw_vsock/virtio_transport_common.c | 59 +++++++++++++++++++++++++++++++--
> >  1 file changed, 56 insertions(+), 3 deletions(-)
> > 
> > diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> > index 94cc0fa..830e890 100644
> > --- a/net/vmw_vsock/virtio_transport_common.c
> > +++ b/net/vmw_vsock/virtio_transport_common.c
> > @@ -264,6 +264,59 @@ static int virtio_transport_send_credit_update(struct vsock_sock *vsk,
> >  }
> >  
> >  static ssize_t
> > +virtio_transport_stream_do_peek(struct vsock_sock *vsk,
> > +				struct msghdr *msg,
> > +				size_t len)
> > +{
> > +	struct virtio_vsock_sock *vvs = vsk->trans;
> > +	struct virtio_vsock_pkt *pkt;
> > +	size_t bytes, off = 0, total = 0;
> > +	int err = -EFAULT;
> > +
> > +	spin_lock_bh(&vvs->rx_lock);
> > +
> 
> What about using list_for_each_entry() to cycle through the queued packets?
> 
> > +	if (list_empty(&vvs->rx_queue)) {
> > +		spin_unlock_bh(&vvs->rx_lock);
> > +		return 0;
> > +	}
> > +
> > +	pkt = list_first_entry(&vvs->rx_queue,
> > +			       struct virtio_vsock_pkt, list);
> > +	do {
> 
> pkt->off contains the offset inside the packet where the unread data starts.
> So here we should initialize 'off':
> 
> 		off = pkt->off;
> 
> Or just use pkt->off later (without increasing it as in the dequeue).
> 
> > +		bytes = len - total;
> > +		if (bytes > pkt->len - off)
> > +			bytes = pkt->len - off;
> > +
> > +		/* sk_lock is held by caller so no one else can dequeue.
> > +		 * Unlock rx_lock since memcpy_to_msg() may sleep.
> > +		 */
> > +		spin_unlock_bh(&vvs->rx_lock);
> > +
> > +		err = memcpy_to_msg(msg, pkt->buf + off, bytes);
> > +		if (err)
> > +			goto out;
> > +
> > +		spin_lock_bh(&vvs->rx_lock);
> > +
> > +		total += bytes;
> 
> Using list_for_each_entry(), here we can just do:
> (or better, at the beginning of the cycle)
> 
> 		if (total == len)
> 			break;
> 
> removing the next part...
> 
> > +		off += bytes;
> > +		if (off == pkt->len) {
> > +			pkt = list_next_entry(pkt, list);
> > +			off = 0;
> > +		}
> > +	} while ((total < len) && !list_is_first(&pkt->list, &vvs->rx_queue));
> 
> ...until here.
> 
> > +
> > +	spin_unlock_bh(&vvs->rx_lock);
> > +
> > +	return total;
> > +
> > +out:
> > +	if (total)
> > +		err = total;
> > +	return err;
> > +}
> > +
> > +static ssize_t
> >  virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
> >  				   struct msghdr *msg,
> >  				   size_t len)
> > @@ -330,9 +383,9 @@ virtio_transport_stream_dequeue(struct vsock_sock *vsk,
> >  				size_t len, int flags)
> >  {
> >  	if (flags & MSG_PEEK)
> > -		return -EOPNOTSUPP;
> > -
> > -	return virtio_transport_stream_do_dequeue(vsk, msg, len);
> > +		return virtio_transport_stream_do_peek(vsk, msg, len);
> > +	else
> > +		return virtio_transport_stream_do_dequeue(vsk, msg, len);
> >  }
> >  EXPORT_SYMBOL_GPL(virtio_transport_stream_dequeue);
> >  
> 
> The rest looks good to me!
> 
> Thanks,
> Stefano
Thanks Stefano. Based on your comments, I will modify the patch and
resubmit it.

Matias
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
