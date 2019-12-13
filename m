Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADCF11E294
	for <lists.virtualization@lfdr.de>; Fri, 13 Dec 2019 12:13:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1762188B0B;
	Fri, 13 Dec 2019 11:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BiEj0q3uuD58; Fri, 13 Dec 2019 11:13:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4723488AE8;
	Fri, 13 Dec 2019 11:13:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 263EBC0881;
	Fri, 13 Dec 2019 11:13:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DCADC0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 11:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 83B4B204D2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 11:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b3m++DRBC+0R
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 11:12:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 3B2EC20497
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576235576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lxgYDeLn+qsD2/3M7+5DqmcLMAJ3gqSfcZrOd3a7MZc=;
 b=ct2bk9J/hseEWY30m/Jg4PK/beo4U2n9B1oabxDsYxVB8lcDb/n6FozD8QshMCCNoRIAxT
 F3xmsYZHHXMtYzjBMP2nHKKNXtDo/mj3WqHVSrS0ZuPu25f3EtPuFKuZxFBGSGcf3R7RCT
 NtQbb8FbtvF1bRlNKpuNSpUsD8cpFD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-uPeUHrhDONiQNaDCyb1D_w-1; Fri, 13 Dec 2019 06:12:55 -0500
X-MC-Unique: uPeUHrhDONiQNaDCyb1D_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1D5CDB22;
 Fri, 13 Dec 2019 11:12:53 +0000 (UTC)
Received: from localhost (unknown [10.36.118.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FAA76013D;
 Fri, 13 Dec 2019 11:12:49 +0000 (UTC)
Date: Fri, 13 Dec 2019 11:12:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] virtio-blk: remove VIRTIO_BLK_F_SCSI support
Message-ID: <20191213111248.GF1180977@stefanha-x1.localdomain>
References: <20191212163719.28432-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20191212163719.28432-1-hch@lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Cc: axboe@kernel.dk, mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, pbonzini@redhat.com
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
Content-Type: multipart/mixed; boundary="===============2806254460053145579=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============2806254460053145579==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B0nZA57HJSoPbsHY"
Content-Disposition: inline

--B0nZA57HJSoPbsHY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2019 at 05:37:19PM +0100, Christoph Hellwig wrote:
> Since the need for a special flag to support SCSI passthrough on a
> block device was added in May 2017 the SCSI passthrough support in
> virtio-blk has been disabled.  It has always been a bad idea
> (just ask the original author..) and we have virtio-scsi for proper
> passthrough.  The feature also never made it into the virtio 1.0
> or later specifications.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/configs/guest.config |   1 -
>  drivers/block/Kconfig             |  10 ---
>  drivers/block/virtio_blk.c        | 115 +-----------------------------
>  3 files changed, 1 insertion(+), 125 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--B0nZA57HJSoPbsHY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3zcjAACgkQnKSrs4Gr
c8hUCwgAwoDSWLqUUFcE49cvm2R06U1mq/S+1RD+NEKHblyqWDsshV3UG8/It0EK
P0UJdPG99+Px7vbsh8WoZx0THO+YT3pBT0UzxY/KggDZYU2IAStfaSxBwDa0mULu
utlt/elBTbhtTd8dNIDz0w9qxyVHaa/8urGHtFe8mWw7xhOg5LHLqQESRV6V7y9v
f7+Za7/DFg1XeFxGDlZW3dWY22lPTe8gAGrOqQRnj69lrYZuezbCIDNf3Ab+PJQp
p2HoSZBNZTRrekMap2n3iEA63GNQAlXrDRfdWqRXkK3EXjHlVJcGe86ZZD8XqiCp
g/TdO1+w4c9ds5Oqo6dO/MWQKOVYGg==
=+gj9
-----END PGP SIGNATURE-----

--B0nZA57HJSoPbsHY--


--===============2806254460053145579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2806254460053145579==--

