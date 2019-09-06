Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E7AB7B4
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 14:05:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 78F912168;
	Fri,  6 Sep 2019 12:05:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E3B06215C
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 12:05:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A221E756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 12:05:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A3A53090FDB;
	Fri,  6 Sep 2019 12:05:36 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6FF8E19C70;
	Fri,  6 Sep 2019 12:05:35 +0000 (UTC)
Date: Fri, 6 Sep 2019 13:05:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 16/18] virtiofs: Use virtio_fs_mutex for races w.r.t
	->remove and mount path
Message-ID: <20190906120534.GX5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-17-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-17-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 06 Sep 2019 12:05:36 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============3750306256798096800=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============3750306256798096800==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZcaUvQ23gCOmDTXi"
Content-Disposition: inline


--ZcaUvQ23gCOmDTXi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 03:48:57PM -0400, Vivek Goyal wrote:
> It is possible that a mount is in progress and device is being removed at
> the same time. Use virtio_fs_mutex to avoid races.
>=20
> This also takes care of bunch of races and removes some TODO items.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)

Let's move to a per-device mutex in the future.  That way a single
device that fails to drain/complete requests will not hang all other
virtio-fs instances.  This is fine for now.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ZcaUvQ23gCOmDTXi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1yS44ACgkQnKSrs4Gr
c8gUCQf+Lirs+hHg5s88TZfhFQDIDlsjp7llI3ghi4VGGjOuWrHpg5U7YPVCoG+A
+0eiFCQiNg4fqbw/TLcaT8YknKoReHjLZb8waWsV+NWa4EVPLLcQHM4NPVMQpHXg
/CNlyVrgI608sj4hndY5xrbKsnmJdSUBedMLU7nNpnl2dId2yIHYMzHrwsce+Fth
a0bRjYBP1KZqXLaiTi+D7ytBAdRcIyacS+pJ8eeOOk+wOgWaoeQx8oZUfy6/IXyq
hZ+zZpC6c7xcxaNJqgvs+eBG3oQBFJHWCqRtFJad+TSEPgSNOiRU/fcVTAR1Anmj
czpMpNPM8lGfcpjr4tW456SPBRyiVw==
=nWjp
-----END PGP SIGNATURE-----

--ZcaUvQ23gCOmDTXi--

--===============3750306256798096800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3750306256798096800==--
