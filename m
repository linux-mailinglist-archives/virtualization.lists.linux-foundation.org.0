Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B3527169ED0
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 07:51:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC50286FCD;
	Mon, 24 Feb 2020 06:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjqdQPKRtnJ2; Mon, 24 Feb 2020 06:51:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CEE8386FF8;
	Mon, 24 Feb 2020 06:51:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A51FAC0177;
	Mon, 24 Feb 2020 06:51:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD702C0177;
 Mon, 24 Feb 2020 06:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B5131203F0;
 Mon, 24 Feb 2020 06:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8u5R8mBRahM; Mon, 24 Feb 2020 06:51:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by silver.osuosl.org (Postfix) with ESMTPS id A6EC3203E4;
 Mon, 24 Feb 2020 06:51:27 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48Qt596JR7z9sRQ; Mon, 24 Feb 2020 17:51:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582527085;
 bh=4toq+o4FWYWnXZF2qhVnr45b/rNEVYKG5cy9H9uQF6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gMA87Wx6tBiuJB6UgG+glqvbxC6ABwj/iRhqAEx62Xk9uiswratDNTSr3AAa71CXv
 GPUNJKQ/bDn7vXGBXFm2T/BC6o2tFusk2R+id/HezhrRbfqJ0xpErOvpDBEnHAlL93
 576GQ8Ja7NR/3iFZTxbI/J02SIr0x/x5yeKPtEZk=
Date: Mon, 24 Feb 2020 17:50:53 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] virtio: let virtio use DMA API when guest RAM is
 protected
Message-ID: <20200224065053.GM1751@umbus.fritz.box>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220160606.53156-3-pasic@linux.ibm.com>
 <20200220161309.GB12709@lst.de>
 <20200221025915.GB2298@umbus.fritz.box>
 <20200221163645.GB10054@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200221163645.GB10054@lst.de>
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Michael Mueller <mimu@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>,
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
Content-Type: multipart/mixed; boundary="===============3387094857185492849=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============3387094857185492849==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tv2SIFopg1r47n4a"
Content-Disposition: inline


--tv2SIFopg1r47n4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 05:36:45PM +0100, Christoph Hellwig wrote:
> On Fri, Feb 21, 2020 at 01:59:15PM +1100, David Gibson wrote:
> > > Hell no.  This is a detail of the platform DMA direct implementation.
> > > Drivers have no business looking at this flag, and virtio finally nee=
ds
> > > to be fixed to use the DMA API properly for everything but legacy dev=
ices.
> >=20
> > So, this patch definitely isn't right as it stands, but I'm struggling
> > to understand what it is you're saying is the right way.
> >=20
> > By "legacy devices" I assume you mean pre-virtio-1.0 devices, that
> > lack the F_VERSION_1 feature flag.  Is that right?  Because I don't
> > see how being a legacy device or not relates to use of the DMA API.
>=20
> No.   "legacy" is anything that does not set F_ACCESS_PLATFORM.

Hm, I see.

The trouble is I think we can only reasonably call things "legacy"
when essentially all currently in use OSes have support for the new,
better way of doing things.  That is, alas, not really the case for
F_ACCESS_PLATFORM.

> > I *think* what you are suggesting here is that virtio devices that
> > have !F_IOMMU_PLATFORM should have their dma_ops set up so that the
> > DMA API treats IOVA=3D=3DPA, which will satisfy what the device expects.
> > Then the virtio driver can use the DMA API the same way for both
> > F_IOMMU_PLATFORM and !F_IOMMU_PLATFORM devices.
>=20
> No.  Those should just keep using the existing legacy non-dma ops
> case and be done with it.  No changes to that and most certainly
> no new features.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tv2SIFopg1r47n4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5TckoACgkQbDjKyiDZ
s5K3ZRAAhMCdmN1OrUKfgLFhJWQQeC89dOZY69wRPSGHIRGqp2vdz/84iVFYTXtM
KJIVtt/k4q5tdpB8FDlRYkPkBjAxZxwUXCQ5ErZ8bUW+1l9qidMcmM81ud6CuDo5
JnNILm61f05ut+aJtoH8N9pHLWVp6Xd7D0U2EuZm3O1E1Ru7eWh89XVqZszqy/0v
wU+HF11K6jWai0ZBUmsbHzRzklrXB832SfHRxREYTgaAnfIJciC+VoYClfLDdz5l
IHqFw/HkmOM0gbiuTsirWTmIZYgdiGm2luvqn3UJRSUeMur5r1KAQb54VdTXoxm6
85M7AILjY82m3QKG4xWbSzH778IFxv3fhbfNo1lOT0f4IAn3bJ3xNrlP72vmzq03
mnU3XYWDD7Bi7ohPJmNL/KatbmLDSBGW55f6VxdcydKUEWC4EOdLhAm3D1L9GOI7
m9MOyhkKifhvysv3yA4+Wu6lEhJS7C/xLLzZIKuXS/2YWeplK4meqBoIgBnLD9L1
oD4EK/yI9AQu0WLj2SPUP5jWzMxaUzKHrseBf8Lzk1i/IrMrOxqYF3+Mz6hHZkey
+3lNPAAPuD+FeZC34MWsH7jL/JPT3RPDGHjtIf7fP2f/VPZygVJCOUh5/vYnX4dI
v2Jd5yIETXGCRsGnZcxnszGVK3J0zN+skCNsyIZKwRBsZuBTLj0=
=Q89/
-----END PGP SIGNATURE-----

--tv2SIFopg1r47n4a--

--===============3387094857185492849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3387094857185492849==--
