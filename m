Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF3BAB75D
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 13:50:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 595631E80;
	Fri,  6 Sep 2019 11:50:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 00D251DE4
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 11:50:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A537A756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 11:50:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0113F190C106;
	Fri,  6 Sep 2019 11:50:36 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EED2A5D9CA;
	Fri,  6 Sep 2019 11:50:27 +0000 (UTC)
Date: Fri, 6 Sep 2019 12:50:26 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 11/18] virtiofs: stop and drain queues after sending
	DESTROY
Message-ID: <20190906115026.GS5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-12-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-12-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.70]);
	Fri, 06 Sep 2019 11:50:36 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============7346664300694486098=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============7346664300694486098==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6zn93sY2JrH9m7VZ"
Content-Disposition: inline


--6zn93sY2JrH9m7VZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 03:48:52PM -0400, Vivek Goyal wrote:
> During virtio_kill_sb() we first stop forget queue and drain it and then
> call fuse_kill_sb_anon(). This will result in sending DESTROY request to
> fuse server. Once finished, stop all the queues and drain one more time
> just to be sure and then free up the devices.
>=20
> Given drain queues will call flush_work() on various workers, remove this
> logic from virtio_free_devs().
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--6zn93sY2JrH9m7VZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1ySAIACgkQnKSrs4Gr
c8hPCggAqxxAtpxUlxuyJ1JMZVearCJpL7Y98Ts25vXNZJKaGv/Z7w+0b1YNHE04
RuXVOEqhwAG5VKOIpPYs+SJwTEwWTgsHEdAgtprbwW+v/vrOlf3LEaC9QS7+Z6bZ
altTVdvWHQiqulsObNYVrgm/alLh75y8skYmwHHAK0EtbLoOwBnwzYNHyuOsH7tk
YdpXmipXCBBtjQrC9rWXSt0ug0xCm29uK/voTea5mrDVFTpTixcKJ2LM6jnT6r4v
mXBtZwegQNYew2LLapEqG+GNE2SSbMD765Z/MFyR48cksq/5mEbCOavSmN8S1HfH
zelxUzsGNaQAsRXvt+wUI8Y94D+aoQ==
=OYfd
-----END PGP SIGNATURE-----

--6zn93sY2JrH9m7VZ--

--===============7346664300694486098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7346664300694486098==--
