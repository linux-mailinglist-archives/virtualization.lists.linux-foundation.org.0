Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 762649AC93
	for <lists.virtualization@lfdr.de>; Fri, 23 Aug 2019 12:09:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 012D3E5D;
	Fri, 23 Aug 2019 10:09:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8AC43B8E
	for <virtualization@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 10:09:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 37D0FE6
	for <virtualization@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 10:09:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7DA53804F2;
	Fri, 23 Aug 2019 10:09:23 +0000 (UTC)
Received: from localhost (ovpn-117-204.ams2.redhat.com [10.36.117.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 870DB5D6B2;
	Fri, 23 Aug 2019 10:09:22 +0000 (UTC)
Date: Fri, 23 Aug 2019 11:09:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 11/11] vsock_test: wait for the remote to close the
	connection
Message-ID: <20190823100921.GD12092@stefanha-x1.localdomain>
References: <20190801152541.245833-1-sgarzare@redhat.com>
	<20190801152541.245833-12-sgarzare@redhat.com>
	<20190820082828.GA9855@stefanha-x1.localdomain>
	<20190822091546.qcns2kot6tzju7yv@steredhat>
MIME-Version: 1.0
In-Reply-To: <20190822091546.qcns2kot6tzju7yv@steredhat>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 23 Aug 2019 10:09:23 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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
Content-Type: multipart/mixed; boundary="===============3303573342666839353=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============3303573342666839353==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2iBwrppp/7QCDedR"
Content-Disposition: inline


--2iBwrppp/7QCDedR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2019 at 11:15:46AM +0200, Stefano Garzarella wrote:
> On Tue, Aug 20, 2019 at 09:28:28AM +0100, Stefan Hajnoczi wrote:
> > On Thu, Aug 01, 2019 at 05:25:41PM +0200, Stefano Garzarella wrote:
> > > +/* Wait for the remote to close the connection */
> > > +void vsock_wait_remote_close(int fd)
> > > +{
> > > +	struct epoll_event ev;
> > > +	int epollfd, nfds;
> > > +
> > > +	epollfd =3D epoll_create1(0);
> > > +	if (epollfd =3D=3D -1) {
> > > +		perror("epoll_create1");
> > > +		exit(EXIT_FAILURE);
> > > +	}
> > > +
> > > +	ev.events =3D EPOLLRDHUP | EPOLLHUP;
> > > +	ev.data.fd =3D fd;
> > > +	if (epoll_ctl(epollfd, EPOLL_CTL_ADD, fd, &ev) =3D=3D -1) {
> > > +		perror("epoll_ctl");
> > > +		exit(EXIT_FAILURE);
> > > +	}
> > > +
> > > +	nfds =3D epoll_wait(epollfd, &ev, 1, TIMEOUT * 1000);
> > > +	if (nfds =3D=3D -1) {
> > > +		perror("epoll_wait");
> > > +		exit(EXIT_FAILURE);
> > > +	}
> > > +
> > > +	if (nfds =3D=3D 0) {
> > > +		fprintf(stderr, "epoll_wait timed out\n");
> > > +		exit(EXIT_FAILURE);
> > > +	}
> > > +
> > > +	assert(nfds =3D=3D 1);
> > > +	assert(ev.events & (EPOLLRDHUP | EPOLLHUP));
> > > +	assert(ev.data.fd =3D=3D fd);
> > > +
> > > +	close(epollfd);
> > > +}
> >=20
> > Please use timeout_begin()/timeout_end() so that the test cannot hang.
> >=20
>=20
> I used the TIMEOUT macro in the epoll_wait() to avoid the hang.
> Do you think is better to use the timeout_begin()/timeout_end()?
> In this case, should I remove the timeout in the epoll_wait()?

Oops, you're right.  There are no other blocking calls in this function
so the existing patch is fine.

Thanks,
Stefan

--2iBwrppp/7QCDedR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1fu1EACgkQnKSrs4Gr
c8jQlQf/e7aGXCiFEXR/fv7L4FF9eS7lMkOgWamvi2VQREbzelZCJ2YN+WJbgScs
AoWswurbMlnTinfdZGo2iSdsB+8Y1Ufkivjv4thTUNOSkBF2M8Wxk3DG2Pnbttu4
+x3W1QWUop0vp8vw5w/P8zxG5k5AkwZu1CT9EbPv4eCUeCG9awehnr+dS5ThKl2S
tktgQl1Xn8C+drVb1J3hB8FPtuHp7MQ7uLNUJdNwwjBWVFXYTneOV83Y058VnWv+
SQnba6jDppi9aUSbvew7xpiMLwcIMstMjl9i62+fOjJnedQhWjMlmYXvRP7fC+lw
4a8sOFnOeh3zkFN9tpxISsv+LKpzvg==
=CuTk
-----END PGP SIGNATURE-----

--2iBwrppp/7QCDedR--

--===============3303573342666839353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3303573342666839353==--
