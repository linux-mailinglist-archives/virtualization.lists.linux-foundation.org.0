Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DFAAB471
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 10:54:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8B7F01DEC;
	Fri,  6 Sep 2019 08:54:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 61C141D9C
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 08:54:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0D79F7DB
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 08:54:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6BCED308FBAC;
	Fri,  6 Sep 2019 08:54:13 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 862C2600CC;
	Fri,  6 Sep 2019 08:54:10 +0000 (UTC)
Date: Fri, 6 Sep 2019 09:54:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Matt Lupfer <mlupfer@ddn.com>
Subject: Re: [PATCH v2] scsi: virtio_scsi: unplug LUNs when events missed
Message-ID: <20190906085409.GC5900@stefanha-x1.localdomain>
References: <20190905181903.29756-1-mlupfer@ddn.com>
MIME-Version: 1.0
In-Reply-To: <20190905181903.29756-1-mlupfer@ddn.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 06 Sep 2019 08:54:13 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>
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
Content-Type: multipart/mixed; boundary="===============8776125737915835866=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============8776125737915835866==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Content-Disposition: inline


--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 06:19:28PM +0000, Matt Lupfer wrote:
> The event handler calls scsi_scan_host() when events are missed, which
> will hotplug new LUNs.  However, this function won't remove any
> unplugged LUNs.  The result is that hotunplug doesn't work properly when
> the number of unplugged LUNs exceeds the event queue size (currently 8).
>=20
> Scan existing LUNs when events are missed to check if they are still
> present.  If not, remove them.
>=20
> Signed-off-by: Matt Lupfer <mlupfer@ddn.com>
> ---
>  drivers/scsi/virtio_scsi.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Please include a changelog in future patch revisions.  For example:

  Signed-off-by: ...
  ---
  v2:
    * Replaced magic constants with sd.h constants [Michael]

Just C and virtio code review, no SCSI specifics:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1yHrEACgkQnKSrs4Gr
c8gzzAgAuYSjHn9hrs1cMsy6ox6Yq6EuWDPA1QLCT8w5U0wDuEYZNyEcXwfjz9YX
UTUP5SvIxTPY0h1xkG+xZBWzxeGSzO8+24810N6QeJJLbmXqLJT1YATxntwvp+wa
Y0pP8RmHry+TLkuq7kH87eFrp5+kml6Cxq3mTAx8ELSpikGl8GGK6SQN958+5Tgv
NfI9iko4E3c8hSbRthCUMt6ZQpJEpMIoh2DsIkFeY5OI+ZXs4uCUMqc8u9oVCDwf
sj3CrN+r27WQ5oGlXrg3MA4w9Ng6+hvpPRbhbLli4v7NeFUyswz2qJDQWM2e87Pt
vJ2fssWWXnh3m7u5LraZwstLo3ainA==
=6rpq
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--

--===============8776125737915835866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8776125737915835866==--
