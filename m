Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C60AB681
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 12:57:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 780022152;
	Fri,  6 Sep 2019 10:57:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E102B214B
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:57:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8F9B8623
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:57:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1ED6F308FB9A;
	Fri,  6 Sep 2019 10:57:06 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52FDF5D9E1;
	Fri,  6 Sep 2019 10:56:59 +0000 (UTC)
Date: Fri, 6 Sep 2019 11:56:58 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 10/18] virtiofs: Do not use device managed mem for
	virtio_fs and virtio_fs_vq
Message-ID: <20190906105658.GR5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-11-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-11-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 06 Sep 2019 10:57:06 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============0750517170047623129=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============0750517170047623129==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Sf3MmCJcUNNLokcm"
Content-Disposition: inline


--Sf3MmCJcUNNLokcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 03:48:51PM -0400, Vivek Goyal wrote:
> These data structures should go away when virtio_fs object is going away.
> When deivce is going away, we need to just make sure virtqueues can go
> away and after that none of the code accesses vq and all the requests
> get error.
>=20
> So allocate memory for virtio_fs and virtio_fs_vq normally and free it
> at right time.
>=20
> This patch still frees up memory during device remove time. A later patch
> will make virtio_fs object reference counted and this memory will be
> freed when last reference to object is dropped.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Sf3MmCJcUNNLokcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1yO3oACgkQnKSrs4Gr
c8gsdQgAw8es95r3jldWITNK2HV3hQUadAUD6wcJTqh47Co/1pn1JWttU9UhsGCs
wlgovlHxIO9oPsjaBc+Vcyczu7QtV+5x4r2lAsxHBH0idZnq6H8T+Om+iM9F3Bhs
hlXTBKrjDt3anxgGHZ/EysPRolxSBPr3W81uqVOATwsS8zKO0liMr6z6brUc12Jx
a9w/zciAljgcusrSgVkQ5C1JwCvMxgGctU1rqzPE1QwPHOT+1/+f7KqJYmTvCYHJ
NfWPrl8z3I68LSE9XkSL6oVU9NDNbey1lzpGIBOpOmZZqucUU67jXy8HO3z2iNB6
UUKV1kzQjkeYn8GGRSqyyJhao8stKw==
=d30F
-----END PGP SIGNATURE-----

--Sf3MmCJcUNNLokcm--

--===============0750517170047623129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0750517170047623129==--
