Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C2419056
	for <lists.virtualization@lfdr.de>; Mon, 27 Sep 2021 10:02:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87EE781AAD;
	Mon, 27 Sep 2021 08:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWQaId0HFIKD; Mon, 27 Sep 2021 08:02:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 22F4081A8E;
	Mon, 27 Sep 2021 08:02:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84721C001E;
	Mon, 27 Sep 2021 08:02:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C8EFC000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 08:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29DDA607C9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 08:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IjX9VPM9q2PL
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 08:02:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64EAC6075F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 08:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632729754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WYdrd60a/bnHP4r9+0eIKSKk9RqPVq0ho2CMR0yVDMk=;
 b=WhGdItLmVqLUdhY54ZfjY2bB9skzGGWyJW7jn4zIqsfh2XwFcCmyxBzLkAB2ptny+CLvER
 8qAfT1siAf1fCPoCWW5KOsJf9UfrtvNHl7YeuCM7yQ54Bexxg6f2CTmfjOIMcqM91kqSYL
 TTFIA42rK2jcIPYswcLMpScFFeAYx2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-E-PhM04ZMqS7zs1XRnhvbA-1; Mon, 27 Sep 2021 04:02:32 -0400
X-MC-Unique: E-PhM04ZMqS7zs1XRnhvbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96E88100CCC6;
 Mon, 27 Sep 2021 08:02:30 +0000 (UTC)
Received: from localhost (unknown [10.39.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A84160C13;
 Mon, 27 Sep 2021 08:02:21 +0000 (UTC)
Date: Mon, 27 Sep 2021 10:02:20 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH 1/2] virtio: introduce virtio_dev_to_node helper
Message-ID: <YVF6jOfF7sqWWiBl@stefanha-x1.localdomain>
References: <20210926145518.64164-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210926145518.64164-1-mgurtovoy@nvidia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, kvm@vger.kernel.org,
 mst@redhat.com, israelr@nvidia.com, virtualization@lists.linux-foundation.org,
 hch@infradead.org, nitzanc@nvidia.com, oren@nvidia.com
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
Content-Type: multipart/mixed; boundary="===============4081209970671279501=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============4081209970671279501==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4fVC5S2hVXKz+qy4"
Content-Disposition: inline


--4fVC5S2hVXKz+qy4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 26, 2021 at 05:55:17PM +0300, Max Gurtovoy wrote:
> Also expose numa_node field as a sysfs attribute. Now virtio device
> drivers will be able to allocate memory that is node-local to the
> device. This significantly helps performance and it's oftenly used in
> other drivers such as NVMe, for example.
>=20
> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> ---
>  drivers/virtio/virtio.c | 10 ++++++++++
>  include/linux/virtio.h  | 13 +++++++++++++
>  2 files changed, 23 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--4fVC5S2hVXKz+qy4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFReocACgkQnKSrs4Gr
c8gT+QgAg0wer2CY+2rCDIWjcsfv8yyqVsHfHaJ9TLzdC+6JHfOmPuyD99Fx8FzQ
TbExtXhcMxGkHXDcOrH6Zn2Z/l6B8ki2htsnlVXM6O6eu6xvZ6AHl1g/DDxIqERQ
iQ9IRW9PzjsI0X3vCGuBFk9/R+O7OW9WYOi486lAJpflkUt+YEl/1LZ7uebwiBC8
2fv8WaBYmjKMpsLC624qer0MHB7JNQCXOl6BjUvi0biYe28w03WKaVH2N9cPVVzF
GoVCfCSuKGxdn8i2VdzYNdXAmkSlkYBHGKc/XfW6rZMaJ56YGlcE+cfiuwcs9P5U
Ep65hjfmwiGrb94XyDrmov2vIaGlhQ==
=Ex/F
-----END PGP SIGNATURE-----

--4fVC5S2hVXKz+qy4--


--===============4081209970671279501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4081209970671279501==--

