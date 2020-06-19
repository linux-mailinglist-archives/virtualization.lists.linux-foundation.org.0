Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B49BC2008FE
	for <lists.virtualization@lfdr.de>; Fri, 19 Jun 2020 14:49:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6396087B4E;
	Fri, 19 Jun 2020 12:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nqNFgFzP45CV; Fri, 19 Jun 2020 12:49:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB52A87B48;
	Fri, 19 Jun 2020 12:49:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE1F5C016E;
	Fri, 19 Jun 2020 12:49:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C95AFC016E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 12:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A0BC62038A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 12:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZkqL9Qs7eMs
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 12:49:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 9153B20382
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 12:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592570988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IGO+CJBEnWQc9Ot84SOMePVBK9U6K5jZVae2LE+FwxE=;
 b=HPVgU561i+TBXvW+b45txCrDKwkyiHBxlkZLl96BPqI5yoe4WaB628sKM9b0MtQ2AouWY/
 ImDW5BSay1SaGtj0U/s1TPPvGOAfba0sOPx/Uw6kto7QMjMhGiDKPTj7qvi9UBzk6TyTnR
 1YdFlxo8upDaddd/Xzl24BxGen+zcMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-qs7lwy3qMVevVZcbLW21uQ-1; Fri, 19 Jun 2020 08:49:44 -0400
X-MC-Unique: qs7lwy3qMVevVZcbLW21uQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 579BD801A03;
 Fri, 19 Jun 2020 12:49:43 +0000 (UTC)
Received: from localhost (ovpn-113-212.ams2.redhat.com [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93F345C1D0;
 Fri, 19 Jun 2020 12:49:39 +0000 (UTC)
Date: Fri, 19 Jun 2020 13:49:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Wang Qing <wangqing@vivo.com>
Subject: Re: [PATCH] drivers\block: Use kobj_to_dev() API
Message-ID: <20200619124938.GA2424182@stefanha-x1.localdomain>
References: <1591945856-14749-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
In-Reply-To: <1591945856-14749-1-git-send-email-wangqing@vivo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============6003003601213530443=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============6003003601213530443==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 03:10:56PM +0800, Wang Qing wrote:
> Use kobj_to_dev() API instead of container_of().
>=20
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/block/virtio_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  mode change 100644 =3D> 100755 drivers/block/virtio_blk.c

Please fix the '\' -> '/' in the commit message. Looks good otherwise:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7stGIACgkQnKSrs4Gr
c8iKlgf/f+yvjTB2iqqDHAxkMDvnIu83CmaNspZ6bGF/0hEaFtWKGCIiJ+uyD2ow
HeS/6wRfIYMFpEcrwpEPWssIh/+US/957FmjIVeUU8b7jIER7VHH1BcAZq8DDKe3
yIxlUtJPOFRUz8GyddfoWDycsSL5SCGjP8eRTJkIy93yBlw308K8h/Y0keIN3ToJ
QYnuq143Mm0XmVk7RgkIMIM6iiDgxrU+qU5wIRg4f5UVzGWFAHIugGHEN+BMEUfv
hXpS0Akw5CkVFSTkOewu15i52Hp4TDRyQn+A0DldsPdjnjebGaygbRH5In8NzqX/
AACpzHtUyBhoDiAf2Ml3OAh86QIIEA==
=eGvO
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--


--===============6003003601213530443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6003003601213530443==--

