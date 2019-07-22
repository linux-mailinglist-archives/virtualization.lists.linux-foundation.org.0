Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2C36FBD8
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 11:08:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6094AC7C;
	Mon, 22 Jul 2019 09:08:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D68CD949
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 09:08:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7F58CF1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 09:08:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 094C4C058CBD;
	Mon, 22 Jul 2019 09:08:42 +0000 (UTC)
Received: from localhost (ovpn-117-250.ams2.redhat.com [10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCD9D19D71;
	Mon, 22 Jul 2019 09:08:36 +0000 (UTC)
Date: Mon, 22 Jul 2019 10:08:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 0/5] vsock/virtio: optimizations to increase the
	throughput
Message-ID: <20190722090835.GF24934@stefanha-x1.localdomain>
References: <20190717113030.163499-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190717113030.163499-1-sgarzare@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 22 Jul 2019 09:08:42 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>
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
Content-Type: multipart/mixed; boundary="===============7180977776759916593=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============7180977776759916593==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0rSojgWGcpz+ezC3"
Content-Disposition: inline


--0rSojgWGcpz+ezC3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 01:30:25PM +0200, Stefano Garzarella wrote:
> This series tries to increase the throughput of virtio-vsock with slight
> changes.
> While I was testing the v2 of this series I discovered an huge use of mem=
ory,
> so I added patch 1 to mitigate this issue. I put it in this series in ord=
er
> to better track the performance trends.
>=20
> v4:
> - rebased all patches on current master (conflicts is Patch 4)
> - Patch 1: added Stefan's R-b
> - Patch 3: removed lock when buf_alloc is written [David];
>            moved this patch after "vsock/virtio: reduce credit update mes=
sages"
>            to make it clearer
> - Patch 4: vhost_exceeds_weight() is recently introduced, so I've solved =
some
>            conflicts

Stefano: Do you want to continue experimenting before we merge this
patch series?  The code looks functionally correct and the performance
increases, so I'm happy for it to be merged.

--0rSojgWGcpz+ezC3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl01fRMACgkQnKSrs4Gr
c8jTLwgAkxfRp9mHdA/2v4fYnheHpBNa4CYfMPvJjwm3cV2wOPsoVqnPx6kFjNED
LJ54+h1tVFruOGHKnjsMYU4e9U9Aw2oLYV2FfAXJqeX6QzGM5Fp/pP7uaJt84htO
R/PUE2syWbEmd/O4BII7vdLSi6flpPHrnYE4qU585fU3C+zcSMa5J+cJKCQiE/ZD
mDwIQulVhh7pRJktNHPsi1YndADEm9ycqXU5UJYIMfoOilnT5Bri68hLS5fK410+
DMAONtomNK9EirCGpH8T6jNrLpJImwLFHsp6+VmAC6xcvDpQwR3WjIPlzkTlEb+X
DilvYlXPjDGvW6KgTTp+X70lkoIDnQ==
=2Juw
-----END PGP SIGNATURE-----

--0rSojgWGcpz+ezC3--

--===============7180977776759916593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7180977776759916593==--
