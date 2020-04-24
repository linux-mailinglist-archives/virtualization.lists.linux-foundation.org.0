Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 437461B7236
	for <lists.virtualization@lfdr.de>; Fri, 24 Apr 2020 12:43:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 99B5C8588C;
	Fri, 24 Apr 2020 10:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IDfpO7ygwkNv; Fri, 24 Apr 2020 10:43:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 749A08810E;
	Fri, 24 Apr 2020 10:43:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 573A1C0175;
	Fri, 24 Apr 2020 10:43:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F62EC0175
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 10:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8086D887BC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 10:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ph4Hls5B5Nsw
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 10:43:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D255B885D0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587724978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pL+Y2FSl5usXnWFqFb9T8Nd7Bq7Qkybd1Lh3zGsmB9U=;
 b=WfTaEa4oo21ukT1aFrp25t+dW9OMwLbFOkyLMOmSkZdevn5sWdRhS5Pdsc+VWQSpiCwffJ
 goTGFwmQcanpfMbZEEqBz0pe/wQVL78qsvqAxlS4goe+I17nT4exUbj6Pe2WxMLBopFBU1
 0p8fxpv3B8yLO2PMGxvICBkdgek5p8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-vsW2AbJbOEuaFi50kmH8qQ-1; Fri, 24 Apr 2020 06:42:54 -0400
X-MC-Unique: vsW2AbJbOEuaFi50kmH8qQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D9D91005510;
 Fri, 24 Apr 2020 10:42:53 +0000 (UTC)
Received: from localhost (ovpn-114-136.ams2.redhat.com [10.36.114.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E20915D70B;
 Fri, 24 Apr 2020 10:42:49 +0000 (UTC)
Date: Fri, 24 Apr 2020 11:42:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] virtio-blk: handle block_device_operations callbacks
 after hot unplug
Message-ID: <20200424104248.GB174193@stefanha-x1.localdomain>
References: <20200423123717.139141-1-stefanha@redhat.com>
 <20200423141338.GA29646@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200423141338.GA29646@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, Lance Digby <ldigby@redhat.com>,
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
Content-Type: multipart/mixed; boundary="===============1580520126394187014=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============1580520126394187014==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline

--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2020 at 07:13:38AM -0700, Christoph Hellwig wrote:
> On Thu, Apr 23, 2020 at 01:37:17PM +0100, Stefan Hajnoczi wrote:
> > A virtio_blk block device can still be referenced after hot unplug by
> > userspace processes that hold the file descriptor.  In this case
> > virtblk_getgeo() can be invoked after virtblk_remove() was called.  For
> > example, a program that has /dev/vdb open can call ioctl(HDIO_GETGEO)
> > after hot unplug.
> >=20
> > Fix this by clearing vblk->disk->private_data and checking that the
> > virtio_blk driver instance is still around in virtblk_getgeo().
> >=20
> > Note that the virtblk_getgeo() function itself is guaranteed to remain
> > in memory after hot unplug because the virtio_blk module refcount is
> > still held while a block device reference exists.
> >=20
> > Originally-by: Lance Digby <ldigby@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  drivers/block/virtio_blk.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > index 93468b7c6701..b50cdf37a6f7 100644
> > --- a/drivers/block/virtio_blk.c
> > +++ b/drivers/block/virtio_blk.c
> > @@ -300,6 +300,10 @@ static int virtblk_getgeo(struct block_device *bd,=
 struct hd_geometry *geo)
> >  {
> >  =09struct virtio_blk *vblk =3D bd->bd_disk->private_data;
> > =20
> > +=09/* Driver instance has been removed */
> > +=09if (!vblk)
> > +=09=09return -ENOTTY;
>=20
> If this ever hits you have a nasty race condition and this is not
> going to fix it, as it could be removed just after this check as well.

Perhaps a better fix is to keep a refcount in struct virtio_blk and
implement block_device_operations->release() to decrement the refcount.

That way the struct virtio_blk stays around until all block device
references are dropped.  This is similar to nbd_put() in
drivers/block/nbd.c.

Stefan

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6iwqgACgkQnKSrs4Gr
c8gkBQgAwHhtsW9ZXLDZXqp0Kkfsefk/q7JtsVeNejQKlMtOxFqaksestEjC6QvD
i1eTIlK/eNKdy6dfYcLANEpE4GQWxfYcdRGjVFiEghbpyOxCqbhk+Tj2PYIEpczs
Hs0l/nnEN07+hP7nI+owGGdpPN3USN8ZPGJyUOEVjPMT10wYbU5msh2sFnPGGAcU
NbCMJQq6PaNij35r1AL8GdimGQ6lqjnMoTbL1ex9Jrf1KzBoYBBJckK/JkDd1v59
5DsDbjTkDFcaRHKJzf3iuxg8a0AzGXQKudwiS2rGzVirxwVQN1RAi5yHBZnLJ0uT
C0Q7z66olBCYP+IxjOpt5ZtA7X8H6A==
=+zCT
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--


--===============1580520126394187014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1580520126394187014==--

