Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BB138166D80
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 04:27:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D85E86E71;
	Fri, 21 Feb 2020 03:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9zc7-gO2MbLE; Fri, 21 Feb 2020 03:27:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 68BD286E53;
	Fri, 21 Feb 2020 03:27:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56077C013E;
	Fri, 21 Feb 2020 03:27:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C39FBC013E;
 Fri, 21 Feb 2020 03:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BFDD786E1A;
 Fri, 21 Feb 2020 03:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EOcV84yG-mJV; Fri, 21 Feb 2020 03:27:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 68AED86E18;
 Fri, 21 Feb 2020 03:27:50 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48Nxjc3tDHz9sS3; Fri, 21 Feb 2020 14:27:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582255668;
 bh=iKptlhtjkgkIsdcJEVAHVMwjI89lNKjQ7HEHAkGj37o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SvbdaUavxTvf/pdBCZS/hwo/cFcJDx3AXHEPeo4dmS4LjE0QO1ICTIBLbdDUDwlSD
 TluHdPFcvWasZDuu181i/bcrOfbjrL2e+mMAYoEn8M3ITyswpVSktDPN5OrymYv2SV
 Pj6SH8iB+ZxgjkUtDEduBd1iw2b04kGhl6O37f+s=
Date: Fri, 21 Feb 2020 13:59:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] virtio: let virtio use DMA API when guest RAM is
 protected
Message-ID: <20200221025915.GB2298@umbus.fritz.box>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220160606.53156-3-pasic@linux.ibm.com>
 <20200220161309.GB12709@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200220161309.GB12709@lst.de>
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
Content-Type: multipart/mixed; boundary="===============5246512583095113353=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============5246512583095113353==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 05:13:09PM +0100, Christoph Hellwig wrote:
> On Thu, Feb 20, 2020 at 05:06:06PM +0100, Halil Pasic wrote:
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index 867c7ebd3f10..fafc8f924955 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -243,6 +243,9 @@ static bool vring_use_dma_api(struct virtio_device =
*vdev)
> >  	if (!virtio_has_iommu_quirk(vdev))
> >  		return true;
> > =20
> > +	if (force_dma_unencrypted(&vdev->dev))
> > +		return true;
>=20
> Hell no.  This is a detail of the platform DMA direct implementation.
> Drivers have no business looking at this flag, and virtio finally needs
> to be fixed to use the DMA API properly for everything but legacy devices.

So, this patch definitely isn't right as it stands, but I'm struggling
to understand what it is you're saying is the right way.

By "legacy devices" I assume you mean pre-virtio-1.0 devices, that
lack the F_VERSION_1 feature flag.  Is that right?  Because I don't
see how being a legacy device or not relates to use of the DMA API.

I *think* what you are suggesting here is that virtio devices that
have !F_IOMMU_PLATFORM should have their dma_ops set up so that the
DMA API treats IOVA=3D=3DPA, which will satisfy what the device expects.
Then the virtio driver can use the DMA API the same way for both
F_IOMMU_PLATFORM and !F_IOMMU_PLATFORM devices.

But if that works for !F_IOMMU_PLATFORM_DEVICES+F_VERSION_1 devices,
then AFAICT it will work equally well for legacy devices.

Using the DMA API for *everything* in virtio, legacy or not, seems
like a reasonable approach to me.  But, AFAICT, that does require the
DMA layer to have some kind of explicit call to turn on this
behaviour, which the virtio driver would call during initializsation.
I don't think we can do it 100% within the DMA layer, because only the
driver can reasonably know when a device has this weird non-standard
DMA behaviour.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5PR4EACgkQbDjKyiDZ
s5LraA/+KQYlg3wZ+0krCgI0rnOA1c4Rh7dkchkUxj0XPpjfegrcik9vB4AEk1uV
NViHfw9TklofjnE59FOo9Rexy90uk2aepCPMiba2Aidm0X+E9OMWIZ75l+9IyNod
fnTLSUCP45wGHQUcjIE1iL3TNJrTZ+F0bQkuu1rwZhtBHx+mKYmS005cUmOuiYQi
+gZAl8VlR/Ar3QktvDq1ChJai/rB22k+AWL9eL6fgpFGZv/E13hM25tKU61acUZh
WbtOBNEDoDs792CWCbIs9gqoeq1Whd555JS3nbAlDqNykTUMrfqDbbX/FdJlciPu
b1TlYEWQLmJDCv8xdPNj8Iep747a3Pc8pDhe7cALeEGvR8dEgbXE7+cx6l5rX6FW
glvHUQbw8/iD2tRbMLEfk1z/uyL7Gzugk7P6Xfeg+fNcGoL6ADR3DFCBUn1eD0Bf
EHyBM/WOmi1kn9p52fC3waAPg5BqftyrxFdGd2dI7mUjLvGeT/gxPnqfdaEDbdku
nlBw4/tcIdlesiIAiI+bCe4bX111KgcJvqVSjaRiS1YqFumJ1aySBzXpAfjqWW/p
2MU+m6v1xqCEDc7UY+aFtHrRw+CsByowyIFYfNcfSgDMvB9uFkvme4opmrdyAe+g
G/3fLNvewrGHvqTITJtkyQGQnyJEmHbcQMnWbSdQyqbQU+qO8tg=
=dMlk
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--

--===============5246512583095113353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5246512583095113353==--
