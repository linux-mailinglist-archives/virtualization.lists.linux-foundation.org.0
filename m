Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AC91B4AF0
	for <lists.virtualization@lfdr.de>; Wed, 22 Apr 2020 18:54:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C0A6287C72;
	Wed, 22 Apr 2020 16:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XpRPBXQMaT0F; Wed, 22 Apr 2020 16:54:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2189286747;
	Wed, 22 Apr 2020 16:54:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00DADC0175;
	Wed, 22 Apr 2020 16:54:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DC26C0175
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 16:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 275A7862FC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 16:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xf6Q-KlP6Ncf
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 16:54:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 71A3B862FB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587574468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BqXrTpX3oy5nBKz0NvKqThQ4hDPxT3MyqKs03+N19io=;
 b=YaknBObiI9i4/j6qDF5DhZVh7wUl2YxDAoJPsC7JUCTikzQsoE12adscuKF6kS16CCea7x
 2N7WJfpUBea3fEuTbPoqffOw+yORD25OA7jKm4vOdciSHV7nWcEKKz4EnkCVXV5azUF11u
 16iuBIO5HhBNIet/dYxj8w/mJA1oVJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-D27f3_n-M_6jsSUZlNKFjQ-1; Wed, 22 Apr 2020 12:54:24 -0400
X-MC-Unique: D27f3_n-M_6jsSUZlNKFjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E6861800D6B;
 Wed, 22 Apr 2020 16:54:22 +0000 (UTC)
Received: from localhost (ovpn-113-71.ams2.redhat.com [10.36.113.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91DBA60C87;
 Wed, 22 Apr 2020 16:54:21 +0000 (UTC)
Date: Wed, 22 Apr 2020 17:54:20 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net] vsock/virtio: postpone packet delivery to monitoring
 devices
Message-ID: <20200422165420.GL47385@stefanha-x1.localdomain>
References: <20200421092527.41651-1-sgarzare@redhat.com>
 <20200421154246.GA47385@stefanha-x1.localdomain>
 <20200421161724.c3pnecltfz4jajww@steredhat>
MIME-Version: 1.0
In-Reply-To: <20200421161724.c3pnecltfz4jajww@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Gerard Garcia <ggarcia@deic.uab.cat>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
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
Content-Type: multipart/mixed; boundary="===============2170368816574865467=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============2170368816574865467==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FnOKg9Ah4tDwTfQS"
Content-Disposition: inline

--FnOKg9Ah4tDwTfQS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 06:17:24PM +0200, Stefano Garzarella wrote:
> On Tue, Apr 21, 2020 at 04:42:46PM +0100, Stefan Hajnoczi wrote:
> > On Tue, Apr 21, 2020 at 11:25:27AM +0200, Stefano Garzarella wrote:
> > > We delivering packets to monitoring devices, before to check if
> > > the virtqueue has enough space.
> >=20
> > "We [are] delivering packets" and "before to check" -> "before
> > checking".  Perhaps it can be rewritten as:
> >=20
> >   Packets are delivered to monitoring devices before checking if the
> >   virtqueue has enough space.
> >=20
>=20
> Yeah, it is better :-)
>=20
> > >=20
> > > If the virtqueue is full, the transmitting packet is queued up
> > > and it will be sent in the next iteration. This causes the same
> > > packet to be delivered multiple times to monitoring devices.
> > >=20
> > > This patch fixes this issue, postponing the packet delivery
> > > to monitoring devices, only when it is properly queued in the
> >=20
> > s/,//
> >=20
> > > virqueue.
> >=20
> > s/virqueue/virtqueue/
> >=20
>=20
> Thanks, I'll fix in the v2!
>=20
> > > @@ -137,6 +135,11 @@ virtio_transport_send_pkt_work(struct work_struc=
t *work)
> > >  =09=09=09break;
> > >  =09=09}
> > > =20
> > > +=09=09/* Deliver to monitoring devices all correctly transmitted
> > > +=09=09 * packets.
> > > +=09=09 */
> > > +=09=09virtio_transport_deliver_tap_pkt(pkt);
> > > +
> >=20
> > The device may see the tx packet and therefore receive a reply to it
> > before we can call virtio_transport_deliver_tap_pkt().  Does this mean
> > that replies can now appear in the packet capture before the transmitte=
d
> > packet?
>=20
> hmm, you are right!
>=20
> And the same thing can already happen in vhost-vsock where we call
> virtio_transport_deliver_tap_pkt() after the vhost_add_used(), right?
>=20
> The vhost-vsock case can be fixed in a simple way, but here do you think
> we should serialize them? (e.g. mutex, spinlock)
>=20
> In this case I'm worried about performance.
>=20
> Or is there some virtqueue API to check availability?

Let's stick to the same semantics as Ethernet netdevs.  That way there
are no surprises to anyone who is familiar with Linux packet captures.
I don't know what those semantics are though, you'd need to check the
code :).

Stefan

--FnOKg9Ah4tDwTfQS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6gdrwACgkQnKSrs4Gr
c8ge/AgAr4BzzDJ/myfhWhgsvMu3TdicuwspJcKD1cHy36+ZKBVo2LAGNjaM14PE
LfCBpZxLe0al85XyUlQfyhc2yWGnLhNBatu6d9IXH+PiwWgI6LAsE0Wt0GSFgo2Q
8camx09TTHHx3zKvM5IyGHhJJNgQkOLjCGCRGGBclVjPZymt6KqH38T2YSvzcZlm
SlGJwX3YlAxmaDxLnenVfdDW76tVkcpg8Ik91Fpa6RHsD+Y4zxF07/qGPIzOB4Ay
fYQUeCAJV1Vf/au5LOy7KoH6LMdqlOKH8MzCkPXV41REHUYEOXNYWFy13HMkEj+1
QBkWbRsN/zAS6nmFJWAAYwFz+lNDog==
=uwp0
-----END PGP SIGNATURE-----

--FnOKg9Ah4tDwTfQS--


--===============2170368816574865467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2170368816574865467==--

