Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2BD75AB
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 13:56:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4B104CA1;
	Tue, 15 Oct 2019 11:56:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F2FD7CA1
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:56:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7A75C5D3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:56:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1225308FBB4;
	Tue, 15 Oct 2019 11:56:41 +0000 (UTC)
Received: from localhost (ovpn-116-252.ams2.redhat.com [10.36.116.252])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52C175D9E2;
	Tue, 15 Oct 2019 11:56:38 +0000 (UTC)
Date: Tue, 15 Oct 2019 12:56:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net 0/2] vsock: don't allow half-closed socket in the
	host transports
Message-ID: <20191015115637.GA1346@stefanha-x1.localdomain>
References: <20191011130758.22134-1-sgarzare@redhat.com>
	<20191011101408-mutt-send-email-mst@kernel.org>
	<20191011143457.4ujt3gg7oxco6gld@steredhat>
	<20191012183838-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191012183838-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 15 Oct 2019 11:56:42 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Adit Ranadive <aditr@vmware.com>, "David S. Miller" <davem@davemloft.net>,
	Jorgen Hansen <jhansen@vmware.com>,
	Stefano Garzarella <sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============7560174157302438320=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============7560174157302438320==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2019 at 06:38:46PM -0400, Michael S. Tsirkin wrote:
> On Fri, Oct 11, 2019 at 04:34:57PM +0200, Stefano Garzarella wrote:
> > On Fri, Oct 11, 2019 at 10:19:13AM -0400, Michael S. Tsirkin wrote:
> > > On Fri, Oct 11, 2019 at 03:07:56PM +0200, Stefano Garzarella wrote:
> > > > We are implementing a test suite for the VSOCK sockets and we disco=
vered
> > > > that vmci_transport never allowed half-closed socket on the host si=
de.
> > > >=20
> > > > As Jorgen explained [1] this is due to the implementation of VMCI.
> > > >=20
> > > > Since we want to have the same behaviour across all transports, this
> > > > series adds a section in the "Implementation notes" to exaplain this
> > > > behaviour, and changes the vhost_transport to behave the same way.
> > > >=20
> > > > [1] https://patchwork.ozlabs.org/cover/847998/#1831400
> > >=20
> > > Half closed sockets are very useful, and lots of
> > > applications use tricks to swap a vsock for a tcp socket,
> > > which might as a result break.
> >=20
> > Got it!
> >=20
> > >=20
> > > If VMCI really cares it can implement an ioctl to
> > > allow applications to detect that half closed sockets aren't supporte=
d.
> > >=20
> > > It does not look like VMCI wants to bother (users do not read
> > > kernel implementation notes) so it does not really care.
> > > So why do we want to cripple other transports intentionally?
> >=20
> > The main reason is that we are developing the test suite and we noticed
> > the miss match. Since we want to make sure that applications behave in
> > the same way on different transports, we thought we would solve it that
> > way.
> >=20
> > But what you are saying (also in the reply of the patches) is actually
> > quite right. Not being publicized, applications do not expect this beha=
vior,
> > so please discard this series.
> >=20
> > My problem during the tests, was trying to figure out if half-closed
> > sockets were supported or not, so as you say adding an IOCTL or maybe
> > better a getsockopt() could solve the problem.
> >=20
> > What do you think?
> >=20
> > Thanks,
> > Stefano
>=20
> Sure, why not.

The aim is for applications using AF_VSOCK sockets to run on any
transport.  When the semantics differ between transports it creates a
compatibility problem.

That said, I do think keeping the standard sockets behavior is
reasonable.  If applications have problems on VMCI a sockopt may be
necessary :(.

Stefan

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2ls/UACgkQnKSrs4Gr
c8hXfQf8DmC3BVfNYClaxCwUaQbqYFilievM4mTXLUF9Hf5yhcrEeaXDL3MDuzba
vCMXFtTonmxmoMMRYtU+HmWKQP/02aBLgym3JOuiedb8QADkYIhPo1xtppIeC43U
D9G+/UzHiVKOfHm2XmVpjdOGbY4xmD/J6qAOPKlFdju2ateq5Bj8AawcuuXmMewK
ZuwZiIDK3GditH12SUl2PA9u10321wXpIhjZ5MeydxSviL91A0HN5xfwJxwxZmlR
ddc+4gBPdGWmz5XpDutchJ4mQbcc4NA6nUvzBG43+0JhhQiAR8nvzPlTcN4mTQmw
oGdDYLLcMdYh3HG0E6UrCOwaRlB0DQ==
=2zm7
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--

--===============7560174157302438320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7560174157302438320==--
