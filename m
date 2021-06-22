Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C01AF3B0100
	for <lists.virtualization@lfdr.de>; Tue, 22 Jun 2021 12:11:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD2B340444;
	Tue, 22 Jun 2021 10:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZkBX9OYjwrw; Tue, 22 Jun 2021 10:11:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4B85A40311;
	Tue, 22 Jun 2021 10:11:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B04C0C000E;
	Tue, 22 Jun 2021 10:11:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CD4CC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Jun 2021 10:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 339826076B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Jun 2021 10:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2TSR9e4MuFXj
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Jun 2021 10:11:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8959B6072A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Jun 2021 10:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624356676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WS8d4KycsxMU7KBb2v46pT5Y072Xx9wFwYyCO/co8TM=;
 b=a1Sux0/FZPUnpq0aPTgWw23fgYTBg4pMDs1IjNoFQpgHpAKmnJ8AQ0ojMc7r/ywhCaat/3
 cA0QisMo/VPpm9VJAFkOcVjJ6WLo/Ak4CXudO7KMSZ0F3rZTo8opljEe2t7cjkyFWdvWs/
 BPKU6oJjNS3RZA6ym88dNqLgVuxq/7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-HE7C4kpjOUeqVEwQWzvwTg-1; Tue, 22 Jun 2021 06:11:12 -0400
X-MC-Unique: HE7C4kpjOUeqVEwQWzvwTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20E81802C89;
 Tue, 22 Jun 2021 10:11:11 +0000 (UTC)
Received: from localhost (ovpn-114-192.ams2.redhat.com [10.36.114.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7537D10023AB;
 Tue, 22 Jun 2021 10:11:07 +0000 (UTC)
Date: Tue, 22 Jun 2021 11:11:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH v3] virtio-blk: Add validation for block size in config
 space
Message-ID: <YNG3OvKm8XcAY/1I@stefanha-x1.localdomain>
References: <20210617051004.146-1-xieyongji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210617051004.146-1-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: axboe@kernel.dk, mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============4911037639304426612=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============4911037639304426612==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Uvqz3smAdALkpwOl"
Content-Disposition: inline


--Uvqz3smAdALkpwOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 01:10:04PM +0800, Xie Yongji wrote:
> This ensures that we will not use an invalid block size
> in config space (might come from an untrusted device).
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  drivers/block/virtio_blk.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index b9fa3ef5b57c..bbdae989f1ea 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -696,6 +696,28 @@ static const struct blk_mq_ops virtio_mq_ops =3D {
>  static unsigned int virtblk_queue_depth;
>  module_param_named(queue_depth, virtblk_queue_depth, uint, 0444);
> =20
> +static int virtblk_validate(struct virtio_device *vdev)
> +{
> +	u32 blk_size;
> +
> +	if (!vdev->config->get) {
> +		dev_err(&vdev->dev, "%s failure: config access disabled\n",
> +			__func__);
> +		return -EINVAL;
> +	}
> +
> +	if (!virtio_has_feature(vdev, VIRTIO_BLK_F_BLK_SIZE))
> +		return 0;
> +
> +	blk_size =3D virtio_cread32(vdev,
> +			offsetof(struct virtio_blk_config, blk_size));
> +
> +	if (blk_size < SECTOR_SIZE || blk_size > PAGE_SIZE)
> +		__virtio_clear_bit(vdev, VIRTIO_BLK_F_BLK_SIZE);
> +
> +	return 0;
> +}

I saw Michael asked for .validate() in v2. I would prefer to keep
everything in virtblk_probe() instead of adding .validate() because:

- There is a race condition that an untrusted device can exploit since
  virtblk_probe() fetches the value again.

- It's more complex now that .validate() takes a first shot at blk_size
  and then virtblk_probe() deals with it again later on.

--Uvqz3smAdALkpwOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDRtzoACgkQnKSrs4Gr
c8gDCgf+IRregxXJWDa8TNewE7DLn0qdSNPYmDbi6biBNsDw8vkFc//cSZdKUMk/
Au7OUwklOYgGRUJ/Us+16XOuVS2e6s49t8zFT4r9zndIPI2fp7Y3KlPgMgf0kUd8
9zCNBRUMC7x5aQ9FKpG5DjjN5/gZrywbk9/kPb8ms0/TfV3mrn7c/XBanUZDpAIS
PFshsLVABiM/H+E/UrGGqYlDx+dGQW3uQtZOyZuWNf+3+H4O/8cNNIVOlyslenQK
zxaIj/4GD4c3S2lKQHJ5/H3nF3gVpXPNrPsnWK1m+3bMoK0rhmj1hZwrapUJnwp7
chQ1KlEFWphmgF3zyZNI4aagJDxhcQ==
=KkQY
-----END PGP SIGNATURE-----

--Uvqz3smAdALkpwOl--


--===============4911037639304426612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4911037639304426612==--

