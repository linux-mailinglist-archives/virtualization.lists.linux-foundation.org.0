Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C4C166DD5
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 04:37:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 104A486E2A;
	Fri, 21 Feb 2020 03:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kyllJgtlS+b; Fri, 21 Feb 2020 03:37:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC3DE86E3F;
	Fri, 21 Feb 2020 03:37:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1186C013E;
	Fri, 21 Feb 2020 03:37:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34DDFC013E;
 Fri, 21 Feb 2020 03:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1E36B85722;
 Fri, 21 Feb 2020 03:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izHJedFEU0ws; Fri, 21 Feb 2020 03:37:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0DDB5855F7;
 Fri, 21 Feb 2020 03:36:59 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48Nxw96pvRz9sS3; Fri, 21 Feb 2020 14:36:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582256217;
 bh=023zimJNppk3UBUgHQ61G7caK9h50x5C45Mcz1ME6eA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e3zdRwhjeJUcGi8UjR/bkaGU7iqvokZ0xSIereTY15GrOforn7fnCxaUAuHbxiZM4
 emwuWpBssUMeLJe/wGXWIiu66flWbyJ4cJ4MGXqogR27W3pz7uFchHhFUzLrqu3Y2+
 PplWrOzzPS2DH7Rn+fVEvIcvBGYlpQZH/yJb1Ohw=
Date: Fri, 21 Feb 2020 14:29:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH 2/2] virtio: let virtio use DMA API when guest RAM is
 protected
Message-ID: <20200221032907.GD2298@umbus.fritz.box>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220160606.53156-3-pasic@linux.ibm.com>
 <20200220154904-mutt-send-email-mst@kernel.org>
 <20200221011748.GE5713@oc0525413822.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20200221011748.GE5713@oc0525413822.ibm.com>
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Michael Mueller <mimu@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1655836899128473284=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============1655836899128473284==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RhUH2Ysw6aD5utA4"
Content-Disposition: inline


--RhUH2Ysw6aD5utA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 05:17:48PM -0800, Ram Pai wrote:
> On Thu, Feb 20, 2020 at 03:55:14PM -0500, Michael S. Tsirkin wrote:
> > On Thu, Feb 20, 2020 at 05:06:06PM +0100, Halil Pasic wrote:
> > > Currently the advanced guest memory protection technologies (AMD SEV,
> > > powerpc secure guest technology and s390 Protected VMs) abuse the
> > > VIRTIO_F_IOMMU_PLATFORM flag to make virtio core use the DMA API, whi=
ch
> > > is in turn necessary, to make IO work with guest memory protection.
> > >=20
> > > But VIRTIO_F_IOMMU_PLATFORM a.k.a. VIRTIO_F_ACCESS_PLATFORM is really=
 a
> > > different beast: with virtio devices whose implementation runs on an =
SMP
> > > CPU we are still fine with doing all the usual optimizations, it is j=
ust
> > > that we need to make sure that the memory protection mechanism does n=
ot
> > > get in the way. The VIRTIO_F_ACCESS_PLATFORM mandates more work on the
> > > side of the guest (and possibly he host side as well) than we actually
> > > need.
> > >=20
> > > An additional benefit of teaching the guest to make the right decision
> > > (and use DMA API) on it's own is: removing the need, to mandate speci=
al
> > > VM configuration for guests that may run with protection. This is
> > > especially interesting for s390 as VIRTIO_F_IOMMU_PLATFORM pushes all
> > > the virtio control structures into the first 2G of guest memory:
> > > something we don't necessarily want to do per-default.
> > >=20
> > > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > > Tested-by: Ram Pai <linuxram@us.ibm.com>
> > > Tested-by: Michael Mueller <mimu@linux.ibm.com>
> >=20
> > This might work for you but it's fragile, since without
> > VIRTIO_F_ACCESS_PLATFORM hypervisor assumes it gets
> > GPA's, not DMA addresses.
> >=20
> >=20
> >=20
> > IOW this looks like another iteration of:
> >=20
> > 	virtio: Support encrypted memory on powerpc secure guests
> >=20
> > which I was under the impression was abandoned as unnecessary.
>=20
> It has been abondoned on powerpc. We enabled VIRTIO_F_ACCESS_PLATFORM;
> by default, flag on powerpc.

Uh... we haven't yet, though we're working on it.

> We would like to enable secure guests on powerpc without this flag
> aswell enabled, but past experience has educated us that its not a easy
> path.  However if Halil makes some inroads in this path for s390, we
> will like to support him.
>=20
>=20
> RP
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RhUH2Ysw6aD5utA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5PToIACgkQbDjKyiDZ
s5L9mw//e6UlWdIjS0sVfS3LR0dfVU8WuWvcWGPlHsAvqf8ahlSYAPlyL8YHIHwe
kntSk9WXkEn3jRCsD+nHK+dAu10C1hiGl18RH+S0yisKRnH+WabU1oesIh5cDwaV
r+bZsU3HPaTwHS83yVNRYjoic3ZjV97karqDYGMHSnWWbVqCDZDnREwxG3VE1jm7
7sdJak8rTIZ1AUezQwSKgfIy4lkCGVoaUC9ZKIvdWVIHywQvtXDn2ikbGENaY3E3
MaU7NicXVogmy+beOzkOWNst0Xfm6N+oGHw2O/8zRpsmk95YAg84UGYEg4GfTEKE
UGjNeeMDAL5lMYRbqdbzBve+wGmgnyThjGwt3PeivwATqEiL3j8AmOelUmQ9SY2y
qPOTzprDVU+Vu0A+6NHBPuzvhFZr5dVpD4n5kF+TeH6lp+m4GC9YCIN6hT6NE+DG
/yc/2QUJk14otNc/h7Nk+RqVm1+ZORWoDqiISB/M3U2t3kaai0hczJ6q2tDjl1pJ
cDx9sX8mVAhyOT3LSxvfOrRDsUwyzuUjrqJCh9gnXv073cc8E6VnFb7g+Cj+NUYP
tbh3wOC7KKoovvfI4x2YrPNpkDSAOE91h5gaM1sFtmsB0leF77mrbDAwncZHC5C8
2EWMVf3S2sJLq9s1CulJ8Zc27iCG9F/71Bd88Nitf2HIvFqDSZs=
=5mIy
-----END PGP SIGNATURE-----

--RhUH2Ysw6aD5utA4--

--===============1655836899128473284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1655836899128473284==--
