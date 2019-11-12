Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B3324F8CDF
	for <lists.virtualization@lfdr.de>; Tue, 12 Nov 2019 11:33:47 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 068E315B6;
	Tue, 12 Nov 2019 10:33:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EAAA2104E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 10:33:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 64F27DF
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573554818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=UbdqnUvJyxjVktur7YbB/k1R6NmF4aLu8y6RDMWAoTY=;
	b=ZGAFxAjagrR0WFnuRgMlazrw0lrVUCfQRFu4iCk370iWk4zNAQBr+r4RIH16mOQMN9tQLG
	chMrjZXwkU+Gc7iKffIkGUjv2OfuYj+w2ZbCR0t2NP15EpAt+6oDmye/I0u/2Q/iJ9BZbJ
	xhbwBQQg+7rvg4Cpb5J9LVMwrOoawkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-358-gzBh0wV8OMqbISFucOXYSA-1; Tue, 12 Nov 2019 05:33:35 -0500
X-MC-Unique: gzBh0wV8OMqbISFucOXYSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C77E4DB62;
	Tue, 12 Nov 2019 10:33:33 +0000 (UTC)
Received: from localhost (ovpn-116-203.ams2.redhat.com [10.36.116.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BE7A9F5C;
	Tue, 12 Nov 2019 10:33:32 +0000 (UTC)
Date: Tue, 12 Nov 2019 10:33:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH v2] virtiofs: Use static const, not const static
Message-ID: <20191112103331.GE463128@stefanha-x1.localdomain>
References: <1573474545-37037-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1573474545-37037-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Content-Type: multipart/mixed; boundary="===============2133633367245864343=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

--===============2133633367245864343==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6Vw0j8UKbyX0bfpA"
Content-Disposition: inline

--6Vw0j8UKbyX0bfpA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2019 at 08:15:45PM +0800, zhengbin wrote:
> Move the static keyword to the front of declarations, which resolves
> compiler warnings when building with "W=3D1":
>=20
> fs/fuse/virtio_fs.c:687:1: warning: =E2=80=98static=E2=80=99 is not at be=
ginning of declaration [-Wold-style-declaration]
>  const static struct virtio_device_id id_table[] =3D {
>  ^
> fs/fuse/virtio_fs.c:692:1: warning: =E2=80=98static=E2=80=99 is not at be=
ginning of declaration [-Wold-style-declaration]
>  const static unsigned int feature_table[] =3D {};
>  ^
> fs/fuse/virtio_fs.c:1029:1: warning: =E2=80=98static=E2=80=99 is not at b=
eginning of declaration [-Wold-style-declaration]
>  const static struct fuse_iqueue_ops virtio_fs_fiq_ops =3D {
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
> v1->v2: modify comment
>  fs/fuse/virtio_fs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--6Vw0j8UKbyX0bfpA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3KinsACgkQnKSrs4Gr
c8iVvAf+KcM0juc41tqI7xOrSt9zxcuq5KCxeQURRRWcUAPCKs2XgqNswQfg7yzx
ZDfiOV0zS9TJpfNDffpeZl9GiGMNHOZdsvOiJWMJIlydpZA5TrgWoRlrM+z/42iY
04Junb5gUk7sMeOPKU/HRHyMyoPUd2mbaxET+Zv2fPvWt3u2QTmW3R2puEHFiFo/
aG1ijnb2XYCWjolOS3wzDuhIhi4O+UMh9utzwYjlDV9GJH+7av4NBPS0DF5yUJfS
d062MA39xdIsNZdrliamIvrBV1QKpY7a+GaT7wAQvOcUbLf8YF6uNDyiRrVvj8K9
SRDgt9Kbr4GpQ8R6cJSnEIBe6mof+g==
=hbuN
-----END PGP SIGNATURE-----

--6Vw0j8UKbyX0bfpA--


--===============2133633367245864343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2133633367245864343==--

