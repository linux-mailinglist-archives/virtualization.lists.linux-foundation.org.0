Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 909F4AB763
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 13:52:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0D51C20E3;
	Fri,  6 Sep 2019 11:52:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B51701DE3
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 11:52:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7BEA9756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 11:52:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16FFF305D637;
	Fri,  6 Sep 2019 11:52:48 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51C755D6A9;
	Fri,  6 Sep 2019 11:52:42 +0000 (UTC)
Date: Fri, 6 Sep 2019 12:52:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 13/18] virtiofs: Do not access virtqueue in request
	submission path
Message-ID: <20190906115241.GU5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-14-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-14-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 06 Sep 2019 11:52:48 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============8288909688578011247=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============8288909688578011247==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iBHcHRCIarfY7C0j"
Content-Disposition: inline


--iBHcHRCIarfY7C0j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 03:48:54PM -0400, Vivek Goyal wrote:
> In request submission path it is possible that virtqueue is already gone
> due to driver->remove(). So do not access it in dev_dbg(). Use pr_debug()
> instead.
>=20
> If virtuqueue is gone, this will result in NULL pointer deference.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--iBHcHRCIarfY7C0j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1ySIkACgkQnKSrs4Gr
c8gXMQf/QUTibXMbQdKidGB1Vqv7pi+fendYycKROG3QMPsuTAtmXYzqvaPyQ+V7
IQKRcXkPStzxee3RJePDleTtTNsjDlsuLgfpvgh0Bik7ZTOfN7ddHzXvcBx2VDJf
OtV+D2N9Cm2YkI1r2OEVWylqmv9aH83xFJHj5hsc7vNO+yu9V+7TA+RZKasdT1GX
zd/W2E4xlYS/vz9fKRX7QReLWIla2yJVy7Qb6MECtMGELGmq02OdzsO5SJWX52cG
gSh58Gw1wIyidQXqTbEkl+gNMORVs3xtNvlIXNyEcXjvaVZzRCAdq3UGVAFL2C7x
LeqWw3/P3WTKxDZwTHLyAwoo2fpnpg==
=cLla
-----END PGP SIGNATURE-----

--iBHcHRCIarfY7C0j--

--===============8288909688578011247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8288909688578011247==--
