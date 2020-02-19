Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C9984164D27
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 18:58:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 15B92864FB;
	Wed, 19 Feb 2020 17:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vVMtHPrZwhsV; Wed, 19 Feb 2020 17:58:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3FF0286614;
	Wed, 19 Feb 2020 17:58:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1AFD8C1D89;
	Wed, 19 Feb 2020 17:58:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C1CDC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 17:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 04FED847BE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 17:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sdWdrkNNRLSO
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 17:58:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 30BC084363
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 17:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582135088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=osE6Os536TzWa3Iu36fjeW3PyeJPL+4fg4AlWyJ2Fe8=;
 b=XBUQ/m1uoQ5nXNJxATugkDg+WKM9xhbX38GbeEmWwOR1FCvF7mNjisV86dNZ1VbaUlpaEd
 F7LO782kxG8FX1vDRlPBpLCmGisLPB6LcRPxYRr+M5FQ1rxkhXbw7nNXW8I85zkoHhf2k9
 pXcsQJbvaFt+XS8gORPRMA0JULS0cMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-Bt2leHTQP2q-fUD22d082g-1; Wed, 19 Feb 2020 12:57:59 -0500
X-MC-Unique: Bt2leHTQP2q-fUD22d082g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1470D100550E;
 Wed, 19 Feb 2020 17:57:57 +0000 (UTC)
Received: from localhost (unknown [10.36.118.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE60648;
 Wed, 19 Feb 2020 17:57:53 +0000 (UTC)
Date: Wed, 19 Feb 2020 15:11:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 0/2] virtio-blk: improve handling of DMA mapping failures
Message-ID: <20200219151134.GI1078625@stefanha-x1.localdomain>
References: <20200213123728.61216-1-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20200213123728.61216-1-pasic@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, Viktor Mihajlovski <mihajlov@linux.ibm.com>
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
Content-Type: multipart/mixed; boundary="===============7714109132051819987=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============7714109132051819987==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zqjkMoGlbUJ91oFe"
Content-Disposition: inline

--zqjkMoGlbUJ91oFe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 01:37:26PM +0100, Halil Pasic wrote:
> Two patches are handling new edge cases introduced by doing DMA mappings
> (which can fail) in virtio core.
>=20
> I stumbled upon this while stress testing I/O for Protected Virtual
> Machines. I deliberately chose a tiny swiotlb size and have generated
> load with fio. With more than one virtio-blk disk in use I experienced
> hangs.
>=20
> The goal of this series is to fix those hangs.
>=20
> Halil Pasic (2):
>   virtio-blk: fix hw_queue stopped on arbitrary error
>   virtio-blk: improve virtqueue error to BLK_STS
>=20
>  drivers/block/virtio_blk.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
>=20
> base-commit: 39bed42de2e7d74686a2d5a45638d6a5d7e7d473
> --=20
> 2.17.1
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zqjkMoGlbUJ91oFe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5NUCYACgkQnKSrs4Gr
c8j5Pgf+MI41fd9a93cz9zlmiW7E/b+B99Zg/shlPYBcQXo0INymDnvknnpzLpqK
uHn5ZGq85kM6+ls29Zhh4w7bxiJlBBNRzCkIIRxe5CwyOptQPcKHONreD1suCGT0
boXaZtrbU1Wt1bWRBK4F9OLZcyIFxUESQ36b1r1VddZsKeFETUXAwjpSEU9bVCZ6
qJfDp9RLYVvFISB17avVnsqyw8xO9mVI3RyIdzQATERL9W3DVxaacULruMmlBHvq
T3nt4WcQjbTHEmTjvpnwGg2Oz4uvaRGm617bv082XAOP+Xr0h9uNU119WKCYk1Qk
VML23VMN5owhMcib+gUXV3/9bQQkYQ==
=GsRc
-----END PGP SIGNATURE-----

--zqjkMoGlbUJ91oFe--


--===============7714109132051819987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7714109132051819987==--

