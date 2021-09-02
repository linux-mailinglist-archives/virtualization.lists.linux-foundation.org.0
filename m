Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 084303FEDB2
	for <lists.virtualization@lfdr.de>; Thu,  2 Sep 2021 14:21:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4511581D21;
	Thu,  2 Sep 2021 12:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTb2UX_OAW9e; Thu,  2 Sep 2021 12:21:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1B8BE823F4;
	Thu,  2 Sep 2021 12:21:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 951C2C001F;
	Thu,  2 Sep 2021 12:21:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62ADDC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Sep 2021 12:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44507614BE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Sep 2021 12:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LfLRu7GIunxJ
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Sep 2021 12:21:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99E2561467
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Sep 2021 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630585294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hY16j+oJ/RLc0kDkzsh1MP+pUads19JdDqlb34c/SbA=;
 b=DCcFktGz87gqf1C0ZPsTqglgKbUP2fXdCWSQPT+wu2nvJJS6053RRsPQXbZmoAe/v9ryFV
 rmm3Ppx0iwGBwC1pgoa5vZod+4GmBK8LdIqBH6N4bfch0mhpZHHR/iL/X8uNPjSyjihlen
 yx+ZZAIfgPB8up7wvNfIfR95boy1GgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-0WyANDvvPRKEuZC_JugsvA-1; Thu, 02 Sep 2021 08:21:33 -0400
X-MC-Unique: 0WyANDvvPRKEuZC_JugsvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF6FCEC1A6;
 Thu,  2 Sep 2021 12:21:31 +0000 (UTC)
Received: from localhost (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6161E100EBC1;
 Thu,  2 Sep 2021 12:21:28 +0000 (UTC)
Date: Thu, 2 Sep 2021 13:21:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH v3 1/1] virtio-blk: avoid preallocating big SGL for data
Message-ID: <YTDBx/E/UJZWTFlG@stefanha-x1.localdomain>
References: <20210901131434.31158-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210901131434.31158-1-mgurtovoy@nvidia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, kvm@vger.kernel.org,
 mst@redhat.com, israelr@nvidia.com, virtualization@lists.linux-foundation.org,
 hch@infradead.org, nitzanc@nvidia.com, oren@nvidia.com
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
Content-Type: multipart/mixed; boundary="===============3736173486286664190=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============3736173486286664190==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z2rIWpdHIslofiCP"
Content-Disposition: inline


--z2rIWpdHIslofiCP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 04:14:34PM +0300, Max Gurtovoy wrote:
> No need to pre-allocate a big buffer for the IO SGL anymore. If a device
> has lots of deep queues, preallocation for the sg list can consume
> substantial amounts of memory. For HW virtio-blk device, nr_hw_queues
> can be 64 or 128 and each queue's depth might be 128. This means the
> resulting preallocation for the data SGLs is big.
>=20
> Switch to runtime allocation for SGL for lists longer than 2 entries.
> This is the approach used by NVMe drivers so it should be reasonable for
> virtio block as well. Runtime SGL allocation has always been the case
> for the legacy I/O path so this is nothing new.
>=20
> The preallocated small SGL depends on SG_CHAIN so if the ARCH doesn't
> support SG_CHAIN, use only runtime allocation for the SGL.
>=20
> Re-organize the setup of the IO request to fit the new sg chain
> mechanism.
>=20
> No performance degradation was seen (fio libaio engine with 16 jobs and
> 128 iodepth):
>=20
> IO size      IOPs Rand Read (before/after)         IOPs Rand Write (befor=
e/after)
> --------     ---------------------------------    -----------------------=
-----------
> 512B          318K/316K                                    329K/325K
>=20
> 4KB           323K/321K                                    353K/349K
>=20
> 16KB          199K/208K                                    250K/275K
>=20
> 128KB         36K/36.1K                                    39.2K/41.7K
>=20
> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> Reviewed-by: Israel Rukshin <israelr@nvidia.com>
> ---
>=20
> changes from V2:
>  - initialize vbr->out_hdr.sector during virtblk_setup_cmd
>=20
> changes from V1:
>  - Kconfig update (from Christoph)
>  - Re-order cmd setup (from Christoph)
>  - use flexible sg pointer in the cmd (from Christoph)
>  - added perf numbers to commit msg (from Feng Li)
>=20
> ---
>  drivers/block/Kconfig      |   1 +
>  drivers/block/virtio_blk.c | 155 +++++++++++++++++++++++--------------
>  2 files changed, 100 insertions(+), 56 deletions(-)

Hi Max,
I can run benchmark to give everyone more confidence about this change.
Should I test this version or are you still planning to make code
changes?

Stefan

--z2rIWpdHIslofiCP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEwwccACgkQnKSrs4Gr
c8g4aAf/e1JaN7Xed1hTL+F4WDY4o+YDC+vleCJtGmv90L4hCtsq9UyokNwgVE8N
K7rdoJP48GJNZtS0yehyVx+fz8Hsud01k805Ye9RlgOymN3gtaLWvX70EFBwlg0s
39HvbUWThJTvzt5glLaHwVnyayVdeBNTDQ+h7g6jhE22txOUtvGS0XuJZft0+Y5S
LMqE4qb8WypZtD7M7TzAlUbVkxEvd3QiPCOLK73qukjXzgOX2C4BGCShr4YIo5Mc
yA6/GiKsp5twzFFkNCTZb6Kt0P3uI6/eNINpfuPqJy6+k/UXFkuMO6J3ulZeLCwp
+pNtlvXyq///2N3FcZtSm6U3gJeu0Q==
=IrFB
-----END PGP SIGNATURE-----

--z2rIWpdHIslofiCP--


--===============3736173486286664190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3736173486286664190==--

