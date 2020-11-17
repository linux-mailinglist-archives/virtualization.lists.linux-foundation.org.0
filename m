Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF9F2B6A82
	for <lists.virtualization@lfdr.de>; Tue, 17 Nov 2020 17:44:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E0C60207A9;
	Tue, 17 Nov 2020 16:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVdwpn4gFnvn; Tue, 17 Nov 2020 16:44:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 875A120794;
	Tue, 17 Nov 2020 16:44:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5643BC07FF;
	Tue, 17 Nov 2020 16:44:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84D9EC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 16:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 722DF20794
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xCQ2XE-yCQvs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 16:43:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 6857320791
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 16:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605631437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0OL/HWgYU3Ie9fdtyyN8GOVgjmDBchi3gRVFLpHkxcU=;
 b=UmOhv+hj0rD5Xiiv3NSu7EsWkqc2rjx+6iu5zl2gAsYwE8VzyXT8N3TwuCuvYvEkAHUWgX
 BU1OjkO0lxlvTxexBQMTDG3Ao7VWmrkcboiM9ghyP7XyfLfU1WcwLTA7eVMqrRfemCQpe+
 Qz7SIq4vF//rrWaf2iWm55Mjam7T8E4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-FqcYCU_7OWyruRRi3iCFDQ-1; Tue, 17 Nov 2020 11:43:48 -0500
X-MC-Unique: FqcYCU_7OWyruRRi3iCFDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62B31186DD27;
 Tue, 17 Nov 2020 16:43:47 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0985460C05;
 Tue, 17 Nov 2020 16:43:43 +0000 (UTC)
Date: Tue, 17 Nov 2020 16:43:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH RFC 04/12] vdpa: add vdpa simulator for block device
Message-ID: <20201117164342.GT131917@stefanha-x1.localdomain>
References: <20201113134712.69744-1-sgarzare@redhat.com>
 <20201113134712.69744-5-sgarzare@redhat.com>
 <20201117111121.GD131917@stefanha-x1.localdomain>
 <20201117141620.ytium7r6xpxi4and@steredhat>
MIME-Version: 1.0
In-Reply-To: <20201117141620.ytium7r6xpxi4and@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Eli Cohen <elic@nvidia.com>
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
Content-Type: multipart/mixed; boundary="===============8953065488108215787=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============8953065488108215787==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Kq+wHeKEs1nwG7z"
Content-Disposition: inline

--4Kq+wHeKEs1nwG7z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 03:16:20PM +0100, Stefano Garzarella wrote:
> On Tue, Nov 17, 2020 at 11:11:21AM +0000, Stefan Hajnoczi wrote:
> > On Fri, Nov 13, 2020 at 02:47:04PM +0100, Stefano Garzarella wrote:
> > > +static void vdpasim_blk_work(struct work_struct *work)
> > > +{
> > > +=09struct vdpasim *vdpasim =3D container_of(work, struct vdpasim, wo=
rk);
> > > +=09u8 status =3D VIRTIO_BLK_S_OK;
> > > +=09int i;
> > > +
> > > +=09spin_lock(&vdpasim->lock);
> > > +
> > > +=09if (!(vdpasim->status & VIRTIO_CONFIG_S_DRIVER_OK))
> > > +=09=09goto out;
> > > +
> > > +=09for (i =3D 0; i < VDPASIM_BLK_VQ_NUM; i++) {
> > > +=09=09struct vdpasim_virtqueue *vq =3D &vdpasim->vqs[i];
> > > +
> > > +=09=09if (!vq->ready)
> > > +=09=09=09continue;
> > > +
> > > +=09=09while (vringh_getdesc_iotlb(&vq->vring, &vq->iov, &vq->iov,
> > > +=09=09=09=09=09    &vq->head, GFP_ATOMIC) > 0) {
> > > +
> > > +=09=09=09int write;
> > > +
> > > +=09=09=09vq->iov.i =3D vq->iov.used - 1;
> > > +=09=09=09write =3D vringh_iov_push_iotlb(&vq->vring, &vq->iov, &stat=
us, 1);
> > > +=09=09=09if (write <=3D 0)
> > > +=09=09=09=09break;
> >=20
> > We're lucky the guest driver doesn't crash after VIRTIO_BLK_T_GET_ID? :=
)
>=20
> The crash could happen if the simulator doesn't put the string terminator=
,
> but in virtio_blk.c, the serial_show() initialize the buffer putting the
> string terminator in the VIRTIO_BLK_ID_BYTES element:
>=20
>     buf[VIRTIO_BLK_ID_BYTES] =3D '\0';
>     err =3D virtblk_get_id(disk, buf);
>=20
> This should prevent the issue, right?
>=20
> However in the last patch of this series I implemented VIRTIO_BLK_T_GET_I=
D
> support :-)

Windows, BSD, macOS, etc guest drivers aren't necessarily going to
terminate or initialize the serial string buffer.

Anyway, the later patch that implements VIRTIO_BLK_T_GET_ID solves this
issue! Thanks.

Stefan

--4Kq+wHeKEs1nwG7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+z/b4ACgkQnKSrs4Gr
c8h22ggAqEQeAfGrxGr95sKZWQAV8LyIENzk1MbKUX7ASOqttSgewXNkW7pPoYjk
M2kKdVh0EJ8i+W1qT7wWAH55W0uBxUgn/VtdeCGG5hZJ19UsS9CMSnvoWaqIL7UD
85+MtvBC/t6y4c9u4gdC4KDFuE3K8qWX0RakC6psbBZYLMeWrXWLQPUPM4Q3Twsl
riNb1a2bYauOPWepY9lcfU0H6kzPq6OImICQI1yPXRsBm4Lk1GLt2QhfC2LvIvh7
0RraoybgM46/xFiMK1CtEcrwIy3tMYGms5Pus0J1TugkioojDbrGSjD8ZxCOmiLc
OkeZjXaLmcxfSGuTke6Rmxl13FSqwA==
=rQOR
-----END PGP SIGNATURE-----

--4Kq+wHeKEs1nwG7z--


--===============8953065488108215787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8953065488108215787==--

