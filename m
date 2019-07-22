Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B82556FBA1
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 10:53:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 52959C7A;
	Mon, 22 Jul 2019 08:53:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7A0BCC5C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 08:53:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 44951F1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 08:53:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69A6D30BC57D;
	Mon, 22 Jul 2019 08:53:28 +0000 (UTC)
Received: from localhost (ovpn-117-250.ams2.redhat.com [10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A4E65DA2E;
	Mon, 22 Jul 2019 08:53:25 +0000 (UTC)
Date: Mon, 22 Jul 2019 09:53:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 3/5] vsock/virtio: fix locking in
	virtio_transport_inc_tx_pkt()
Message-ID: <20190722085319.GC24934@stefanha-x1.localdomain>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-4-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190717113030.163499-4-sgarzare@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 22 Jul 2019 08:53:28 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
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
Content-Type: multipart/mixed; boundary="===============8321079117283513658=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============8321079117283513658==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 01:30:28PM +0200, Stefano Garzarella wrote:
> fwd_cnt and last_fwd_cnt are protected by rx_lock, so we should use
> the same spinlock also if we are in the TX path.
>=20
> Move also buf_alloc under the same lock.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/linux/virtio_vsock.h            | 2 +-
>  net/vmw_vsock/virtio_transport_common.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl01eX8ACgkQnKSrs4Gr
c8jE7AgAs5N6O7elzpZi4u/g75m8dfsiRpiyEG+NXL6ahFUWKw98b80S/q2RNHZR
udZDGbmyVjnwH1pok2YnjdwcqCq515JelqAdv7CdhhzzRZdwiHGMQh8uqHYDfzGZ
R2V0hSJAiSG21HxP+RBG6VoWCoBUeQU/vce3jkYsxT6F64tUqeqxJd/C+AcRHOKk
dxxTmtn2NdRRs6Hofl5nW0ulYG/wxRRtN3dTf+V/FKkXLYv1197AD0+JXZnTRw2s
159FbLvqqdFzBGt2HORUTR+7aTcBuILeDuLW8gJT6JrFF2MIw1B0VaSB0Lbv0mN6
tuZAmnZlcurH5zz8i5XOJ5mugHY72w==
=VeGT
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--

--===============8321079117283513658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8321079117283513658==--
