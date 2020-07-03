Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E929214198
	for <lists.virtualization@lfdr.de>; Sat,  4 Jul 2020 00:35:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 25F4F897E4;
	Fri,  3 Jul 2020 22:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngk-dT3KT-SJ; Fri,  3 Jul 2020 22:35:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 19F63897E1;
	Fri,  3 Jul 2020 22:35:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC753C0888;
	Fri,  3 Jul 2020 22:35:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F199BC0733
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B747520476
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YepEAyzXGpG
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:35:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by silver.osuosl.org (Postfix) with ESMTPS id 5D63320474
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:34:59 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 2FA551C0BD2; Sat,  4 Jul 2020 00:34:54 +0200 (CEST)
Date: Sat, 4 Jul 2020 00:34:53 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jann Horn <jannh@google.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
Message-ID: <20200703223453.GA25072@amd>
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703113026.GT18446@dhcp22.suse.cz>
 <CAG48ez2O2z4L=n57Omwy6s1sWQkdTkPKiikhbfdVhiyd_TGRRw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAG48ez2O2z4L=n57Omwy6s1sWQkdTkPKiikhbfdVhiyd_TGRRw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "mingo@kernel.org" <mingo@kernel.org>, Michal Hocko <mhocko@kernel.org>,
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
Content-Type: multipart/mixed; boundary="===============2776688396572436139=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============2776688396572436139==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-07-03 15:29:22, Jann Horn wrote:
> On Fri, Jul 3, 2020 at 1:30 PM Michal Hocko <mhocko@kernel.org> wrote:
> > On Fri 03-07-20 10:34:09, Catangiu, Adrian Costin wrote:
> > > This patch adds logic to the kernel power code to zero out contents of
> > > all MADV_WIPEONSUSPEND VMAs present in the system during its transiti=
on
> > > to any suspend state equal or greater/deeper than Suspend-to-memory,
> > > known as S3.
> >
> > How does the application learn that its memory got wiped? S2disk is an
> > async operation and it can happen at any time during the task execution.
> > So how does the application work to prevent from corrupted state - e.g.
> > when suspended between two memory loads?
>=20
> You can do it seqlock-style, kind of - you reserve the first byte of
> the page or so as a "is this page initialized" marker, and after every
> read from the page, you do a compiler barrier and check whether that
> byte has been

That would also need smp cpu barriers, and guarantee that first byte
is always ... cleared first, and matching barriers in kernel space,
too, no?

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7/so0ACgkQMOfwapXb+vKdqwCdHbxhUjXRK2lyMx90kTRewpgH
sy8An1fvpOxBo4ol1ZYLjYYj+LThkGbw
=Ci2L
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--

--===============2776688396572436139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2776688396572436139==--
