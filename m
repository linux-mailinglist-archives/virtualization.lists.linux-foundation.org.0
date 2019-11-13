Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 14785FB2B6
	for <lists.virtualization@lfdr.de>; Wed, 13 Nov 2019 15:40:35 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D7FFDDDF;
	Wed, 13 Nov 2019 14:40:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 23B5CBA9
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 14:40:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 662598A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573656025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=zjCOT9P28nv8a4MBtngrDC5z35NTofmz5vBBPAPm6Zg=;
	b=KCaNTeJJ7EnV8WBhfdoOoVziF3CooBjNsHLP02y8u0Jwgzi2xf9yYpm0ZYVMcthgvw9tzu
	icD8NK6VSaM+VuUV2dYWLvoIMi2n/8NLMn5Plih5mUkDbc8C20VI9zRuRRqnOSYdl3ZWO8
	PLbp6zG+rdJKSfadTxyYAQ3NdDGpWzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-66-wZGniYHCNaWWRKsaHL3NSw-1; Wed, 13 Nov 2019 09:40:21 -0500
X-MC-Unique: wZGniYHCNaWWRKsaHL3NSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B61BD1804973;
	Wed, 13 Nov 2019 14:40:20 +0000 (UTC)
Received: from localhost (ovpn-117-166.ams2.redhat.com [10.36.117.166])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A6CD6106C;
	Wed, 13 Nov 2019 14:40:20 +0000 (UTC)
Date: Wed, 13 Nov 2019 14:40:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 0/3] virtiofs: Small Cleanups for 5.5
Message-ID: <20191113144018.GC554680@stefanha-x1.localdomain>
References: <20191030150719.29048-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191030150719.29048-1-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: miklos@szeredi.hu, linux-kernel@vger.kernel.org, dgilbert@redhat.com,
	virtio-fs@redhat.com, linux-fsdevel@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============8759589861265519034=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

--===============8759589861265519034==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline

--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 11:07:16AM -0400, Vivek Goyal wrote:
> Hi Miklos,
>=20
> Here are few small cleanups for virtiofs for 5.5. I had received some
> comments from Michael Tsirkin on original virtiofs patches and these
> cleanups are result of these comments.
>=20
> Thanks
> Vivek
>=20
> Vivek Goyal (3):
>   virtiofs: Use a common function to send forget
>   virtiofs: Do not send forget request "struct list_head" element
>   virtiofs: Use completions while waiting for queue to be drained
>=20
>  fs/fuse/virtio_fs.c | 204 ++++++++++++++++++++++----------------------
>  1 file changed, 103 insertions(+), 101 deletions(-)
>=20
> --=20
> 2.20.1
>=20

There are typos in the commit descriptions but the code looks fine:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3MFdIACgkQnKSrs4Gr
c8gz9gf8C1ie4Xi0WRMLEPRPpIjZue0W+WRJNTMJheJ+0d2dyTylZl1EOFrRI9Mz
tlQtH/MUeJ999e1bX14gngArSdq5yrBMmk2OVngHa9CoPJlJ7CAT8R0uJFa0ca1X
6QWdtDLTlcyKJGGl75bFqwT32R/iReCoQuzXRdO0h/tKPykm6NDDFhJJPtDeO4GM
F+4C+1faPh0nMUp7lSGwIAJ4pgKYGc3URDSJpHj8X0mouYDBnoHtVErX6dMnxyw2
jKGthgQDd2Ynx7NYecWmD+qfSMiBa7JUWgFpAreyVxnzONAKKUqAxmVShzdRdNm8
zBAVkR0zFJEJljlOj9jfknJxGlecIg==
=traL
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--


--===============8759589861265519034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8759589861265519034==--

