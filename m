Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE0AB62C
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 12:40:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8E137210E;
	Fri,  6 Sep 2019 10:40:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D00182106
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:40:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 96AA4623
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:40:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BB7285363;
	Fri,  6 Sep 2019 10:40:33 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B74D19C70;
	Fri,  6 Sep 2019 10:40:25 +0000 (UTC)
Date: Fri, 6 Sep 2019 11:40:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 01/18] virtiofs: Remove request from processing list
	before calling end
Message-ID: <20190906104024.GI5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-2-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-2-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 06 Sep 2019 10:40:33 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============5585810226116696543=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============5585810226116696543==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UthUFkbMtH2ceUK2"
Content-Disposition: inline


--UthUFkbMtH2ceUK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 03:48:42PM -0400, Vivek Goyal wrote:
> In error path we are calling fuse_request_end() but we need to clear
> FR_SENT bit as well as remove request from processing queue. Otherwise
> fuse_request_end() triggers a warning as well as other issues show up.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--UthUFkbMtH2ceUK2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1yN5gACgkQnKSrs4Gr
c8iH2Qf9FDlsSyo3aEDCwVuW5ufQrOhFl5xJgIrwu9zF7Q8xWoHeRxDRnuXqrpy0
IBO3sm8mijVdTypCJ8zrFIER28OnXnmNmRuZFPxmlDoSf1/G74BAX7qaLH8NTikF
CwJC4TUljhUvvGNKo9/jRu6qVKNcNxz8BXmxjIGBSWWGu90lmDwarFxX6arkWn+x
N8E6/S9dUi6f6jiEy0k0zNUUZ+i4bXhM3SsGXaNuoI/GzZQUG8016CUbYKDSxRxo
ov0FV+U9gy9GEDbuhy5LI5DrlYOzlpSe8OiNiw031NIlcrGmty1o75Dw4j0Bxzwr
zMlTa2f77G2tmrCucSRxbNT2u2u6xw==
=1d2m
-----END PGP SIGNATURE-----

--UthUFkbMtH2ceUK2--

--===============5585810226116696543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5585810226116696543==--
