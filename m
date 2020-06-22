Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399D203416
	for <lists.virtualization@lfdr.de>; Mon, 22 Jun 2020 11:57:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2BD11891AC;
	Mon, 22 Jun 2020 09:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9acWawyN92IS; Mon, 22 Jun 2020 09:57:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 96F22891C1;
	Mon, 22 Jun 2020 09:57:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7970CC016F;
	Mon, 22 Jun 2020 09:57:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDB5EC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9F4E921FA9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYLo2Mwek1x7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:57:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id BBBC1204B8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592819820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J3J1GK/1v24r8R8vBSVjEP1Qqwlwwoh+PJYXVdhCI1A=;
 b=DVfXdNwvGzQIzg5+pJ+ioYTccFwIIRcZexHvR1mdhcQWTVhIp4rGEz6LmsSH31RkDu+pFP
 8B/O/FTUPSApD+aiH8odg/TR+aS6hD+oUVyqg+zDL0IxFoB0STFmo0WuJ9/uKhyDKXcBhI
 nxefC62h1u/Pec8u7cMUhkyDkQI+kvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-mFwUshu-OC2Ov1O5wyre8w-1; Mon, 22 Jun 2020 05:56:56 -0400
X-MC-Unique: mFwUshu-OC2Ov1O5wyre8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C871464;
 Mon, 22 Jun 2020 09:56:54 +0000 (UTC)
Received: from localhost (ovpn-115-184.ams2.redhat.com [10.36.115.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1987F7C1FD;
 Mon, 22 Jun 2020 09:56:50 +0000 (UTC)
Date: Mon, 22 Jun 2020 10:56:49 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Wang Qing <wangqing@vivo.com>
Subject: Re: [PATCH V2] drivers/block: Use kobj_to_dev() API
Message-ID: <20200622095649.GA6675@stefanha-x1.localdomain>
References: <1592618024-28990-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
In-Reply-To: <1592618024-28990-1-git-send-email-wangqing@vivo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Content-Type: multipart/mixed; boundary="===============0763075395374165669=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============0763075395374165669==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2020 at 09:53:43AM +0800, Wang Qing wrote:
> Use kobj_to_dev() API instead of container_of().
>=20
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/block/virtio_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7wgGEACgkQnKSrs4Gr
c8jiqwf+NDwvJrqVQacgMbfslm7ctFkXeq127ECemWo6fBJHJ0v01REWrK2Uw9U+
envftxXJjZBtRea5aPUC2NBHfyVQoBuM3q5F2vbmSOOtOv+BHq0oDp16mUqsUD7k
Jg//Y4VKXMFykxC2cHsq1AkyJxUvvU1eLyjs0T6AtbtW7rFysXeT95p7n0bd72ah
G9yxU3htdGZUWygJKbCPYZXM/4uCfZpuiMq0GFdyBNH27aP/XvuD/pRJ4ag5Q9JZ
wq5JtUbs7EqdAGQokCfY0/tk6emgN0MW7GPClOUA0kBcCUoOZivS6/igsjk5FF22
UzBcDoKiDUf2nZhjEPcv1Wqqjkd5xw==
=PUEf
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--


--===============0763075395374165669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0763075395374165669==--

