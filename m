Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C7F49B8A4
	for <lists.virtualization@lfdr.de>; Tue, 25 Jan 2022 17:32:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8039F401A1;
	Tue, 25 Jan 2022 16:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xSQgo30J2bOj; Tue, 25 Jan 2022 16:32:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E102A40194;
	Tue, 25 Jan 2022 16:32:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FD05C0077;
	Tue, 25 Jan 2022 16:32:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35AE9C002F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Jan 2022 16:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 227F1409B1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Jan 2022 16:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ewnolz5kGE5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Jan 2022 16:32:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5D154099F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Jan 2022 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643128352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NRfHWalNhzsREmVV8gVYrobA6F+5FFYXHRBpd3r4T9M=;
 b=hDla9q2Ul/JdK7Jq1EMXJF8EqjjQ84zsrAr5dD4qOpuY8/oSKHhlgjJRTryeRmHRSmxsOs
 LpWW9L/lhQE4yUFF7YO/annK6LpdfZbZuSIPqVehTUWs2A60zWYjrp8hhgQIlzwm8lDP7w
 9/C5WYpoDcV52shq43fajF9HhQIAg1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-wEyZStvsPlqFJU-yoKCx-g-1; Tue, 25 Jan 2022 11:32:30 -0500
X-MC-Unique: wEyZStvsPlqFJU-yoKCx-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 975BC81F002;
 Tue, 25 Jan 2022 16:32:29 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2599B70D2B;
 Tue, 25 Jan 2022 16:32:17 +0000 (UTC)
Date: Tue, 25 Jan 2022 16:32:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v1] vhost: cache avail index in vhost_enable_notify()
Message-ID: <YfAmEDPXO0P0Q027@stefanha-x1.localdomain>
References: <20220114090508.36416-1-sgarzare@redhat.com>
 <Ye6OJdi2M1EBx7b3@stefanha-x1.localdomain>
 <20220125111422.tmsnk575jo7ckt46@steredhat>
MIME-Version: 1.0
In-Reply-To: <20220125111422.tmsnk575jo7ckt46@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============8007853054756303909=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============8007853054756303909==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Mh4IROCt27BBDXkt"
Content-Disposition: inline


--Mh4IROCt27BBDXkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 12:14:22PM +0100, Stefano Garzarella wrote:
> On Mon, Jan 24, 2022 at 11:31:49AM +0000, Stefan Hajnoczi wrote:
> > On Fri, Jan 14, 2022 at 10:05:08AM +0100, Stefano Garzarella wrote:
> > > In vhost_enable_notify() we enable the notifications and we read
> > > the avail index to check if new buffers have become available in
> > > the meantime.
> > >=20
> > > We are not caching the avail index, so when the device will call
> > > vhost_get_vq_desc(), it will find the old value in the cache and
> > > it will read the avail index again.
> >=20
> > I think this wording is clearer because we do keep a cached the avail
> > index value, but the issue is we don't update it:
> > s/We are not caching the avail index/We do not update the cached avail
> > index value/
>=20
> I'll fix in v3.
> It seems I forgot to CC you on v2: https://lore.kernel.org/virtualization=
/20220121153108.187291-1-sgarzare@redhat.com/
>=20
> >=20
> > >=20
> > > It would be better to refresh the cache every time we read avail
> > > index, so let's change vhost_enable_notify() caching the value in
> > > `avail_idx` and compare it with `last_avail_idx` to check if there
> > > are new buffers available.
> > >=20
> > > Anyway, we don't expect a significant performance boost because
> > > the above path is not very common, indeed vhost_enable_notify()
> > > is often called with unlikely(), expecting that avail index has
> > > not been updated.
> > >=20
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > > v1:
> > > - improved the commit description [MST, Jason]
> > > ---
> > >  drivers/vhost/vhost.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > > index 59edb5a1ffe2..07363dff559e 100644
> > > --- a/drivers/vhost/vhost.c
> > > +++ b/drivers/vhost/vhost.c
> > > @@ -2543,8 +2543,9 @@ bool vhost_enable_notify(struct vhost_dev
> > > *dev, struct vhost_virtqueue *vq)
> > >  		       &vq->avail->idx, r);
> > >  		return false;
> > >  	}
> > > +	vq->avail_idx =3D vhost16_to_cpu(vq, avail_idx);
> > >=20
> > > -	return vhost16_to_cpu(vq, avail_idx) !=3D vq->avail_idx;
> > > +	return vq->avail_idx !=3D vq->last_avail_idx;
> >=20
> > vhost_vq_avail_empty() has a fast path that's missing in
> > vhost_enable_notify():
> >=20
> >  if (vq->avail_idx !=3D vq->last_avail_idx)
> >      return false;
>=20
> Yep, I thought about that, but devices usually call vhost_enable_notify()
> right when vq->avail_idx =3D=3D vq->last_avail_idx, so I don't know if it=
's an
> extra check for a branch that will never be taken.
>=20
> Do you think it is better to add that check? (maybe with unlikely())

You're right. It's probably fine to omit it.

Stefan

--Mh4IROCt27BBDXkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHwJhAACgkQnKSrs4Gr
c8hMCAgAvntEUi1Nm76si2ZUiNX7b7Qa4oBn5ogtU4I9m1ddGFuJ3GifSrp7XAnl
gakg0NDmPh/+vp1k2J9hqWr34h4lqGENJE8ozYGNPjLRgFTBmlS0NQEDc/08pdsJ
tW6jJhG/zz2OLZFT4yhvb6jzrJFIP1Ab4Z3avzemBXDhI80uRnN/pVDiE6M3SqcV
T34ZXIvLTFdkexKlJolGWFrcplkGSrPf63yiBZM5P8iU+aQmbKCwAP42fr5sQBD+
DW3SbQrrSzYFyCKaX7ct/0qP3x8NK0Q2gUN3zwwxur7CzizOMjy1YdjoPNYXHTSH
3fXB8JueF9RVOtRdSY23RVXB+Lrcgg==
=tNNr
-----END PGP SIGNATURE-----

--Mh4IROCt27BBDXkt--


--===============8007853054756303909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8007853054756303909==--

