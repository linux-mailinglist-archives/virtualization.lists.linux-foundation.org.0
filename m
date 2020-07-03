Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F27722141C6
	for <lists.virtualization@lfdr.de>; Sat,  4 Jul 2020 00:44:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A6FF89811;
	Fri,  3 Jul 2020 22:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPGr8VKiA7-b; Fri,  3 Jul 2020 22:44:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 81CCD89804;
	Fri,  3 Jul 2020 22:44:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 509FDC0733;
	Fri,  3 Jul 2020 22:44:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3EDDC0733
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CABC62047E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wfF7VExwT5sr
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:44:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by silver.osuosl.org (Postfix) with ESMTPS id 04CB12047D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:44:13 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 821251C0C0F; Sat,  4 Jul 2020 00:44:11 +0200 (CEST)
Date: Sat, 4 Jul 2020 00:44:11 +0200
From: Pavel Machek <pavel@ucw.cz>
To: "Catangiu, Adrian Costin" <acatan@amazon.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
Message-ID: <20200703224411.GC25072@amd>
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
MIME-Version: 1.0
In-Reply-To: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "fweimer@redhat.com" <fweimer@redhat.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "bonzini@gnu.org" <bonzini@gnu.org>, "Graf \(AWS\),
 Alexander" <graf@amazon.de>, "wad@chromium.org" <wad@chromium.org>,
 "keescook@chromium.org" <keescook@chromium.org>, "MacCarthaigh,
 Colm" <colmmacc@amazon.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "Weiss,
 Radu" <raduweis@amazon.com>, "Brooker, Marc" <mbrooker@amazon.com>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "luto@amacapital.net" <luto@amacapital.net>, "Sandu,
 Andrei" <sandreim@amazon.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>, "Singh, Balbir" <sblbir@amazon.com>,
 "mingo@kernel.org" <mingo@kernel.org>, "Manwaring, Derek" <derekmn@amazon.com>
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
Content-Type: multipart/mixed; boundary="===============0569669408677175741=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============0569669408677175741==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Content-Disposition: inline


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Cryptographic libraries carry pseudo random number generators to
> quickly provide randomness when needed. If such a random pool gets
> cloned, secrets may get revealed, as the same random number may get
> used multiple times. For fork, this was fixed using the WIPEONFORK
> madvise flag [1].

> Unfortunately, the same problem surfaces when a virtual machine gets
> cloned. The existing flag does not help there. This patch introduces a
> new flag to automatically clear memory contents on VM suspend/resume,
> which will allow random number generators to reseed when virtual
> machines get cloned.

Umm. If this is real problem, should kernel provide such rng in the
vsdo page using vsyscalls? Kernel can have special interface to its
vsyscalls, but we may not want to offer this functionality to rest of
userland...

>  - Provides a simple mechanism to avoid RAM exfiltration during
>    traditional sleep/hibernate on a laptop or desktop when memory,
>    and thus secrets, are vulnerable to offline tampering or
>    inspection.

This second use has nothing to do with RNGs, right?

And I don't think we should do this in kernel.

It is userspace that initiates the suspend transition. Userspace
should lock the screen _before_ starting it, for example. Userspace
should also get rid of any secrets, first...

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7/tLsACgkQMOfwapXb+vKLKwCeJYf9jINarjpOcvkWGapwUdIa
uagAnjDEdee4JzvzUfcuKH+WBY/IbjHX
=2u6r
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--

--===============0569669408677175741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0569669408677175741==--
