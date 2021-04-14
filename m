Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CA535EF92
	for <lists.virtualization@lfdr.de>; Wed, 14 Apr 2021 10:44:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6D3A40167;
	Wed, 14 Apr 2021 08:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1ZV3xWcJ9qO; Wed, 14 Apr 2021 08:44:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8646440171;
	Wed, 14 Apr 2021 08:44:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7C05C000A;
	Wed, 14 Apr 2021 08:44:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48623C000A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 08:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FE9260D6F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 08:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id raVN0r3PHgvr
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 08:44:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8204760BA8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618389883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PI0biHAjtioVE9nE4bLO2UBKn34udcJDNDQVnJSXI5I=;
 b=M69Kp90HHKI/NLHMOH5zV9+mkZNHfMJVT2yXsAiflsWDIFn2haMl1MchDMl0MIojORLObR
 NxWILW5bAksf9EFabiaJyZJmesigjOKubcPldtBZW9z/myqE2Njz9s5MQoGIyJW8+I0LqO
 a/9OmI2K+xr2sdX+LyOxb2m5+7hQyPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-pGt2yJp0Puqc60dY4e2B9Q-1; Wed, 14 Apr 2021 04:44:41 -0400
X-MC-Unique: pGt2yJp0Puqc60dY4e2B9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 009788030A0;
 Wed, 14 Apr 2021 08:44:40 +0000 (UTC)
Received: from localhost (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FD5E51298;
 Wed, 14 Apr 2021 08:44:36 +0000 (UTC)
Date: Wed, 14 Apr 2021 09:44:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] virtio_blk: Add support for lifetime feature
Message-ID: <YHarc5gGgjyQOaA+@stefanha-x1.localdomain>
References: <20210330231602.1223216-1-egranata@google.com>
 <YHQQL1OTOdnuOYUW@stefanha-x1.localdomain>
 <20210412094217.GA981912@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210412094217.GA981912@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: axboe@kernel.dk, mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 pbonzini@redhat.com, Enrico Granata <egranata@google.com>
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
Content-Type: multipart/mixed; boundary="===============2899938005588206824=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============2899938005588206824==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bauiO0UMhevZr0So"
Content-Disposition: inline


--bauiO0UMhevZr0So
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 12, 2021 at 10:42:17AM +0100, Christoph Hellwig wrote:
> A note to the virtio committee:  eMMC is the worst of all the currently
> active storage standards by a large margin.  It defines very strange
> ad-hoc interfaces that expose very specific internals and often provides
> very poor abstractions.  It would be great it you could reach out to the
> wider storage community before taking bad ideas from the eMMC standard
> and putting it into virtio.

As Michael mentioned, there is still time to change the virtio-blk spec
since this feature hasn't been released yet.

Why exactly is exposing eMMC-style lifetime information problematic?

Can you and Enrico discuss the use case to figure out an alternative
interface?

Thanks,
Stefan

--bauiO0UMhevZr0So
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB2q3MACgkQnKSrs4Gr
c8iCWQf/XiM3VgPA1Zs4wDtPYzkWMh607Ajshz1zQnvTv/pJs17WdQ2XSjJAdXxS
46IZ7lThbydBkeAaO0liAnBadJGipfv0MWQpkoWRVGvYH868k37bdtE/ypMeAL+b
sUXF0BKNur+PMwV643QM04oGlYnEecvbNSFH1C2tADROJC7S9uEcZYK6pC9wKhap
gKmDBhR+3qSRihK8d8aK2Bp4sUrZRGpsTnI9OZNCbZhRMGwvzGox0ffumvX0j1dA
zPpSFesL+ytUmhAT695CAW/lPlcDwCP84GXAt2uaPvA4unZSzkbk4SN9Zx8zaKqu
kiofNkpquHkH8V4R2QdBvLbK590Ixw==
=DTBm
-----END PGP SIGNATURE-----

--bauiO0UMhevZr0So--


--===============2899938005588206824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2899938005588206824==--

