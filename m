Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1B5140DB8
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 16:22:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5997C82835;
	Fri, 17 Jan 2020 15:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ek-sUXxFiWNW; Fri, 17 Jan 2020 15:22:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0688F86B11;
	Fri, 17 Jan 2020 15:22:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCC25C077D;
	Fri, 17 Jan 2020 15:22:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01364C077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 15:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DDE1F87E7D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 15:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33FmMOM0FRMR
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 15:22:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 46411877A0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 15:22:17 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 275A321B4C;
 Fri, 17 Jan 2020 10:22:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 17 Jan 2020 10:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LkaAGr
 9qb2WSS36AdTHsu1vkrVlxLzzaM/rrttl5LQY=; b=hjJ9xhf2m/f+klbWJ0acnL
 qE4NMuR1whpLotW8iUr4wNHlnD8YqGrnosOsT6cvo2+OVVYZiCBjAICf0xfPLQRX
 OUxGLnoy8ByUIvdRdZFMYwHbKuWLLsXX4EDKUkp/bIyZC+qu2FVimVIaEiV8pgbd
 mH/NMoewtOw3XqmiHlSlCei1UH8v32BHyfqUgWvKSMppmyabo+2JblNxV+4npjke
 UkBVFVR5OXPe13jMZB6Jrzmw+Pv0Kn8cfENWGrmrEEm5SNUG4nqUhSMs/ZHa9XtK
 LQwssL6KDbgu4nH2+YCzy/MdFJCGC8XsX/VvkOVr93CS+th5aGLjB62ICBFwIA8w
 ==
X-ME-Sender: <xms:J9EhXrX-V3plTOEHcYcbsEokxAJPzYmV-h-lAfNiV8KJ9uirevmSrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdejgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
 dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
 ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
 enucfkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 rhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhush
 htvghrufhiiigvpedt
X-ME-Proxy: <xmx:J9EhXj_FOLXJr48r40pzWY8YmI7FcKOJ82yON5mmqjsLmCQIOzmP4w>
 <xmx:J9EhXoijMCFUp-vIDWDPztnPEDB4Rq64MSY8oBrEaZoKAuZcSvCvMw>
 <xmx:J9EhXiWC0yMsh5cWaHC4avsS8p0ibIoZ0qVq7N08zWEv_F5CQyfHrg>
 <xmx:KNEhXp7U3780DF58G58Ufgob3YiSziGSgU1H9KdEUeZIOBo25Tl33Q>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6024C3060A88;
 Fri, 17 Jan 2020 10:22:15 -0500 (EST)
Date: Fri, 17 Jan 2020 16:22:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible
Message-ID: <20200117152211.GZ1314@mail-itl>
References: <20200110163211.GB29736@mail-itl>
 <20200113071939.rtqb7yw45zi63fqy@sirius.home.kraxel.org>
 <20200115003356.GL2507@mail-itl>
 <20200115100821.qcdraolkoki6e5tz@sirius.home.kraxel.org>
 <20200115134119.GP1314@mail-itl>
 <20200115141353.3kse3uj2mg6ik6k5@sirius.home.kraxel.org>
 <20200115142741.GM2507@mail-itl>
 <20200115161635.ekrnk5rmjqbxxu77@sirius.home.kraxel.org>
 <20200116025232.GN2507@mail-itl>
 <20200117125825.3in2t2m6nxbblsaf@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20200117125825.3in2t2m6nxbblsaf@sirius.home.kraxel.org>
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
Content-Type: multipart/mixed; boundary="===============2228732945785509442=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============2228732945785509442==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+cTHE2B7cPyeMCYH"
Content-Disposition: inline


--+cTHE2B7cPyeMCYH
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible

On Fri, Jan 17, 2020 at 01:58:25PM +0100, Gerd Hoffmann wrote:
> > Should switching to bochsdrmfb be deferred until efifb gets properly
> > destroyed? How?
>=20
> Should be in do_remove_conflicting_framebuffers, everyone might run into
> this.  So lets try wait for all (other) references went away:

Yes, this solves the problem. I guess the proper solution would be to
replace it with some wait queue or such, right?
Is there any guarantee that the process holding /dev/fb0 (plymouthd in
this case) will eventually release it? If not, what could this
(indefinite then) wait cause? Is there any lock held here that could
hang other operations?

> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/=
fbmem.c
> index d04554959ea7..2d4911cc7ec4 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1726,7 +1726,9 @@ static void do_unregister_framebuffer(struct fb_inf=
o *fb_info)
>  	fbcon_fb_unregistered(fb_info);
>  	console_unlock();
> =20
> -	/* this may free fb info */
> +	while (atomic_read(&fb_info->count) > 1)
> +		msleep(10);
> +	/* this will free fb info */
>  	put_fb_info(fb_info);
>  }
> =20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--+cTHE2B7cPyeMCYH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4h0SMACgkQ24/THMrX
1yyHRgf/cvdh48JzcslTWiyh345ddD4+7EJ8KhQOmZDlOygdHMUpLFV466aCtlqy
p7TO82lg4odvx5ig5s2HxfP1/xvZsRC3WukdPMIR+XYvGTdCPY1VtgNNTJPGrjfQ
uyeJ4Tc9WejLiSLgcqkEp9Ge47Z+fkbIF3nm3DPThvPYpn1DrdRUvu2nCXQxcQum
EQwi+NyHJZEVx5KCIC7/wPJDJRbya2DNeRSpswE99HbTWM2cqqFGfyvfkNlWtiif
XQihw62Lph70Rqq24uWybEoip0NwFBpFuFEbtq45SWcVe+duHPJKHyoo4vWL+Jti
685xudC9u3WkcUkqn/MzVZGW8I44Pg==
=kcPT
-----END PGP SIGNATURE-----

--+cTHE2B7cPyeMCYH--

--===============2228732945785509442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2228732945785509442==--
