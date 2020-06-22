Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B26DC20343E
	for <lists.virtualization@lfdr.de>; Mon, 22 Jun 2020 12:02:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EADE022008;
	Mon, 22 Jun 2020 10:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6iO7puLwTrLq; Mon, 22 Jun 2020 10:02:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 866B121FA9;
	Mon, 22 Jun 2020 10:02:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68EEAC016F;
	Mon, 22 Jun 2020 10:02:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63C54C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 10:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4994E885D0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 10:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3uAe71+RwYRw
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 10:02:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B45EB88587
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592820122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N35KV1I58jEeqp0kFFqDBICZ46ggu9j0UFA6KwOX1CQ=;
 b=JtMdcMuk/TN04Du3tyLqHF9NDh6w3pKZ4JvVaKpfHyu1EI4ocR6s1i4T7isY8miOXQTEYS
 rtI8jdTmb841XMCRWuNf1g/9T1sCzpSjtFeGgLKRm8m+PJmEF0hLR50Bu9c52voBSIcZJB
 xW+SdO4O2773RG/h7SZyd5FyaMMLqdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-Bemg7nuROgGN_hYEPBEvZQ-1; Mon, 22 Jun 2020 06:01:52 -0400
X-MC-Unique: Bemg7nuROgGN_hYEPBEvZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5113B8014D4;
 Mon, 22 Jun 2020 10:01:51 +0000 (UTC)
Received: from localhost (ovpn-115-184.ams2.redhat.com [10.36.115.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8D651C94D;
 Mon, 22 Jun 2020 10:01:47 +0000 (UTC)
Date: Mon, 22 Jun 2020 11:01:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v9 09/11] vhost/scsi: switch to buf APIs
Message-ID: <20200622100146.GC6675@stefanha-x1.localdomain>
References: <20200619182302.850-1-eperezma@redhat.com>
 <20200619182302.850-10-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200619182302.850-10-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: kvm list <kvm@vger.kernel.org>, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============8570965207212452021=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============8570965207212452021==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Content-Disposition: inline

--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 08:23:00PM +0200, Eugenio P=E9rez wrote:
> @@ -1139,9 +1154,9 @@ vhost_scsi_send_tmf_reject(struct vhost_scsi *vs,
>  =09iov_iter_init(&iov_iter, READ, &vq->iov[vc->out], vc->in, sizeof(rsp)=
);
> =20
>  =09ret =3D copy_to_iter(&rsp, sizeof(rsp), &iov_iter);
> -=09if (likely(ret =3D=3D sizeof(rsp)))
> -=09=09vhost_add_used_and_signal(&vs->dev, vq, vc->head, 0);
> -=09else
> +=09if (likely(ret =3D=3D sizeof(rsp))) {
> +=09=09vhost_scsi_signal_noinput(&vs->dev, vq, &vc->buf);
> +=09} else
>  =09=09pr_err("Faulted on virtio_scsi_ctrl_tmf_resp\n");
>  }

The curly brackets are not necessary, but the patch still looks fine:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7wgYoACgkQnKSrs4Gr
c8iU0wgAsLU1H/KwuKf6yqFN/L0od7nMvZEId3V8dwQBJLUc48Mxam6NlNI0Y/Fb
fY8+U4GIN38UTCj3sWf9KwU/jUVxdwtFHljPNcdDG4IRARU9bLZ1Z8XDrPvXqx0L
SiXWJRPbZhCS0vSKlStWVPsiKhntXocPX805bya3z0B5ix5U3TjfEWjmJnMtq8Vm
RrJGKjF8TYNLCXbJWmeFCKIzZ9HNkaPlZ8X3yb7J5xoPtf7wzxoRdFXbDeJPlMsa
JTN2jd6r8TRyN5zWukPwYe3Q5vX1QfVtCcZwNY9Iwys45cn7AoZrwhEMtDqaJCkN
0VZfJdyLT6+w8Ns35FIqT9XGxccMMw==
=yt/w
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--


--===============8570965207212452021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8570965207212452021==--

