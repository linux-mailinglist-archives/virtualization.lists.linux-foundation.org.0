Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D358AB644
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 12:46:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3511F211A;
	Fri,  6 Sep 2019 10:45:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 46E63210C
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:45:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 07991623
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:45:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9468D878E46;
	Fri,  6 Sep 2019 10:45:55 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0ACE81000321;
	Fri,  6 Sep 2019 10:45:49 +0000 (UTC)
Date: Fri, 6 Sep 2019 11:45:49 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 04/18] virtiofs: Check connected state for VQ_REQUEST
	queue as well
Message-ID: <20190906104549.GL5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-5-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-5-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Fri, 06 Sep 2019 10:45:55 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============5710068701374602317=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============5710068701374602317==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L/Qt9NZ8t00Dhfad"
Content-Disposition: inline


--L/Qt9NZ8t00Dhfad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 03:48:45PM -0400, Vivek Goyal wrote:
> Right now we are checking ->connected state only for VQ_HIPRIO. Now we wa=
nt
> to make use of this method for all queues. So check it for VQ_REQUEST as
> well.
>=20
> This will be helpful if device has been removed and virtqueue is gone. In
> that case ->connected will be false and request can't be submitted anymore
> and user space will see error -ENOTCONN.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--L/Qt9NZ8t00Dhfad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1yONwACgkQnKSrs4Gr
c8hiJQf/RcdMwTruxvR/8Bl1CjfN+mUt21UCtv0K/otHklhGEdna7AzGT1QFFBqi
iyQUlYckbqC72mhKLNOWT/I8JJkq3jUS+xUf2i/qzNv/4B3yVfCFazfumOIcb7P+
XriTd61VYMSaPfJRPXLvn+oxLknVB9LohRBQHZc0ljt339uGCt9YBlc38G2/XRud
PT41SRg8rwBjDyfqx3OVTzL7kgxdXaM5ZbUJo24/To3ZQdmzO/QWWDJqUCGi0kCQ
r5x6rkMUjd9gZCIUcgio7ourUi3+gfQA+sIQHU3FUH+UCyL7+nM5XM61n7t80BpH
P8ACIKgUO0IDNTm9uaTHnuUTZAUrrw==
=+Vva
-----END PGP SIGNATURE-----

--L/Qt9NZ8t00Dhfad--

--===============5710068701374602317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5710068701374602317==--
