Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 02679508BE8
	for <lists.virtualization@lfdr.de>; Wed, 20 Apr 2022 17:16:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C67C40C10;
	Wed, 20 Apr 2022 15:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gs2Xa5cVHHVz; Wed, 20 Apr 2022 15:16:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1E5344021C;
	Wed, 20 Apr 2022 15:16:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FBCAC0088;
	Wed, 20 Apr 2022 15:16:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98EACC002C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Apr 2022 15:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7795884125
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Apr 2022 15:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fc4Av0E3Sfb1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Apr 2022 15:16:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7B7584118
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Apr 2022 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650467770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=itzFBDMP0hGzFySs3Fnp8lbrJT+//GSnkzTMfR5NeuI=;
 b=fVT+KKKNy1VKnNcV/HCQH5eDgOdn4WTu7D5kS3rrsQPpTxeaATsQpdA/1mORNkIszgkzUM
 ATNdyZhyLh4HIKY7zREE0aw/admBDnRqqUbmJ72j+pU5G4QXrHYA83AQhMRjp1exl2UO2U
 7HYdKPvhtvHbNMQfJo3ef4Tmwb3jUeo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-CZ_hl-QKMPqV1bm0-zi4Nw-1; Wed, 20 Apr 2022 11:16:06 -0400
X-MC-Unique: CZ_hl-QKMPqV1bm0-zi4Nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31244811E7A;
 Wed, 20 Apr 2022 15:16:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7EC0404D2D2;
 Wed, 20 Apr 2022 15:16:05 +0000 (UTC)
Date: Wed, 20 Apr 2022 17:16:03 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [PATCH 3/4] virtio-blk: avoid function call in the fast path
Message-ID: <YmAjs0O58TuGkJO8@stefanha-x1.localdomain>
References: <20220420041053.7927-1-kch@nvidia.com>
 <20220420041053.7927-4-kch@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20220420041053.7927-4-kch@nvidia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Cc: linux-block@vger.kernel.org, pbonzini@redhat.com,
 virtualization@lists.linux-foundation.org, mst@redhat.com
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
Content-Type: multipart/mixed; boundary="===============5607148400965556028=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============5607148400965556028==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ehArJuq3AQ8w9/S/"
Content-Disposition: inline


--ehArJuq3AQ8w9/S/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022 at 09:10:52PM -0700, Chaitanya Kulkarni wrote:
> We can avoid a function call virtblk_map_data() in the fast path if
> block layer request has no physical segments by moving the call
> blk_rq_nr_phys_segments() from virtblk_map_data() to virtio_queue_rq().
>=20
> Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
> ---
>  drivers/block/virtio_blk.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

virtblk_map_data() is a static function that is not called by anything
else in virtio_blk.c. The disassembly on my x86_64 machine shows it has
been inlined into virtio_queue_rq(). The compiler has already done what
this patch is trying to do (and more).

Can you share performance data or some more background on why this
code change is necessary?

>=20
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index d038800474c2..74c3a48cd1e5 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -178,9 +178,6 @@ static int virtblk_map_data(struct blk_mq_hw_ctx *hct=
x, struct request *req,
>  {
>  	int err;
> =20
> -	if (!blk_rq_nr_phys_segments(req))
> -		return 0;
> -
>  	vbr->sg_table.sgl =3D vbr->sg;
>  	err =3D sg_alloc_table_chained(&vbr->sg_table,
>  				     blk_rq_nr_phys_segments(req),
> @@ -303,7 +300,7 @@ static blk_status_t virtio_queue_rq(struct blk_mq_hw_=
ctx *hctx,
>  	struct request *req =3D bd->rq;
>  	struct virtblk_req *vbr =3D blk_mq_rq_to_pdu(req);
>  	unsigned long flags;
> -	int num;
> +	int num =3D 0;
>  	int qid =3D hctx->queue_num;
>  	bool notify =3D false;
>  	blk_status_t status;
> @@ -315,10 +312,12 @@ static blk_status_t virtio_queue_rq(struct blk_mq_h=
w_ctx *hctx,
> =20
>  	blk_mq_start_request(req);
> =20
> -	num =3D virtblk_map_data(hctx, req, vbr);
> -	if (unlikely(num < 0)) {
> -		virtblk_cleanup_cmd(req);
> -		return BLK_STS_RESOURCE;
> +	if (blk_rq_nr_phys_segments(req)) {
> +		num =3D virtblk_map_data(hctx, req, vbr);
> +		if (unlikely(num < 0)) {
> +			virtblk_cleanup_cmd(req);
> +			return BLK_STS_RESOURCE;
> +		}
>  	}
> =20
>  	spin_lock_irqsave(&vblk->vqs[qid].lock, flags);
> --=20
> 2.29.0
>=20

--ehArJuq3AQ8w9/S/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJgI7MACgkQnKSrs4Gr
c8gdjQf/UbdMa6QNgetE5v1d8lqlqLm0rFmZtAb91AqCrnkcFgwVFztF55zgbdkU
XtA9kDAUJ2DJn8JeGPWFq1B2UgvoDg0bILJcHWi3c2Yvs+lTbNf8JF/3k4jpldCd
Pf2oaQXr2Cd6OucmoU0Y4asQBbWD6kPZ++ViZ1vs/RVA6VvdWgRHdIuBRfNYkL/O
d9+NUwhV6GX3bvsTc54iQ52QnOGaF0VAPwZtR6MmbYKTIVCsftsklWKFSRHaNiOH
Od+XcpkDe7iCKQ2JebqfZ73TnxM7xGQ9rfENTu1u5BkceUqFIRyAZHLko2oRMNzB
bEObI/fiGZo1hKLHBCmsmyITPxvfUw==
=rG7o
-----END PGP SIGNATURE-----

--ehArJuq3AQ8w9/S/--


--===============5607148400965556028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5607148400965556028==--

