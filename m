Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3950330C2C7
	for <lists.virtualization@lfdr.de>; Tue,  2 Feb 2021 15:59:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E0CB286F8F;
	Tue,  2 Feb 2021 14:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQqgJtoEoe5x; Tue,  2 Feb 2021 14:59:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8911086FBB;
	Tue,  2 Feb 2021 14:59:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5620FC013A;
	Tue,  2 Feb 2021 14:59:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78B1CC013A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 14:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 74D88860D5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 14:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lhe+cAjg9vrb
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 14:59:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 05D5C860BE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 14:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612277994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kKeX0URGSb9UCbr0adu7KmORKEcxZbdiukW8R2TM+Cc=;
 b=adQ0OODKNYd0aPENW6OnC3HivVCN58u8D1JvwYlpLX78hJKJqHk4SCSvuo/mLCoFUe0Ci2
 5x77W89Fw9be91bvDaDUIfLFsSeGpEQ6clT54xat7o/MZSFFow70Lm85OUo8/ahiqS13af
 5lI5/lqIuaCbkFpJIJZn8sPV2/ocSMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-nsEX7khMPdmLOTnwF69CDw-1; Tue, 02 Feb 2021 09:59:49 -0500
X-MC-Unique: nsEX7khMPdmLOTnwF69CDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38F00809DCC;
 Tue,  2 Feb 2021 14:59:48 +0000 (UTC)
Received: from localhost (ovpn-115-185.ams2.redhat.com [10.36.115.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA4535C1CF;
 Tue,  2 Feb 2021 14:59:44 +0000 (UTC)
Date: Tue, 2 Feb 2021 09:44:09 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH RFC v2 10/10] vdpa_sim_blk: handle VIRTIO_BLK_T_GET_ID
Message-ID: <20210202094409.GC243557@stefanha-x1.localdomain>
References: <20210128144127.113245-1-sgarzare@redhat.com>
 <20210128144127.113245-11-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210128144127.113245-11-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>
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
Content-Type: multipart/mixed; boundary="===============8670725052622744143=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============8670725052622744143==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline


--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 03:41:27PM +0100, Stefano Garzarella wrote:
> Handle VIRTIO_BLK_T_GET_ID request, always answering the
> "vdpa_blk_sim" string.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v2:
> - made 'vdpasim_blk_id' static [Jason]
> ---
>  drivers/vdpa/vdpa_sim/vdpa_sim_blk.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAZHukACgkQnKSrs4Gr
c8h6vwf6A8s+B0nRtzSJR6MXg9BA+xRNjCAn+XG2vIbw9UN3xOfy+bfM45Tnz58C
xdQzu+yQ6QJHdSaln3x1mXh8akmyIPNOCdPbCAarLIlART4VdlJyXL6PKUxKsVkr
gDxqCm+TFlZiFBx4ggoJcqnf394m9jQBVXHq4WBSS0CM+aETJaAD+4yKgT0Zl/C6
k0WXDgoZi+qWatdmTu8ReIPWsSNcWgx25ZCaW+wnXwE3lfrGLB2evVLlc7dVXRn8
Mf0BMYql/WQUD09a3G5XOlOSxeW28lXzeFhYnm4j8/yT+RSCrLmjkrxyIbz+mkf7
beNfB4Tg0kc3+Pw0DV1RNv6v+X9tKw==
=wZsq
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--


--===============8670725052622744143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8670725052622744143==--

