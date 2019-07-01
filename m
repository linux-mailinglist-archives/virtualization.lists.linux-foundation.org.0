Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F6D10D0A
	for <lists.virtualization@lfdr.de>; Wed,  1 May 2019 21:09:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D15922B6B;
	Wed,  1 May 2019 19:09:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A6D062B5D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  1 May 2019 19:08:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F1DC471C
	for <virtualization@lists.linux-foundation.org>;
	Wed,  1 May 2019 19:08:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54FE430832E1;
	Wed,  1 May 2019 19:08:34 +0000 (UTC)
Received: from localhost (ovpn-116-20.ams2.redhat.com [10.36.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9290312A47;
	Wed,  1 May 2019 19:08:33 +0000 (UTC)
Date: Wed, 1 May 2019 15:08:31 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Jorge E. Moreira" <jemoreira@google.com>
Subject: Re: [PATCH] vsock/virtio: Initialize core virtio vsock before
	registering the driver
Message-ID: <20190501190831.GF22391@stefanha-x1.localdomain>
References: <20190501003001.186239-1-jemoreira@google.com>
MIME-Version: 1.0
In-Reply-To: <20190501003001.186239-1-jemoreira@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 01 May 2019 19:08:34 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
	kernel-team@android.com, "David S. Miller" <davem@davemloft.net>,
	sgarzare@redhat.com
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
Content-Type: multipart/mixed; boundary="===============8219591520968240425=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============8219591520968240425==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lIrNkN/7tmsD/ALM"
Content-Disposition: inline


--lIrNkN/7tmsD/ALM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2019 at 05:30:01PM -0700, Jorge E. Moreira wrote:
> Avoid a race in which static variables in net/vmw_vsock/af_vsock.c are
> accessed (while handling interrupts) before they are initialized.
>
>=20
> [    4.201410] BUG: unable to handle kernel paging request at fffffffffff=
fffe8
> [    4.207829] IP: vsock_addr_equals_addr+0x3/0x20
> [    4.211379] PGD 28210067 P4D 28210067 PUD 28212067 PMD 0
> [    4.211379] Oops: 0000 [#1] PREEMPT SMP PTI
> [    4.211379] Modules linked in:
> [    4.211379] CPU: 1 PID: 30 Comm: kworker/1:1 Not tainted 4.14.106-4192=
97-gd7e28cc1f241 #1
> [    4.211379] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    4.211379] Workqueue: virtio_vsock virtio_transport_rx_work
> [    4.211379] task: ffffa3273d175280 task.stack: ffffaea1800e8000
> [    4.211379] RIP: 0010:vsock_addr_equals_addr+0x3/0x20
> [    4.211379] RSP: 0000:ffffaea1800ebd28 EFLAGS: 00010286
> [    4.211379] RAX: 0000000000000002 RBX: 0000000000000000 RCX: ffffffffb=
94e42f0
> [    4.211379] RDX: 0000000000000400 RSI: ffffffffffffffe0 RDI: ffffaea18=
00ebdd0
> [    4.211379] RBP: ffffaea1800ebd58 R08: 0000000000000001 R09: 000000000=
0000001
> [    4.211379] R10: 0000000000000000 R11: ffffffffb89d5d60 R12: ffffaea18=
00ebdd0
> [    4.211379] R13: 00000000828cbfbf R14: 0000000000000000 R15: ffffaea18=
00ebdc0
> [    4.211379] FS:  0000000000000000(0000) GS:ffffa3273fd00000(0000) knlG=
S:0000000000000000
> [    4.211379] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    4.211379] CR2: ffffffffffffffe8 CR3: 000000002820e001 CR4: 000000000=
01606e0
> [    4.211379] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [    4.211379] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [    4.211379] Call Trace:
> [    4.211379]  ? vsock_find_connected_socket+0x6c/0xe0
> [    4.211379]  virtio_transport_recv_pkt+0x15f/0x740
> [    4.211379]  ? detach_buf+0x1b5/0x210
> [    4.211379]  virtio_transport_rx_work+0xb7/0x140
> [    4.211379]  process_one_work+0x1ef/0x480
> [    4.211379]  worker_thread+0x312/0x460
> [    4.211379]  kthread+0x132/0x140
> [    4.211379]  ? process_one_work+0x480/0x480
> [    4.211379]  ? kthread_destroy_worker+0xd0/0xd0
> [    4.211379]  ret_from_fork+0x35/0x40
> [    4.211379] Code: c7 47 08 00 00 00 00 66 c7 07 28 00 c7 47 08 ff ff f=
f ff c7 47 04 ff ff ff ff c3 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 8b 47 0=
8 <3b> 46 08 75 0a 8b 47 04 3b 46 04 0f 94 c0 c3 31 c0 c3 90 66 2e
> [    4.211379] RIP: vsock_addr_equals_addr+0x3/0x20 RSP: ffffaea1800ebd28
> [    4.211379] CR2: ffffffffffffffe8
> [    4.211379] ---[ end trace f31cc4a2e6df3689 ]---
> [    4.211379] Kernel panic - not syncing: Fatal exception in interrupt
> [    4.211379] Kernel Offset: 0x37000000 from 0xffffffff81000000 (relocat=
ion range: 0xffffffff80000000-0xffffffffbfffffff)
> [    4.211379] Rebooting in 5 seconds..
>=20
> Fixes: 22b5c0b63f32 ("vsock/virtio: fix kernel panic after device hot-unp=
lug")
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: kvm@vger.kernel.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: netdev@vger.kernel.org
> Cc: kernel-team@android.com
> Cc: stable@vger.kernel.org [4.9+]
> Signed-off-by: Jorge E. Moreira <jemoreira@google.com>
> ---
>  net/vmw_vsock/virtio_transport.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_tran=
sport.c
> index 15eb5d3d4750..96ab344f17bb 100644
> --- a/net/vmw_vsock/virtio_transport.c
> +++ b/net/vmw_vsock/virtio_transport.c
> @@ -702,28 +702,27 @@ static int __init virtio_vsock_init(void)
>  	if (!virtio_vsock_workqueue)
>  		return -ENOMEM;
> =20
> -	ret =3D register_virtio_driver(&virtio_vsock_driver);
> +	ret =3D vsock_core_init(&virtio_transport.transport);

Have you checked that all transport callbacks are safe even if another
CPU calls them while virtio_vsock_probe() is executing on another CPU?

>  	if (ret)
>  		goto out_wq;
> =20
> -	ret =3D vsock_core_init(&virtio_transport.transport);
> +	ret =3D register_virtio_driver(&virtio_vsock_driver);
>  	if (ret)
> -		goto out_vdr;
> +		goto out_vci;
> =20
>  	return 0;
> =20
> -out_vdr:
> -	unregister_virtio_driver(&virtio_vsock_driver);
> +out_vci:
> +	vsock_core_exit();
>  out_wq:
>  	destroy_workqueue(virtio_vsock_workqueue);
>  	return ret;
> -
>  }
> =20
>  static void __exit virtio_vsock_exit(void)
>  {
> -	vsock_core_exit();
>  	unregister_virtio_driver(&virtio_vsock_driver);
> +	vsock_core_exit();
>  	destroy_workqueue(virtio_vsock_workqueue);
>  }

The virtio_vsock_exit() order is intentional:

  commit 22b5c0b63f32568e130fa2df4ba23efce3eb495b
  Author: Stefano Garzarella <sgarzare@redhat.com>
  Date:   Fri Feb 1 12:42:06 2019 +0100

      vsock/virtio: fix kernel panic after device hot-unplug

      virtio_vsock_remove() invokes the vsock_core_exit() also if there
      are opened sockets for the AF_VSOCK protocol family. In this way
      the vsock "transport" pointer is set to NULL, triggering the
      kernel panic at the first socket activity.

      This patch move the vsock_core_init()/vsock_core_exit() in the
      virtio_vsock respectively in module_init and module_exit functions,
      that cannot be invoked until there are open sockets.

Calling vsock_core_exit() after unregister_virtio_driver() is likely to
lead to the issue that Stefano tried to fix.

Is it necessary to change virtio_vsock_exit()?

Stefan

--lIrNkN/7tmsD/ALM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzJ7pQACgkQnKSrs4Gr
c8jR1gf/cnFCrPkul6fp2xkobJXTTX2hwlN4Lg0ubx64+2nm0kboOAywf+Ci3qRb
bVxc31iEJ0uDkNfrvYCMNAHRdo210mQwQOTgGlwb7NGW+MwadZG2bi7ESaLnC0Bq
1qs6c4X/wHxjhyz3juLA50/20c0G0jtOdTmiltlgTyK+tsPKu0BQUN0tutokYmeV
/Maojmx6cXozqPperoF3OZhoQXzKWc5qefOqJyJYIeVpI+XeWiC4DL7zua5Jorp0
BLXio3tkGHge6idenbxSpzey/cv8l1BMoGt8TtCbpbK11sPcSJk73Ggg8EzqC27u
uleMVbN1FWgzKvc46IErCJE1P/1S0A==
=kAew
-----END PGP SIGNATURE-----

--lIrNkN/7tmsD/ALM--

--===============8219591520968240425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8219591520968240425==--
