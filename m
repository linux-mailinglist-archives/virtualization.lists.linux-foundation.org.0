Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A7710AFC7F
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 14:25:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 004BA13CF;
	Wed, 11 Sep 2019 12:25:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E742E13C5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 12:25:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AA22B896
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 12:25:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B8423060399;
	Wed, 11 Sep 2019 12:25:10 +0000 (UTC)
Received: from localhost (ovpn-116-185.ams2.redhat.com [10.36.116.185])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C55A71001959;
	Wed, 11 Sep 2019 12:25:04 +0000 (UTC)
Date: Wed, 11 Sep 2019 14:24:58 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [PATCH v5 0/4] virtio-fs: shared file system for virtual machines
Message-ID: <20190911122458.GA8859@stefanha-x1.localdomain>
References: <20190910151206.4671-1-mszeredi@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190910151206.4671-1-mszeredi@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 11 Sep 2019 12:25:10 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, Vivek Goyal <vgoyal@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1214283376661723893=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============1214283376661723893==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2019 at 05:12:02PM +0200, Miklos Szeredi wrote:
> Git tree for this version is available here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#virtiofs-=
v5
>=20
> Only post patches that actually add virtiofs (virtiofs-v5-base..virtiofs-=
v5).
>=20
> I've folded the series from Vivek and fixed a couple of TODO comments
> myself.  AFAICS two issues remain that need to be resolved in the short
> term, one way or the other: freeze/restore and full virtqueue.

Thank you!  I am investigating freeze/restore.

Stefan

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1455oACgkQnKSrs4Gr
c8hWrggArzr0OOPSTmdQ2dbddY7tmvuQTZgyaLYh1W0gffJZH8gkHIH2rod4htHq
AWYZ7UxNWmHEdY4JHvMZCuxHMT8NScXWjGrkYbyE9amgj0b7PjtgRMiTJDFp2AMf
pr5rza+XUKxkeoVjdSHMThZEGXWn2PP3zEA/IftMSyL7XEHSVS47NRFTFScGDDwW
HpuWwzul31EFYU6ciPAGbAYPOcvDZCZv51ViJdnCcUMnzP3JMpdYyQy/2pcTauzm
1cvyoMStnkMl3uqTswNRCwRFGU5YVqjnxAWg6Gyqu4TyEa5hp96f97XKcFZRbBjv
LFwvgwMzPdO3dZqn3kBILCi/ZSR6MA==
=TbXq
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

--===============1214283376661723893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1214283376661723893==--
