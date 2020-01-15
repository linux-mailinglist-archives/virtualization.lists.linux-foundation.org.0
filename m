Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D23D13C5F2
	for <lists.virtualization@lfdr.de>; Wed, 15 Jan 2020 15:28:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D55F7847FE;
	Wed, 15 Jan 2020 14:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkGM_iiThzib; Wed, 15 Jan 2020 14:27:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A00384C93;
	Wed, 15 Jan 2020 14:27:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78947C077D;
	Wed, 15 Jan 2020 14:27:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED9A4C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 14:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DCBB5847FE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 14:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 42P_jjioKC4z
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 14:27:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 871C884B6F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 14:27:47 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0A6F733E;
 Wed, 15 Jan 2020 09:27:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 15 Jan 2020 09:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZqmZNy
 9PTct/9dOQGEsZs/+ka/UdIsW6Yb+KSBsDrJY=; b=M+pvPbU+TnQlAz20kYBqQj
 GgBbB1BKcsfFvh0HhxidAj3/uPEQxhKvyX3Ic6eAq3BQk1iL4nQ9ayPNASKDiqaL
 mBwDBTbQ8jIBRjGXWObDGHx9+6jztoXACT3ip3TdOLB4bZV4cc+0iZEGOWgtnyAW
 sxPLzCZSCOKJoNhNG5KtwT1kQqKe4nJgXT235nU/2nxOKMjABwNZUqVvmX6YQ7dP
 ZOhJs18wtge/r7jsZUdy++xsqkPS1RZBMTKfcxKJySoD65iGOLl0V2OBSX2Ivfc3
 JWUIb93YI1I41ddT87WfagkxnlWK/2X92A7eXGUIY9iZaTW63AzfSJSxqebMK7mg
 ==
X-ME-Sender: <xms:YiEfXosiRUSmC4hO7dcjNkeoIenSa1EXfwK3IJhBzKFuzrAUb7WASg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdefgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
 dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
 ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
 enucfkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 rhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhush
 htvghrufhiiigvpedt
X-ME-Proxy: <xmx:YiEfXq8tJ9cePWX0emwUcrqF-BynWszhGRTkjY8lnqfXNvuJ1MpYoA>
 <xmx:YiEfXi1_DNkc60qNznhMXHOCXH_S9x33udBEv0352iJhUfu8gibEGA>
 <xmx:YiEfXvihqbFmGdD3tJ_cUhJhbpaW64UzaINgQBm6jciHSvs7VDz-7A>
 <xmx:YiEfXlZd2tDzf6Vpz-J0yLXdhUFOrBljcFshIOUQZV09JjaVaBLhIQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id EA04D3060886;
 Wed, 15 Jan 2020 09:27:45 -0500 (EST)
Date: Wed, 15 Jan 2020 15:27:41 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible
Message-ID: <20200115142741.GM2507@mail-itl>
References: <20200110163211.GB29736@mail-itl>
 <20200113071939.rtqb7yw45zi63fqy@sirius.home.kraxel.org>
 <20200115003356.GL2507@mail-itl>
 <20200115100821.qcdraolkoki6e5tz@sirius.home.kraxel.org>
 <20200115134119.GP1314@mail-itl>
 <20200115141353.3kse3uj2mg6ik6k5@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20200115141353.3kse3uj2mg6ik6k5@sirius.home.kraxel.org>
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
Content-Type: multipart/mixed; boundary="===============0708393496682375683=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============0708393496682375683==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AA9g+nFNFPYNJKiL"
Content-Disposition: inline


--AA9g+nFNFPYNJKiL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible

On Wed, Jan 15, 2020 at 03:13:53PM +0100, Gerd Hoffmann wrote:
>   Hi,
>=20
> > > And "grep -A1 0000:00:02.0 /proc/iomem" ?
> >=20
> >   c0000000-c0ffffff : 0000:00:02.0
> >   c1000000-c103ffff : 0000:00:04.0
>=20
> So no reservation left.  Whatever blocked the pci bar resource (efifb
> probably) is gone now.
>=20
> So the interesting question is why that reservation sticked long enough
> to prevent bochs-drm from initializing.  In theory efifb de-init should
> be completed when drm_fb_helper_remove_conflicting_pci_framebuffers()
> returns.

Maybe the fact that switching to text mode plymouth help, gives some
hint?

> Bisecting could help, or springkling printk's into efifb ...

That's a pretty broad range of commits...
I'll try adding some printks.

> > [46921.562805] fbcon: bochs-drmdrmfb (fb0) is primary device
> > [46921.562808] fbcon: Deferring console take-over
>=20
> I think that is just some eye candy which delays fbcon init until
> something is actually printed.
>=20
> Try "echo hello world > /dev/tty0".
> Maybe tapping enter (to make getty re-print the login prompt) works too.

Oh, yes, indeed it works.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--AA9g+nFNFPYNJKiL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4fIV4ACgkQ24/THMrX
1yyQWAgAhyAtsKVWKV+RdLZhnbOkPAPWlCdF+2Z4ecNX1BJE6oxIXZWwkMX6wmnF
M3HxFkQdpkAuM5aoimSyBEWvjes1KWpuyCQeFv2GyqMZzTgZyKIL1zYFUsHUvtuE
FknTQt4waa31Ty6Ob3XWKHFrPJTYrcDUHf1mLHFwKPiixC7Yd/xU9v25M9YY0kKH
J5sbfgyLdXizDl1wAoGLrUtj7EngwZ3qbDcvIsQGf6fxLSsJ9CRM/UafKEG75Av0
fnFyIA+EhygNcCyxHFaFbUNES6afZJt8vq1Uq9KL1ijeZOktrvEDsZ22z71IMchZ
0A9B7k3yFXvvU8LEjBtUz8KdB7Vb+A==
=8tHz
-----END PGP SIGNATURE-----

--AA9g+nFNFPYNJKiL--

--===============0708393496682375683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0708393496682375683==--
