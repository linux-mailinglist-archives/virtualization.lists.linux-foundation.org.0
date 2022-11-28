Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BA38363B1E2
	for <lists.virtualization@lfdr.de>; Mon, 28 Nov 2022 20:07:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1172E60AFD;
	Mon, 28 Nov 2022 19:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1172E60AFD
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cv23SOuf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 839TCDeBqCKx; Mon, 28 Nov 2022 19:07:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BF2A660A7A;
	Mon, 28 Nov 2022 19:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF2A660A7A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7631C0078;
	Mon, 28 Nov 2022 19:07:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84474C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Nov 2022 19:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B886813DE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Nov 2022 19:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B886813DE
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=cv23SOuf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c0Q_1O52tXOk
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Nov 2022 19:07:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FB66813D7
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FB66813D7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Nov 2022 19:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669662458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ekimUx4Xtb0qILKp5qfsCcKzDNUCeNRMwKEt1lPD7ds=;
 b=cv23SOufSgGLcn7X+hklrOm7KFL/dYFSd9YlS09mZjfwv87SnKFFTlCvJJvxLQ/XCdyjRV
 KkGcdx7B4LK1prhAXeWcaO9ujOpHCvHo1OhtNnS8XwDof84K6JckYtfhN9lBfD0B2drvnW
 jr8YGgv6eVUPuK3kHIFtqpjJ8ldNzws=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205--8RFDKf7O229T1UuhkDSlA-1; Mon, 28 Nov 2022 14:07:26 -0500
X-MC-Unique: -8RFDKf7O229T1UuhkDSlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DCF93C0CD54;
 Mon, 28 Nov 2022 19:07:26 +0000 (UTC)
Received: from localhost (unknown [10.39.192.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBB7C2166B2E;
 Mon, 28 Nov 2022 19:07:25 +0000 (UTC)
Date: Mon, 28 Nov 2022 14:07:22 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Subject: Re: [PATCH v2] virtio_blk: add VIRTIO_BLK_F_LIFETIME feature support
Message-ID: <Y4UG6lQXbzxOix1/@fedora>
References: <20221121085923.2717501-1-alvaro.karsz@solid-run.com>
 <1bd1c77e-d8c3-b04a-4fbc-bbc85391e630@nvidia.com>
 <20221124013830-mutt-send-email-mst@kernel.org>
 <Y3/WXWoV1jcJnohR@fedora>
 <CAJs=3_AY_1eGwsu5MvzUr4N03=3qgYiVdu5=EV+VSj6+yUYeyg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJs=3_AY_1eGwsu5MvzUr4N03=3qgYiVdu5=EV+VSj6+yUYeyg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Cc: Jens Axboe <axboe@kernel.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============3026384131788173350=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============3026384131788173350==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ntlNSts6nGmGkYoP"
Content-Disposition: inline


--ntlNSts6nGmGkYoP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2022 at 12:09:45AM +0200, Alvaro Karsz wrote:
> > I suggest defining a separate UAPI struct for this ioctl.
>=20
> Sounds fine to me.
> I could use the following struct
>=20
> struct virtio_blk_lifetime_ioctl {
>         u16 pre_eol_info;
>         u16 device_lifetime_est_typ_a;
>         u16 device_lifetime_est_typ_b;
>         u16 padding;
> };

Looks good.

Stefan

--ntlNSts6nGmGkYoP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOFBuoACgkQnKSrs4Gr
c8iyLwf/TmY+gfmvv3ZLksVb/mk7BV4bihxg4SuEhj7PieCXdB5hmabaQRtVmI6x
LOlKHtW3DO5gbMjJwXB27MQ3fiJuXkjfCqibuH5hzRrJRm1pELLMDeIgKBGIiFyF
rHBZLSGg/xxQ3dTSWkWfcwMdcUuZXKUBXKHq+srHsL48o2QglgypF7xn3cN8xloV
JErRy+6lkHphl086YOczW/0LLQiLXU1Ot6AM/KuXs+5tm8NfNEu939pCIXCECTiL
pHPniGviMPReiJVlDSuvA5r5VTGLZ6izGMNnQUvOuNI/6Yb7LzJhc+64O+DDT6Z4
BBJoZBvUpn0a77JOX/hxL26XoMvZyw==
=7e+v
-----END PGP SIGNATURE-----

--ntlNSts6nGmGkYoP--


--===============3026384131788173350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3026384131788173350==--

