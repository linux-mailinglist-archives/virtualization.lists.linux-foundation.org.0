Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 052422B7962
	for <lists.virtualization@lfdr.de>; Wed, 18 Nov 2020 09:52:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF9E28701E;
	Wed, 18 Nov 2020 08:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DY-UNf86LNxY; Wed, 18 Nov 2020 08:52:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 31F8386F7E;
	Wed, 18 Nov 2020 08:52:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12F97C07FF;
	Wed, 18 Nov 2020 08:52:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BED11C07FF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Nov 2020 08:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9DE7B204FB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Nov 2020 08:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8eUGHaValvE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Nov 2020 08:52:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 468FD2002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Nov 2020 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605689522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AGZAWOOKsaOMtTPLmfavfmom9OBpCpjkv96nXQO85ew=;
 b=iyCdp0Eu5tT7ounoky71QnPShI0EyEg41Q2VaQCTqO+kGQG6FmglAyqn0ps3ADYeznM9PY
 ogWsjOlSyTmMCREepoCIEa7028p8MK9fIo7QTrawF1eTkMjKZS6LkB1bwKtNEqMMWEHajw
 qtyG4pfPjPEl9UYDhfjF+sbK+LQ8ezs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-i_0NcwotPZOABUEPm69HuA-1; Wed, 18 Nov 2020 03:52:00 -0500
X-MC-Unique: i_0NcwotPZOABUEPm69HuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3691B10B9CB6;
 Wed, 18 Nov 2020 08:51:59 +0000 (UTC)
Received: from localhost (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCD6C5D9CD;
 Wed, 18 Nov 2020 08:51:55 +0000 (UTC)
Date: Wed, 18 Nov 2020 08:51:54 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 1/1] vhost scsi: fix lun reset completion handling
Message-ID: <20201118085154.GB182763@stefanha-x1.localdomain>
References: <1605680660-3671-1-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605680660-3671-1-git-send-email-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: target-devel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-scsi@vger.kernel.org, mst@redhat.com
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
Content-Type: multipart/mixed; boundary="===============5626191928505672135=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============5626191928505672135==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline

--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 12:24:20AM -0600, Mike Christie wrote:
> vhost scsi owns the scsi se_cmd but lio frees the se_cmd->se_tmr
> before calling release_cmd, so while with normal cmd completion we
> can access the se_cmd from the vhost work, we can't do the same with
> se_cmd->se_tmr. This has us copy the tmf response in
> vhost_scsi_queue_tm_rsp to our internal vhost-scsi tmf struct for
> when it gets sent to the guest from our worker thread.
>=20
> Signed-off-by: Mike Christie <michael.christie@oracle.com>
> ---
>  drivers/vhost/scsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+04KoACgkQnKSrs4Gr
c8i6xQf/WGTmSkaZz3wjoFmuGQ0KePZY+uEW6Z7F4/QjhABFHREnOU3K37aawDrb
eDky5KvUxkFhkNJ0zkfoao9NQSIBNwWAm2mACVHKaYf2q6V6s7Slxtqb1tmvA0T9
rc1Sfm10qvQdCQgqwrPn3HPFTPLkub5JanfhHqAZsmh2BDFX7mWiLQ91b/uQ4t9T
7s9K7blSuufG6awOBM0vLi3PWNHCginHDHLD/bjaV5ntRH8CF5vxoqVzYtPxDtMr
N9RFqAHqLLXvi2kV/Ik4/+B4Xmk0jUZPBHemXSbX5I0Q00ksv1Ql+2ciU5A9agtw
ThFXOBEDFoHmIPRib6Gn/Cgt/7+22g==
=LX+f
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--


--===============5626191928505672135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5626191928505672135==--

