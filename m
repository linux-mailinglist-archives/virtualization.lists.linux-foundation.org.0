Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F2B652752
	for <lists.virtualization@lfdr.de>; Tue, 20 Dec 2022 20:51:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D26681F20;
	Tue, 20 Dec 2022 19:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D26681F20
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ixJXJIdt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mqFfgHRmOTYm; Tue, 20 Dec 2022 19:51:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5DA2181E86;
	Tue, 20 Dec 2022 19:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA2181E86
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C95ACC002D;
	Tue, 20 Dec 2022 19:51:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8D4CC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 19:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B774E60AAD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 19:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B774E60AAD
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ixJXJIdt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ED06NINeKgNy
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 19:51:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1447E60ACE
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1447E60ACE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 19:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671565895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BGc57pMu8PZQqKa78AS39aQQLkuWJYOqorRpGd4QEMU=;
 b=ixJXJIdt60JHyKOSNRq+luM4s7pmT4cl4peWgd6EEwnx7fCtoyy2xdSSBCI8+qKcavMwig
 k6AwiTHx/CpZ/sY+eTpHArIYExY53UjZULRQ3uzQLuU+E7O+cLNLNzjZo/CPn3lklJl7Hi
 wyFglRwVm+McBLY7fdnuYaVHU73tG70=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-xyGbolVIP0KzXT-6k4ZI5g-1; Tue, 20 Dec 2022 14:51:31 -0500
X-MC-Unique: xyGbolVIP0KzXT-6k4ZI5g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBB8E282380B;
 Tue, 20 Dec 2022 19:51:30 +0000 (UTC)
Received: from localhost (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47F98492B00;
 Tue, 20 Dec 2022 19:51:29 +0000 (UTC)
Date: Tue, 20 Dec 2022 14:51:28 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] virtio_blk: temporary variable type tweak
Message-ID: <Y6ISQGnxdW7RB0sN@fedora>
References: <20221220124152.523531-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221220124152.523531-1-mst@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Content-Type: multipart/mixed; boundary="===============3407061092150668537=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============3407061092150668537==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="imwUiy+yiKAqjoRf"
Content-Disposition: inline


--imwUiy+yiKAqjoRf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 07:41:53AM -0500, Michael S. Tsirkin wrote:
> virtblk_result returns blk_status_t which is a bitwise restricted type,
> so we are not supposed to stuff it in a plain int temporary variable.
> All we do with it is pass it on to a function expecting blk_status_t so
> the generated code is ok, but we get warnings from sparse:
>=20
> drivers/block/virtio_blk.c:326:36: sparse: sparse: incorrect type in init=
ializer (different base types) @@     expected int status @@
> +got restricted blk_status_t @@
> drivers/block/virtio_blk.c:334:33: sparse: sparse: incorrect type in argu=
ment 2 (different base types) @@     expected restricted
> +blk_status_t [usertype] error @@     got int status @@
>=20
> Make sparse happy by using the correct type.
>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/block/virtio_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--imwUiy+yiKAqjoRf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOiEkAACgkQnKSrs4Gr
c8jYogf/S4jEFrznpo8+c66way8ejJTXmDDq3YtWCOVGDr3f6q+0sxNxmhnHAn+z
rEK7ByQtnH/ZRSo7mfJ+cnmViSwkm5fCrykdm0w6sh5DiaZlHfWdp/cAS2ZggOej
v3dQUnrTvDZhkFLbRshy+G20T7b3wqCP0sU/IHw3MMW9iobl6Utv5dfsvD38Dz2+
X5OjBuFs2oTHu+M9jSMJU7/rmxEQtbnMIY0UlguKfDCZmzRUWoEd/AD+zDxBmcTa
IQft81vadyNZnOE+LlC1xsY3pxqm38EgB23X+YY1ctTSw0LGjLJjKeXdZYJ353NY
0TwIr9eWgbHUS4Lbcq0fHhKY0RfVOg==
=6ckR
-----END PGP SIGNATURE-----

--imwUiy+yiKAqjoRf--


--===============3407061092150668537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3407061092150668537==--

