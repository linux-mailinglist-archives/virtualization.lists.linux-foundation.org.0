Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DC55F2272F
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:19:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F1572B49;
	Sun, 19 May 2019 16:17:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 89D1D52E0
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 20:20:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7DDF7834
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 20:20:08 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s18so5972368wmh.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 06 May 2019 13:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5KVj2cIFo4sf42IOvLasjrLGxhKPAN71ZeOyGOXbgEg=;
	b=cmUNiJ98WYG7sItDJoJr3sz3tx87o4/cseKFyRTB6KPblTqcD6p2X4Cl9Dt7uhRrbX
	hwg3vsZ07HYU/TiXZVulJMltTrF/i8J+DlWJ8kYkqKoW3peDCioHiWUYbjftKe6qPglk
	+yDK+zpMcVMUEQBzOIhOI3WfpIT6a5+4NO1/0EUR7vAT5tyU2DdWvP3oWcTcWKXeX+YG
	C6Q7Hq5oLAY6JvccnQw8frAjd7/cZts981BUwUlJrmEuKmxiAeJ9UADewVtE7o06DJu9
	8etmdNoNdE/3u5DC1DPp9fes9/FTjtks4PT0YKvOg69TSeWpiw1vKegIHhwPwDgriAPk
	EYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5KVj2cIFo4sf42IOvLasjrLGxhKPAN71ZeOyGOXbgEg=;
	b=bPIdaI7yeZblVC01mle8NaEZqV5traiI9pEw6tWb4IVNs4cNWo8MexZLxs4LF+d56Y
	bJk7beYBuNc9hzH9M2tAn89iwBFEgh5ZrJyqvDG/6SCtd86m/tZlOASHqsxF7NKb0mVE
	wCBt/yf7siMDHaTe4xKtvTPfmEDdM7/Ndd+6bRDWyH5FIVVWYsdEB6+G1ImBGVunTVNt
	x0CEj2rH7v8FTpiU5vN9w5RFNNV9f4q8OiothBIhGq87Cxhzz4/SPthF/mO2+7fdWcp8
	9u53Jv4OOdow8X4JcKql6ZXHgYy0zC9lWpXLqirTlSTwccuyX+7ud7EnSfScvT9r9xEn
	jjPQ==
X-Gm-Message-State: APjAAAWYP0kGkvQxSOuLwoWKZzktIHCZ+H6QbkoStN5r6YKHQL+ytZiT
	2Iai9tSMvw5maIxolG+RlClTLL51DFo4oZhvkOpHzw==
X-Google-Smtp-Source: APXvYqw6YN+mxes4KsRlBEwg0TxslCYp4jV8sOumNLnEbdftzDK/6jIQfDvI0cZj8kywJzf8b7wnJVv8SPDDt1cLFo8=
X-Received: by 2002:a05:600c:2248:: with SMTP id
	a8mr18696267wmm.75.1557174006447; 
	Mon, 06 May 2019 13:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190501003001.186239-1-jemoreira@google.com>
	<20190501190831.GF22391@stefanha-x1.localdomain>
	<20190502082045.u3xypjbac5npbhtc@steredhat.homenet.telecomitalia.it>
In-Reply-To: <20190502082045.u3xypjbac5npbhtc@steredhat.homenet.telecomitalia.it>
Date: Mon, 6 May 2019 13:19:55 -0700
Message-ID: <CAJi--POaVsfprbp5na5BvR=VNONKGfFya_BnmTzzcWmOQ1DM2Q@mail.gmail.com>
Subject: Re: [PATCH] vsock/virtio: Initialize core virtio vsock before
	registering the driver
To: Stefano Garzarella <sgarzare@redhat.com>
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>, kernel-team@android.com,
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
From: Jorge Moreira Broche via Virtualization
	<virtualization@lists.linux-foundation.org>
Reply-To: Jorge Moreira Broche <jemoreira@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

> On Wed, May 01, 2019 at 03:08:31PM -0400, Stefan Hajnoczi wrote:
> > On Tue, Apr 30, 2019 at 05:30:01PM -0700, Jorge E. Moreira wrote:
> > > Avoid a race in which static variables in net/vmw_vsock/af_vsock.c are
> > > accessed (while handling interrupts) before they are initialized.
> > >
> > >
> > > [    4.201410] BUG: unable to handle kernel paging request at ffffffffffffffe8
> > > [    4.207829] IP: vsock_addr_equals_addr+0x3/0x20
> > > [    4.211379] PGD 28210067 P4D 28210067 PUD 28212067 PMD 0
> > > [    4.211379] Oops: 0000 [#1] PREEMPT SMP PTI
> > > [    4.211379] Modules linked in:
> > > [    4.211379] CPU: 1 PID: 30 Comm: kworker/1:1 Not tainted 4.14.106-419297-gd7e28cc1f241 #1
> > > [    4.211379] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
> > > [    4.211379] Workqueue: virtio_vsock virtio_transport_rx_work
> > > [    4.211379] task: ffffa3273d175280 task.stack: ffffaea1800e8000
> > > [    4.211379] RIP: 0010:vsock_addr_equals_addr+0x3/0x20
> > > [    4.211379] RSP: 0000:ffffaea1800ebd28 EFLAGS: 00010286
> > > [    4.211379] RAX: 0000000000000002 RBX: 0000000000000000 RCX: ffffffffb94e42f0
> > > [    4.211379] RDX: 0000000000000400 RSI: ffffffffffffffe0 RDI: ffffaea1800ebdd0
> > > [    4.211379] RBP: ffffaea1800ebd58 R08: 0000000000000001 R09: 0000000000000001
> > > [    4.211379] R10: 0000000000000000 R11: ffffffffb89d5d60 R12: ffffaea1800ebdd0
> > > [    4.211379] R13: 00000000828cbfbf R14: 0000000000000000 R15: ffffaea1800ebdc0
> > > [    4.211379] FS:  0000000000000000(0000) GS:ffffa3273fd00000(0000) knlGS:0000000000000000
> > > [    4.211379] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [    4.211379] CR2: ffffffffffffffe8 CR3: 000000002820e001 CR4: 00000000001606e0
> > > [    4.211379] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > [    4.211379] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > [    4.211379] Call Trace:
> > > [    4.211379]  ? vsock_find_connected_socket+0x6c/0xe0
> > > [    4.211379]  virtio_transport_recv_pkt+0x15f/0x740
> > > [    4.211379]  ? detach_buf+0x1b5/0x210
> > > [    4.211379]  virtio_transport_rx_work+0xb7/0x140
> > > [    4.211379]  process_one_work+0x1ef/0x480
> > > [    4.211379]  worker_thread+0x312/0x460
> > > [    4.211379]  kthread+0x132/0x140
> > > [    4.211379]  ? process_one_work+0x480/0x480
> > > [    4.211379]  ? kthread_destroy_worker+0xd0/0xd0
> > > [    4.211379]  ret_from_fork+0x35/0x40
> > > [    4.211379] Code: c7 47 08 00 00 00 00 66 c7 07 28 00 c7 47 08 ff ff ff ff c7 47 04 ff ff ff ff c3 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 8b 47 08 <3b> 46 08 75 0a 8b 47 04 3b 46 04 0f 94 c0 c3 31 c0 c3 90 66 2e
> > > [    4.211379] RIP: vsock_addr_equals_addr+0x3/0x20 RSP: ffffaea1800ebd28
> > > [    4.211379] CR2: ffffffffffffffe8
> > > [    4.211379] ---[ end trace f31cc4a2e6df3689 ]---
> > > [    4.211379] Kernel panic - not syncing: Fatal exception in interrupt
> > > [    4.211379] Kernel Offset: 0x37000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> > > [    4.211379] Rebooting in 5 seconds..
> > >
> > > Fixes: 22b5c0b63f32 ("vsock/virtio: fix kernel panic after device hot-unplug")
> > > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > > Cc: "David S. Miller" <davem@davemloft.net>
> > > Cc: kvm@vger.kernel.org
> > > Cc: virtualization@lists.linux-foundation.org
> > > Cc: netdev@vger.kernel.org
> > > Cc: kernel-team@android.com
> > > Cc: stable@vger.kernel.org [4.9+]
> > > Signed-off-by: Jorge E. Moreira <jemoreira@google.com>
> > > ---
> > >  net/vmw_vsock/virtio_transport.c | 13 ++++++-------
> > >  1 file changed, 6 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
> > > index 15eb5d3d4750..96ab344f17bb 100644
> > > --- a/net/vmw_vsock/virtio_transport.c
> > > +++ b/net/vmw_vsock/virtio_transport.c
> > > @@ -702,28 +702,27 @@ static int __init virtio_vsock_init(void)
> > >     if (!virtio_vsock_workqueue)
> > >             return -ENOMEM;
> > >
> > > -   ret = register_virtio_driver(&virtio_vsock_driver);
> > > +   ret = vsock_core_init(&virtio_transport.transport);
> >
> > Have you checked that all transport callbacks are safe even if another
> > CPU calls them while virtio_vsock_probe() is executing on another CPU?
> >
>
> I have the same doubt.
>
> What do you think to take the 'the_virtio_vsock_mutex' in the
> virtio_vsock_init(), keeping the previous order?
>
> This should prevent this issue because the virtio_vsock_probe() remains
> blocked in the mutex until the end of vsock_core_init().
>
> Cheers,
> Stefano

Hi Stefan, Stefano,
Sorry for the late reply.

@Stefan
The order of vsock_core_exit() does not need to be changed to fix the
bug I found, but not changing it means the exit function is not
symmetric to the init function.

@Stefano
Taking the mutex from virtio_vsock_init() could work too (I haven't
tried it yet), but it's unnecessary, all that needs to be done is
properly initialize vsock_core before attempting to use it.

I would prefer to change the order in virtio_vsock_init, while leaving
virtio_vsock_exit unchanged, but I'll leave the final decision to you
since I am not very familiar with the inner workings of these modules.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
