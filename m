Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA43E16CA
	for <lists.virtualization@lfdr.de>; Thu,  5 Aug 2021 16:18:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 677164013C;
	Thu,  5 Aug 2021 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6eJP-H9Y6fz; Thu,  5 Aug 2021 14:18:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D993E402F0;
	Thu,  5 Aug 2021 14:18:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CC16C000E;
	Thu,  5 Aug 2021 14:18:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32D01C000E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Aug 2021 14:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 208F6402F0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Aug 2021 14:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NBvfuKSI7eou
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Aug 2021 14:18:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2882F4013C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Aug 2021 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628173085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CgTtaO9aoRpCiTYl9JW5StPBedgaEjV6BwrhWwCNWbE=;
 b=hu4J1kPqtC8FikAf1YwV+Q8Dg5cRpDwYUgwM36zCVQWXlM0AsYNmQn5XSpVlPLvWVGUpvI
 fZyP65EobiVoFKfGxVMWZlCHPEMs66Tg/quuwb8lgJg8N0etO96osaZv/98uqltWl/sElU
 dDF1unnCYj5kYXZ2nKiI2CPOTNC1/Zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-c6z6JEHGMJe0DH8ARyr-fg-1; Thu, 05 Aug 2021 10:18:04 -0400
X-MC-Unique: c6z6JEHGMJe0DH8ARyr-fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F369693925;
 Thu,  5 Aug 2021 14:18:00 +0000 (UTC)
Received: from localhost (unknown [10.39.193.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A98375D6A1;
 Thu,  5 Aug 2021 14:17:52 +0000 (UTC)
Date: Thu, 5 Aug 2021 15:17:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/15] virtio_blk: use bvec_virt
Message-ID: <YQvzD4FlF7+AgrSw@stefanha-x1.localdomain>
References: <20210804095634.460779-1-hch@lst.de>
 <20210804095634.460779-9-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210804095634.460779-9-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Jan Hoeppner <hoeppner@linux.ibm.com>, Mike Snitzer <snitzer@redhat.com>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Ilya Dryomov <idryomov@gmail.com>, linux-um@lists.infradead.org,
 Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, Stefan Haberland <sth@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, ceph-devel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>, Phillip Lougher <phillip@squashfs.org.uk>
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
Content-Type: multipart/mixed; boundary="===============8339351371083791526=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============8339351371083791526==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZDhkEMoj7rmqL+Fh"
Content-Disposition: inline


--ZDhkEMoj7rmqL+Fh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 11:56:27AM +0200, Christoph Hellwig wrote:
> Use bvec_virt instead of open coding it.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/virtio_blk.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ZDhkEMoj7rmqL+Fh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEL8w8ACgkQnKSrs4Gr
c8jPdgf+PcMouWs94g0uS6wpaN9fVvtvzsyRrLa0a4jPqggbtSulcjUYQzYZ9BGX
1xnrp3ABDt4KhYhX+iAsAxc4LmWEAYUruE6WxqsxaPKE19XcFuwM/tpwcv5U8/x+
2GvsXderla2RbbwTzdCFUf1m538Dw+eqH8+6Dt0Q6QjCC4EAX3ubWU+pX0K5rLNX
d7M7JCyOzOdU/VJYYVQDs1Vkpu/2AFtQT+hnq7veWzgQD+iFkLNZUEBVFm4jRbkC
5cfC+IUVtDkCjhD2offyhX+djtvDy5IZAnHEMv/ulIMmCzc0o1VgEy/5zNiKnjgg
5CdxbrfAKcA734P4gNIy/UD+hGlM6g==
=Cztj
-----END PGP SIGNATURE-----

--ZDhkEMoj7rmqL+Fh--


--===============8339351371083791526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8339351371083791526==--

