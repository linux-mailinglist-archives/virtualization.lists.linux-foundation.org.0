Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4AD43DCE1
	for <lists.virtualization@lfdr.de>; Thu, 28 Oct 2021 10:19:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3B8740403;
	Thu, 28 Oct 2021 08:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMWI9-xW82fh; Thu, 28 Oct 2021 08:19:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 98C94403FE;
	Thu, 28 Oct 2021 08:18:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDB7CC0036;
	Thu, 28 Oct 2021 08:18:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 827EBC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 08:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B44640403
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 08:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id itQggFlIUhaa
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 08:18:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72FF1403FE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635409135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pXMrcpHehLRVHJk/nMeA6+QLvzVDo2cx25CECDi4i7A=;
 b=JAJnUFjPqlv1tq/hh0E+TED8BpilQejxGHjiKBiysXigTdTJqeqCUCUBXaaf4kLzAfyQM6
 Qc74S11k6+asX8ooLERRU/y4bdY/TkEGhd4QM7WSdOdq67b+N2Xw6Hy/ZxKv3eLgDFiH+1
 C3JBAQrvzdZTRX/nliMScDC0A35q6qI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-i4Dnxkw1NDyC3baBbDAFUQ-1; Thu, 28 Oct 2021 04:18:51 -0400
X-MC-Unique: i4Dnxkw1NDyC3baBbDAFUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 497889F932;
 Thu, 28 Oct 2021 08:18:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E742B57CB9;
 Thu, 28 Oct 2021 08:18:46 +0000 (UTC)
Date: Thu, 28 Oct 2021 09:18:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Colin Ian King <colin.i.king@googlemail.com>
Subject: Re: [PATCH][next] virtio_blk: Fix spelling mistake: "advertisted" ->
 "advertised"
Message-ID: <YXpc5l6lzp+aBTaU@stefanha-x1.localdomain>
References: <20211025102240.22801-1-colin.i.king@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211025102240.22801-1-colin.i.king@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Jens Axboe <axboe@kernel.dk>, "Michael S . Tsirkin" <mst@redhat.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============1431487299580601395=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============1431487299580601395==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U+u1ddsxMsOIkdhu"
Content-Disposition: inline


--U+u1ddsxMsOIkdhu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 11:22:40AM +0100, Colin Ian King wrote:
> There is a spelling mistake in a dev_err error message. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/block/virtio_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--U+u1ddsxMsOIkdhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF6XOUACgkQnKSrs4Gr
c8j8vgf9GmyeRUXKxu9ABJAENCKSjxXLD6Vukn+lKvXAMvprvR+m82GgNwtX37u5
ag8cYzpK3JKZ8pu2U9hmsbormnnXTPhwSv4Xu6rwSsmLK2kx1ZrVjmlh3/z4MA8T
yoUsJQOpMsIjO6Y0R+t+/Hl/8bzxuH3d4mWWca4GTbIF2ZAvOxEgute1VVGcUr9L
yiFT3Ym5HVxP7VaHrtXBCwjXl/taWhB+oTo4cToa4OPo6/ccnTaXtuJEn+ytGlTd
ZBiPFVVGIpPNqasYkZeMcE8Jxxp/4+c5uDW89FVZ3l2NxKoX3TmaLHyfFDk0RqJY
1tK8mop6eVQvpb7pkQwjikTXOG8/7g==
=0jkP
-----END PGP SIGNATURE-----

--U+u1ddsxMsOIkdhu--


--===============1431487299580601395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1431487299580601395==--

