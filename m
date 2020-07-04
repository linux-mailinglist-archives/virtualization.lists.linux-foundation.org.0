Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E30982145A6
	for <lists.virtualization@lfdr.de>; Sat,  4 Jul 2020 13:48:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 747BE87F74;
	Sat,  4 Jul 2020 11:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qlb07DSmvQsz; Sat,  4 Jul 2020 11:48:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 016C487F69;
	Sat,  4 Jul 2020 11:48:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD4D1C08A2;
	Sat,  4 Jul 2020 11:48:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5919DC0733
 for <virtualization@lists.linux-foundation.org>;
 Sat,  4 Jul 2020 11:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4A57087F69
 for <virtualization@lists.linux-foundation.org>;
 Sat,  4 Jul 2020 11:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xk9s94GcQ0is
 for <virtualization@lists.linux-foundation.org>;
 Sat,  4 Jul 2020 11:48:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 757D187F63
 for <virtualization@lists.linux-foundation.org>;
 Sat,  4 Jul 2020 11:48:24 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 805441C0BD2; Sat,  4 Jul 2020 13:48:21 +0200 (CEST)
Date: Sat, 4 Jul 2020 13:48:20 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jann Horn <jannh@google.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
Message-ID: <20200704114820.GA16083@amd>
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703224411.GC25072@amd>
 <CAG48ez0oWQd42a-H-Dzw1Wq7HgB5PpFRGCZeYxP8ohxaoZHmvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAG48ez0oWQd42a-H-Dzw1Wq7HgB5PpFRGCZeYxP8ohxaoZHmvQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "mingo@kernel.org" <mingo@kernel.org>, "mhocko@kernel.org" <mhocko@kernel.org>,
 "Brooker, Marc" <mbrooker@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "bonzini@gnu.org" <bonzini@gnu.org>, "Graf \(AWS\),
 Alexander" <graf@amazon.de>, "keescook@chromium.org" <keescook@chromium.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, "MacCarthaigh, Colm" <colmmacc@amazon.com>,
 "fweimer@redhat.com" <fweimer@redhat.com>,
 "wad@chromium.org" <wad@chromium.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "Manwaring,
 Derek" <derekmn@amazon.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "luto@amacapital.net" <luto@amacapital.net>, "Sandu,
 Andrei" <sandreim@amazon.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
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
Content-Type: multipart/mixed; boundary="===============3568459736035921658=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============3568459736035921658==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Cryptographic libraries carry pseudo random number generators to
> > > quickly provide randomness when needed. If such a random pool gets
> > > cloned, secrets may get revealed, as the same random number may get
> > > used multiple times. For fork, this was fixed using the WIPEONFORK
> > > madvise flag [1].
> >
> > > Unfortunately, the same problem surfaces when a virtual machine gets
> > > cloned. The existing flag does not help there. This patch introduces a
> > > new flag to automatically clear memory contents on VM suspend/resume,
> > > which will allow random number generators to reseed when virtual
> > > machines get cloned.
> >
> > Umm. If this is real problem, should kernel provide such rng in the
> > vsdo page using vsyscalls? Kernel can have special interface to its
> > vsyscalls, but we may not want to offer this functionality to rest of
> > userland...
>=20
> And then the kernel would just need to maintain a sequence
> number in the vDSO data page that gets bumped on suspen

Yes, something like that would work. Plus, we'd be free to change the
mechanism in future.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8AbIQACgkQMOfwapXb+vKmPACeIrmKuoNf1JXiUYxPw51Y90fr
M6oAnjRxd9sUbS8IWUhsIH7VWkQJzbQT
=mrV7
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--

--===============3568459736035921658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3568459736035921658==--
