Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC591BF516
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 12:14:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 55DEA86B60;
	Thu, 30 Apr 2020 10:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t5bFgKFF3VRm; Thu, 30 Apr 2020 10:14:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AFBDB869C9;
	Thu, 30 Apr 2020 10:14:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B8D4C016F;
	Thu, 30 Apr 2020 10:14:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EEA2C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6E674204F1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qaI+0PiCcBXm
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:14:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 6D6A3204DD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588241661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=he4HUnnfxnhrTm0QWMP5xIVq1tnDqvYcm1K+XZ8uTjY=;
 b=A/QQupxOeffJZZ1EjlphzQ4bA8eBMlof0C4obc78GFZbMycggSS7qU4Zt664Mzq1pHRhI0
 mh5JToMnayG+3SpTSEQQS+lfwloa0Z0A9E6MtquCWAz3pPKH6N5BCND2hxiukUJg+ku5bf
 YdRb+3UQN8CnZHN3vRJflXKCg703UIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-sz2XCukOO5iKg-L0FdllgQ-1; Thu, 30 Apr 2020 06:14:17 -0400
X-MC-Unique: sz2XCukOO5iKg-L0FdllgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA7BD1899522;
 Thu, 30 Apr 2020 10:14:15 +0000 (UTC)
Received: from localhost (ovpn-115-102.ams2.redhat.com [10.36.115.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FAE85C1D0;
 Thu, 30 Apr 2020 10:14:12 +0000 (UTC)
Date: Thu, 30 Apr 2020 11:14:10 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v3] virtio-blk: handle block_device_operations callbacks
 after hot unplug
Message-ID: <20200430101410.GA164094@stefanha-x1.localdomain>
References: <20200429165345.144702-1-stefanha@redhat.com>
 <20200430084323.qts2q5ql7rkclk2h@steredhat>
MIME-Version: 1.0
In-Reply-To: <20200430084323.qts2q5ql7rkclk2h@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, Lance Digby <ldigby@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============4972291916040212616=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============4972291916040212616==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 10:43:23AM +0200, Stefano Garzarella wrote:
> On Wed, Apr 29, 2020 at 05:53:45PM +0100, Stefan Hajnoczi wrote:
> > A userspace process holding a file descriptor to a virtio_blk device ca=
n
> > still invoke block_device_operations after hot unplug.  This leads to a
> > use-after-free accessing vblk->vdev in virtblk_getgeo() when
> > ioctl(HDIO_GETGEO) is invoked:
> >=20
> >   BUG: unable to handle kernel NULL pointer dereference at 000000000000=
0090
> >   IP: [<ffffffffc00e5450>] virtio_check_driver_offered_feature+0x10/0x9=
0 [virtio]
> >   PGD 800000003a92f067 PUD 3a930067 PMD 0
> >   Oops: 0000 [#1] SMP
> >   CPU: 0 PID: 1310 Comm: hdio-getgeo Tainted: G           OE  ---------=
---   3.10.0-1062.el7.x86_64 #1
> >   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.13.=
0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
> >   task: ffff9be5fbfb8000 ti: ffff9be5fa890000 task.ti: ffff9be5fa890000
> >   RIP: 0010:[<ffffffffc00e5450>]  [<ffffffffc00e5450>] virtio_check_dri=
ver_offered_feature+0x10/0x90 [virtio]
> >   RSP: 0018:ffff9be5fa893dc8  EFLAGS: 00010246
> >   RAX: ffff9be5fc3f3400 RBX: ffff9be5fa893e30 RCX: 0000000000000000
> >   RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff9be5fbc10b40
> >   RBP: ffff9be5fa893dc8 R08: 0000000000000301 R09: 0000000000000301
> >   R10: 0000000000000000 R11: 0000000000000000 R12: ffff9be5fdc24680
> >   R13: ffff9be5fbc10b40 R14: ffff9be5fbc10480 R15: 0000000000000000
> >   FS:  00007f1bfb968740(0000) GS:ffff9be5ffc00000(0000) knlGS:000000000=
0000000
> >   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >   CR2: 0000000000000090 CR3: 000000003a894000 CR4: 0000000000360ff0
> >   DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> >   DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> >   Call Trace:
> >    [<ffffffffc016ac37>] virtblk_getgeo+0x47/0x110 [virtio_blk]
> >    [<ffffffff8d3f200d>] ? handle_mm_fault+0x39d/0x9b0
> >    [<ffffffff8d561265>] blkdev_ioctl+0x1f5/0xa20
> >    [<ffffffff8d488771>] block_ioctl+0x41/0x50
> >    [<ffffffff8d45d9e0>] do_vfs_ioctl+0x3a0/0x5a0
> >    [<ffffffff8d45dc81>] SyS_ioctl+0xa1/0xc0
> >=20
> > A related problem is that virtblk_remove() leaks the vd_index_ida index
> > when something still holds a reference to vblk->disk during hot unplug.
> > This causes virtio-blk device names to be lost (vda, vdb, etc).
> >=20
> > Fix these issues by protecting vblk->vdev with a mutex and reference
> > counting vblk so the vd_index_ida index can be removed in all cases.
> >=20
> > Fixes: 48e4043d4529523cbc7fa8dd745bd8e2c45ce1d3
> >        ("virtio: add virtio disk geometry feature")
> > Reported-by: Lance Digby <ldigby@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  drivers/block/virtio_blk.c | 87 ++++++++++++++++++++++++++++++++++----
> >  1 file changed, 79 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > index 93468b7c6701..6f7f277495f4 100644
> > --- a/drivers/block/virtio_blk.c
> > +++ b/drivers/block/virtio_blk.c
> > @@ -33,6 +33,16 @@ struct virtio_blk_vq {
> >  } ____cacheline_aligned_in_smp;
> > =20
> >  struct virtio_blk {
> > +=09/*
> > +=09 * vdev may be accessed without taking this mutex in blk-mq and
> > +=09 * virtqueue code paths because virtblk_remove() stops them before =
vdev
> > +=09 * is freed.
> > +=09 *
> > +=09 * Everything else must hold this mutex when accessing vdev and mus=
t
> > +=09 * handle the case where vdev is NULL after virtblk_remove() has be=
en
> > +=09 * called.
> > +=09 */
> > +=09struct mutex vdev_mutex;
>=20
> The patch LGTM, I'm just worried about cache_type_store() and
> cache_type_show() because IIUC they aren't in blk-mq and virtqueue code
> paths, but they use vdev.
>=20
> Do we have to take the mutex there too?

No, because del_gendisk() in virtblk_remove() deletes the sysfs
attributes before vblk->vdev is set to NULL.  kernfs deactivates the
kernfs nodes so that further read()/write() operations fail with ENODEV
(see fs/kernfs/dir.c and fs/kernfs/file.c).

I have tested that a userspace process with a sysfs attr file open
cannot access the attribute after virtblk_remove().

Stefan

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6qpPIACgkQnKSrs4Gr
c8iZKAf/QYt7ZiFCMaka9IVao81da6OKlgxHACLKj/tlMnmQoBlUn6vOfWh1IbNl
A3Zf/liD7BYWPReVipQYV+GjFllxmNSga2iYjvW82j5N0R8Kk5L5cZ6jx7uASvrI
3bF+oRoX6bWL8ayocKPD0Sc6P2/tOhCrBpNNuYyB2PEu+oSCYA8KE9BRp+3IRe87
J+vI3jFPFhX45bZ4nCxwuygtcj1PP98X3kgz4QruMVI0uho/hB56hA1+/7ntU59R
k3E4v4ZlCT8bbZOEbphOwPjDU7+ESMIR7W8mKl4q6uVlTX0PVEk+q62Q0kBRVVkp
DLCUFcL2y0BUSwxsmP+qpkyfvgiubg==
=pQ+W
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--


--===============4972291916040212616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4972291916040212616==--

