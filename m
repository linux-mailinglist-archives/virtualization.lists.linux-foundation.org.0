Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF23303B39
	for <lists.virtualization@lfdr.de>; Tue, 26 Jan 2021 12:13:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8C5C886110;
	Tue, 26 Jan 2021 11:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8qQAchHIpcHa; Tue, 26 Jan 2021 11:13:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 27F678614D;
	Tue, 26 Jan 2021 11:13:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D792CC013A;
	Tue, 26 Jan 2021 11:13:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27E08C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 11:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0D8C48701F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 11:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lBGeRbNsnQQg
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 11:13:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1510C87002
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 11:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611659626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P4c97Mxtvt6PTgjdE+ULFdPo0WkT/OF+2OqvOiR8htc=;
 b=bRbmlvct3NfYooarashzwAjdG8Ya6hRRfmYChjcX6ctTFAehfqIIdzll4HAgEZi3zcj9Uh
 GyDKJlTFobDBVHXhQgbTdZyY1F/TDsACmnVqFRjd1itkDcg4AoHytvRFvC1XMVDlrvqbH1
 5zaEXLR415xcrViMISY3Kvn/9XXbdsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-jmomYNYmNsSaV8eW66ic2w-1; Tue, 26 Jan 2021 06:13:44 -0500
X-MC-Unique: jmomYNYmNsSaV8eW66ic2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 391E3107ACE3;
 Tue, 26 Jan 2021 11:13:43 +0000 (UTC)
Received: from localhost (ovpn-114-186.ams2.redhat.com [10.36.114.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76E9D5D9DB;
 Tue, 26 Jan 2021 11:13:38 +0000 (UTC)
Date: Tue, 26 Jan 2021 11:13:38 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH v2] virtio-blk: support per-device queue depth
Message-ID: <20210126111338.GB250425@stefanha-x1.localdomain>
References: <1611307306-71067-1-git-send-email-joseph.qi@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1611307306-71067-1-git-send-email-joseph.qi@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0574285561616784716=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============0574285561616784716==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline

--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2021 at 05:21:46PM +0800, Joseph Qi wrote:
> module parameter 'virtblk_queue_depth' was firstly introduced for
> testing/benchmarking purposes described in commit fc4324b4597c
> ("virtio-blk: base queue-depth on virtqueue ringsize or module param").
> And currently 'virtblk_queue_depth' is used as a saved value for the
> first probed device.
> Since we have different virtio-blk devices which have different
> capabilities, it requires that we support per-device queue depth instead
> of per-module. So defaultly use vq free elements if module parameter
> 'virtblk_queue_depth' is not set.
>=20
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/block/virtio_blk.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAP+WEACgkQnKSrs4Gr
c8jB3QgAjrJPToqOiJGBQjegVT2HvHLWSp6ydxjE88jnKWgvktDv+P+D69KDhO9N
DMuD1gNAaodGaj43Dfhe2i6iXt/IXirHVnOIl/Z03n/bOprYN26s4Z+oQ1YoA4UP
GWfzQn3UnwClzWQY/gSCK/mgsIPNfbueWj5Vl1SCet32OrqIoWdjGSC24AGQGlUB
OeP1heONma8TMTaK5rkA6Vt8ItFy7ZiAakKtRGs4p86SN60osC1KxBkpMkjMnaEg
+qTQHRxzYazl121lFb5f/muixMnFQxr4QqIVFNpn7FetMY5uYszcXX+Tdy39mnw6
tlKTatVzde4fSMIdLfLQ9voC6eUD7A==
=cV2T
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--


--===============0574285561616784716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0574285561616784716==--

