Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F487914A
	for <lists.virtualization@lfdr.de>; Mon, 29 Jul 2019 18:44:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C13961AB8;
	Mon, 29 Jul 2019 16:43:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0422D153D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 16:41:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8D8415E4
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 16:41:39 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id e189so45622367oib.11
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 09:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qEnidYZvMtI0djmi8U0ZEWcmJ8XfKi49GrC/Gx0OghM=;
	b=bsKhkqC9OF537cXFNjB1z3QDBysCfhsylnn+InD5Lw10DfJtA7jtNwk2Xhz6Qtq2IS
	mkqr8u5xzosBFVQr2/btVK7WMjpskSxJWqo1wpeS+q1nDaWTTQvIYrM1zKNDGrjM2UTy
	NldPVLXLIS4MnW+aRyt9J/ephhbh+8ikq78er9Fk6wPJOS8vFPbo2xzN8VFQtF801umQ
	qWwbfNebBWBQNtkgeHOI1/BZcSQWGC0Z6un4g+ulTs3w6OivsMIJTMLeYvxsWu4HBsG1
	x3PMURXVuM97LMWMp8s60HBrgETTMoSHz7UjSpGMJfK/lHUszwIH83XnzLiyywuU2KpL
	5Mhg==
X-Gm-Message-State: APjAAAWJA5iat35X/IkXBedpSX1WbeuWmkWXTCStu2m4msE+Kp3hbTgc
	U50/rPrrl5KvIVQVEY3sDmjM+WYPn/1nbcjGb2slRA==
X-Google-Smtp-Source: APXvYqwLmyK1E/4jrfGUT98xeH//0WmrilX5ZcE9+u6f94aZr6eu7bn4vAgIsx2aZWLhabtNB/WLd0Vdna3tzy2IXKU=
X-Received: by 2002:aca:1803:: with SMTP id h3mr20756041oih.24.1564418498709; 
	Mon, 29 Jul 2019 09:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-2-sgarzare@redhat.com>
	<20190729095956-mutt-send-email-mst@kernel.org>
	<20190729153656.zk4q4rob5oi6iq7l@steredhat>
	<20190729115904-mutt-send-email-mst@kernel.org>
In-Reply-To: <20190729115904-mutt-send-email-mst@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 29 Jul 2019 18:41:27 +0200
Message-ID: <CAGxU2F5F1KcaFNJ6n7++ApZiYMGnoEWKVRgo3Vc4h5hpxSJEZg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
To: "Michael S. Tsirkin" <mst@redhat.com>
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

On Mon, Jul 29, 2019 at 12:01:37PM -0400, Michael S. Tsirkin wrote:
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
> > The other option is to copy each packet in a new buffer like I did in
> > the v2 [2], but this forces us to make a copy for each packet that does
> > not fill the entire buffer, perhaps too expensive.
> >
> > [2] https://patchwork.kernel.org/patch/10938741/
> >
>
> So one thing we can easily do is to under-report the
> available credit. E.g. if we copy up to 256bytes,
> then report just 256bytes for every buffer in the queue.
>

Ehm sorry, I got lost :(
Can you explain better?


Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
