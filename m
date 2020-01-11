Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AC24D137A74
	for <lists.virtualization@lfdr.de>; Sat, 11 Jan 2020 01:07:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 53C5F885BA;
	Sat, 11 Jan 2020 00:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vWYOHuWqd12I; Sat, 11 Jan 2020 00:07:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BEBAB885B5;
	Sat, 11 Jan 2020 00:07:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A21D5C0881;
	Sat, 11 Jan 2020 00:07:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75C31C0881
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jan 2020 00:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6E78720468
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jan 2020 00:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lml1zJGAjUJd
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jan 2020 00:07:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by silver.osuosl.org (Postfix) with ESMTPS id A0EE220443
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jan 2020 00:07:50 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id E9B765F1;
 Fri, 10 Jan 2020 19:07:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 10 Jan 2020 19:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XbNxVu
 LH0B9WhqAEC+oatPC7TRSP+fUuEbSkqir0p6M=; b=FKx/FXQ+cJYQZdO+qIt8SY
 LFfkLj8/ZxqSRfGNi3e4p5rekleIaI+w9MitRewhq/d+1V2F7NYJPSwl+lxGbYMK
 xTLiHzXTbDPNd/k7SygWWCzHQwB2+a1Bqnj11FVbgRA7UmijTwObVVLL1L/CWZ/J
 itbjO50faLPwalKW4z/8jVSS91rjh45PH78qIcKqoqRZslbDcaXc6/f0CtpqcYlW
 CgbVyKJMWReeOCVIUS23kNSFy4keINZFk4e5rhiGYdOcZHOfqVQ7ZFvlMm8wIi0b
 O80mhm3dR4LOQy0TQ41aBKBMevIa6o0SEbGBp3J+iAXzxnKAUR4ROoccHRfjJB/g
 ==
X-ME-Sender: <xms:1REZXtaYsxeZik0PT3cC-z6aCV-BHwf8Th4rl-jM-FweO0C683YUUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeigedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
 khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
 eqnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluh
 hsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:1REZXqhbP4f-mg4k7OHkNl5X4FFk-LErQRXQXtVjQHlb-fA5ll8YKw>
 <xmx:1REZXlie7lvF6nbsSfUqMwrfd_u51TaSYkslzQMHaMob3LErTlWp1Q>
 <xmx:1REZXvAYIhYvdLngWYTntkD3cs5bpommjrm7i12D5iamSZR8R_icxQ>
 <xmx:1REZXoHCzi5Fk5HlNGmVtl271cQhnm2xRqnfZeXCEqBx41fJD5S1ng>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id C04F180059;
 Fri, 10 Jan 2020 19:07:48 -0500 (EST)
Date: Sat, 11 Jan 2020 01:07:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: bochs_drm: failed bochs_hw_init() results in panic
Message-ID: <20200111000745.GF2507@mail-itl>
References: <20200110013328.GA12596@mail-itl>
 <20200110053553.4gqlagjdpfi6pg3b@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20200110053553.4gqlagjdpfi6pg3b@sirius.home.kraxel.org>
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
Content-Type: multipart/mixed; boundary="===============2746345514883671253=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============2746345514883671253==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WlEyl6ow+jlIgNUh"
Content-Disposition: inline


--WlEyl6ow+jlIgNUh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: bochs_drm: failed bochs_hw_init() results in panic

On Fri, Jan 10, 2020 at 06:35:53AM +0100, Gerd Hoffmann wrote:
> On Fri, Jan 10, 2020 at 02:33:28AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > It looks like bochs_kms_fini() don't like being called if
> > bochs_kms_init() wasn't. Regardless of the reason for the
> > bochs_hw_init() failure (that's another story), it shouldn't cause a
> > panic. Any idea how to fix it?
>=20
> maybe this?

Yes, it prevents the panic, with a little fix. Thanks!
Of course(?) I don't have working framebuffer then, but I can interact
with the system in other ways, at least to diagnose what's wrong.

Now the messages looks like this:

[   29.800835] bochs-drm 0000:00:02.0: remove_conflicting_pci_framebuffers:=
 bar 0: 0xc0000000 -> 0xc0ffffff
[   29.800840] bochs-drm 0000:00:02.0: remove_conflicting_pci_framebuffers:=
 bar 2: 0xc1087000 -> 0xc1087fff
[   29.800842] checking generic (c0000000 1000000) vs hw (c0000000 1000000)
[   29.800843] fb0: switching to bochsdrmfb from EFI VGA
[   29.805542] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
[   29.805742] bochs-drm 0000:00:02.0: BAR 0: can't reserve [mem 0xc0000000=
-0xc0ffffff pref]
[   29.805749] [drm:bochs_hw_init [bochs_drm]] *ERROR* Cannot request frame=
buffer
[   29.805781] bochs-drm: probe of 0000:00:02.0 failed with error -16
[   30.129014] Trying to free nonexistent resource <00000000c0000000-000000=
00c0ffffff>

Is the last one an issue?


> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bo=
chs_kms.c
> index 3f0006c2470d..322be68a238a 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -192,6 +192,9 @@ int bochs_kms_init(struct bochs_device *bochs)
> =20
>  void bochs_kms_fini(struct bochs_device *bochs)
>  {
> +	if (!dev->mode_config.num_connector)

bochs->dev->...

> +		return;
> +
>  	drm_atomic_helper_shutdown(bochs->dev);
>  	drm_mode_config_cleanup(bochs->dev);
>  }
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--WlEyl6ow+jlIgNUh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4ZEdEACgkQ24/THMrX
1yxgQAf7BNzQn/c4syB9SAklGnH8cluM8WfIbc8IsxTgdSly8M1RaEHY46mDrnlM
7fyI76EFobSydNSOocQVMCSzXtzMNVnEAhAOiu11JsUmXyziAugauVz19f3gcbpa
f+pJHqukT2H1lnTCcdmIK6muzKTHAWMmPgAG2ZM4YZvp3OF8ibDrjabOscLcEF/p
62HOJSwAHur1A1o31+oaM59eGsY5O9ZZ0DSlphbkAuq9A8A/kUlRytE8KTzd7pM0
5aKiIp7o7w0mEB7xCadwbhVNUFnkc1jwppkRru/wUt0cpYzJtx41fEM3tO9z1ln5
SenB6MgyRTl3fHSDJDpwTZvzg6cibg==
=Edtu
-----END PGP SIGNATURE-----

--WlEyl6ow+jlIgNUh--

--===============2746345514883671253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2746345514883671253==--
