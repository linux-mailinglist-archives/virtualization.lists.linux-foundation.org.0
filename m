Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C41F21D2CB
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 11:30:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F0D4689383;
	Mon, 13 Jul 2020 09:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QVijKfA6Y3Sc; Mon, 13 Jul 2020 09:30:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 723B989414;
	Mon, 13 Jul 2020 09:30:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 439B7C0733;
	Mon, 13 Jul 2020 09:30:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A6F6C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 09:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EB089872D0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 09:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3tJ031lUkoi7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 09:30:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 71EA1872CC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 09:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594632599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FkdClRISCLaiArFjVxkA+fHx1NW3jZ3pECNBcgR6TSM=;
 b=M+hIApVZyhMpVBIlRKY4ZrF7Flr1CO1n+ulMkF1SLqAz7ypsdvNQTZtwlTwGtFUTUABbpB
 U4QYVi6Xop6h4Djqn6T3xFeQDtKywAFKovJfkac1TAMV82980wGEIGsZyHZfWYFZB+A+F/
 xbjuc8x4UqdHy2qDZraKiGA28ho2idA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-wUIIf35hMS-KCLeMBOln2Q-1; Mon, 13 Jul 2020 05:29:55 -0400
X-MC-Unique: wUIIf35hMS-KCLeMBOln2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5AF5107ACCA;
 Mon, 13 Jul 2020 09:29:53 +0000 (UTC)
Received: from localhost (ovpn-114-66.ams2.redhat.com [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37CDD74F44;
 Mon, 13 Jul 2020 09:29:50 +0000 (UTC)
Date: Mon, 13 Jul 2020 10:29:49 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost/scsi: fix up req type endian-ness
Message-ID: <20200713092949.GE28639@stefanha-x1.localdomain>
References: <20200710104849.406023-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200710104849.406023-1-mst@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
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
Content-Type: multipart/mixed; boundary="===============1949456174227624760=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============1949456174227624760==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n+lFg1Zro7sl44OB"
Content-Disposition: inline

--n+lFg1Zro7sl44OB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2020 at 06:48:51AM -0400, Michael S. Tsirkin wrote:
> vhost/scsi doesn't handle type conversion correctly
> for request type when using virtio 1.0 and up for BE,
> or cross-endian platforms.
>=20
> Fix it up using vhost_32_to_cpu.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/vhost/scsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--n+lFg1Zro7sl44OB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8MKY0ACgkQnKSrs4Gr
c8gQOQf+KmgjzVnEXU62hGmZBNsGZ9+2r2VBviBdhlBL0AB0927CK0A8v4HXZ/5+
8Y6UwKNT0GZnj67/+PBXAVvJm4Jny+4TTgTafuZY0gnlNZKS6PpmSoztnzwjqtgI
ddm2TVEWDF/lDZNRcWZ1a0cURg8If2ZQPxNepxT3uqa5LnbYXiwuIlnFG6eetsHV
Cl751SmdjCSXzCDBvEE6eboXtzt3ok1TWIx3L2jU034AyexssehBz6C0G9LVQhau
pVJs0q2BfsF95xxX6k2Bo/8Paj4EqzUKxG4jEXteR9SIHwZH3anw0PKPygh96FWF
XrsnZG1MAaXY8ybmuVlQkaJofLFlMA==
=4fi+
-----END PGP SIGNATURE-----

--n+lFg1Zro7sl44OB--


--===============1949456174227624760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1949456174227624760==--

