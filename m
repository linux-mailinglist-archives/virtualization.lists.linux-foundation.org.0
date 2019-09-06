Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC3FAB642
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 12:44:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C346314AA;
	Fri,  6 Sep 2019 10:44:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5814410B3
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:44:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0C632623
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:44:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B40D369CC;
	Fri,  6 Sep 2019 10:44:31 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 447CE60605;
	Fri,  6 Sep 2019 10:44:26 +0000 (UTC)
Date: Fri, 6 Sep 2019 11:44:25 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 03/18] virtiofs: Pass fsvq instead of vq as parameter to
	virtio_fs_enqueue_req
Message-ID: <20190906104425.GK5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-4-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-4-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 06 Sep 2019 10:44:31 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============0432668485164356889=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============0432668485164356889==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ee6FjwWxuMujAVRe"
Content-Disposition: inline


--ee6FjwWxuMujAVRe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 03:48:44PM -0400, Vivek Goyal wrote:
> Pass fsvq instead of vq as parameter to virtio_fs_enqueue_req(). We will
> retrieve vq from fsvq under spin lock.
>=20
> Later in the patch series we will retrieve vq only if fsvq is still conne=
cted
> other vq might have been cleaned up by device ->remove code and we will
> return error.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ee6FjwWxuMujAVRe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1yOIgACgkQnKSrs4Gr
c8g+8Qf9HHMGZxy914gG38i6e+DYwvC5CryjFWlCDopWdJemyDaSNvh8UTIgIHGs
swJeFt68ZxTzEW1c/YGufHhbxDlaDhTZEs6lfIvd7I+feMa1Ovwo3fZ4UfqFBiAp
SC12MZ7/8B8wMQ1z9IG2JykyYJqoe2jQLKzr1/bQ2rW/wsh7nK+i14SkbiR560z7
bAM610aHlhhm5IPmbDuKwvui2cwyMRnHsSSWatrM3IvuOoR9fd/5DhqPKoGALSNH
FLI3zz4UiELQl2ln/hAI46cFN5b3zOucaegRvn7+C4msZkccGjAMUshVh3UPpdjK
DLFNt7LWNZp+0euYiznREAKikwyZrA==
=O1h4
-----END PGP SIGNATURE-----

--ee6FjwWxuMujAVRe--

--===============0432668485164356889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0432668485164356889==--
