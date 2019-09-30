Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0ADC2277
	for <lists.virtualization@lfdr.de>; Mon, 30 Sep 2019 15:52:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D423EB79;
	Mon, 30 Sep 2019 13:51:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D3095408
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 13:51:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5C4CA1FB
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 13:51:31 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A653D2026F
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 13:51:30 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id s25so3958069wmh.1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 06:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KJecfdV4cU2EkR1odbrtXYLFF3/KCfbmiXi5v/OdwmM=;
	b=meYx4ZLQgZrJReGhj2a0dBFKtFGB7XXKW19ir4QRZhG72NEYuHr+szJBq9dh6gWUFN
	iINqJbP2xukL0VKsk/bxa7iUJdbmAcUJvny/ZnPcwhxfwoEFwqe/vkzVdrJp0EYseesf
	lQIog16CRFfit5kZiSZ7fDl/MqF/wOB3DTmpsFWayzFTZqlNtvF6mwSMballeJlRHozr
	ApApXBNSIgocLZPLgL5Fw8fEsZ3m591KTqELQXOAzcZDtC/pO5zS9gyvenmEO2teIOZ3
	gbxca4m07WGWw0HxILq6jeW4leL3DiOn2/s5hCSllbvTE0dQoLVhfQh6tYIupD8Q4I8s
	a2vA==
X-Gm-Message-State: APjAAAXRld/wiu+gnYjqAf4cGBzZ2tXLCpgL3u1uDPLMwFGDgsewgIdu
	/troxwai0rE+sWtcxot3PMeZGTTY9GN/fBt0CqKPZ6BOZZxH9/9B8JG8WcmnqlAJRXo6bz+Qrn2
	k7azVJ2kj+vV3XwgWLNF+El6A3qRKLTd44JiRr7T2ug==
X-Received: by 2002:a05:600c:238a:: with SMTP id
	m10mr18590253wma.51.1569851489005; 
	Mon, 30 Sep 2019 06:51:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwO29KpzdE/B4PZ3FyZQ0b+zqrWaXagG+JSizcZd8LEziw9BOwffjU331R6jmlmhQgquk4C4Q==
X-Received: by 2002:a05:600c:238a:: with SMTP id
	m10mr18590238wma.51.1569851488775; 
	Mon, 30 Sep 2019 06:51:28 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174]) by smtp.gmail.com with ESMTPSA id
	h63sm26377926wmf.15.2019.09.30.06.51.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Sep 2019 06:51:28 -0700 (PDT)
Date: Mon, 30 Sep 2019 15:51:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH net v2] vsock: Fix a lockdep warning in __vsock_release()
Message-ID: <20190930135125.prztj336splp74wq@steredhat>
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
> 

Hi Dexuan,
I tested on virtio socket and it works as expected!

With your patch applied I don't have issues and call-trace. Without
the patch I have a very similar call-trace (as expected):
    ============================================
    WARNING: possible recursive locking detected
    5.3.0-vsock #17 Not tainted
    --------------------------------------------
    python3/872 is trying to acquire lock:
    ffff88802b650110 (sk_lock-AF_VSOCK){+.+.}, at: virtio_transport_release+0x34/0x330 [vmw_vsock_virtio_transport_common]

    but task is already holding lock:
    ffff88803597ce10 (sk_lock-AF_VSOCK){+.+.}, at: __vsock_release+0x3f/0x130 [vsock]

    other info that might help us debug this:
     Possible unsafe locking scenario:

           CPU0
           ----
      lock(sk_lock-AF_VSOCK);
      lock(sk_lock-AF_VSOCK);

     *** DEADLOCK ***

     May be due to missing lock nesting notation

    2 locks held by python3/872:
     #0: ffff88802c957180 (&sb->s_type->i_mutex_key#8){+.+.}, at: __sock_release+0x2d/0xb0
     #1: ffff88803597ce10 (sk_lock-AF_VSOCK){+.+.}, at: __vsock_release+0x3f/0x130 [vsock]

    stack backtrace:
    CPU: 0 PID: 872 Comm: python3 Not tainted 5.3.0-vsock #17
    Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-2.fc30 04/01/2014
    Call Trace:
     dump_stack+0x85/0xc0
     __lock_acquire.cold+0xad/0x22b
     lock_acquire+0xc4/0x1a0
     ? virtio_transport_release+0x34/0x330 [vmw_vsock_virtio_transport_common]
     lock_sock_nested+0x5d/0x80
     ? virtio_transport_release+0x34/0x330 [vmw_vsock_virtio_transport_common]
     virtio_transport_release+0x34/0x330 [vmw_vsock_virtio_transport_common]
     ? mark_held_locks+0x49/0x70
     ? _raw_spin_unlock_irqrestore+0x44/0x60
     __vsock_release+0x2d/0x130 [vsock]
     __vsock_release+0xb9/0x130 [vsock]
     vsock_release+0x12/0x30 [vsock]
     __sock_release+0x3d/0xb0
     sock_close+0x14/0x20
     __fput+0xc1/0x250
     task_work_run+0x93/0xb0
     exit_to_usermode_loop+0xd3/0xe0
     syscall_return_slowpath+0x205/0x310
     entry_SYSCALL_64_after_hwframe+0x49/0xbe


Feel free to add:

Tested-by: Stefano Garzarella <sgarzare@redhat.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
