Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A35DB8BBEE
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 16:48:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 79B57BE7;
	Tue, 13 Aug 2019 14:47:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CD61ABB3;
	Tue, 13 Aug 2019 14:47:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 87FCC67F;
	Tue, 13 Aug 2019 14:47:46 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
	id 467Ftl594Dz9sN1; Wed, 14 Aug 2019 00:47:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1565707663;
	bh=YSf4/YKDTs2wsPKYpWpVsROZ9TkPMAXnHxWQNLas4ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RL7wRDBnOANeQePVqkn3FJuiHQUYJQd/cb/dQZ/3SDxdB92pdJf/cJeJiDGnTLJCl
	rBSj0c8hn7JlnGn2go3uzHbhLJcFsA97E5o9TJgefD0W+kXcz8Fww9xsPBQGXHpdmu
	iQo4GX9xOdCk3vr3TirWKAtH2Rhs2p3fGutGDX0E=
Date: Wed, 14 Aug 2019 00:24:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190813142439.GO3947@umbus.fritz.box>
References: <87zhrj8kcp.fsf@morokweng.localdomain>
	<20190810143038-mutt-send-email-mst@kernel.org>
	<20190810220702.GA5964@ram.ibm.com> <20190811055607.GA12488@lst.de>
	<20190812095156.GD3947@umbus.fritz.box>
	<20190813132617.GA6426@lst.de>
MIME-Version: 1.0
In-Reply-To: <20190813132617.GA6426@lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexey Kardashevskiy <aik@linux.ibm.com>,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Paul Mackerras <paulus@ozlabs.org>, iommu@lists.linux-foundation.org,
	linuxppc-devel@lists.ozlabs.org
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
Content-Type: multipart/mixed; boundary="===============1660255041622460718=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============1660255041622460718==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xexMVKTdXPhpRiVT"
Content-Disposition: inline


--xexMVKTdXPhpRiVT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 03:26:17PM +0200, Christoph Hellwig wrote:
> On Mon, Aug 12, 2019 at 07:51:56PM +1000, David Gibson wrote:
> > AFAICT we already kind of abuse this for the VIRTIO_F_IOMMU_PLATFORM,
> > because to handle for cases where it *is* a device limitation, we
> > assume that if the hypervisor presents VIRTIO_F_IOMMU_PLATFORM then
> > the guest *must* select it.
> >=20
> > What we actually need here is for the hypervisor to present
> > VIRTIO_F_IOMMU_PLATFORM as available, but not required.  Then we need
> > a way for the platform core code to communicate to the virtio driver
> > that *it* requires the IOMMU to be used, so that the driver can select
> > or not the feature bit on that basis.
>=20
> I agree with the above, but that just brings us back to the original
> issue - the whole bypass of the DMA OPS should be an option that the
> device can offer, not the other way around.  And we really need to
> fix that root cause instead of doctoring around it.

I'm not exactly sure what you mean by "device" in this context.  Do
you mean the hypervisor (qemu) side implementation?

You're right that this was the wrong way around to begin with, but as
well as being hard to change now, I don't see how it really addresses
the current problem.  The device could default to IOMMU and allow
bypass, but the driver would still need to get information from the
platform to know that it *can't* accept that option in the case of a
secure VM.  Reversed sense, but the same basic problem.

The hypervisor does not, and can not be aware of the secure VM
restrictions - only the guest side platform code knows that.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xexMVKTdXPhpRiVT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1SyCcACgkQbDjKyiDZ
s5I4bQ//S4EUhoZcI/LsW/VYsc9vUb4nR5PFUpsfHBRPpz5LSCyiE0zj6HPD0NEw
xx7wFiEoEoijTK2eUAql0bciMMkjU4bktaIRNxHL0gHTJ+bYC0JQK42DBFC6t/9L
2D5DD8K9CYwIwxjYOPlxaxCEJfVKLLCMwBXmO3n1wbp3DO4ejeOq6TcsFfzF079C
rj1ofD3aAdjKicydMAWXVOly4fcAimPwCI+CU/hEuAiT5OOsvl3RkOcPQ2psC0kr
AhWUtFFDmdTosz+3HvByFrQoIsWS833CETD/+h7QPRfcgdDnoctb5QY9oyqSCxvH
phO1O07WExt8rXrRAWJvP81K0n+b4cTuw8aUKp8qchHopQUrSiUfwM0vLFgbHmPj
qG+x3Z1XfdMRWJjnst0aF/EMnI3GXl+d2hzMJLbXicj0F4HLnn/F2mkQbXRkOcFw
8gilmJLNmOhUWo8viy7dc90YU2i0HOQd6h0j+5fyfhYKf+4fWvodL6thBGHWWiTk
g63CjmoEZByRc5iDwuGf3vRBsFU26hDHYXh3mk8+AEmfZ0zMfE+6NvgEdPOvU82A
bwQU186bnnTF1AjRiGfC69gX4Dfe077FiFjcDwS6ojR+21MojjdITMsVOKw4ZwfQ
wwnomYbPb7NjK2QJcSM8AqbQftwvqAIzBtjPEOsknnb4VyoVTXs=
=2Lh2
-----END PGP SIGNATURE-----

--xexMVKTdXPhpRiVT--

--===============1660255041622460718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1660255041622460718==--
