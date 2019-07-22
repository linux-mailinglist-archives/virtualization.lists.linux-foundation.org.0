Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA156FB67
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 10:37:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 55291C6D;
	Mon, 22 Jul 2019 08:36:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9092FC2A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 08:36:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 40F27F1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 08:36:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA7ED85365;
	Mon, 22 Jul 2019 08:36:44 +0000 (UTC)
Received: from localhost (ovpn-117-250.ams2.redhat.com [10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EC2819D71;
	Mon, 22 Jul 2019 08:36:41 +0000 (UTC)
Date: Mon, 22 Jul 2019 09:36:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 2/5] vsock/virtio: reduce credit update messages
Message-ID: <20190722083640.GB24934@stefanha-x1.localdomain>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-3-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190717113030.163499-3-sgarzare@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 22 Jul 2019 08:36:44 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============5773362539808652197=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============5773362539808652197==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 01:30:27PM +0200, Stefano Garzarella wrote:
> In order to reduce the number of credit update messages,
> we send them only when the space available seen by the
> transmitter is less than VIRTIO_VSOCK_MAX_PKT_BUF_SIZE.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/linux/virtio_vsock.h            |  1 +
>  net/vmw_vsock/virtio_transport_common.c | 16 +++++++++++++---
>  2 files changed, 14 insertions(+), 3 deletions(-)

It's an arbitrary limit but the risk of regressions is low since the
credit update traffic was so excessive:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl01dZgACgkQnKSrs4Gr
c8h/oQgAuTo0CerV6R9QtoxW4hcg6Tkq8sm7tBtXxSlRDhm5cvCYY3GKnhq1R/d0
Kg0hqcHUpqMsLT0yNza3j2F2USkvoxFm3wMgKijp5A0L15YVUQ+qZOwxVfBw9wDe
RXeY5bMyEHE5MFFtMfGDAiNyL1umrZ0Cy2RSYdzc+JhvZEkFyvwqE/za5PmXhofP
hF5u98zTLSjIxjxMAl7I7obkZIaJmU4A5XDUWwucqQm4wBP4QFQQqocM91RlQ7Gz
slJK7JiLWEpd2ka1VDVK9AfgE6R0dnT6tZ1r306NaG0moJmgts9gm3ETffKce8bn
OlHQa8PxT//6DYE3ghoFPTOpYxFqLw==
=G3Rg
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--

--===============5773362539808652197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5773362539808652197==--
