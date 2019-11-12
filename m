Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 19540F8CE3
	for <lists.virtualization@lfdr.de>; Tue, 12 Nov 2019 11:34:29 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1326B15C9;
	Tue, 12 Nov 2019 10:34:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F03E715C4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 10:34:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 827FB4C3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 10:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573554840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=xuxahvL3kg1EGPXS8GSuqJmgg7QGAaS4yIWjCAFx7Cc=;
	b=gGWk/HOLVrIG7mGhg531uECVr1GYBsiEj2eJCj9pmLcxynOx2GR5x4xIb+Q7muzxXJSOng
	5z/OCfRuRgnSA6Edfec4yJvFPU7/aBVXmcqUuTuptjaKKtcpMFg3HJOk2PsKzwwnC3OiFV
	Djiu2q6QIQgTw7qcEsFaPdequEsiqmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-8-Y2ODGrCqMRC1KMNK5d05Fw-1; Tue, 12 Nov 2019 05:33:57 -0500
X-MC-Unique: Y2ODGrCqMRC1KMNK5d05Fw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15D4F1005500;
	Tue, 12 Nov 2019 10:33:56 +0000 (UTC)
Received: from localhost (ovpn-116-203.ams2.redhat.com [10.36.116.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7512F171F9;
	Tue, 12 Nov 2019 10:33:55 +0000 (UTC)
Date: Tue, 12 Nov 2019 10:33:54 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] virtiofs: Fix old-style declaration
Message-ID: <20191112103354.GF463128@stefanha-x1.localdomain>
References: <20191111122359.43624-1-yuehaibing@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20191111122359.43624-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Content-Type: multipart/mixed; boundary="===============2915682224872862672=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

--===============2915682224872862672==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Content-Disposition: inline

--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2019 at 08:23:59PM +0800, YueHaibing wrote:
> There expect the 'static' keyword to come first in a
> declaration, and we get warnings like this with "make W=3D1":
>=20
> fs/fuse/virtio_fs.c:687:1: warning: 'static' is not at beginning of decla=
ration [-Wold-style-declaration]
> fs/fuse/virtio_fs.c:692:1: warning: 'static' is not at beginning of decla=
ration [-Wold-style-declaration]
> fs/fuse/virtio_fs.c:1029:1: warning: 'static' is not at beginning of decl=
aration [-Wold-style-declaration]
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/fuse/virtio_fs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3KipIACgkQnKSrs4Gr
c8gdJwf+PUqmtiGDYcD4HiwZZWATLMxXmETqzmnRsTSpcZmilmmFYmNPT9MNuj7D
oPRTSg2Buso6+GYt3HILA0QBHzltRPFpGHFKGFo87AMHUs8Hya8Kn/Ixtlzd2yzk
uetQbToOHQ1BXjNmm8AVmXImi8hr6HVpNGfY08rcbiiw8f5pZeKEiXwLtWc/09Kl
pkOLTnMrheeXEWt8eVMTUfGaUeEeylz3XRUdObm9Oq5hbN1DbERRV3WbNI55a96q
n+X86cFuZP2dvI82+tS5bYl+DcGYkKWrM+kAKJWiwBO9vWTN/5M9UiJmdigSIFux
i47j9PEBMtc87VtbuU9ytoi8EF51MA==
=WtV3
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--


--===============2915682224872862672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2915682224872862672==--

