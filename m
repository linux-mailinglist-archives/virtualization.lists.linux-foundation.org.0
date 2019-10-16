Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A94AD944E
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 16:50:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 98EA4EC1;
	Wed, 16 Oct 2019 14:50:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A108DEBC
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 14:50:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 59635887
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 14:50:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A66E89F302;
	Wed, 16 Oct 2019 14:50:42 +0000 (UTC)
Received: from localhost (unknown [10.36.118.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0A5760127;
	Wed, 16 Oct 2019 14:50:39 +0000 (UTC)
Date: Wed, 16 Oct 2019 15:50:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vsock/virtio: remove unused 'work' field from 'struct
	virtio_vsock_pkt'
Message-ID: <20191016145038.GH5487@stefanha-x1.localdomain>
References: <20191015150051.104631-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191015150051.104631-1-sgarzare@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Wed, 16 Oct 2019 14:50:42 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============3943229247751328346=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============3943229247751328346==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EemXnrF2ob+xzFeB"
Content-Disposition: inline


--EemXnrF2ob+xzFeB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 05:00:51PM +0200, Stefano Garzarella wrote:
> The 'work' field was introduced with commit 06a8fc78367d0
> ("VSOCK: Introduce virtio_vsock_common.ko")
> but it is never used in the code, so we can remove it to save
> memory allocated in the per-packet 'struct virtio_vsock_pkt'
>=20
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/linux/virtio_vsock.h | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--EemXnrF2ob+xzFeB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2nLj4ACgkQnKSrs4Gr
c8hxgQf/fJM59TTkQU6f/aLvKMLRivTzsa1Yz/4hy25NeYI++lHojSBwzdtd1BxY
PF945mWrEnCumX+FOqHdpwX6oRU4bnJ0pc3kzHPrxnLYoyHT1NYNPnEHnaZERFfP
7OdE3RMXooLx+JM7MrIn8Fh/ElR2Bi4JhUw+zOUMEO96aY+HIJ7cAPsDG3QTHinj
TL4WUjSRZEqwfZKvJ0TiydqJR/RKjpNEi1bYrTV9TzW84/5AmWternJ3sS76dH3w
2Qb9yLIBpDSbOnohYQQunrl8VuYdeCw2w0NZc9jsbslAgs6yc5EIE/6PoX//fwOn
Tf1ER5hbSetx0Lk+7Jaw3eVDH5r6Uw==
=GpdO
-----END PGP SIGNATURE-----

--EemXnrF2ob+xzFeB--

--===============3943229247751328346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3943229247751328346==--
