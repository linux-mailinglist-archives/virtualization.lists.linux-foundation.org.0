Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A8513B68E
	for <lists.virtualization@lfdr.de>; Wed, 15 Jan 2020 01:34:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BED3885E65;
	Wed, 15 Jan 2020 00:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tv5MIpx6JwVR; Wed, 15 Jan 2020 00:34:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1B1C085EB8;
	Wed, 15 Jan 2020 00:34:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E50D2C1D8D;
	Wed, 15 Jan 2020 00:34:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AAA5C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 00:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 102C285EAF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 00:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yt66J7NiPTTp
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 00:34:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 621FC85E65
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 00:34:01 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5AF7F22AF5;
 Tue, 14 Jan 2020 19:34:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Jan 2020 19:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wFTKTS
 Wjz6YQeib87ZGImocTJoCsHSlLDQw23nOQjqc=; b=tMvF6WY6w0BbT/mDh3/mJo
 RAN2M83EEWrnlEDImg9PYFXGpFKdOW5q5PLw82LN9m0tcVua30NHZ5qHXEK7U12K
 3d4W/T1NBbdiB8DYdzwrqq1v1wGMGnQzJxGqWvkQJOeID1mKy/eehjaV25DEs61i
 dwPlAG30oRMyYJPxOMcm6HBDMSGKZ6yM+zQU/WlYBcOCB/x48+0dulsjep+rj6Lg
 PLcxMyNE1NJDCczXAYp3GnqTmTPNyFo0/H28fw+WZN/xqOKpGixGIcZyzq3WlcAq
 dKw2d3RlQ9vYPYCsMtSXBTUQhCm5tdf3cIERIIAjooIg+/7fX0fCA/9qBEcMU9VQ
 ==
X-ME-Sender: <xms:-F0eXhXsUQQ92KZh6sg4-6sVTn-z7gtxt2MBiUTcIR4a8A0pSgponQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
 dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
 ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
 enucfkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 rhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhush
 htvghrufhiiigvpedt
X-ME-Proxy: <xmx:-F0eXmzxlnJ0KnVBx11WOssNSimSvCVuFqyzM40wHxVEQaO0aWqJrQ>
 <xmx:-F0eXuTQc3-jg8RvPJ37_9UtdV0h4eUlSbQepjr_SJi624GP0M8T3A>
 <xmx:-F0eXqgZ8B5DUamPbt5CzODQa662OJu9pjrnUfGC4HbrCBD9e5EkXw>
 <xmx:-F0eXtD7YGBbXNdV40VKyXJjLM6VlKZ8OT5KUKC8iIONVQgEPxr0BA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 98FB230602DB;
 Tue, 14 Jan 2020 19:33:59 -0500 (EST)
Date: Wed, 15 Jan 2020 01:33:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible
Message-ID: <20200115003356.GL2507@mail-itl>
References: <20200110163211.GB29736@mail-itl>
 <20200113071939.rtqb7yw45zi63fqy@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20200113071939.rtqb7yw45zi63fqy@sirius.home.kraxel.org>
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
Content-Type: multipart/mixed; boundary="===============0933172239616650811=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============0933172239616650811==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ICrdrp3pM9DyZLTK"
Content-Disposition: inline


--ICrdrp3pM9DyZLTK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible

On Mon, Jan 13, 2020 at 08:19:39AM +0100, Gerd Hoffmann wrote:
> On Fri, Jan 10, 2020 at 05:32:11PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > This is the context of "bochs_drm: failed bochs_hw_init() results in
> > panic". When I boot the system, if plymouth is visible, it crashes. But
> > if I press ESC to hide it, it boots fine. bochs_drm is build as module
> > and _not_ included in the initramfs, so it is loaded only after root
> > filesystem is mounted. And before that, efifb works just fine, including
> > nice graphical disk passphrase prompt.
>=20
> > [   32.951345] fb0: switching to bochsdrmfb from EFI VGA
> [ ... ]
> > [   33.030158] bochs-drm 0000:00:02.0: BAR 0: can't reserve [mem 0xc000=
0000-0xc0ffffff pref]
>=20
> Looks like efifb continues to claim the framebuffer resource
> (0xc0000000-0xc0ffffff) for some reason, so bochs-drm can't
> reserve it.
>=20
> No clue why, also doesn't reproduce here (standard fedora 31 5.4.7
> kernel).  I don't have an encrypted disk, so no passphrase prompt,
> maybe that makes a difference.

Extra data point: it worked on 4.19.89.

> How does /proc/iomem look after boot, specifically the 0000:00:02.0 pci
> bars?

grep 0000:00:02.0 /proc/iomem
  c0000000-c0ffffff : 0000:00:02.0
  c1087000-c1087fff : 0000:00:02.0

lspci -vvs 0000:00:02.0
00:02.0 VGA compatible controller: Device 1234:1111 (rev 02) (prog-if 00 [V=
GA controller])
        Subsystem: Red Hat, Inc. Device 1100
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
 Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Region 0: Memory at c0000000 (32-bit, prefetchable) [size=3D16M]
        Region 2: Memory at c1087000 (32-bit, non-prefetchable) [size=3D4K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Kernel modules: bochs_drm

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--ICrdrp3pM9DyZLTK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4eXfQACgkQ24/THMrX
1ywsAQf+IYTpUQhFVJQCqcY7225Z5cbDeotU/3S8l8yFrW+OtJna2CsBk4h3ePTU
+lP7zhQ2zRkl3+79XBqpcEt3Wy56Eh3o9jPN+yv7ANvy+3sy4WR4QyY19uc/CC6D
MXtuWFJZ/AG3b1YC+k1a6J45wP2mj0Un7GSugWYsCBPaC06+Jc4YVtUHsa87YdCu
L5qMWaHwTBMKkD2/KkQOjGRbWzO05xc/n5XDnLQv26zN6mk7aTBLxXAISo8HZlxj
I4xufIFHVvzqt7BtDoUtKQzA0B8/qsYJaDPnIoLCG1W32buE0kUWKDDSgmb5dqRI
AM078UOJb5ET+X1gTq2NniJHHtBorA==
=EAXg
-----END PGP SIGNATURE-----

--ICrdrp3pM9DyZLTK--

--===============0933172239616650811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0933172239616650811==--
