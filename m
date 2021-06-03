Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C514439A286
	for <lists.virtualization@lfdr.de>; Thu,  3 Jun 2021 15:51:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9EF683E5B;
	Thu,  3 Jun 2021 13:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hg28-tFIaBw5; Thu,  3 Jun 2021 13:51:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B49783E88;
	Thu,  3 Jun 2021 13:51:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E34E9C0001;
	Thu,  3 Jun 2021 13:51:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71DD1C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 13:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5913B400FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 13:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1IDa-Vbn16kt
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 13:51:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BC6A400CA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622728293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4wKYE2aHzUmRDWCFqUk0v5VcoRnS1iPBP5mOxwGvsWI=;
 b=PNEPbv/PYB5OXir7U5fSWo3KhicSxgrOsOqZ79bXjSuA+oFgNwjHQ+rjUXJoBlaSCVC+yw
 NOsGRmBgZdDcnE665AmSr27XE6crh3xsiTPoQsLg133vZZN+Sfl0IpVHd8UQobxkxBLgPH
 CBrF7uob1ElpGwZxIrOKYVf80K0uCOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-Cte7uI84PzeTyJAWf9YCXw-1; Thu, 03 Jun 2021 09:51:29 -0400
X-MC-Unique: Cte7uI84PzeTyJAWf9YCXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60DB6180FD70;
 Thu,  3 Jun 2021 13:51:28 +0000 (UTC)
Received: from localhost (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA0F061008;
 Thu,  3 Jun 2021 13:51:24 +0000 (UTC)
Date: Thu, 3 Jun 2021 14:51:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 4/9] vhost: allow vhost_polls to use different
 vhost_workers
Message-ID: <YLjeW6ueJlbVXuWB@stefanha-x1.localdomain>
References: <20210525180600.6349-1-michael.christie@oracle.com>
 <20210525180600.6349-5-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20210525180600.6349-5-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: linux-scsi@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 pbonzini@redhat.com
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
Content-Type: multipart/mixed; boundary="===============2039134034379188248=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============2039134034379188248==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8DbeKzXGg/TrwsJe"
Content-Disposition: inline


--8DbeKzXGg/TrwsJe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 01:05:55PM -0500, Mike Christie wrote:
> This allows vhost_polls to use the worker the vq the poll is associated
> with.
>=20
> This also exports a helper vhost_vq_work_queue which is used here
> internally, and will be used in the vhost-scsi patches.
>=20
> Signed-off-by: Mike Christie <michael.christie@oracle.com>
> ---
>  drivers/vhost/net.c   |  6 ++++--
>  drivers/vhost/vhost.c | 19 ++++++++++++++++---
>  drivers/vhost/vhost.h |  6 +++++-
>  3 files changed, 25 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--8DbeKzXGg/TrwsJe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC43lsACgkQnKSrs4Gr
c8hYewf/UmNcYo5fLhwnWpuFJ21tNHZofqURelQ2HtDD4nzZiK9JGJy4fLtX2Zxv
s2cX/WKG9s04USJ27h9BsH0+4bQRvGWu5uphV1vEisvyuPxIRgsoCD0TrFroPt74
1CQkdsVh4WM0ABny15Z0byw0gt7axXCgcW+GlkEWZrXllOuQWF+4JyQZt0MKkuDw
lv9ql4oy0O8cUJCar6T54WaJHJy1d7a3UPU4mrqDyC499ml+Ngz+WWk02led6l1e
01OE8fUb5vn3el/x/2YRVWsD8b+lPDK9Mch4N7Th+qqHhdAxMpdMvmDLWFQPP7Jm
Qv3b7PIa5K8yWO9mTiYhFOvfhGOebA==
=i0pa
-----END PGP SIGNATURE-----

--8DbeKzXGg/TrwsJe--


--===============2039134034379188248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2039134034379188248==--

