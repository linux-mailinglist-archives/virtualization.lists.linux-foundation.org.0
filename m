Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 20897AB7BF
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 14:06:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D2FF3216A;
	Fri,  6 Sep 2019 12:06:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 082C62165
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 12:06:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C00B6756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 12:06:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AA20307D88D;
	Fri,  6 Sep 2019 12:06:39 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF22B60610;
	Fri,  6 Sep 2019 12:06:38 +0000 (UTC)
Date: Fri, 6 Sep 2019 13:06:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 17/18] virtiofs: Remove TODO to quiesce/end_requests
Message-ID: <20190906120637.GY5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-18-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-18-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 06 Sep 2019 12:06:39 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: miklos@szeredi.hu, mst@redhat.com, linux-kernel@vger.kernel.org,
	dgilbert@redhat.com, virtio-fs@redhat.com, linux-fsdevel@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============6644181476154957324=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============6644181476154957324==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lYVfafuUkPqz/tKz"
Content-Disposition: inline


--lYVfafuUkPqz/tKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 03:48:58PM -0400, Vivek Goyal wrote:
> We now stop queues and drain all the pending requests from all virtqueues.
> So this is not a TODO anymore.
>=20
> Got rid of incrementing fc->dev_count as well. It did not seem meaningful
> for virtio_fs.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--lYVfafuUkPqz/tKz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1yS80ACgkQnKSrs4Gr
c8iYtAf+M+W93KWyYjt/Ozu/X8KfP7/va+YH3UjLCSvUxvX5CnMw8go9WAGz79SW
h3CwH86zMiiBVTqVtUcV6HyxuDRdKDSLC123iMP5ydQGJYa63zkdGpbq8Xnc3kFB
vQdt2JHMqvByjMdtgAzOSdVYb5kslR6VxFrH8xd+fd7x6gKvp4dNE1lDfuI5iUHN
vS3OQ2IcSBv1TpPGTRrUhDEcz7N5ebnh5/JQvDbyPbmspchYS+PUvFofzLAQ61Pl
2gKkBnoYAnpHQJwXaFq7aTp/48t2BIsX9j6WrXeK2PjkV2Xa24O1M7jM995KwK+n
lHQUmHQMYTsl27X2YQeHusZ4XB1Gdw==
=LskU
-----END PGP SIGNATURE-----

--lYVfafuUkPqz/tKz--

--===============6644181476154957324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6644181476154957324==--
