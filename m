Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B79CAB64D
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 12:47:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C1DDE210F;
	Fri,  6 Sep 2019 10:47:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B59E7210F
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:47:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7B66E623
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:47:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10F2D307D88D;
	Fri,  6 Sep 2019 10:47:15 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BE1A60BF1;
	Fri,  6 Sep 2019 10:47:09 +0000 (UTC)
Date: Fri, 6 Sep 2019 11:47:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 06/18] virtiofs: ->remove should not clean virtiofs fuse
	devices
Message-ID: <20190906104708.GN5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-7-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-7-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 06 Sep 2019 10:47:15 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============8771087932482653607=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============8771087932482653607==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yK/6QRnH3Zanb0EF"
Content-Disposition: inline


--yK/6QRnH3Zanb0EF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 03:48:47PM -0400, Vivek Goyal wrote:
> We maintain a fuse device per virt queue. This fuse devices are allocated
> and installed during mount time and should be cleaned up when super block
> is going away. Device removal should not clean it. Device removal should
> stop queues and virtuques can go away.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--yK/6QRnH3Zanb0EF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1yOSwACgkQnKSrs4Gr
c8h6Qwf/WpO4mnEca0Q5mo2lnzp1LNn53yJFIz8baldN1jOcw33zkeKDoJ8jQ4ij
1MbNgXpZWvKRM3ne2pDWOTfgU+JfCLruMSB7cgawvizBo2wsehRoCQ7Y+rEFrPhT
QkfKngAlQfkxdMH0s3efds0D/ra9rWftywFg4BxtNrwWwq85JA5bA6IulJBeydlL
kYibfDTxusBufOj57M6CzGNkcrhbBbGoGp29/WKGDTJPYr10IOINpG1VLMRalyyY
DR1y94cFvWz3qNz1CduPxLeBXjCfAjd9u9RNV+U/JnsmVDm6+csXA70wr7tmPjEY
mc+3IOwSwASzAjknAwn7k4QHKwpUmA==
=TIQ2
-----END PGP SIGNATURE-----

--yK/6QRnH3Zanb0EF--

--===============8771087932482653607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8771087932482653607==--
