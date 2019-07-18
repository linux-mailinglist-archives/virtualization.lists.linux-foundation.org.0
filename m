Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 299996CA28
	for <lists.virtualization@lfdr.de>; Thu, 18 Jul 2019 09:43:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 24F48EF3;
	Thu, 18 Jul 2019 07:43:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5BB70EF3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 07:43:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2904812E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 07:43:09 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g67so20439902wme.1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 00:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+5h5a3O3K59BqV9oPAQLtP560NcGiWgROtgONhhQBcA=;
	b=p0/54spqm8GgFfljgSdoWnNhiqYzkb2Ib5inqllRWzsSEbRQrre3Nq4ajpL3A7zmru
	G2zMwjUXYNG/yASFm3fgmre8OiPJzGNYonoE0FaMMZMbSAjHyv0dNtY2022a3czVvLtC
	IHfpPWVLjQcBi+Ft8Y39R5M6T9rWLk7prxGq70ByF4TjLugqD0I+CsVs/eNtZLSeYRS9
	u1j89QSIS255mvh+OlbJp3Z7Xc51ahwBNKHnGWq36DYrYxCNF+gtUpI0BvpoIJlUB/a6
	ijaf/shxFnDYccxiuKT2KCGYneiLf1eFRZUmbnoK+T9aZeR/k2/k4UbuGbN+GgcSdwly
	BvRw==
X-Gm-Message-State: APjAAAWPpbrazcY5d1Rh+aZv01tv44z4S+dV/0cfB5xr3Cy+5xwktEUX
	dwxm9V5CNSmU5obJg0udfly0zA==
X-Google-Smtp-Source: APXvYqwtVzF6pOrVC5RrHtwRwAyqm+l6A25CyYC8a8Kyj4y50SwTmJGOs3CDoEzgqjZKGhzJbIUIfQ==
X-Received: by 2002:a1c:3:: with SMTP id 3mr41105085wma.6.1563435787761;
	Thu, 18 Jul 2019 00:43:07 -0700 (PDT)
Received: from steredhat ([5.170.38.133]) by smtp.gmail.com with ESMTPSA id
	g25sm18763167wmk.39.2019.07.18.00.43.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 00:43:07 -0700 (PDT)
Date: Thu, 18 Jul 2019 09:43:04 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 3/5] vsock/virtio: fix locking in
	virtio_transport_inc_tx_pkt()
Message-ID: <CAGxU2F5PS8Ug3ei79ShVHOwLSXGYKwn3umvfvnhSFDs9pdvH2g@mail.gmail.com>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-4-sgarzare@redhat.com>
	<20190717105056-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717105056-mutt-send-email-mst@kernel.org>
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

On Wed, Jul 17, 2019 at 4:51 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Jul 17, 2019 at 01:30:28PM +0200, Stefano Garzarella wrote:
> > fwd_cnt and last_fwd_cnt are protected by rx_lock, so we should use
> > the same spinlock also if we are in the TX path.
> >
> > Move also buf_alloc under the same lock.
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>
> Wait a second is this a bugfix?
> If it's used under the wrong lock won't values get corrupted?
> Won't traffic then stall or more data get to sent than
> credits?

Before this series, we only read vvs->fwd_cnt and vvs->buf_alloc in this
function, but using a different lock than the one used to write them.
I'm not sure if a corruption can happen, but if we want to avoid the
lock, we should use an atomic operation or memory barriers.

Since now we also need to update vvs->last_fwd_cnt, in order to limit the
credit message, I decided to take the same lock used to protect vvs->fwd_cnt
and vvs->last_fwd_cnt.


Thanks,
Stefano

>
> > ---
> >  include/linux/virtio_vsock.h            | 2 +-
> >  net/vmw_vsock/virtio_transport_common.c | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
> > index 49fc9d20bc43..4c7781f4b29b 100644
> > --- a/include/linux/virtio_vsock.h
> > +++ b/include/linux/virtio_vsock.h
> > @@ -35,7 +35,6 @@ struct virtio_vsock_sock {
> >
> >       /* Protected by tx_lock */
> >       u32 tx_cnt;
> > -     u32 buf_alloc;
> >       u32 peer_fwd_cnt;
> >       u32 peer_buf_alloc;
> >
> > @@ -43,6 +42,7 @@ struct virtio_vsock_sock {
> >       u32 fwd_cnt;
> >       u32 last_fwd_cnt;
> >       u32 rx_bytes;
> > +     u32 buf_alloc;
> >       struct list_head rx_queue;
> >  };
> >
> > diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> > index a85559d4d974..34a2b42313b7 100644
> > --- a/net/vmw_vsock/virtio_transport_common.c
> > +++ b/net/vmw_vsock/virtio_transport_common.c
> > @@ -210,11 +210,11 @@ static void virtio_transport_dec_rx_pkt(struct virtio_vsock_sock *vvs,
> >
> >  void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct virtio_vsock_pkt *pkt)
> >  {
> > -     spin_lock_bh(&vvs->tx_lock);
> > +     spin_lock_bh(&vvs->rx_lock);
> >       vvs->last_fwd_cnt = vvs->fwd_cnt;
> >       pkt->hdr.fwd_cnt = cpu_to_le32(vvs->fwd_cnt);
> >       pkt->hdr.buf_alloc = cpu_to_le32(vvs->buf_alloc);
> > -     spin_unlock_bh(&vvs->tx_lock);
> > +     spin_unlock_bh(&vvs->rx_lock);
> >  }
> >  EXPORT_SYMBOL_GPL(virtio_transport_inc_tx_pkt);
> >
> > --
> > 2.20.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
