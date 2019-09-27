Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7FFC013A
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 10:33:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 24CC2FA0;
	Fri, 27 Sep 2019 08:33:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 31C96F73
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:33:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AC6E98A0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:33:05 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A11D81F0D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:33:05 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id q10so698121wro.22
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 01:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8q/w5sAXzXN1dRT+MgNlQctaxYrMedzUaye5evRWr8c=;
	b=JHT8E06yE6RLVg/P7vLb2eWm4PoERm4ETfgt5MT2KSgyQtFuse+6CGiCYQf/ExBA1u
	PYyzNQWKUHt5g7rSNqdsrrqBKvkzFz2G/7z3DJ4rhd0HB9DXfgnQAfSfDVJYqppdn1OS
	7Z7amwC9aVPea1ETfUneFfp1fNk+GrjUX9Apdq2LtpQETe1KklJ4ejFvizWgAxfYbNqp
	hKao8SJxZPt0fjvIK4Q5oVNtvU27F3P2InWIJJ46PduhuH/njxyuPLLlLPyoU1wJBanw
	fkd4+vvSMyMu1yauYeX4PBJlsNUcickV2DtwIJETEpIoip2CWIrxu2mOcC64N6N2NvAI
	re6A==
X-Gm-Message-State: APjAAAV5MYF/KdsV0ODqwWN3p7PESkVuedV2u4iaOFkHXt97/7kOdEZJ
	Jn8mO+Kx1mQtxZZdnthfx2U64/JIz20d2S1Db4qvIZNwJ09AaKp4QkUKVvFG+0FAb6aEKBOpbVn
	BFKr6fksm8qRFH17Vss5H3X48JoLXH41vZz8ig9owYg==
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr1966698wrn.40.1569573183636;
	Fri, 27 Sep 2019 01:33:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1XqOwNHa9WBwgJ453lXOPmAttGZXlCqgWAiPmgeffopvvBWugkK9DmTJuCHziUY3/8n0+bQ==
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr1966676wrn.40.1569573183304;
	Fri, 27 Sep 2019 01:33:03 -0700 (PDT)
Received: from steredhat.homenet.telecomitalia.it
	(host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174])
	by smtp.gmail.com with ESMTPSA id 33sm2224730wra.41.2019.09.27.01.33.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 01:33:02 -0700 (PDT)
Date: Fri, 27 Sep 2019 10:32:59 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH net v2] vsock: Fix a lockdep warning in __vsock_release()
Message-ID: <20190927083259.zpzseatncogfdrv4@steredhat.homenet.telecomitalia.it>
References: <1569460241-57800-1-git-send-email-decui@microsoft.com>
	<20190926074749.sltehhkcgfduu7n2@steredhat.homenet.telecomitalia.it>
	<PU1P153MB01698C46C9348B9762D5E122BF810@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PU1P153MB01698C46C9348B9762D5E122BF810@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "sashal@kernel.org" <sashal@kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ytht.net@gmail.com" <ytht.net@gmail.com>,
	"deepa.kernel@gmail.com" <deepa.kernel@gmail.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"jhansen@vmware.com" <jhansen@vmware.com>,
	Michael Kelley <mikelley@microsoft.com>
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

On Fri, Sep 27, 2019 at 05:37:20AM +0000, Dexuan Cui wrote:
> > From: linux-hyperv-owner@vger.kernel.org
> > <linux-hyperv-owner@vger.kernel.org> On Behalf Of Stefano Garzarella
> > Sent: Thursday, September 26, 2019 12:48 AM
> > 
> > Hi Dexuan,
> > 
> > On Thu, Sep 26, 2019 at 01:11:27AM +0000, Dexuan Cui wrote:
> > > ...
> > > NOTE: I only tested the code on Hyper-V. I can not test the code for
> > > virtio socket, as I don't have a KVM host. :-( Sorry.
> > >
> > > @Stefan, @Stefano: please review & test the patch for virtio socket,
> > > and let me know if the patch breaks anything. Thanks!
> > 
> > Comment below, I'll test it ASAP!
> 
> Stefano, Thank you!
> 
> BTW, this is how I tested the patch:
> 1. write a socket server program in the guest. The program calls listen()
> and then calls sleep(10000 seconds). Note: accept() is not called.
> 
> 2. create some connections to the server program in the guest.
> 
> 3. kill the server program by Ctrl+C, and "dmesg" will show the scary
> call-trace, if the kernel is built with 
> 	CONFIG_LOCKDEP=y
> 	CONFIG_LOCKDEP_SUPPORT=y
> 
> 4. Apply the patch, do the same test and we should no longer see the call-trace.

Thanks very useful! I'll follow these steps!

> 
> > > -		lock_sock(sk);
> > > +		/* When "level" is 2, use the nested version to avoid the
> > > +		 * warning "possible recursive locking detected".
> > > +		 */
> > > +		if (level == 1)
> > > +			lock_sock(sk);
> > 
> > Since lock_sock() calls lock_sock_nested(sk, 0), could we use directly
> > lock_sock_nested(sk, level) with level = 0 in vsock_release() and
> > level = SINGLE_DEPTH_NESTING here in the while loop?
> > 
> > Thanks,
> > Stefano
> 
> IMHO it's better to make the lock usage more explicit, as the patch does.
> 
> lock_sock_nested(sk, level) or lock_sock_nested(sk, 0) seems a little
> odd to me. But I'm open to your suggestion: if any of the network
> maintainers, e.g. davem, also agrees with you, I'll change the code 
> as you suggested. :-)

Sure!

Just to be clear, I'm proposing this (plus the changes in the transports
and yours useful comments):

--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -638,7 +638,7 @@ struct sock *__vsock_create(struct net *net,
 }
 EXPORT_SYMBOL_GPL(__vsock_create);

-static void __vsock_release(struct sock *sk)
+static void __vsock_release(struct sock *sk, int level)
 {
        if (sk) {
                struct sk_buff *skb;
@@ -650,7 +650,7 @@ static void __vsock_release(struct sock *sk)

                transport->release(vsk);

-               lock_sock(sk);
+               lock_sock_nested(sk, level);
                sock_orphan(sk);
                sk->sk_shutdown = SHUTDOWN_MASK;

@@ -659,7 +659,7 @@ static void __vsock_release(struct sock *sk)

                /* Clean up any sockets that never were accepted. */
                while ((pending = vsock_dequeue_accept(sk)) != NULL) {
-                       __vsock_release(pending);
+                       __vsock_release(pending, SINGLE_DEPTH_NESTING);
                        sock_put(pending);
                }

@@ -708,7 +708,7 @@ EXPORT_SYMBOL_GPL(vsock_stream_has_space);

 static int vsock_release(struct socket *sock)
 {
-       __vsock_release(sock->sk);
+       __vsock_release(sock->sk, 0);
        sock->sk = NULL;
        sock->state = SS_FREE;

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
