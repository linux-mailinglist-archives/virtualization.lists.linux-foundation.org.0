Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AAC4EA98A
	for <lists.virtualization@lfdr.de>; Tue, 29 Mar 2022 10:45:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E7F9417C2;
	Tue, 29 Mar 2022 08:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRrPlI3hXf3V; Tue, 29 Mar 2022 08:45:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B6BF5405AE;
	Tue, 29 Mar 2022 08:45:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CD9FC0073;
	Tue, 29 Mar 2022 08:45:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C17E8C0012
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Mar 2022 08:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97D8960B5F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Mar 2022 08:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wD8rXAEcwPZU
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Mar 2022 08:45:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B398360B58
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Mar 2022 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648543536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uMgkTYZf/g0woPe8B780plgukc+vz+yUuXXC8TqXCcA=;
 b=d0u6bPBImwf3AxzytBR1tgu04Bg27G4TVQS48Z9j5ygYbpPJ8hI4LncgoSEWlUXKbCzkPn
 6MMgsGLQ0mo2xj0974kelFv0c3aWwzDIUbBX6wuOxvlxhu8qqo1sWgFVgPqHjAfytS+Y+u
 hpBBBJ0gz97nArA3GJ/vUuySZ/0OqtE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-4oflrWbVOaKBM0S8CQKSBQ-1; Tue, 29 Mar 2022 04:45:31 -0400
X-MC-Unique: 4oflrWbVOaKBM0S8CQKSBQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7F571C168E4;
 Tue, 29 Mar 2022 08:45:30 +0000 (UTC)
Received: from localhost (unknown [10.39.195.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AE0D46A3AF;
 Tue, 29 Mar 2022 08:45:30 +0000 (UTC)
Date: Tue, 29 Mar 2022 09:45:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Suwan Kim <suwan.kim027@gmail.com>
Subject: Re: [PATCH v3 2/2] virtio-blk: support mq_ops->queue_rqs()
Message-ID: <YkLHKXukyZd27ADE@stefanha-x1.localdomain>
References: <20220324140450.33148-1-suwan.kim027@gmail.com>
 <20220324140450.33148-3-suwan.kim027@gmail.com>
 <YkG1HeQ8qu11KFnF@stefanha-x1.localdomain>
 <YkHZSV+USBSRPuTv@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <YkHZSV+USBSRPuTv@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Cc: mgurtovoy@nvidia.com, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 pbonzini@redhat.com
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
Content-Type: multipart/mixed; boundary="===============0406913427225875817=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============0406913427225875817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mO5OVVo6Gt3wRhJH"
Content-Disposition: inline


--mO5OVVo6Gt3wRhJH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 12:50:33AM +0900, Suwan Kim wrote:
> On Mon, Mar 28, 2022 at 02:16:13PM +0100, Stefan Hajnoczi wrote:
> > On Thu, Mar 24, 2022 at 11:04:50PM +0900, Suwan Kim wrote:
> > > +static void virtio_queue_rqs(struct request **rqlist)
> > > +{
> > > +	struct request *req, *next, *prev =3D NULL;
> > > +	struct request *requeue_list =3D NULL;
> > > +
> > > +	rq_list_for_each_safe(rqlist, req, next) {
> > > +		struct virtio_blk_vq *vq =3D req->mq_hctx->driver_data;
> > > +		unsigned long flags;
> > > +		bool kick;
> > > +
> > > +		if (!virtblk_prep_rq_batch(vq, req)) {
> > > +			rq_list_move(rqlist, &requeue_list, req, prev);
> > > +			req =3D prev;
> > > +
> > > +			if (!req)
> > > +				continue;
> > > +		}
> > > +
> > > +		if (!next || req->mq_hctx !=3D next->mq_hctx) {
> > > +			spin_lock_irqsave(&vq->lock, flags);
> >=20
> > Did you try calling virtblk_add_req() here to avoid acquiring and
> > releasing the lock multiple times? In other words, do virtblk_prep_rq()
> > but wait until we get here to do virtblk_add_req().
> >=20
> > I don't know if it has any measurable effect on performance or maybe the
> > code would become too complex, but I noticed that we're not fully
> > exploiting batching.
>=20
> I tried as you said. I called virtlblk_add_req() and added requests
> of rqlist to virtqueue in this if statement with holding the lock
> only once.
>=20
> I attach the code at the end of this mail.
> Please refer the code.
>=20
> But I didn't see improvement. It showed slightly worse performance
> than the current patch.

Okay, thanks for trying it!

> > > +			kick =3D virtqueue_kick_prepare(vq->vq);
> > > +			spin_unlock_irqrestore(&vq->lock, flags);
> > > +			if (kick)
> > > +				virtqueue_notify(vq->vq);
> > > +
> > > +			req->rq_next =3D NULL;
>=20
> Did you ask this part?
>=20
> > > +			*rqlist =3D next;
> > > +			prev =3D NULL;
> > > +		} else
> > > +			prev =3D req;
> >=20
> > What guarantees that req is still alive after we called
> > virtblk_add_req()? The device may have seen it and completed it already
> > by the time we get here.
>=20
> Isn't request completed after the kick?
>=20
> If you asked about "req->rq_next =3D NULL",
> I think it should be placed before
> "kick =3D virtqueue_kick_prepare(vq->vq);"
>=20
> -----------
> 	req->rq_next =3D NULL;
> 	kick =3D virtqueue_kick_prepare(vq->vq);
> 	spin_unlock_irqrestore(&vq->lock, flags);
> 	if (kick)
> 		virtqueue_notify(vq->vq);
> -----------

No, virtqueue_add_sgs() exposes vring descriptors to the device. The
device may process immediately. In other words, VIRTIO devices may poll
the vring instead of waiting for virtqueue_notify(). There is no
guarantee that the request is alive until virtqueue_notify() is called.

The code has to handle the case where the request is completed during
virtqueue_add_sgs().

Stefan

--mO5OVVo6Gt3wRhJH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJCxykACgkQnKSrs4Gr
c8i6RggAyb2FEHMODJp1S34MXObUfuNkzJdnNuX2cn1Eh4CjmvTyHSPK/vSwqBF2
cLcDqG1Mdf8qzvtO2WQdrkvDzhyYZAM0C51cQu7m1UzZ7HMmSVZc6XNdKplKS7uZ
sWkGppbl43ng0Ts31FhSCE7tt5RbfQ1qZqdoCkDLl6oD4xAAP2/tJJy7iXaFdOoT
PYI2OWs3S2u2kCxJdJbHVlxMy4I+SIn9q/ZOzzgz4PI4xAQ316YlL99ciyIqIBaX
toE6eMSrkvyveT/O80M8OwwaVNkZR/EPZGNAWGwz6ZpmMIL33T+mRU3DOdC5ikLy
aqaIom1JtCx+gekwkhhfw4XHhlJPqQ==
=a5gB
-----END PGP SIGNATURE-----

--mO5OVVo6Gt3wRhJH--


--===============0406913427225875817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0406913427225875817==--

