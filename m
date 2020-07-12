Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626F21C7DC
	for <lists.virtualization@lfdr.de>; Sun, 12 Jul 2020 09:22:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5948588E76;
	Sun, 12 Jul 2020 07:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8hYWdIw7Wpv; Sun, 12 Jul 2020 07:22:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B82A88E58;
	Sun, 12 Jul 2020 07:22:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30550C088E;
	Sun, 12 Jul 2020 07:22:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E04D3C0733
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 07:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CE24988E6C
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 07:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ql2VEhd40+o1
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 07:22:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 49D0A88E58
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 07:22:38 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id AC44D1C0BD5; Sun, 12 Jul 2020 09:22:28 +0200 (CEST)
Date: Sun, 12 Jul 2020 09:22:28 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Colm MacCarthaigh <colmmacc@amazon.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
Message-ID: <20200712072228.GB4721@duo.ucw.cz>
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703113026.GT18446@dhcp22.suse.cz>
 <CAG48ez2O2z4L=n57Omwy6s1sWQkdTkPKiikhbfdVhiyd_TGRRw@mail.gmail.com>
 <20200707073823.GA3820@dhcp22.suse.cz> <20200707080726.GA32357@amd>
 <20200707085847.GA5913@dhcp22.suse.cz> <20200707163758.GA1947@amd>
 <E6B41570-E206-4458-921B-465B9EF74949@amazon.com>
MIME-Version: 1.0
In-Reply-To: <E6B41570-E206-4458-921B-465B9EF74949@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 mingo@kernel.org, Jann Horn <jannh@google.com>, "Brooker,
 Marc" <mbrooker@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
 len.brown@intel.com, bonzini@gnu.org, "Graf \(AWS\),
 Alexander" <graf@amazon.de>, keescook@chromium.org, linux-pm@vger.kernel.org,
 "Catangiu, Adrian Costin" <acatan@amazon.com>,
 Michal Hocko <mhocko@kernel.org>, fweimer@redhat.com, wad@chromium.org,
 linux-api@vger.kernel.org, "Manwaring, Derek" <derekmn@amazon.com>,
 rjw@rjwysocki.net, luto@amacapital.net, "Sandu, Andrei" <sandreim@amazon.com>,
 akpm@linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============2073529199839191405=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============2073529199839191405==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-07-07 12:00:41, Colm MacCarthaigh wrote:
>=20
>=20
> On 7 Jul 2020, at 9:37, Pavel Machek wrote:
> > Please go through the thread and try to understand it.
> >=20
> > You'd need syscalls per get_randomness(), not per migration.
>=20
> I think one check per get_randomness() is sufficient, though putting it at
> the end of the critical section rather than the beginning helps.

Yeah, well, one syscall is still enough to make it useless.

Best regards,
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXwq6NAAKCRAw5/Bqldv6
8uuCAJ9LrEaAGhXBNhJwHuvAzGcY9PEKpACgo6pz2brnyUlPHZvcCAbvR8lQRLk=
=jD89
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--

--===============2073529199839191405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2073529199839191405==--
