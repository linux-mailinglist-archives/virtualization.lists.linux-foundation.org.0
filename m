Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F60D3728E8
	for <lists.virtualization@lfdr.de>; Tue,  4 May 2021 12:27:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE25840F6C;
	Tue,  4 May 2021 10:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id liDjNl_sX9Q4; Tue,  4 May 2021 10:27:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64E0940F6D;
	Tue,  4 May 2021 10:27:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E93F3C0001;
	Tue,  4 May 2021 10:27:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E054C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 May 2021 10:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE25A40568
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 May 2021 10:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wOueRWxhh8jp
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 May 2021 10:27:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E23640563
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 May 2021 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620124047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zq9ZAUu6BV9hrWPMjQygywv5KPKG+EiMuH5sJULgAGw=;
 b=LmKVO2yWre+4REGV78OjgT5VvmBvKe9rPh2/1IaqPeHQ8vOZXAj84lK/VkfFKxjbXOtqXz
 1oU0JCLjWFfob8DFQrvJJ9TXvzfn4v41VnF4VZd5LXjwi1V3/XgEq2NTxL+f2PU+syWpUE
 7tOB4c/65a/P52mJm04mPrWnP7W9FbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-86Zh9_88OU2TIQtCKxbBnQ-1; Tue, 04 May 2021 06:27:24 -0400
X-MC-Unique: 86Zh9_88OU2TIQtCKxbBnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B78B3107ACE4;
 Tue,  4 May 2021 10:27:22 +0000 (UTC)
Received: from localhost (ovpn-115-110.ams2.redhat.com [10.36.115.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B3AB5D9C0;
 Tue,  4 May 2021 10:27:17 +0000 (UTC)
Date: Tue, 4 May 2021 11:27:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sohaib Mohamed <sohaib.amhmd@gmail.com>
Subject: Re: [PATCH] virtio_blk: cleanups: remove check obsoleted by
 CONFIG_LBDAF removal
Message-ID: <YJEhhWgzVtWd2Vhm@stefanha-x1.localdomain>
References: <20210430103611.77345-1-sohaib.amhmd@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210430103611.77345-1-sohaib.amhmd@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Jens Axboe <axboe@kernel.dk>, a.fatoum@pengutronix.de,
 "Michael S. Tsirkin" <mst@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO BLOCK AND SCSI DRIVERS"
 <virtualization@lists.linux-foundation.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
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
Content-Type: multipart/mixed; boundary="===============4446368336560525013=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============4446368336560525013==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azv+1tfdWfJx4DWE"
Content-Disposition: inline


--azv+1tfdWfJx4DWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 12:36:11PM +0200, Sohaib Mohamed wrote:
> From: Sohaib <sohaib.amhmd@gmail.com>
>=20
> Prior to 72deb455b5ec ("block: remove CONFIG_LBDAF"), it was optional if
> the 32-bit kernel support block device and/or file sizes larger than 2 TiB
> (considering the sector size is 512 bytes)
> But now sector_t and blkcnt_t are always 64-bit in size.
>=20
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Sohaib Mohammed <sohaib.amhmd@gmail.com>
> ---
>  drivers/block/virtio_blk.c | 7 -------
>  1 file changed, 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--azv+1tfdWfJx4DWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCRIYQACgkQnKSrs4Gr
c8iX4Qf/exEHxqBALcdDtpaB/d0fHflU8dsTJb69DAVNal9+XfSdnjILjQ0o6ZP9
G0u4Uhtn8k71Szhwg8lbVoORYVHzk8wcWg5YdafvtnE5iAMQy3Al6wKW2jczi0fC
lRyU440rHxzaMx4PR99adARDN7MvuY6q9KVjQexdU7zmaoyVdjA7jVzQdQVral6E
PcBiOCHQiUYYKVBQv30s3V9MFouRn4nWFLBLUV764IxjJpCn/HSt2jx9xM8ywxzp
MGKZQuxprnn8xGIwTxQZkVPe2axhTGxneyE5jGW2rCwm0IqkX17Dtj0I2lwERFJ9
F8VvI+gB5WjyZNUy/HY97Re1Slf4Dw==
=LGQo
-----END PGP SIGNATURE-----

--azv+1tfdWfJx4DWE--


--===============4446368336560525013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4446368336560525013==--

