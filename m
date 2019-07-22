Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7924C6FBBB
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 11:06:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C845AC7D;
	Mon, 22 Jul 2019 09:06:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 76E62B88
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 09:06:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3B54FF1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 09:06:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B40D2307D88C;
	Mon, 22 Jul 2019 09:06:36 +0000 (UTC)
Received: from localhost (ovpn-117-250.ams2.redhat.com [10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C788010027B9;
	Mon, 22 Jul 2019 09:06:33 +0000 (UTC)
Date: Mon, 22 Jul 2019 10:06:32 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 4/5] vhost/vsock: split packets to send using multiple
	buffers
Message-ID: <20190722090632.GD24934@stefanha-x1.localdomain>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-5-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190717113030.163499-5-sgarzare@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 22 Jul 2019 09:06:36 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============0824544068008785175=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============0824544068008785175==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BI5RvnYi6R4T2M87"
Content-Disposition: inline


--BI5RvnYi6R4T2M87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 01:30:29PM +0200, Stefano Garzarella wrote:
> If the packets to sent to the guest are bigger than the buffer
> available, we can split them, using multiple buffers and fixing
> the length in the packet header.
> This is safe since virtio-vsock supports only stream sockets.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  drivers/vhost/vsock.c                   | 66 ++++++++++++++++++-------
>  net/vmw_vsock/virtio_transport_common.c | 15 ++++--
>  2 files changed, 60 insertions(+), 21 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--BI5RvnYi6R4T2M87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl01fJgACgkQnKSrs4Gr
c8iGEAf8Djr/PEoFhNeRcB4nTbEZ0yqI9J0bTIg+5JPeRIwVuw8VN0SNdYcbUn4x
8z5Ze/MQcXrji7cU3OHBfNC0aTebpQ7odl8Fh+0Ge74z8CGT4fjTHgVVuFXcGOdw
oO0lLxNBn1PEZG3GziU7v1nnOOQMP7p1uedmMBNm1eRJztxOFGIfbl7eQzGYE0/0
UvnT0EbbiIaqcN151Db4L94rvRASIhKQSvk/Vx9lM6kKFzjJml2dO/pirzJvwyg7
ToYEINcqb5vJibA/uV9zXiaQPIuAi4HNSrXWXXvCyPZycd4MsISdRQSig44VmT3P
bkhomEAvwsqdfMfALjPSRENrlVKkhg==
=9pnw
-----END PGP SIGNATURE-----

--BI5RvnYi6R4T2M87--

--===============0824544068008785175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0824544068008785175==--
