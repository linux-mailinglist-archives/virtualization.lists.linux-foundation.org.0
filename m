Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4D94F3C69
	for <lists.virtualization@lfdr.de>; Tue,  5 Apr 2022 17:46:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4BAC40ABD;
	Tue,  5 Apr 2022 15:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJmn1A8UUF4g; Tue,  5 Apr 2022 15:46:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A948540ABF;
	Tue,  5 Apr 2022 15:46:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2505DC0073;
	Tue,  5 Apr 2022 15:46:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF961C0012
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Apr 2022 15:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D0F840ABF
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Apr 2022 15:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mm9vOcU92wJZ
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Apr 2022 15:46:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E82F140ABD
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Apr 2022 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649173612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BmCfcOyijFUWsVuVuW7JcJV3f9Qib5akkQOMFQ7IxQ0=;
 b=Ss916vA42zFpscgIBseAdrHGx/f2p5CqlD0OTVjWd6p8LxJE4me6nECfWkg9UUiIr14vSx
 QeDhnbQczLVcHNr08LmSaIdJOBoYpOyCzKbeFigjHmzmEhggsLqvvyuoEaMPnu0NSI/Dpa
 bRI/KMB/ocJ2S4M00KF1vVOL6xx6IGI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-aDcea6VNPQGBaoeThpIH9A-1; Tue, 05 Apr 2022 11:46:49 -0400
X-MC-Unique: aDcea6VNPQGBaoeThpIH9A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 469E31C0EDCA;
 Tue,  5 Apr 2022 15:46:43 +0000 (UTC)
Received: from localhost (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADFE84021D9;
 Tue,  5 Apr 2022 15:46:40 +0000 (UTC)
Date: Tue, 5 Apr 2022 16:46:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Suwan Kim <suwan.kim027@gmail.com>
Subject: Re: [PATCH v5 0/2] virtio-blk: support polling I/O and
 mq_ops->queue_rqs()
Message-ID: <YkxkXrHBmvYB50Lk@stefanha-x1.localdomain>
References: <20220405150924.147021-1-suwan.kim027@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220405150924.147021-1-suwan.kim027@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Cc: mgurtovoy@nvidia.com, linux-block@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, hch@infradead.org,
 pbonzini@redhat.com
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
Content-Type: multipart/mixed; boundary="===============5283175422227007510=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============5283175422227007510==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="duw9For8MKB3MpZO"
Content-Disposition: inline


--duw9For8MKB3MpZO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2022 at 12:09:22AM +0900, Suwan Kim wrote:
> This patch serise adds support for polling I/O and mq_ops->queue_rqs()
> to virtio-blk driver.
>=20
> Changes
>=20
> v4 -> v5
>     - patch1 : virtblk_poll
>         - Replace "req_done" with "found" in virtblk_poll()
>         - Split for loop into two distinct for loop in init_vq()
>           that sets callback function for each default/poll queues
>         - Replace "if (i =3D=3D HCTX_TYPE_DEFAULT)" with "i !=3D HCTX_TYP=
E_POLL"
>           in virtblk_map_queues()
>         - Replace "virtblk_unmap_data(req, vbr);" with
>           "virtblk_unmap_data(req, blk_mq_rq_to_pdu(req);"
>           in virtblk_complete_batch()
>    =20
>     - patch2 : virtio_queue_rqs
>         - Instead of using vbr.sg_num field, use vbr->sg_table.nents.
>           So, remove sg_num field in struct virtblk_req
>         - Drop the unnecessary argument of virtblk_add_req() because it
>           doens't need "data_sg" and "have_data". It can be derived from =
"vbr"
>           argument.
>         - Add Reviewed-by tag from Stefan
>=20
> v3 -> v4
>     - patch1 : virtblk_poll
>         - Add print the number of default/read/poll queues in init_vq()
>         - Add blk_mq_start_stopped_hw_queues() to virtblk_poll()
>               virtblk_poll()
>                   ...
>                   if (req_done)
>                                    blk_mq_start_stopped_hw_queues(vblk->d=
isk->queue, true);
>                   ...
>=20
>     - patch2 : virtio_queue_rqs
>         - Modify virtio_queue_rqs() to hold lock only once when it adds
>           requests to virtqueue just before virtqueue notify.
>           It will guarantee that virtio_queue_rqs() will not use
>           previous req again.
>=20
> v2 -> v3
>         - Fix warning by kernel test robot
>          =20
>             static int virtblk_poll()
>                 ...
>                 if (!blk_mq_add_to_batch(req, iob, virtblk_result(vbr),
>                                                    -> vbr->status,
>=20
> v1 -> v2
>         - To receive the number of poll queues from user,
>           use module parameter instead of QEMU uapi change.
>=20
>         - Add the comment about virtblk_map_queues().
>=20
>         - Add support for mq_ops->queue_rqs() to implement submit side
>           batch.
>=20
> Suwan Kim (2):
>   virtio-blk: support polling I/O
>   virtio-blk: support mq_ops->queue_rqs()
>=20
>  drivers/block/virtio_blk.c | 229 +++++++++++++++++++++++++++++++++----
>  1 file changed, 206 insertions(+), 23 deletions(-)
>=20
> --=20
> 2.26.3
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--duw9For8MKB3MpZO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJMZF4ACgkQnKSrs4Gr
c8i6hAf+N/VscnNGTHOpKNdC0PJ0FCSLodNbzbpfUMG2U/IyadhdM7//6OXbW0Gd
f5/eRhIT+P9HX63cKWHQo9ELzwTNtS27WLNzQPA7yheURdZc17PISLI3aCYq+aXR
jyyYPlJdHv63pJDfsC1uQU5zlOUkM6kTN/NZoJ7n0tWqwq8g4C4Q4SMjT0knSBBW
/qqRkMeRrvhgp0mT31k5Citg7gcSAJeHq5ehrfOJ+RybIObu02bwfj1t1XUP0Swo
lIgwNL6WRDwa9jYdYOCIPp4gJqQgHE9NqTj3w+XeESOXTXZOlOYbANlmSKxwJFw+
L1nyo3OWyA1qAXLC2htD3IUo0wl/Zg==
=6bi6
-----END PGP SIGNATURE-----

--duw9For8MKB3MpZO--


--===============5283175422227007510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5283175422227007510==--

