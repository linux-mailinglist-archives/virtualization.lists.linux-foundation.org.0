Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3106E241
	for <lists.virtualization@lfdr.de>; Fri, 19 Jul 2019 10:09:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9595222C5;
	Fri, 19 Jul 2019 08:08:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9B8DD21FF
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 08:08:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 512A58A2
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 08:08:37 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r1so31280681wrl.7
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 01:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Y+k78OJ3hK1HM1NDemkzXf61z14PGYV/5FdhA7MXvnc=;
	b=W1pbW5yvA95VuLqK9At5o4GjoG3fdSKn4LteM4r0e+Go8mn9W2TIhMlyxnnlq4ql5v
	DLEI50Fepi8INnEcOZ5LjfCPJSRvffxiEhbedyu4kX/+hBM+mbsdoft8MIOapkNdriRk
	43oUceFa0IvW8ytlRqq3I7mJLwUqCw/kbAj4+poqN5Q8/ZL5Bn896aEryF1xtSRq6vZH
	wAz2DjF/nbi9HoZgXoc0nkHpgDc9V6L7NXhpqaVWg3Rpqg7GmQvNQoftaYOG+UPBEr0p
	/OXhz8odfySF2XcNC8bvxvLFUuO5MSt4q485jMXF3lQAtcTonYz/GnakkGMRIXPFlv/k
	HmnA==
X-Gm-Message-State: APjAAAXo/clhMVIrukEMXLXhj9i+S1Y5+HU2SMNqYVmtCMyeclPJKsoy
	LMACB+/fh7ZyH0VuSNTvicc7fQ==
X-Google-Smtp-Source: APXvYqwGekmba8XBTisqJlSg2ezvLnTzlY5Y80uopXoQvP3Zgq44U3Hgo7LeCqLljPnVT4Ig58Y5ng==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr53804468wrv.247.1563523715806;
	Fri, 19 Jul 2019 01:08:35 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	y6sm34814375wmd.16.2019.07.19.01.08.34
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 01:08:35 -0700 (PDT)
Date: Fri, 19 Jul 2019 10:08:32 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 4/5] vhost/vsock: split packets to send using multiple
	buffers
Message-ID: <20190719080832.7hoeus23zjyrx3cc@steredhat>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-5-sgarzare@redhat.com>
	<20190717105336-mutt-send-email-mst@kernel.org>
	<CAGxU2F45v40qAOHkm1Hk2E69gCS0UwVgS5NS+tDXXuzdF4EixA@mail.gmail.com>
	<20190718041234-mutt-send-email-mst@kernel.org>
	<CAGxU2F6oo7Cou7t9o=gG2=wxHMKX9xYQXNxVtDYeHq5fyEhJWg@mail.gmail.com>
	<20190718072741-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718072741-mutt-send-email-mst@kernel.org>
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

On Thu, Jul 18, 2019 at 07:35:46AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 18, 2019 at 11:37:30AM +0200, Stefano Garzarella wrote:
> > On Thu, Jul 18, 2019 at 10:13 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > On Thu, Jul 18, 2019 at 09:50:14AM +0200, Stefano Garzarella wrote:
> > > > On Wed, Jul 17, 2019 at 4:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > On Wed, Jul 17, 2019 at 01:30:29PM +0200, Stefano Garzarella wrote:
> > > > > > If the packets to sent to the guest are bigger than the buffer
> > > > > > available, we can split them, using multiple buffers and fixing
> > > > > > the length in the packet header.
> > > > > > This is safe since virtio-vsock supports only stream sockets.
> > > > > >
> > > > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > >
> > > > > So how does it work right now? If an app
> > > > > does sendmsg with a 64K buffer and the other
> > > > > side publishes 4K buffers - does it just stall?
> > > >
> > > > Before this series, the 64K (or bigger) user messages was split in 4K packets
> > > > (fixed in the code) and queued in an internal list for the TX worker.
> > > >
> > > > After this series, we will queue up to 64K packets and then it will be split in
> > > > the TX worker, depending on the size of the buffers available in the
> > > > vring. (The idea was to allow EWMA or a configuration of the buffers size, but
> > > > for now we postponed it)
> > >
> > > Got it. Using workers for xmit is IMHO a bad idea btw.
> > > Why is it done like this?
> > 
> > Honestly, I don't know the exact reasons for this design, but I suppose
> > that the idea was to have only one worker that uses the vring, and
> > multiple user threads that enqueue packets in the list.
> > This can simplify the code and we can put the user threads to sleep if
> > we don't have "credit" available (this means that the receiver doesn't
> > have space to receive the packet).
> 
> 
> I think you mean the reverse: even without credits you can copy from
> user and queue up data, then process it without waking up the user
> thread.

I checked the code better, but it doesn't seem to do that.
The .sendmsg callback of af_vsock, check if the transport has space
(virtio-vsock transport returns the credit available). If there is no
space, it put the thread to sleep on the 'sk_sleep(sk)' wait_queue.

When the transport receives an update of credit available on the other
peer, it calls 'sk->sk_write_space(sk)' that wakes up the thread
sleeping, that will queue the new packet.

So, in the current implementation, the TX worker doesn't check the
credit available, it only sends the packets.

> Does it help though? It certainly adds up work outside of
> user thread context which means it's not accounted for
> correctly.

I can try to xmit the packet directly in the user thread context, to see
the improvements.

> 
> Maybe we want more VQs. Would help improve parallelism. The question
> would then become how to map sockets to VQs. With a simple hash
> it's easy to create collisions ...

Yes, more VQs can help but the map question is not simple to answer.
Maybe we can do an hash on the (cid, port) or do some kind of estimation
of queue utilization and try to balance.
Should the mapping be unique?

> 
> 
> > 
> > What are the drawbacks in your opinion?
> > 
> > 
> > Thanks,
> > Stefano
> 
> - More pressure on scheduler
> - Increased latency
> 

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
