Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D5916BBDD
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 09:31:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D1FEC8643F;
	Tue, 25 Feb 2020 08:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id acJ39Cb5bs1P; Tue, 25 Feb 2020 08:31:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5673B8642E;
	Tue, 25 Feb 2020 08:31:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34E6EC0177;
	Tue, 25 Feb 2020 08:31:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94481C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 08:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 90BD3868F5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 08:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5mxrUhwJ5TX
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 08:31:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BA6CD84B80
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582619465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JmkjEEqq8m5BjNADnDl327dChnkc9rLHPLw9n41A+qY=;
 b=J2Ft6uL3qb2pUkrxSzHQSuCdB2OCostH1rV/uFJVI2B/TKrJmxoBV0yberxiiXKVlFyM7u
 JKS/xUMWIFdWvtFbJ2ye3E+rPUp/98hUpbCF0oEdytKtW/QOkTQgoDlQm9w+aPNnVzFO6L
 svGPKk94UfJIxUteZKeKnY/AtS+VR6A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-zfen6Y4INxuORbuB4zZjzg-1; Tue, 25 Feb 2020 03:31:04 -0500
X-MC-Unique: zfen6Y4INxuORbuB4zZjzg-1
Received: by mail-wm1-f71.google.com with SMTP id y7so553806wmd.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 00:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JmkjEEqq8m5BjNADnDl327dChnkc9rLHPLw9n41A+qY=;
 b=T20dR6PQgk/tLXaWiFXNISaXM/otbbZLN2o3v5NAaDS6EzJOa2nbuuQmm5+m+RQNH5
 mHqte+EZz6xW7gnuE4Ws/HyWwaJeqM+pafgdWSpWaGre90DJLjdk2xgvRtfQXsz3LYUW
 +nZ1Hl4D+J+k2UG8zhHAh0Bc9gV2ZXYTCifyNeKVqZYI/R3iXJi+kuLkw5zLcilqmVXp
 hPZgxCoLBAg7JUmJg37dy9p8Nog/6HiwZVciyP2XLF4+BAZKx/cA3ozmKnKv7Nr/gfPr
 jCuBJffYehYzeK4oktSEJUpXuKqmUBTJIIly3+2OD1leMJZFQF5kc4T6nKvZN0HhY3dl
 vN+Q==
X-Gm-Message-State: APjAAAXcqrOkn20Oz7ZL+dd7aP9s277qelgWyhqPA/E1dPg1TtOTaxEg
 Sam1cWazkZp1eRmCfmm0ILP19YJo3GOCLDcf3VQpCTW7k0C/Or81r72791z1Z34jtb/9JbyJF0l
 pMwzSC936v8UvXyESAruZBbsnn6tP+sEIyyfORO4iGg==
X-Received: by 2002:adf:f586:: with SMTP id f6mr15471142wro.256.1582619462028; 
 Tue, 25 Feb 2020 00:31:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxskh69L3ehEc2A4u9xM0Hn8YDZ+SLMXLTAldmiH302cEMuq/teKvvxsxUwEbCUclTnpJrS4Q==
X-Received: by 2002:adf:f586:: with SMTP id f6mr15471097wro.256.1582619461690; 
 Tue, 25 Feb 2020 00:31:01 -0800 (PST)
Received: from steredhat (host209-4-dynamic.27-79-r.retail.telecomitalia.it.
 [79.27.4.209])
 by smtp.gmail.com with ESMTPSA id a13sm5456577wrt.55.2020.02.25.00.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 00:31:01 -0800 (PST)
Date: Tue, 25 Feb 2020 09:30:58 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: INFO: task hung in lock_sock_nested (2)
Message-ID: <20200225083058.nfrrvsdgjxj3zcmw@steredhat>
References: <0000000000004241ff059f2eb8a4@google.com>
 <20200223075025.9068-1-hdanton@sina.com>
 <20200224100853.wd67e7rqmtidfg7y@steredhat>
 <HK0P153MB0148B4C74BA6A60E295A03D8BFED0@HK0P153MB0148.APCP153.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <HK0P153MB0148B4C74BA6A60E295A03D8BFED0@HK0P153MB0148.APCP153.PROD.OUTLOOK.COM>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Hillf Danton <hdanton@sina.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 syzbot <syzbot+731710996d79d0d58fbc@syzkaller.appspotmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 Jorgen Hansen <jhansen@vmware.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Feb 25, 2020 at 05:44:03AM +0000, Dexuan Cui wrote:
> > From: Stefano Garzarella <sgarzare@redhat.com>
> > Sent: Monday, February 24, 2020 2:09 AM
> > ...
> > > > syz-executor280 D27912  9768   9766 0x00000000
> > > > Call Trace:
> > > >  context_switch kernel/sched/core.c:3386 [inline]
> > > >  __schedule+0x934/0x1f90 kernel/sched/core.c:4082
> > > >  schedule+0xdc/0x2b0 kernel/sched/core.c:4156
> > > >  __lock_sock+0x165/0x290 net/core/sock.c:2413
> > > >  lock_sock_nested+0xfe/0x120 net/core/sock.c:2938
> > > >  virtio_transport_release+0xc4/0xd60
> > net/vmw_vsock/virtio_transport_common.c:832
> > > >  vsock_assign_transport+0xf3/0x3b0 net/vmw_vsock/af_vsock.c:454
> > > >  vsock_stream_connect+0x2b3/0xc70 net/vmw_vsock/af_vsock.c:1288
> > > >  __sys_connect_file+0x161/0x1c0 net/socket.c:1857
> > > >  __sys_connect+0x174/0x1b0 net/socket.c:1874
> > > >  __do_sys_connect net/socket.c:1885 [inline]
> > > >  __se_sys_connect net/socket.c:1882 [inline]
> > > >  __x64_sys_connect+0x73/0xb0 net/socket.c:1882
> > > >  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
> 
> My understanding about the call trace is: in vsock_stream_connect() 
> after we call lock_sock(sk), we call vsock_assign_transport(), which may
> call vsk->transport->release(vsk), i.e. virtio_transport_release(), and in
> virtio_transport_release() we try to get the same lock and hang.

Yes, that's what I got.

> 
> > > Seems like vsock needs a word to track lock owner in an attempt to
> > > avoid trying to lock sock while the current is the lock owner.
> 
> I'm unfamilar with the g2h/h2g :-) 
> Here I'm wondering if it's acceptable to add an 'already_locked'
> parameter like this:
>   bool already_locked = true;
>   vsk->transport->release(vsk, already_locked) ?

Could be acceptable, but I prefer to avoid.

>  
> > Thanks for this possible solution.
> > What about using sock_owned_by_user()?
>  
> > We should fix also hyperv_transport, because it could suffer from the same
> > problem.
> 
> IIUC hyperv_transport doesn't supprot the h2g/g2h feature, so it should not
> suffers from the deadlock issue here?

The h2g/g2h is in the vsock core, and the hyperv_transport is one of the g2h
transports available.

If we have a L1 VM with hyperv_transport (G2H) to communicate with L0 and a
nested KVM VM (L2) we need to load also vhost_transport (H2G). If the
user creates a socket and it tries the following:
    connect(fd, <2,1234>) - socket assigned to hyperv_transport (because
                            the user wants to reach the host using CID_HOST)
        fails

    connect(fd, <3,1234>) - socket must be reassigned to vhost_transport
                            (because the user wants to reach a nested guest)

So, I think in this case we can have the deadlock.

> 
> > At this point, it might be better to call vsk->transport->release(vsk)
> > always with the lock taken and remove it in the transports as in the
> > following patch.
> > 
> > What do you think?
> > 
> > 
> > diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> > index 9c5b2a91baad..a073d8efca33 100644
> > --- a/net/vmw_vsock/af_vsock.c
> > +++ b/net/vmw_vsock/af_vsock.c
> > @@ -753,20 +753,18 @@ static void __vsock_release(struct sock *sk, int
> > level)
> >  		vsk = vsock_sk(sk);
> >  		pending = NULL;	/* Compiler warning. */
> > 
> > -		/* The release call is supposed to use lock_sock_nested()
> > -		 * rather than lock_sock(), if a sock lock should be acquired.
> > -		 */
> > -		if (vsk->transport)
> > -			vsk->transport->release(vsk);
> > -		else if (sk->sk_type == SOCK_STREAM)
> > -			vsock_remove_sock(vsk);
> > -
> >  		/* When "level" is SINGLE_DEPTH_NESTING, use the nested
> >  		 * version to avoid the warning "possible recursive locking
> >  		 * detected". When "level" is 0, lock_sock_nested(sk, level)
> >  		 * is the same as lock_sock(sk).
> >  		 */
> >  		lock_sock_nested(sk, level);
> > +
> > +		if (vsk->transport)
> > +			vsk->transport->release(vsk);
> > +		else if (sk->sk_type == SOCK_STREAM)
> > +			vsock_remove_sock(vsk);
> > +
> >  		sock_orphan(sk);
> >  		sk->sk_shutdown = SHUTDOWN_MASK;
> > 
> > diff --git a/net/vmw_vsock/hyperv_transport.c
> > b/net/vmw_vsock/hyperv_transport.c
> > index 3492c021925f..510f25f4a856 100644
> > --- a/net/vmw_vsock/hyperv_transport.c
> > +++ b/net/vmw_vsock/hyperv_transport.c
> > @@ -529,9 +529,7 @@ static void hvs_release(struct vsock_sock *vsk)
> >  	struct sock *sk = sk_vsock(vsk);
> >  	bool remove_sock;
> > 
> > -	lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
> >  	remove_sock = hvs_close_lock_held(vsk);
> > -	release_sock(sk);
> >  	if (remove_sock)
> >  		vsock_remove_sock(vsk);
> >  }
> 
> This looks good to me, but do we know why vsk->transport->release(vsk)
> is called without holding the lock for 'sk' in the first place?

Maybe because vmci_transport (the first transport implemented) doesn't
require holding lock during the release.

Okay, so I'll test this patch and then I'll send it out for reviews.

Thanks for the feedback,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
