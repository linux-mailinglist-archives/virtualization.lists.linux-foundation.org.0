Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF0EF7333
	for <lists.virtualization@lfdr.de>; Mon, 11 Nov 2019 12:37:31 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 975CAC96;
	Mon, 11 Nov 2019 11:37:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5B796B62
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 11:37:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id AD1AF8A7
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 11:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573472242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=fp61CWS//Q9E9TEcOwi1Jd6e8o1eEd928Hz82Hyjf68=;
	b=cUMJ/FGzEk7UclqkZ2n/KcouEvQkaEfzu3dmW4/xMhvn/41M1Cexdvg0MnOfEEStr1cBgh
	dZBcifFoP+9UN1asdK4A6limZVNjiFos9njh/2Pehs6YEBvVmm/Ib6BUdHEwIG8KmohdiR
	kJvgNMT+bc3mPwFDGoiHhzLt/TG1TNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-350-ocj4iVjXOM-sSiQWiIP7tQ-1; Mon, 11 Nov 2019 06:37:21 -0500
X-MC-Unique: ocj4iVjXOM-sSiQWiIP7tQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CE96DB20;
	Mon, 11 Nov 2019 11:37:20 +0000 (UTC)
Received: from localhost (ovpn-117-169.ams2.redhat.com [10.36.117.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A09FB100034E;
	Mon, 11 Nov 2019 11:37:19 +0000 (UTC)
Date: Mon, 11 Nov 2019 11:37:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH] virtiofs: Use static const, not const static
Message-ID: <20191111113718.GG442334@stefanha-x1.localdomain>
References: <1573464401-4917-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1573464401-4917-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-fsdevel@vger.kernel.org, mszeredi@redhat.com, vgoyal@redhat.com,
	virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============7674181846225458674=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

--===============7674181846225458674==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="APlYHCtpeOhspHkB"
Content-Disposition: inline

--APlYHCtpeOhspHkB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2019 at 05:26:41PM +0800, zhengbin wrote:
> Move the static keyword to the front of declarations.

Please mention why this change is necessary in the commit description.

>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  fs/fuse/virtio_fs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> index b77acea..2ac6818 100644
> --- a/fs/fuse/virtio_fs.c
> +++ b/fs/fuse/virtio_fs.c
> @@ -684,12 +684,12 @@ static int virtio_fs_restore(struct virtio_device *=
vdev)
>  }
>  #endif /* CONFIG_PM_SLEEP */
>=20
> -const static struct virtio_device_id id_table[] =3D {
> +static const struct virtio_device_id id_table[] =3D {
>  =09{ VIRTIO_ID_FS, VIRTIO_DEV_ANY_ID },
>  =09{},
>  };
>=20
> -const static unsigned int feature_table[] =3D {};
> +static const unsigned int feature_table[] =3D {};
>=20
>  static struct virtio_driver virtio_fs_driver =3D {
>  =09.driver.name=09=09=3D KBUILD_MODNAME,
> @@ -1026,7 +1026,7 @@ __releases(fiq->lock)
>  =09}
>  }
>=20
> -const static struct fuse_iqueue_ops virtio_fs_fiq_ops =3D {
> +static const struct fuse_iqueue_ops virtio_fs_fiq_ops =3D {
>  =09.wake_forget_and_unlock=09=09=3D virtio_fs_wake_forget_and_unlock,
>  =09.wake_interrupt_and_unlock=09=3D virtio_fs_wake_interrupt_and_unlock,
>  =09.wake_pending_and_unlock=09=3D virtio_fs_wake_pending_and_unlock,
> --
> 2.7.4
>=20

--APlYHCtpeOhspHkB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3JR+4ACgkQnKSrs4Gr
c8gGrQgAiUk45Og7Sz14vxdo8xHlcsLPekKa5syDhdvKdMTEvk0+dTmW+FcE1N5M
EC7U13dTSLzKzBA5GWJ/3Wbj2nW5q38Kv8Ix4YDh+wX25e0DT+jrDDzpL9qQFUSq
hn06s6VJtwDVhDBh1B2Uflu6C8D+4B2nKgQJlNeHQArlvTCLMy50+kk6gVm+iJFu
Q71bIG7HEU7Hu3L/8xAPvQURVg9r5Mzcgq5ZXJI4Y/oMmfoYXdKSP5tvMzyyPaIh
rY1XYhsr6O3Jbv1cKAW1eg9lpbsH0kq6TnrtY2kKFDfzc3YWAPIWpN4nNxNJ1nPJ
LFU1K1nfHAr4Gl49rAPP1T36fImaxQ==
=bTfD
-----END PGP SIGNATURE-----

--APlYHCtpeOhspHkB--


--===============7674181846225458674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7674181846225458674==--

