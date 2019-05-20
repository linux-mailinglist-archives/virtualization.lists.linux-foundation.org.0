Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B727422F8B
	for <lists.virtualization@lfdr.de>; Mon, 20 May 2019 10:57:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7B692B6D;
	Mon, 20 May 2019 08:57:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A512CB4B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 08:57:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D54B27ED
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 08:57:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B11D307D90F;
	Mon, 20 May 2019 08:57:38 +0000 (UTC)
Received: from localhost (unknown [10.36.118.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00EB75D719;
	Mon, 20 May 2019 08:57:32 +0000 (UTC)
Date: Mon, 20 May 2019 09:57:31 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 1/8] vsock/virtio: limit the memory used per-socket
Message-ID: <20190520085731.GA22546@stefanha-x1.localdomain>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-2-sgarzare@redhat.com>
	<20190516152533.GB29808@stefanha-x1.localdomain>
	<20190517082505.ibjkuh7zibumen77@steredhat>
MIME-Version: 1.0
In-Reply-To: <20190517082505.ibjkuh7zibumen77@steredhat>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 20 May 2019 08:57:46 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============7835411519441482548=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============7835411519441482548==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2019 at 10:25:05AM +0200, Stefano Garzarella wrote:
> On Thu, May 16, 2019 at 04:25:33PM +0100, Stefan Hajnoczi wrote:
> > On Fri, May 10, 2019 at 02:58:36PM +0200, Stefano Garzarella wrote:
> > > +static struct virtio_vsock_buf *
> > > +virtio_transport_alloc_buf(struct virtio_vsock_pkt *pkt, bool zero_c=
opy)
> > > +{
> > > +	struct virtio_vsock_buf *buf;
> > > +
> > > +	if (pkt->len =3D=3D 0)
> > > +		return NULL;
> > > +
> > > +	buf =3D kzalloc(sizeof(*buf), GFP_KERNEL);
> > > +	if (!buf)
> > > +		return NULL;
> > > +
> > > +	/* If the buffer in the virtio_vsock_pkt is full, we can move it to
> > > +	 * the new virtio_vsock_buf avoiding the copy, because we are sure =
that
> > > +	 * we are not use more memory than that counted by the credit mecha=
nism.
> > > +	 */
> > > +	if (zero_copy && pkt->len =3D=3D pkt->buf_len) {
> > > +		buf->addr =3D pkt->buf;
> > > +		pkt->buf =3D NULL;
> > > +	} else {
> > > +		buf->addr =3D kmalloc(pkt->len, GFP_KERNEL);
> >=20
> > buf and buf->addr could be allocated in a single call, though I'm not
> > sure how big an optimization this is.
> >=20
>=20
> IIUC, in the case of zero-copy I should allocate only the buf,
> otherwise I should allocate both buf and buf->addr in a single call
> when I'm doing a full-copy.
>=20
> Is it correct?

Yes, but it's your choice whether optimization is worthwhile.  If it
increases the complexity of the code and doesn't result in a measurable
improvement, then it's not worth it.

Stefan

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzia/sACgkQnKSrs4Gr
c8j8/Qf+NOeZJ2tO8MN+lVvjuwE3gShPAFPc2joqHrqQkZPrfOMHyxNPWBjmd06G
mJaov5ZMGAQQdvkkJatcCbnrnV2IuYLbZyGpfQAGrjVZ4S5RtU8/2VpksfxRJNDV
KrRPS/HoPQrDfJcMnsRxXSpf0dFcG/WptgKFMOlzLPAKiwWZ62dpc/m8ghrHXbzz
/x/TaT4NA9m4S3NwFqZYq/kTQwiXtrSU40sPo/QGk6Wn5o4sTcgNDEveJK3KsLI+
p8KQrt7muGMn9FbRrLjwq2VytiLXksXrdFAeWugUon0qEkmxaKiUSNvbgof0/qi3
4DwGQi4FYh6hvSyjckKOVP/y/F8jSg==
=1IhX
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--

--===============7835411519441482548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7835411519441482548==--
