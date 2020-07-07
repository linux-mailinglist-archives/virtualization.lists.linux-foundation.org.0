Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2B217412
	for <lists.virtualization@lfdr.de>; Tue,  7 Jul 2020 18:38:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F23A889B28;
	Tue,  7 Jul 2020 16:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wEtAvfZtIpzq; Tue,  7 Jul 2020 16:38:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D235989B26;
	Tue,  7 Jul 2020 16:38:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB57EC016F;
	Tue,  7 Jul 2020 16:38:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5C97C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 16:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BA199890F8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 16:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LpLsiKEqEMzm
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 16:38:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2DCE2890E1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 16:38:04 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 70C791C0C0A; Tue,  7 Jul 2020 18:37:58 +0200 (CEST)
Date: Tue, 7 Jul 2020 18:37:58 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
Message-ID: <20200707163758.GA1947@amd>
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703113026.GT18446@dhcp22.suse.cz>
 <CAG48ez2O2z4L=n57Omwy6s1sWQkdTkPKiikhbfdVhiyd_TGRRw@mail.gmail.com>
 <20200707073823.GA3820@dhcp22.suse.cz> <20200707080726.GA32357@amd>
 <20200707085847.GA5913@dhcp22.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20200707085847.GA5913@dhcp22.suse.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "mingo@kernel.org" <mingo@kernel.org>, Jann Horn <jannh@google.com>, "Brooker,
 Marc" <mbrooker@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
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
Content-Type: multipart/mixed; boundary="===============4515907939263274143=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============4515907939263274143==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > You can do it seqlock-style, kind of - you reserve the first byte of
> > > > the page or so as a "is this page initialized" marker, and after ev=
ery
> > > > read from the page, you do a compiler barrier and check whether that
> > > > byte has been cleared.
> > >=20
> > > This is certainly possible yet wery awkwar interface to use IMHO.
> > > MADV_EXTERNALY_VOLATILE would express the actual semantic much better.
> > > I might not still understand the expected usecase but if the target
> > > application has to be changed anyway then why not simply use a
> > > transparent and proper signaling mechanism like poll on a fd. That
> >=20
> > The goal is to have cryprographically-safe get_random_number() with 0
> > syscalls.
> >=20
> > You'd need to do:
> >=20
> >    if (!poll(did_i_migrate)) {
> >          use_prng_seed();
> > 	 if (poll(did_i_migrate)) {
> > 	       /* oops_they_migrated_me_in_middle_of_computation,
> >  	          lets_redo_it() */
> >  		  goto retry:
> > 	 }
> >    }
> >=20
> > Which means two syscalls..
>=20
> Is this a real problem though? Do we have any actual numbers? E.g. how
> often does the migration happen so that 2 syscalls would be visible in
> actual workloads?

Please go through the thread and try to understand it.

You'd need syscalls per get_randomness(), not per migration.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8EpOUACgkQMOfwapXb+vIrGQCfa8t3eRPUQJN4sgdBPhRqIXIN
Md0AoL/VSUKG0fqXzutn3A1vlMnmAH5A
=B3/F
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--

--===============4515907939263274143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4515907939263274143==--
