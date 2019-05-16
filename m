Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AF70820B4F
	for <lists.virtualization@lfdr.de>; Thu, 16 May 2019 17:32:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8B648B49;
	Thu, 16 May 2019 15:32:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 87D39504
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 15:32:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 49A7484F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 15:32:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAD9B3082131;
	Thu, 16 May 2019 15:32:23 +0000 (UTC)
Received: from localhost (ovpn-117-183.ams2.redhat.com [10.36.117.183])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFB8A5D72E;
	Thu, 16 May 2019 15:32:19 +0000 (UTC)
Date: Thu, 16 May 2019 16:32:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 2/8] vsock/virtio: free packets during the socket
	release
Message-ID: <20190516153218.GC29808@stefanha-x1.localdomain>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-3-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190510125843.95587-3-sgarzare@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 16 May 2019 15:32:23 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============1829386865257363735=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============1829386865257363735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2019 at 02:58:37PM +0200, Stefano Garzarella wrote:
> When the socket is released, we should free all packets
> queued in the per-socket list in order to avoid a memory
> leak.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  net/vmw_vsock/virtio_transport_common.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Ouch, this would be nice as a separate patch that can be merged right
away (with s/virtio_vsock_buf/virtio_vsock_pkt/).

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzdgoIACgkQnKSrs4Gr
c8inUgf/ZWWrRlkmdo0umzZLZb20m5kj29mccKVqTXumpuuP4uj0fUgYDiHaO2Nw
RzI9h1D2ZxH0eu8lymsu9LScLZ+x/WoZh36H7BDqAJCqvo3/t3mKQVRj8h+x2Pqg
nhlAE54DTQLjeNBahCiZSNHDx2znDN7XQhTGD4LlEJr4Fo5wxNkflX2aPUtwjH2P
dQFDh2kXCqneuo2QQ/GPpYAufMXA4+n2YNsLKPqV3XtJP26a14tbdhbqaGOnOV4q
J9tOGaC8xukkX331J0Pqo0lPRLwqgeJEYTbjsjfUHcw8OP9Fcsy+/tDZMALSTc1P
4gMCqmXG6V/yfH6zkt7xipW8qhpmsQ==
=htot
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--

--===============1829386865257363735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1829386865257363735==--
