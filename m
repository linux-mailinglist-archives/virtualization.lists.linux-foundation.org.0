Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 414FDD3B48
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 10:36:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4278810A7;
	Fri, 11 Oct 2019 08:36:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 15FA310A6
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 08:27:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BFCEE14D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 08:27:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25DF7302C09B;
	Fri, 11 Oct 2019 08:27:19 +0000 (UTC)
Received: from localhost (unknown [10.36.118.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91C105D9DC;
	Fri, 11 Oct 2019 08:27:15 +0000 (UTC)
Date: Fri, 11 Oct 2019 09:27:14 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 07/13] vsock: handle buffer_size sockopts in the core
Message-ID: <20191011082714.GF12360@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-8-sgarzare@redhat.com>
	<20191009123026.GH5747@stefanha-x1.localdomain>
	<20191010093254.aluys4hpsfcepb42@steredhat>
MIME-Version: 1.0
In-Reply-To: <20191010093254.aluys4hpsfcepb42@steredhat>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 11 Oct 2019 08:27:19 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Jorgen Hansen <jhansen@vmware.com>
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
Content-Type: multipart/mixed; boundary="===============1237859863142675809=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============1237859863142675809==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y/WcH0a6A93yCHGr"
Content-Disposition: inline


--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2019 at 11:32:54AM +0200, Stefano Garzarella wrote:
> On Wed, Oct 09, 2019 at 01:30:26PM +0100, Stefan Hajnoczi wrote:
> > On Fri, Sep 27, 2019 at 01:26:57PM +0200, Stefano Garzarella wrote:
> > Another issue is that this patch drops the VIRTIO_VSOCK_MAX_BUF_SIZE
> > limit that used to be enforced by virtio_transport_set_buffer_size().
> > Now the limit is only applied at socket init time.  If the buffer size
> > is changed later then VIRTIO_VSOCK_MAX_BUF_SIZE can be exceeded.  If
> > that doesn't matter, why even bother with VIRTIO_VSOCK_MAX_BUF_SIZE
> > here?
> >=20
>=20
> The .notify_buffer_size() should avoid this issue, since it allows the
> transport to limit the buffer size requested after the initialization.
>=20
> But again the min set by the user can not be respected and in the
> previous implementation we forced it to VIRTIO_VSOCK_MAX_BUF_SIZE.
>=20
> Now we don't limit the min, but we guarantee only that vsk->buffer_size
> is lower than VIRTIO_VSOCK_MAX_BUF_SIZE.
>=20
> Can that be an acceptable compromise?

I think so.

Setting buffer sizes was never tested or used much by userspace
applications that I'm aware of.  We should probably include tests for
changing buffer sizes in the test suite.

Stefan

--Y/WcH0a6A93yCHGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2gPOIACgkQnKSrs4Gr
c8hnpAf/bZLlTd0r+EaHBLvVtn6u74O2zVoTaaQWQnOazMVH14CZaHHOu1c41TX7
Q0re/sK84wgqeIYkL3oZytOaV0XcGl6gisahwdaj2B0vFbihvsFYpvh7RDO3HQ68
w1qOfDkUS9sTi3UYClbO7gHJfF/29ekUBFgoscFN8DwmqhMZ0BmjlQbI5G7Bx/vb
BsykLfJ1+i+pjEwaf7OnJWjg/D/XEcMgWuwt3TDu4weM4m7URnromXRaunFLetC5
rq7dPRsobckPtCGqpZlg9p9YRqCfyVJKOd/by5XeJVT/0aC5fi0t/gHLBSwCpL3R
6nAoSm1TARBDHhE/TRKT7m4aV/5H3Q==
=76ga
-----END PGP SIGNATURE-----

--Y/WcH0a6A93yCHGr--

--===============1237859863142675809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1237859863142675809==--
