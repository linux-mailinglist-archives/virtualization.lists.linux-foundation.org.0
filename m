Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB88E1E3C
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 16:33:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 310B6ACC;
	Wed, 23 Oct 2019 14:33:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 92C75255
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 14:33:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 0074F831
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 14:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571841188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=WspxuSJb6do4aql0hVCXNdvv2fcuucGIVT4sybM8WcI=;
	b=eLj1uog1kPgbQigoyvJsET9ZmqccC+GmCI+zJaPJSS7ENiwANJb4TIaSFIuoS2eGFQKqDS
	lmGL2Hs6PVWiDtGZblZU4t9M1c5n6a+9z8eo8AHsDNdLxDC8sN+ytUnpmweEfxDbRiduCU
	fKmXU4Bpur9uggTEiT4Kc3wRhxX4mXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-217-VGJTPuWKPrW8OOCHpdup5w-1; Wed, 23 Oct 2019 10:33:05 -0400
X-MC-Unique: VGJTPuWKPrW8OOCHpdup5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 137EA5E6;
	Wed, 23 Oct 2019 14:33:03 +0000 (UTC)
Received: from localhost (unknown [10.36.118.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9ABA360166;
	Wed, 23 Oct 2019 14:33:02 +0000 (UTC)
Date: Wed, 23 Oct 2019 15:33:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH] virtiofs: Remove set but not used variable 'fc'
Message-ID: <20191023143301.GG9574@stefanha-x1.localdomain>
References: <1571796169-61061-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1571796169-61061-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-fsdevel@vger.kernel.org, mszeredi@redhat.com, vgoyal@redhat.com,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0603743247367033290=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

--===============0603743247367033290==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3xoW37o/FfUZJwQG"
Content-Disposition: inline

--3xoW37o/FfUZJwQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2019 at 10:02:49AM +0800, zhengbin wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> fs/fuse/virtio_fs.c: In function virtio_fs_wake_pending_and_unlock:
> fs/fuse/virtio_fs.c:983:20: warning: variable fc set but not used [-Wunus=
ed-but-set-variable]
>=20
> It is not used since commit 7ee1e2e631db ("virtiofs:
> No need to check fpq->connected state")
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  fs/fuse/virtio_fs.c | 2 --
>  1 file changed, 2 deletions(-)

Only affects the linux-next tree, not virtio-fs-dev or linux.git/master.
Same as "[PATCH -next] virtiofs: remove unused variable 'fc'"
(<20191023062130.23068-1-yuehaibing@huawei.com>).

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--3xoW37o/FfUZJwQG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2wZJ0ACgkQnKSrs4Gr
c8jhWggAplRLEXTbMxEBBB5hAMuW2PcDsqSSuI5e+v70h1j8C/mzw4Z/QC3H/WQm
0IVc8kYWZQekjSx3t8oFsLOmiRLJ64wDG5ZimbbMt0GqE/IOkadGGEd45tGZIXMm
YHlvjfEROOsT5W+G0oGwnAfqEqgUiQ2dNvpYpvJqYGF1tSGyjqunT4uyFrywtG9W
2fPGZkaZTAJTOl5p2dm31bep4QUc5NmsovkfB8wCXk9PcunV9OlGrzJTZoWMKvJE
NeHQSl3L83M2TmdrU3r+1lu7ns9lyxkPa55V8JP77mtwbCARgzdwmhpih2vjRvIa
laHxW2WsAK11RTb3twS9EJhqWSDGAw==
=RixM
-----END PGP SIGNATURE-----

--3xoW37o/FfUZJwQG--


--===============0603743247367033290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0603743247367033290==--

