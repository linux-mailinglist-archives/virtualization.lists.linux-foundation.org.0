Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB736CC08
	for <lists.virtualization@lfdr.de>; Thu, 18 Jul 2019 11:38:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 33D6D143E;
	Thu, 18 Jul 2019 09:37:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4E3F31370
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 09:37:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C598E12E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 09:37:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 31so27954773wrm.1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 02:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Vums2zz+KqGmXaH/Vl3B9M8z+ViEwY48CergeYbypPk=;
	b=XSFA+p34SRT86BY8DUHezc4CjawHRZA5c2PcBF4xOUTZ6NMFhjvseN7vl1YKr7628m
	NUQi+tUJfdui/0MpfG4YyOg/srlcPVi6Bh/1eG9zYIot+twLMQTYD1b+XeIJrpfAlbcO
	SSQOrDONlzepB5biWh+v/9KhUJDbkpIW8ctuUWreeaW8zif6bLvQgJNYxED5u2pjhv1A
	6ik66Pj+WaNxRraYGdEWavqfImTaIsEXhQgoRI4564PuZKf9R9xHdNy17Y61nAvHS5UN
	U/QJMCLJkY0knD2B7R8Nxca2in4SO+14QuT1w3MvQEoSZrUIZJuwbbcam26DrjGuxFPl
	BUwA==
X-Gm-Message-State: APjAAAVYD8ByynrYPokbcTojMB6CJKKlL0oLpzYwM/hTWUX7lhIHf03n
	nh8BbzQQD2y/3TB89+slHNLNow==
X-Google-Smtp-Source: APXvYqxYCA1EVl1T2DVO3iZedENcjrNB6Hslgz4pOwp4UFAclSWI8asScK5ZYvkj/r17GyN6S1B6Kg==
X-Received: by 2002:adf:ec0f:: with SMTP id x15mr13474237wrn.165.1563442659406;
	Thu, 18 Jul 2019 02:37:39 -0700 (PDT)
Received: from steredhat ([5.171.190.136]) by smtp.gmail.com with ESMTPSA id
	q18sm27647509wrw.36.2019.07.18.02.37.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 02:37:38 -0700 (PDT)
Date: Thu, 18 Jul 2019 11:37:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 4/5] vhost/vsock: split packets to send using multiple
	buffers
Message-ID: <CAGxU2F6oo7Cou7t9o=gG2=wxHMKX9xYQXNxVtDYeHq5fyEhJWg@mail.gmail.com>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-5-sgarzare@redhat.com>
	<20190717105336-mutt-send-email-mst@kernel.org>
	<CAGxU2F45v40qAOHkm1Hk2E69gCS0UwVgS5NS+tDXXuzdF4EixA@mail.gmail.com>
	<20190718041234-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718041234-mutt-send-email-mst@kernel.org>
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

On Thu, Jul 18, 2019 at 10:13 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> On Thu, Jul 18, 2019 at 09:50:14AM +0200, Stefano Garzarella wrote:
> > On Wed, Jul 17, 2019 at 4:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > On Wed, Jul 17, 2019 at 01:30:29PM +0200, Stefano Garzarella wrote:
> > > > If the packets to sent to the guest are bigger than the buffer
> > > > available, we can split them, using multiple buffers and fixing
> > > > the length in the packet header.
> > > > This is safe since virtio-vsock supports only stream sockets.
> > > >
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > >
> > > So how does it work right now? If an app
> > > does sendmsg with a 64K buffer and the other
> > > side publishes 4K buffers - does it just stall?
> >
> > Before this series, the 64K (or bigger) user messages was split in 4K packets
> > (fixed in the code) and queued in an internal list for the TX worker.
> >
> > After this series, we will queue up to 64K packets and then it will be split in
> > the TX worker, depending on the size of the buffers available in the
> > vring. (The idea was to allow EWMA or a configuration of the buffers size, but
> > for now we postponed it)
>
> Got it. Using workers for xmit is IMHO a bad idea btw.
> Why is it done like this?

Honestly, I don't know the exact reasons for this design, but I suppose
that the idea was to have only one worker that uses the vring, and
multiple user threads that enqueue packets in the list.
This can simplify the code and we can put the user threads to sleep if
we don't have "credit" available (this means that the receiver doesn't
have space to receive the packet).

What are the drawbacks in your opinion?


Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
