Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A79C3FEEF1
	for <lists.virtualization@lfdr.de>; Thu,  2 Sep 2021 15:47:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0146842536;
	Thu,  2 Sep 2021 13:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXQGHRGPXhmC; Thu,  2 Sep 2021 13:47:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CBFFC425AA;
	Thu,  2 Sep 2021 13:47:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D0C2C001F;
	Thu,  2 Sep 2021 13:47:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8C06C000E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Sep 2021 13:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0E5D614E6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Sep 2021 13:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XO-lFe9wkSfR
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Sep 2021 13:47:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C96A6606CB
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Sep 2021 13:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630590427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fNCtS0KdZQb1B+CbwtzJg7He2oOCTmFUj9S0sz1v7Nk=;
 b=NwpLSHoYW0fws6n99zjcyzqJu+Foj46up5n6lcEKPQXB/sOjnzRUscRZ5M0hbCH+KZYu8M
 atvRrOESDRQUXM8HeeAZnjMVQHwXX/zg2E879Sw2C4zQ+X4sJ5f1BG5PXEkXNDbePlW5BW
 T1RdF1eaCisX29MuAdRpcAr/zAnxrXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-Jr-IF8qhOO2RLTAWFXNFiw-1; Thu, 02 Sep 2021 09:45:58 -0400
X-MC-Unique: Jr-IF8qhOO2RLTAWFXNFiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AB2F8145EE;
 Thu,  2 Sep 2021 13:45:56 +0000 (UTC)
Received: from localhost (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 480795C3DF;
 Thu,  2 Sep 2021 13:45:53 +0000 (UTC)
Date: Thu, 2 Sep 2021 14:45:52 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH v2 1/1] virtio-blk: add num_io_queues module parameter
Message-ID: <YTDVkDIr5WLdlRsK@stefanha-x1.localdomain>
References: <20210831135035.6443-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210831135035.6443-1-mgurtovoy@nvidia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Content-Type: multipart/mixed; boundary="===============3522817652727510118=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============3522817652727510118==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vesxpy2vj8JazjFf"
Content-Disposition: inline


--vesxpy2vj8JazjFf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 04:50:35PM +0300, Max Gurtovoy wrote:
> Sometimes a user would like to control the amount of IO queues to be
> created for a block device. For example, for limiting the memory
> footprint of virtio-blk devices.
>=20
> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> ---
>=20
> changes from v1:
>  - use param_set_uint_minmax (from Christoph)
>  - added "Should > 0" to module description
>=20
> Note: This commit apply on top of Jens's branch for-5.15/drivers
> ---
>  drivers/block/virtio_blk.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 4b49df2dfd23..9332fc4e9b31 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -24,6 +24,22 @@
>  /* The maximum number of sg elements that fit into a virtqueue */
>  #define VIRTIO_BLK_MAX_SG_ELEMS 32768
> =20
> +static int virtblk_queue_count_set(const char *val,
> +		const struct kernel_param *kp)
> +{
> +	return param_set_uint_minmax(val, kp, 1, nr_cpu_ids);
> +}
> +
> +static const struct kernel_param_ops queue_count_ops =3D {
> +	.set =3D virtblk_queue_count_set,
> +	.get =3D param_get_uint,
> +};
> +
> +static unsigned int num_io_queues;
> +module_param_cb(num_io_queues, &queue_count_ops, &num_io_queues, 0644);
> +MODULE_PARM_DESC(num_io_queues,
> +		 "Number of IO virt queues to use for blk device. Should > 0");
> +
>  static int major;
>  static DEFINE_IDA(vd_index_ida);
> =20
> @@ -501,7 +517,9 @@ static int init_vq(struct virtio_blk *vblk)
>  	if (err)
>  		num_vqs =3D 1;
> =20
> -	num_vqs =3D min_t(unsigned int, nr_cpu_ids, num_vqs);
> +	num_vqs =3D min_t(unsigned int,
> +			min_not_zero(num_io_queues, nr_cpu_ids),
> +			num_vqs);

If you respin, please consider calling them request queues. That's the
terminology from the VIRTIO spec and it's nice to keep it consistent.
But the purpose of num_io_queues is clear, so:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--vesxpy2vj8JazjFf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEw1ZAACgkQnKSrs4Gr
c8ilgwgAlIOafEmW7i5SZAO2+Ms/0rz8GU5rO5BZfriDJF+tb2PTi80awwHdmw1K
L9criCNflNxb/LT6eBcdW/2xczmSQkeHLUTyA5xEvsmb940rIoSgNjrEEEajvTk8
nUS0BNUezEciYxAWaxIZcDn+0ev/WZyZKJxuokLVmJNd1aPUKg+pN694/paIKdY8
kGnIrBByZK+4ihd9VRb1zY44EVSAdPGsW3F/ko7lklIRlbEO/TKX00dEgfpscWy9
SnSaCPLvqON7/s9GZDOFetH8sCCnewa1fhAMmHWvM4jYufwJCxzE6eEDZssTAZgK
Ytb0LAQrUDnz5vMNUPRiZMH+4mqwIw==
=aE7d
-----END PGP SIGNATURE-----

--vesxpy2vj8JazjFf--


--===============3522817652727510118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3522817652727510118==--

