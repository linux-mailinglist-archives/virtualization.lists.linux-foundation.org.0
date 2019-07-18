Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 407456CD6B
	for <lists.virtualization@lfdr.de>; Thu, 18 Jul 2019 13:36:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7FF851661;
	Thu, 18 Jul 2019 11:36:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2112E1660
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 11:35:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AF5518A0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 11:35:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09FDD30832DA;
	Thu, 18 Jul 2019 11:35:54 +0000 (UTC)
Received: from redhat.com (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
	by smtp.corp.redhat.com (Postfix) with SMTP id B83BD5D96F;
	Thu, 18 Jul 2019 11:35:47 +0000 (UTC)
Date: Thu, 18 Jul 2019 07:35:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 4/5] vhost/vsock: split packets to send using multiple
	buffers
Message-ID: <20190718072741-mutt-send-email-mst@kernel.org>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-5-sgarzare@redhat.com>
	<20190717105336-mutt-send-email-mst@kernel.org>
	<CAGxU2F45v40qAOHkm1Hk2E69gCS0UwVgS5NS+tDXXuzdF4EixA@mail.gmail.com>
	<20190718041234-mutt-send-email-mst@kernel.org>
	<CAGxU2F6oo7Cou7t9o=gG2=wxHMKX9xYQXNxVtDYeHq5fyEhJWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGxU2F6oo7Cou7t9o=gG2=wxHMKX9xYQXNxVtDYeHq5fyEhJWg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 18 Jul 2019 11:35:54 +0000 (UTC)
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

On Thu, Jul 18, 2019 at 11:37:30AM +0200, Stefano Garzarella wrote:
> On Thu, Jul 18, 2019 at 10:13 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Thu, Jul 18, 2019 at 09:50:14AM +0200, Stefano Garzarella wrote:
> > > On Wed, Jul 17, 2019 at 4:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > On Wed, Jul 17, 2019 at 01:30:29PM +0200, Stefano Garzarella wrote:
> > > > > If the packets to sent to the guest are bigger than the buffer
> > > > > available, we can split them, using multiple buffers and fixing
> > > > > the length in the packet header.
> > > > > This is safe since virtio-vsock supports only stream sockets.
> > > > >
> > > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > >
> > > > So how does it work right now? If an app
> > > > does sendmsg with a 64K buffer and the other
> > > > side publishes 4K buffers - does it just stall?
> > >
> > > Before this series, the 64K (or bigger) user messages was split in 4K packets
> > > (fixed in the code) and queued in an internal list for the TX worker.
> > >
> > > After this series, we will queue up to 64K packets and then it will be split in
> > > the TX worker, depending on the size of the buffers available in the
> > > vring. (The idea was to allow EWMA or a configuration of the buffers size, but
> > > for now we postponed it)
> >
> > Got it. Using workers for xmit is IMHO a bad idea btw.
> > Why is it done like this?
> 
> Honestly, I don't know the exact reasons for this design, but I suppose
> that the idea was to have only one worker that uses the vring, and
> multiple user threads that enqueue packets in the list.
> This can simplify the code and we can put the user threads to sleep if
> we don't have "credit" available (this means that the receiver doesn't
> have space to receive the packet).


I think you mean the reverse: even without credits you can copy from
user and queue up data, then process it without waking up the user
thread.
Does it help though? It certainly adds up work outside of
user thread context which means it's not accounted for
correctly.

Maybe we want more VQs. Would help improve parallelism. The question
would then become how to map sockets to VQs. With a simple hash
it's easy to create collisions ...


> 
> What are the drawbacks in your opinion?
> 
> 
> Thanks,
> Stefano

- More pressure on scheduler
- Increased latency


-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
