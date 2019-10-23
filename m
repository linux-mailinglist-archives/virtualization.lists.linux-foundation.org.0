Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB60E1E34
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 16:31:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C6433AD7;
	Wed, 23 Oct 2019 14:31:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1A4C741C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 14:31:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C396214D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 14:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571841076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=NEpRmfIMlgMtQvCpBiyWHq35i58wkyDE9q0HwuYCkJw=;
	b=CX/jp55mqpirCnAlRHeknPBaUoJlkJ08YBNHwsTWiUT9WnYGltC9bQaY+4+riRU5TLIpCf
	94bHPCIgfjz372J82STllw/MHwm2SEKN7xYITwffCYuDf5bo7ASnFoyBcgvAWukUkcvpcy
	m/Hkwtoive+WvNmzbdlsqenJhgkdL2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-289-9MNdKUhlPuOEt5UBzneH8A-1; Wed, 23 Oct 2019 10:31:15 -0400
X-MC-Unique: 9MNdKUhlPuOEt5UBzneH8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE8EC800D49;
	Wed, 23 Oct 2019 14:31:13 +0000 (UTC)
Received: from localhost (unknown [10.36.118.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73E735DD61;
	Wed, 23 Oct 2019 14:31:13 +0000 (UTC)
Date: Wed, 23 Oct 2019 15:31:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] virtiofs: remove unused variable 'fc'
Message-ID: <20191023143112.GF9574@stefanha-x1.localdomain>
References: <20191023062130.23068-1-yuehaibing@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20191023062130.23068-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mszeredi@redhat.com, miklos@szeredi.hu, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-fsdevel@vger.kernel.org, vgoyal@redhat.com
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
Content-Type: multipart/mixed; boundary="===============7469274430740727956=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

--===============7469274430740727956==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3oCie2+XPXTnK5a5"
Content-Disposition: inline

--3oCie2+XPXTnK5a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2019 at 02:21:30PM +0800, YueHaibing wrote:
> fs/fuse/virtio_fs.c:983:20: warning:
>  variable fc set but not used [-Wunused-but-set-variable]
>=20
> It is not used since commit 7ee1e2e631db ("virtiofs:
> No need to check fpq->connected state")
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/fuse/virtio_fs.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--3oCie2+XPXTnK5a5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2wZDAACgkQnKSrs4Gr
c8ia7Af+MQeFLTLG0CFTE1qP7CUS9Bb7d/kyzFLEOhRKzGeQ/X5WF82X/8onbeeS
vWxhG9VDk5YfFMxJs/kCUsOdHyqzSqfU1neF08K+wgu2RsL9LwSvppC+RM68SbUV
+2fh6BaNdKNNtfxRi8Dbw+2xqKLnqlLyhBVCqc7jIAshVMwTeV8GiDAv5WMNWEhQ
8tXKiepCviHSBWHHE0hFQaczmLQQobtgxvJOE6Ooy0Cvd8daN5f3PiCIqpUfRPTx
4ojBtmkZN3Cdc9qHM9cQmqZ/AwdtTuCeTuqd5E096I4Zqm0oq+ZiCBmlt/BSKK+t
sPTRv0L6bdGD6UztBumMJcHOyGplaA==
=Ygrg
-----END PGP SIGNATURE-----

--3oCie2+XPXTnK5a5--


--===============7469274430740727956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7469274430740727956==--

