Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 76148ADCCA
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 18:11:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0C2E3B1F;
	Mon,  9 Sep 2019 16:11:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7A09A255
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 16:10:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AAC5E8B6
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 16:10:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2841C31752A7;
	Mon,  9 Sep 2019 16:10:56 +0000 (UTC)
Received: from localhost (ovpn-117-107.ams2.redhat.com [10.36.117.107])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F76C60BF4;
	Mon,  9 Sep 2019 16:10:50 +0000 (UTC)
Date: Mon, 9 Sep 2019 18:10:45 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 08/18] virtiofs: Drain all pending requests during
	->remove time
Message-ID: <20190909161045.GD20875@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-9-vgoyal@redhat.com>
	<20190906105210.GP5900@stefanha-x1.localdomain>
	<20190906141705.GF22083@redhat.com>
	<20190906101819-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190906101819-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 09 Sep 2019 16:10:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: miklos@szeredi.hu, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, virtio-fs@redhat.com,
	dgilbert@redhat.com, linux-fsdevel@vger.kernel.org,
	Vivek Goyal <vgoyal@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============5704585827897124898=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============5704585827897124898==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline


--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2019 at 10:18:49AM -0400, Michael S. Tsirkin wrote:
> On Fri, Sep 06, 2019 at 10:17:05AM -0400, Vivek Goyal wrote:
> > On Fri, Sep 06, 2019 at 11:52:10AM +0100, Stefan Hajnoczi wrote:
> > > On Thu, Sep 05, 2019 at 03:48:49PM -0400, Vivek Goyal wrote:
> > > > +static void virtio_fs_drain_queue(struct virtio_fs_vq *fsvq)
> > > > +{
> > > > +	WARN_ON(fsvq->in_flight < 0);
> > > > +
> > > > +	/* Wait for in flight requests to finish.*/
> > > > +	while (1) {
> > > > +		spin_lock(&fsvq->lock);
> > > > +		if (!fsvq->in_flight) {
> > > > +			spin_unlock(&fsvq->lock);
> > > > +			break;
> > > > +		}
> > > > +		spin_unlock(&fsvq->lock);
> > > > +		usleep_range(1000, 2000);
> > > > +	}
> > >=20
> > > I think all contexts that call this allow sleeping so we could avoid
> > > usleep here.
> >=20
> > usleep_range() is supposed to be used from non-atomic context.
> >=20
> > https://github.com/torvalds/linux/blob/master/Documentation/timers/time=
rs-howto.rst
> >=20
> > What construct you are thinking of?
> >=20
> > Vivek
>=20
> completion + signal on vq callback?

Yes.  Time-based sleep() is sub-optimal because we could wake up exactly
when in_flight is decremented from the vq callback.  This avoids
unnecessary sleep wakeups and the extra time spent sleeping after
in_flight has been decremented.

Stefan

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl12eYUACgkQnKSrs4Gr
c8gSKQgAnEAvX9YIhk4yOMGl/UMlOnxBybw15xYg29qYtIPTCBl5Px/k0kPkDeK/
iHnhS/2epJz36c5DV0GEfGGX1HCzcKt9zLHZ5RI7NKV5HV5pBKsftliW6gY0yo/p
z0+lghQwP7izbE1EpPGWHichCu+hctoBnwlckg6TFmJxs+xWeSwdsDJ8Vya28tQl
IXvedRgLh0fOX8F7ZkH0pRrmAkzcERWoXjf17QeOEsntwzWWZ9/1LYOwzMo/1imn
exUSUMA7NFgVr4esi8G1LM3kHJRoaQcwCmSN9GGAc2dpUblNzwW04kmD6wAMpOXA
DvrZS9U0BxnNqVjpKlNjyH7fRY7epA==
=8+oH
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--

--===============5704585827897124898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5704585827897124898==--
