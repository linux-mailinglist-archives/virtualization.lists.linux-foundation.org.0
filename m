Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C2C2B68B8
	for <lists.virtualization@lfdr.de>; Tue, 17 Nov 2020 16:32:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5600A204B3;
	Tue, 17 Nov 2020 15:32:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMaa+ayuh5ZR; Tue, 17 Nov 2020 15:32:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F29E020471;
	Tue, 17 Nov 2020 15:32:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96E6AC07FF;
	Tue, 17 Nov 2020 15:32:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78E3DC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 15:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 672DE854E8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 15:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1MUwtW6KVTy
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 15:32:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 74045853F8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605627148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wLVAtYjVS9UVZg93yIztzkKAu2j+G+0Xum5F8J6uQuk=;
 b=gyLKk4E+nuBQqI/+BhEJqBfyiCzExtiMKDQVoSBgzPvTQdl4LkGkgw22JL9flAGgU6/Ifr
 QJnGVMHhTv0dFTui+vsp/uMfCKUwEdBESnwKjjyzChk7G67Vjzv3H1Oe1BKCSi6xwqfte3
 x9XipmW9S1kKZJs1gDUHb/966out/+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-VgzRt7eHMj64zcp_JPCINg-1; Tue, 17 Nov 2020 10:32:25 -0500
X-MC-Unique: VgzRt7eHMj64zcp_JPCINg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0ADC1800D42;
 Tue, 17 Nov 2020 15:32:23 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C78B1974D;
 Tue, 17 Nov 2020 15:32:20 +0000 (UTC)
Date: Tue, 17 Nov 2020 15:32:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 05/10] vhost: poll support support multiple workers
Message-ID: <20201117153219.GN131917@stefanha-x1.localdomain>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <1605223150-10888-7-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605223150-10888-7-git-send-email-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, mst@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, pbonzini@redhat.com
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
Content-Type: multipart/mixed; boundary="===============0741865925411263885=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============0741865925411263885==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3hAdtgBjtgL7p0NQ"
Content-Disposition: inline

--3hAdtgBjtgL7p0NQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 05:19:05PM -0600, Mike Christie wrote:
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index d229515..9eeb8c7 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -187,13 +187,15 @@ void vhost_work_init(struct vhost_work *work, vhost=
_work_fn_t fn)
> =20
>  /* Init poll structure */
>  void vhost_poll_init(struct vhost_poll *poll, vhost_work_fn_t fn,
> -=09=09     __poll_t mask, struct vhost_dev *dev)
> +=09=09     __poll_t mask, struct vhost_dev *dev,
> +=09=09     struct vhost_virtqueue *vq)
>  {
>  =09init_waitqueue_func_entry(&poll->wait, vhost_poll_wakeup);
>  =09init_poll_funcptr(&poll->table, vhost_poll_func);
>  =09poll->mask =3D mask;
>  =09poll->dev =3D dev;
>  =09poll->wqh =3D NULL;
> +=09poll->vq =3D vq;
> =20
>  =09vhost_work_init(&poll->work, fn);
>  }

Tying the poll mechanism to vqs rather than directly to vhost_worker
seems okay for now, but it might be necessary to change this later if
drivers want more flexibility about poll something that's not tied to a
vq or that uses worker 0.

Stefan

--3hAdtgBjtgL7p0NQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+z7QMACgkQnKSrs4Gr
c8heSgf/U4+UEuXuZ0CZCYgD7Qauq2K06gDJ32h3QmIb6XTaQmSneBT3FsOoYjgJ
iph3VMECwKocLt/ABeniUqw/7zVeKj+hj5fC/bu0twjhjtsA7FdvJcBeB5Ism1Nj
3fYfDDpVE8zuO6h8fBwXqn0sGqNZOdbx7jWVZaE311gnxXuutC+k6N+uAFh8Y29G
YEK2nP94JQXUC3o7ET+vxDaktr2pmj4GomC528mfgmaVa5faFKX9fpp4jEOZwQHq
E7p0qEHp+lubeZAXeNj/ZQVQ7apxxXD9rw5br3uq9BrjzoTWF30qLETDo8ihoz6m
IuoPoKFk5k+OXDn0mJWCfMYsJOBu4w==
=MdBC
-----END PGP SIGNATURE-----

--3hAdtgBjtgL7p0NQ--


--===============0741865925411263885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0741865925411263885==--

