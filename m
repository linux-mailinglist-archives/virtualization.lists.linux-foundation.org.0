Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B53F203424
	for <lists.virtualization@lfdr.de>; Mon, 22 Jun 2020 11:59:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8BD6F891F1;
	Mon, 22 Jun 2020 09:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWCFeVgT3-er; Mon, 22 Jun 2020 09:59:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BC81891E0;
	Mon, 22 Jun 2020 09:59:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFE7FC016F;
	Mon, 22 Jun 2020 09:59:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E15EEC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C917486CF1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sadLLeNKaUg3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:59:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 007C886A88
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592819988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4BHHXAqs++6g+gSDQIVmyyKNCLq9QfvogN5UxkxuxLw=;
 b=X7mYypGXclhPIecSchez54haUKHEknjBDzcLJWMsOsRRrIqM+ZqpPeRKvwSn3/tI7B80qw
 vnT7d8oJhYzWMKJZZZXBQylXSkjv1gSFelRQdzvNK9Vb4PkYn0EpbOI0yFJIXtxKv2Swg4
 yQ50XNVc0GIf6B1MAm9JEoDFFsrZV/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-Nygrqms9NTiaHOXIZlTUZg-1; Mon, 22 Jun 2020 05:59:46 -0400
X-MC-Unique: Nygrqms9NTiaHOXIZlTUZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A008846375;
 Mon, 22 Jun 2020 09:59:45 +0000 (UTC)
Received: from localhost (ovpn-115-184.ams2.redhat.com [10.36.115.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B26E5D9D5;
 Mon, 22 Jun 2020 09:59:39 +0000 (UTC)
Date: Mon, 22 Jun 2020 10:59:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v9 10/11] vhost/vsock: switch to the buf API
Message-ID: <20200622095938.GB6675@stefanha-x1.localdomain>
References: <20200619182302.850-1-eperezma@redhat.com>
 <20200619182302.850-11-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200619182302.850-11-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: kvm list <kvm@vger.kernel.org>, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============0366735961809851040=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============0366735961809851040==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline

--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 08:23:01PM +0200, Eugenio P=E9rez wrote:
> From: "Michael S. Tsirkin" <mst@redhat.com>
>=20
> A straight-forward conversion.
>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> ---
>  drivers/vhost/vsock.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7wgQoACgkQnKSrs4Gr
c8gaawf8CE0r7lmdy1n0zKbFGNwbeFg1iFtb/arJ8/pKg6QjAIlXaL2eYU04kVXV
rOn/oN0avr1ji2MKbCL0eKOV2/FpmKhN0RmT/4mvVMfB7MrT/ooruRUoUBV5FsxE
B0ET9VJG6JuUg0xbp2UP/x3QRYSLYwwTXKkc5WDJCflAAlbOJPjHjuK6Mpubgb4y
vx26gYD2lK36TulNmBjkYiiQx72PE2LyA7Ss6Fe4E/DRCzeVNoDr5XQURcYIXjZw
8x2qTEZ95YrJA/cxr36Po9hlycV4P8QHF/sj6Rq1vlTJgFHSFupE1Z21GCuz3kDV
oqun+r8WanK92bkZqA2GYM5TCvZXZg==
=+yyR
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--


--===============0366735961809851040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0366735961809851040==--

