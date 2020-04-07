Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B18721A0990
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 10:51:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 53DC722011;
	Tue,  7 Apr 2020 08:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCF5uzkNvPxI; Tue,  7 Apr 2020 08:51:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 98F8722128;
	Tue,  7 Apr 2020 08:51:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B42DC0177;
	Tue,  7 Apr 2020 08:51:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F3BBC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 08:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 81C5922829
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 08:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a08FwCwlTOeJ
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 08:51:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 0C75120489
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 08:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586249492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jykHO/SKPEfQgLiTVDsBlq5E9x7OAuQZbAht/mZ4Uik=;
 b=Z9kg1JhuizVJtPFFq1R1DS1Myw7OJ5YhAXGtA6GbCWxbfCpyW2ZXED9jLdR49RkRVH/87z
 GbniArfpyEPIotEeJDLpTL4yRAMjGsffe7lP5AlAf3y1aD35xva0WGu2QoMRN9zmmGPjUh
 DtDFnZqtZBEq7BGYQYavC3ZBhfmA6M4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-FiAM1shJMnep_9mw09IkHA-1; Tue, 07 Apr 2020 04:51:28 -0400
X-MC-Unique: FiAM1shJMnep_9mw09IkHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54C161005513;
 Tue,  7 Apr 2020 08:51:27 +0000 (UTC)
Received: from localhost (ovpn-113-168.ams2.redhat.com [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB08BCDBCA;
 Tue,  7 Apr 2020 08:51:24 +0000 (UTC)
Date: Tue, 7 Apr 2020 09:51:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v8 09/19] virtio: stop using legacy struct vring in kernel
Message-ID: <20200407085123.GA247777@stefanha-x1.localdomain>
References: <20200407011612.478226-1-mst@redhat.com>
 <20200407011612.478226-10-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407011612.478226-10-mst@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============2597362528358656703=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============2597362528358656703==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2020 at 09:16:46PM -0400, Michael S. Tsirkin wrote:
> struct vring (in the uapi directory) and supporting APIs are kept
> around to solely avoid breaking old userspace builds.
> It's not actually part of the UAPI - it was kept in the UAPI
> header by mistake, and using it in kernel isn't necessary
> and prevents us from making changes safely.
> In particular, the APIs actually assume the legacy layout.
>=20
> Add an internal kernel-only struct vring and
> switch everyone to use that.
>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/block/virtio_blk.c       |  1 +
>  include/linux/virtio.h           |  1 -
>  include/linux/virtio_ring.h      | 10 ++++++++++
>  include/linux/vringh.h           |  1 +
>  include/uapi/linux/virtio_ring.h | 26 ++++++++++++++++----------
>  5 files changed, 28 insertions(+), 11 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6MPwoACgkQnKSrs4Gr
c8i4iwf/bOwj2ZidNGGENtcVu7gvojGcqqZUH3YTJ7iTnAiBQzurGIHN6p9vGEal
2cS8Jb9OuArHQhIfm5M/AaSzNa3zmy8D9l2tWRVFAooBSK40l4Q10e5EUkybhClw
ITad9nQtPO0n0IGfFGrJasavS7MBhBJw/7wqNtzkHIxq3I86MKA9aLdefTGmkMVp
+PJjhgvzRzjtmbHL/wIu9+bVEFEmMOIjTgHaOoaYvStvVmOqKEOtoiyyb/hormmM
yLJJOmq4zMKsjpKYeQB4wmFDKtXheVRFrRPASciZEMRS8+dPVBRq7QzzWUdG1Awq
edDSidc+l3t9UZBO/tsqBqQQSC6YNQ==
=wat3
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--


--===============2597362528358656703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2597362528358656703==--

