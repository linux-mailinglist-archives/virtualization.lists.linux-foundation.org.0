Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7D15F672
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 12:17:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0EBCA1081;
	Thu,  4 Jul 2019 10:17:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7D5EAD9C
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 10:17:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 36F8F87F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 10:17:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 824E930001E2;
	Thu,  4 Jul 2019 10:17:05 +0000 (UTC)
Received: from localhost (ovpn-117-206.ams2.redhat.com [10.36.117.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6416118B93;
	Thu,  4 Jul 2019 10:17:02 +0000 (UTC)
Date: Thu, 4 Jul 2019 11:17:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 1/3] vsock/virtio: use RCU to avoid use-after-free on
	the_virtio_vsock
Message-ID: <20190704101701.GD1609@stefanha-x1.localdomain>
References: <20190628123659.139576-1-sgarzare@redhat.com>
	<20190628123659.139576-2-sgarzare@redhat.com>
	<05311244-ed23-d061-a620-7b83d83c11f5@redhat.com>
	<20190703104135.wg34dobv64k7u4jo@steredhat>
MIME-Version: 1.0
In-Reply-To: <20190703104135.wg34dobv64k7u4jo@steredhat>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 04 Jul 2019 10:17:05 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============3869138262992494930=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============3869138262992494930==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Content-Disposition: inline


--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2019 at 12:41:35PM +0200, Stefano Garzarella wrote:
> On Wed, Jul 03, 2019 at 05:53:58PM +0800, Jason Wang wrote:
> > On 2019/6/28 =E4=B8=8B=E5=8D=888:36, Stefano Garzarella wrote:
> > Another more interesting question, I believe we will do singleton for
> > virtio_vsock structure. Then what's the point of using vdev->priv to ac=
cess
> > the_virtio_vsock? It looks to me we can it brings extra troubles for do=
ing
> > synchronization.
>=20
> I thought about it when I tried to use RCU to stop the worker and I
> think make sense. Maybe can be another series after this will be merged.
>=20
> @Stefan, what do you think about that?

Yes, let's make it a singleton and keep no other references to it.

Stefan

--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0d0h0ACgkQnKSrs4Gr
c8i7uAf/QXuDj1LvILBy4mvMHIq38SqbW5mFIsodkTbGDB7yc/P8sUakOgHd3iqg
B7T4t6bHfBmin86sSvgINZoQ2Ce0Cl5gfAUArX22oxCNNwo5U0rb6uLLj0aIi66M
JgXi44ww1uhDIqrgJAVltxIQCV6jjLNNR0Qz19oTEV1qNl4UkY4+iew3ebbt/sid
lBqxCSTTuA6dhA2R74j7mNtahfRXHiKqfz/fvnMIt6eayMHvx9cIpGJn+ZcJ5wNr
n55WOBLvBc+xom4siTtiE+R5ZOATuxyfbvCncpj5a6p3wfMDtYIWTh/UeAEyDesp
lL1CmfZat5mLZ1F0gxgjgE5alpkjuw==
=02pH
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--

--===============3869138262992494930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3869138262992494930==--
