Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F471AB7C7
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 14:07:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 24E4F216C;
	Fri,  6 Sep 2019 12:07:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 123492165
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 12:07:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C64727DB
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 12:07:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CE86300BCE9;
	Fri,  6 Sep 2019 12:07:04 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04D145D9CA;
	Fri,  6 Sep 2019 12:06:58 +0000 (UTC)
Date: Fri, 6 Sep 2019 13:06:57 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 18/18] virtiofs: Remove TODO item from
	virtio_fs_free_devs()
Message-ID: <20190906120657.GZ5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-19-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-19-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 06 Sep 2019 12:07:04 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============6282500916654568823=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============6282500916654568823==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H7BIH7T1fRJ3RGOi"
Content-Disposition: inline


--H7BIH7T1fRJ3RGOi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 03:48:59PM -0400, Vivek Goyal wrote:
> virtio_fs_free_devs() is now called from ->kill_sb(). By this time
> all device queues have been quiesced. I am assuming that while
> ->kill_sb() is in progress, another mount instance will wait for
> it to finish (sb->s_umount mutex provides mutual exclusion).
>=20
> W.r.t ->remove path, we should be fine as we are not touching vdev
> or virtqueues. And we have reference on virtio_fs object, so we know
> rest of the data structures are valid.
>=20
> So I can't see the need of any additional locking yet.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--H7BIH7T1fRJ3RGOi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1yS+EACgkQnKSrs4Gr
c8hs9gf+K5gZQL97pXObXjA7p0E5N+4Mu7Z87yZAklDhpHu9q0fe3y4R1Mgfbav4
2LIQdjT1jkJl0MxWr5p90E65k9EIXHqDWalOtCobxdFYDbw9IOKOtm6cbp6qbQQX
iURNmLJIf7q4+rIu5ekeRtb8/DmshZJ1zWdbYvegrvMcaRIP+PT2NcBiccFSKX24
yZ0VlxNOfXZIvXSirKuKn29sKtaLlqbmwtsLGIctcryosKZAS6TP7SJ0iUIh1q83
v3jAjTJE+YIybDSFbuFE0bkKHNm2zKrZLKoUL+tI4GC6l0FoE1zk5yJPU+qNKTr+
nx5oaJ/l0rx/cb7cpVXU9vB5xXNlSA==
=mSQ0
-----END PGP SIGNATURE-----

--H7BIH7T1fRJ3RGOi--

--===============6282500916654568823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6282500916654568823==--
