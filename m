Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C238169EAB
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 07:44:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 73D3B85CB8;
	Mon, 24 Feb 2020 06:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpPgbs9yVnWo; Mon, 24 Feb 2020 06:44:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9685E85D41;
	Mon, 24 Feb 2020 06:44:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 815F0C18DA;
	Mon, 24 Feb 2020 06:44:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22657C1D88;
 Mon, 24 Feb 2020 06:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 03E4585B4D;
 Mon, 24 Feb 2020 06:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6z_j0EOWArY; Mon, 24 Feb 2020 06:43:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 311AB85BC8;
 Mon, 24 Feb 2020 06:43:56 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48QswR5bYFz9sRh; Mon, 24 Feb 2020 17:43:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582526631;
 bh=ZF5PG8T/t5BL5oaCO6K1q0KQ7vQbeqwM3LxrmTrD5EY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bVj1Dp6aUpCfIOZgD5kdvV05fCY+oTTKywiyc9cxriZC7InXfdxb/DT/Atn/qxCv7
 O6stUqLU4tHlAllQ0B3BCVqYzS/Wqn+uIdFxv0XCAB2JSjy717kH5q89gkoQqekPol
 MQiIowckKYzopovcwGfC1Gdj8tkKagI8QC3nKr8E=
Date: Mon, 24 Feb 2020 16:44:28 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 0/2] virtio: decouple protected guest RAM form
 VIRTIO_F_IOMMU_PLATFORM
Message-ID: <20200224054428.GF1751@umbus.fritz.box>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220163055-mutt-send-email-mst@kernel.org>
 <20200221164151.GD10054@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200221164151.GD10054@lst.de>
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
Content-Type: multipart/mixed; boundary="===============3167672314585441791=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============3167672314585441791==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nHwqXXcoX0o6fKCv"
Content-Disposition: inline


--nHwqXXcoX0o6fKCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 05:41:51PM +0100, Christoph Hellwig wrote:
> On Thu, Feb 20, 2020 at 04:33:35PM -0500, Michael S. Tsirkin wrote:
> > So it sounds like a host issue: the emulation of s390 unnecessarily com=
plicated.
> > Working around it by the guest looks wrong ...
>=20
> Yes.  If your host (and I don't care if you split hypervisor,
> ultravisor and megavisor out in your implementation) wants to
> support a VM architecture where the host can't access all guest
> memory you need to ensure the DMA API is used.  Extra points for
> simply always setting the flag and thus future proofing the scheme.

Moving towards F_ACCESS_PLATFORM everywhere is a good idea (for other
reasons), but that doesn't make the problem as it exists right now go
away.

But, "you need to ensure the DMA API is used" makes no sense from the
host point of view.  The existence of the DMA API is an entirely guest
side, and Linux specific detail, the host can't make decisions based
on that.

For POWER - possibly s390 as well - the hypervisor has no way of
knowing at machine construction time whether it will be an old kernel
(or non Linux OS) which can't support F_ACCESS_PLATFORM, or a guest
which will enter secure mode and therefore requires F_ACCESS_PLATFORM
(according to you).  That's the fundamental problem here.

The normal virtio model of features that the guest can optionally
accept would work nicely here - except that that wouldn't work for the
case of hardware virtio devices, where the access limitations come
=66rom "host" (platform) side and therefore can't be disabled by that
host.

We really do have two cases here: 1) access restrictions originating
with the host/platform (e.g. hardware virtio) and 2) access
restrictions originating with the guest (e.g. secure VMs).  What we
need to do to deal with them is basically the same at the driver
level, but it has subtle and important differences at the platform
level.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nHwqXXcoX0o6fKCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5TYrkACgkQbDjKyiDZ
s5LgfA//XEY3lmBePwheA7+ZxvP//i1z+aeebGoX04iO9GIleC4oyEM4gwYIBsyE
wN2BIrmBL7Zv5wxxna4aFmlHWVHtjclnMlbnScF3iSkYjcAqB0WowhE+uMerv86z
0SQsaZBBEzM2AUCdyWpi1NvPPH6qWbB1BAlZ1gS18mpsYePFvZ5Yx7v8HlXoSdti
nHf9vONIz4DjMutYICE0h4wRSG8fE0Glav04Rlvy4G024l5rW3o3Hd4Fg6hlL6Bx
lG9vYtmbznT2FaqV1vvs9LHFQ+luXOqLisBYunWFHDGSBLqQdfWnVApMfHpmkudT
pVFwEZmU3Vdy0MgEF6mMunZ2vw0PqQaQSIw2KUm4KJXSLjrR2qI+XUY878F+hI5h
fvAxlo4FDEBDVgeIudJY28B/57nJdaMZCpxZB6YFHGtuQJU5VHFRLA1wi96A3mFr
W29jfmZcozEl2fpJyr7lg/znfmjbrAx63AeNJkKQ9lWpDGilVd90xHaWcEy+t28L
U9GggmVjYO4KOGiOTjkrY+wskuPj/qZaoEWFra3bzryLW5muVLoCT12H2X+NtcjF
2Poa8kmUAlBjnnrf3QLCh2rQQVuHNXMbS7eYpeSBfld+gHjj7FBMS5ymAnEK0X3B
WySnu4ZlVaDEYjtHlp6tvfiRlkt1PGQswZY8OhtHA6QBkQVs4t0=
=snSR
-----END PGP SIGNATURE-----

--nHwqXXcoX0o6fKCv--

--===============3167672314585441791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3167672314585441791==--
