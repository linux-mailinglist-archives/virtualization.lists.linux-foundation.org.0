Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 741662B5D8A
	for <lists.virtualization@lfdr.de>; Tue, 17 Nov 2020 11:57:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D0FC3870BF;
	Tue, 17 Nov 2020 10:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tpD4Es7nk2iT; Tue, 17 Nov 2020 10:57:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 59104870AD;
	Tue, 17 Nov 2020 10:57:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3277DC07FF;
	Tue, 17 Nov 2020 10:57:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7654AC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 10:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6834D86681
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 10:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yfx8HkGRhlLx
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 10:57:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 00C3181F4D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605610640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sef5YC7ElT0CPIu8Xi0KQIpgG9At4z3nHnONcWlaT6I=;
 b=F0hCVH2MLUUb7jvVac0pjhCs6OWNDitFu0C+L4yHNtpBHUH17kyJj17fuTFB3Hf7lj9WwS
 yRfEAZwASEYuXVIh4cMzUPXoNqBwy5GoMFsBbzlyvjCZ1DC4FePfVO2HlnRJ46rq2qWUwF
 nuDyaquPXHECVZ5oBq34crcEpUhDNDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-CLA16zfPMwG3lzZ5nu0hvg-1; Tue, 17 Nov 2020 05:57:15 -0500
X-MC-Unique: CLA16zfPMwG3lzZ5nu0hvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A255B8030BD;
 Tue, 17 Nov 2020 10:57:14 +0000 (UTC)
Received: from localhost (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16B645B4AA;
 Tue, 17 Nov 2020 10:57:10 +0000 (UTC)
Date: Tue, 17 Nov 2020 10:57:09 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH RFC 01/12] vhost-vdpa: add support for vDPA blk devices
Message-ID: <20201117105709.GC131917@stefanha-x1.localdomain>
References: <20201113134712.69744-1-sgarzare@redhat.com>
 <20201113134712.69744-2-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113134712.69744-2-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Eli Cohen <elic@nvidia.com>
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
Content-Type: multipart/mixed; boundary="===============0464619832265854397=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============0464619832265854397==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Content-Disposition: inline

--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2020 at 02:47:01PM +0100, Stefano Garzarella wrote:
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 2754f3069738..fb0411594963 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -22,6 +22,7 @@
>  #include <linux/nospec.h>
>  #include <linux/vhost.h>
>  #include <linux/virtio_net.h>
> +#include <linux/virtio_blk.h>
> =20
>  #include "vhost.h"
> =20
> @@ -194,6 +195,9 @@ static int vhost_vdpa_config_validate(struct vhost_vd=
pa *v,
>  =09case VIRTIO_ID_NET:
>  =09=09size =3D sizeof(struct virtio_net_config);
>  =09=09break;
> +=09case VIRTIO_ID_BLOCK:
> +=09=09size =3D sizeof(struct virtio_blk_config);
> +=09=09break;
>  =09}
> =20
>  =09if (c->len =3D=3D 0)

Can vdpa_config_ops->get/set_config() handle the size check instead of
hardcoding device-specific knowledge into drivers/vhost/vdpa.c?

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+zrIUACgkQnKSrs4Gr
c8gvowf/Wpwi/uMVifoS0NwyRCe5/CVH7tVJdmGYKpQ0EOCpn9vsgvZ+nD+xnnf5
6X8eiwurchLDat2lMMlWEupsa4ThfFqlLeRIvoGzlIhyc0bJfS3BfhAF+K/dFYhb
UtOzecblfCtEbcTb2wNicHsz3M1wdxW8T04y0vD8vxQRJN3SFvUqa6fxToU9Z4ji
np403zzsVijvNfZf1c204D5oUBr9OR8TXJldXrGPXdp0yTglBi6ZLeicuCiN6Mr5
RHES2SztSo5XrXAoIgI/JZsKgFWCCnYdpJxOt+WUuJVH5PyxhX+57fDLQxZiOXF0
7TVh+myYaXRw0joEJZuSu/zKU0uGzQ==
=Mbol
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--


--===============0464619832265854397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0464619832265854397==--

