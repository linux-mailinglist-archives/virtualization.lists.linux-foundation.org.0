Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C3413C364
	for <lists.virtualization@lfdr.de>; Wed, 15 Jan 2020 14:41:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8F42085A73;
	Wed, 15 Jan 2020 13:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUT4IOI9GJ2Q; Wed, 15 Jan 2020 13:41:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 51B6685633;
	Wed, 15 Jan 2020 13:41:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A9AEC1D83;
	Wed, 15 Jan 2020 13:41:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D666C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 13:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 14B65855CC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 13:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHifXQrP1cFR
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 13:41:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B1D52855CB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 13:41:24 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0D91875C;
 Wed, 15 Jan 2020 08:41:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 15 Jan 2020 08:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QqIiV/
 BN6gqpvdsy9EAZpsClZh6SqobUkD22Mdc2smg=; b=khKIxb2/0sEN+UUVAk+OMc
 kWQ04vgp8Ct44iOGul10x9NjrN+ejsVnXTmD/ROgNh+Eq1zzGrCl2Ubym7ZHUtj2
 Gqf9Rsh9N1HEK20ZGXHMWC2eZCQ/6xkgGc6HRI8fm/8PueJAk0aB4YS1EEoBXd5Y
 ynnt5JLxK6DmoudSik2wZEaNna+KAtlf5uN8nH8IyGn8yhg7+aEU1T3R1DP8bZ94
 Pks5s5R0DMO2QOg9UaIlpCm73pHR0gG5/rlN8241CojSZ8fGQydqutwGsLZTyNSF
 yq1uJWeRmuu7KXMeO6yVpz2Mehtw4L9AvShKhsV029x31svcO+8gKGI/VuZtSKjQ
 ==
X-ME-Sender: <xms:gxYfXurr4_RQs27vXkTDH3bMzNKYQWI3vAj_tlaKQHcAELrStJ1rSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdefgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
 dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
 ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
 enucfkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 rhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhush
 htvghrufhiiigvpedu
X-ME-Proxy: <xmx:gxYfXnO8oeAxwyLBXSyO9yDMzPsLcrI2ctzQqM91TZAnFaCVsmdANA>
 <xmx:gxYfXvycUEHe3ThV0FROg3_Wuwf1YxAXkHDy3aPp4z0U58b2-_f-Aw>
 <xmx:gxYfXgt17ikmSMXRPSHv_EN6pBqjS60c004x0RMAS1_qfuh2bv8Kxw>
 <xmx:gxYfXtIU1NodWKmDluQ0LnBB08qf8j2dd3WCPKsX3hucJRtScDHtDQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D143A8006D;
 Wed, 15 Jan 2020 08:41:22 -0500 (EST)
Date: Wed, 15 Jan 2020 14:41:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible
Message-ID: <20200115134119.GP1314@mail-itl>
References: <20200110163211.GB29736@mail-itl>
 <20200113071939.rtqb7yw45zi63fqy@sirius.home.kraxel.org>
 <20200115003356.GL2507@mail-itl>
 <20200115100821.qcdraolkoki6e5tz@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20200115100821.qcdraolkoki6e5tz@sirius.home.kraxel.org>
Cc: virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============6210848139401305267=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============6210848139401305267==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IjzautVOrq+IorBk"
Content-Disposition: inline


--IjzautVOrq+IorBk
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="cU9XODsizZBnwgll"
Content-Disposition: inline
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible


--cU9XODsizZBnwgll
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2020 at 11:08:21AM +0100, Gerd Hoffmann wrote:
>   Hi,
>=20
> > > No clue why, also doesn't reproduce here (standard fedora 31 5.4.7
> > > kernel).  I don't have an encrypted disk, so no passphrase prompt,
> > > maybe that makes a difference.
> >=20
> > Extra data point: it worked on 4.19.89.
> >=20
> > > How does /proc/iomem look after boot, specifically the 0000:00:02.0 p=
ci
> > > bars?
> >=20
> > grep 0000:00:02.0 /proc/iomem
> >   c0000000-c0ffffff : 0000:00:02.0
> >   c1087000-c1087fff : 0000:00:02.0
>=20
> And "grep -A1 0000:00:02.0 /proc/iomem" ?

  c0000000-c0ffffff : 0000:00:02.0
  c1000000-c103ffff : 0000:00:04.0
--
  c1087000-c1087fff : 0000:00:02.0
  fec00000-fec00fff : Reserved

Full iomem attached.

> Also: what happens if you "rmmod bochs-drm; modprobe bochs-drm"?

Looks promising, but I didn't get my console back:

[46921.550669] bochs-drm 0000:00:02.0: remove_conflicting_pci_framebuffers:=
 bar 0: 0xc0000000 -> 0xc0ffffff
[46921.550673] bochs-drm 0000:00:02.0: remove_conflicting_pci_framebuffers:=
 bar 2: 0xc1087000 -> 0xc1087fff
[46921.550675] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
[46921.553577] [drm] Found bochs VGA, ID 0xb0c5.
[46921.553579] [drm] Framebuffer size 16384 kB @ 0xc0000000, mmio @ 0xc1087=
000.
[46921.554733] [TTM] Zone  kernel: Available graphics memory: 1997204 KiB
[46921.554735] [TTM] Initializing pool allocator
[46921.554741] [TTM] Initializing DMA pool allocator
[46921.556460] [drm] Found EDID data blob.
[46921.557129] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:00:02.0 =
on minor 0
[46921.562805] fbcon: bochs-drmdrmfb (fb0) is primary device
[46921.562808] fbcon: Deferring console take-over
[46921.562813] bochs-drm 0000:00:02.0: fb0: bochs-drmdrmfb frame buffer dev=
ice


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--cU9XODsizZBnwgll
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="iomem.txt"

00000000-00000fff : Reserved
00001000-0009ffff : System RAM
000a0000-000fffff : Reserved
  000a0000-000bffff : PCI Bus 0000:00
  000f0000-000fffff : System ROM
00100000-007fffff : System RAM
00800000-00807fff : ACPI Non-volatile Storage
00808000-0080ffff : System RAM
00810000-008fffff : ACPI Non-volatile Storage
00900000-be762fff : System RAM
  01000000-01c00e30 : Kernel code
  01c00e31-0263093f : Kernel data
  02c93000-031fffff : Kernel bss
be763000-be774fff : ACPI Non-volatile Storage
be775000-be793fff : Reserved
be794000-be9d5fff : System RAM
be9d6000-beb1afff : Reserved
beb1b000-bfb9afff : System RAM
bfb9b000-bfbf2fff : Reserved
bfbf3000-bfbfafff : ACPI Tables
bfbfb000-bfbfefff : ACPI Non-volatile Storage
bfbff000-bff4ffff : System RAM
bff50000-bff6ffff : Reserved
bff70000-bfffffff : ACPI Non-volatile Storage
c0000000-febfffff : PCI Bus 0000:00
  c0000000-c0ffffff : 0000:00:02.0
  c1000000-c103ffff : 0000:00:04.0
  c1040000-c105ffff : 0000:00:04.0
  c1060000-c107ffff : 0000:00:04.0
  c1080000-c1083fff : 0000:00:04.0
  c1084000-c1084fff : 0000:00:07.0
  c1085000-c1085fff : 0000:00:06.0
  c1086000-c1086fff : 0000:00:05.0
    c1086000-c1086fff : ehci_hcd
  c1087000-c1087fff : 0000:00:02.0
fec00000-fec00fff : Reserved
  fec00000-fec003ff : IOAPIC 0
fed00000-fed003ff : HPET 0
  fed00000-fed003ff : PNP0103:00
fee00000-feefffff : Reserved
  fee00000-fee00fff : Local APIC
100000000-1403e1fff : System RAM
1403e2000-143ffffff : RAM buffer
800000000-87fffffff : PCI Bus 0000:00
  800000000-800003fff : 0000:00:06.0
    800000000-800003fff : virtio-pci-modern
  800004000-800007fff : 0000:00:07.0
    800004000-800007fff : virtio-pci-modern
fd00000000-ffffffffff : Reserved


--cU9XODsizZBnwgll--

--IjzautVOrq+IorBk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4fFn8ACgkQ24/THMrX
1yzHZgf+I8ALNHuzSByjXKz1qozygLmfk6bvy7hFPLLlJY1exngAn8lUD9XRu/dJ
csx+SM7m9ZXyTDb25tANz6GVgERLnx10LVmiimaSup+8tlxLWk1m2AkTFq5FsagD
t9APSoZqeg4wUb4FNfCyR2gRLeW1JyTs2/WH1GpSl2KbpaBOSAGCItZMr3HrE2sN
i33x0uu5cplo/rup25MpjXxYvu++/EJHBlBMSdW+aJkaDnNC136XuMmRyJGhM0cJ
2IRLLM+i1MwKdrvtc39KMMIBe2AghgenAgjTk/tIY67NzbBko3P3P87ktpTHMkWC
lMXNlzfv1nYg31ThVHQwV36FLycYcw==
=YlUN
-----END PGP SIGNATURE-----

--IjzautVOrq+IorBk--

--===============6210848139401305267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6210848139401305267==--
