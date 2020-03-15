Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 38535185BDC
	for <lists.virtualization@lfdr.de>; Sun, 15 Mar 2020 11:12:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 544E888334;
	Sun, 15 Mar 2020 10:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tsINOMr0nlp1; Sun, 15 Mar 2020 10:12:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8BC9C883C2;
	Sun, 15 Mar 2020 10:12:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B68DC013E;
	Sun, 15 Mar 2020 10:12:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D79D4C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 15 Mar 2020 10:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CD0C489099
 for <virtualization@lists.linux-foundation.org>;
 Sun, 15 Mar 2020 10:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRENeAh4DsS2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 15 Mar 2020 10:12:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1AB3A88568
 for <virtualization@lists.linux-foundation.org>;
 Sun, 15 Mar 2020 10:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584267146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8fYeknRcTWmnQg8ZYRz0ZJkyEQG95MNGzU7Kd6SLL+M=;
 b=ZEFV0OjbS8/G3s5wKNjn586CBurViMN+vYtN1cddOsyLLrHNvrBvfbrgWhx0whMWT4JaEp
 /SOisYgd+udsoSjDrDtDd+4hyLTIT2qQ551LDRgMN8+Ps0FCyuQ5PtO4cEmMp3pLp7UOUt
 SstaGIB3rmB/MTOKpJYfRMwebwQj9oA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-ojHza0DOPKSAkDn91LjYXg-1; Sun, 15 Mar 2020 06:12:21 -0400
X-MC-Unique: ojHza0DOPKSAkDn91LjYXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A3A91005512;
 Sun, 15 Mar 2020 10:12:18 +0000 (UTC)
Received: from localhost (ovpn-116-26.ams2.redhat.com [10.36.116.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1792A5C1B2;
 Sun, 15 Mar 2020 10:12:16 +0000 (UTC)
Date: Sun, 15 Mar 2020 10:12:15 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Wang Wenhu <wenhu.wang@vivo.com>
Subject: Re: [PATCH 0/2] doc: zh_CN: facilitate translation for filesystems
Message-ID: <20200315101215.GA325031@stefanha-x1.localdomain>
References: <20200315092810.87008-1-wenhu.wang@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20200315092810.87008-1-wenhu.wang@vivo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Miklos Szeredi <miklos@szeredi.hu>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 virtualization@lists.linux-foundation.org, kernel@vivo.com,
 Harry Wei <harryxiyou@gmail.com>, Eric Biggers <ebiggers@google.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Alex Shi <alex.shi@linux.alibaba.com>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 Vivek Goyal <vgoyal@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============3739069146261955507=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============3739069146261955507==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2020 at 02:27:58AM -0700, Wang Wenhu wrote:
> This patch series set up the basic facility for the translation work
> of the docs residing on filesystems into Chinese, indexing the filesystem=
s
> directory and adding one indexed translation into it. The virtiofs.rst
> added is not only a translation itself but also an simple example that
> future developers would take.
>=20
> The detailed diff info also shows the basic essential markups of
> the toctree and reStructuredText, at least for the most simple occasions.
> More translations of filesystems are on their way, and futher,
> of more subsystems.
>=20
> ---
> Wang Wenhu (2):
>   doc: zh_CN: index files in filesystems subdirectory
>   doc: zh_CN: add translation for virtiofs
>=20
>  Documentation/filesystems/index.rst           |  2 +
>  Documentation/filesystems/virtiofs.rst        |  2 +
>  .../translations/zh_CN/filesystems/index.rst  | 29 +++++++++
>  .../zh_CN/filesystems/virtiofs.rst            | 62 +++++++++++++++++++
>  Documentation/translations/zh_CN/index.rst    |  1 +
>  5 files changed, 96 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/filesystems/index.rs=
t
>  create mode 100644 Documentation/translations/zh_CN/filesystems/virtiofs=
.rst
>=20
> --=20
> 2.17.1
>=20

I am not a Chinese speaker but thank you for translation the
documentation!

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5t/38ACgkQnKSrs4Gr
c8i7pggAxFGK9yalFhtI40r+K7LMZVxPGH3zc20Ho6hCuGGbk0pnrVxuDOyAsgTo
w809N9Ypju11BY4lh8vzpA8wmi+mrjCI1I+/Md87gv+vIuur17n6v895rHas9rkh
VN6uRiHTxQR/zaDSaUM3yrR/KDCqHqe26T77B8//ope+JTqpWRNrhNccDtz5x/Kt
BVWkyKGmHwKK2LZm3OkHHYXhZx519RS6gBrxbzSySnBbwPbBWcY75et0o8c3FSJP
qh/pJ8keEtMEKVj/EGTZ2B9MN5d4nSi1yhxVizGHWkeDJ/yg6/l2kMKQ7MzAxPIP
iM5LDusm9auID4W1sU3363No0ZF+4Q==
=Sx9O
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--


--===============3739069146261955507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3739069146261955507==--

