Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 046095905C7
	for <lists.virtualization@lfdr.de>; Thu, 11 Aug 2022 19:23:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AE8161110;
	Thu, 11 Aug 2022 17:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AE8161110
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XoDmTM4N
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q7gqFmhwe6ad; Thu, 11 Aug 2022 17:23:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 551436110B;
	Thu, 11 Aug 2022 17:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551436110B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 828DEC007B;
	Thu, 11 Aug 2022 17:23:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14E27C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 17:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E04866108A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 17:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E04866108A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axxSAvN0_roX
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 17:23:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A1760758
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63A1760758
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660238624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B7I5PAOOErv1ZVcauTUvvJBXgNSfohhWYbnS90qn2T8=;
 b=XoDmTM4NGIpJKDPqybJo58q37laLxjo+apnmdjtEaWiDwgxEoqtNiAoCLEDW/py9FQ5i/n
 62MHunMHV1hsE++OofJMcGg6M02LO9mvBSuPC7cpkGYcm8sTKEc0WP87WYBt0qv0pVUUEg
 v+mkn7W1iMc/023eJ3njOp99ZOA15Ug=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-ltHPr13nPyKPSQAq_Ja6Kw-1; Thu, 11 Aug 2022 13:23:40 -0400
X-MC-Unique: ltHPr13nPyKPSQAq_Ja6Kw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C608811E81;
 Thu, 11 Aug 2022 17:23:40 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9051C40CF8E7;
 Thu, 11 Aug 2022 17:23:39 +0000 (UTC)
Date: Thu, 11 Aug 2022 13:23:37 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Shigeru Yoshida <syoshida@redhat.com>
Subject: Re: [PATCH v2] virtio-blk: Avoid use-after-free on suspend/resume
Message-ID: <YvU7GdBMNy7NbQLe@fedora>
References: <20220810160948.959781-1-syoshida@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220810160948.959781-1-syoshida@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Cc: axboe@kernel.dk, mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 pbonzini@redhat.com, suwan.kim027@gmail.com
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
Content-Type: multipart/mixed; boundary="===============2634556155633668248=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============2634556155633668248==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bcLkh93uF3UZp5A6"
Content-Disposition: inline


--bcLkh93uF3UZp5A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2022 at 01:09:48AM +0900, Shigeru Yoshida wrote:
> hctx->user_data is set to vq in virtblk_init_hctx().  However, vq is
> freed on suspend and reallocated on resume.  So, hctx->user_data is
> invalid after resume, and it will cause use-after-free accessing which
> will result in the kernel crash something like below:
>=20
> [   22.428391] Call Trace:
> [   22.428899]  <TASK>
> [   22.429339]  virtqueue_add_split+0x3eb/0x620
> [   22.430035]  ? __blk_mq_alloc_requests+0x17f/0x2d0
> [   22.430789]  ? kvm_clock_get_cycles+0x14/0x30
> [   22.431496]  virtqueue_add_sgs+0xad/0xd0
> [   22.432108]  virtblk_add_req+0xe8/0x150
> [   22.432692]  virtio_queue_rqs+0xeb/0x210
> [   22.433330]  blk_mq_flush_plug_list+0x1b8/0x280
> [   22.434059]  __blk_flush_plug+0xe1/0x140
> [   22.434853]  blk_finish_plug+0x20/0x40
> [   22.435512]  read_pages+0x20a/0x2e0
> [   22.436063]  ? folio_add_lru+0x62/0xa0
> [   22.436652]  page_cache_ra_unbounded+0x112/0x160
> [   22.437365]  filemap_get_pages+0xe1/0x5b0
> [   22.437964]  ? context_to_sid+0x70/0x100
> [   22.438580]  ? sidtab_context_to_sid+0x32/0x400
> [   22.439979]  filemap_read+0xcd/0x3d0
> [   22.440917]  xfs_file_buffered_read+0x4a/0xc0
> [   22.441984]  xfs_file_read_iter+0x65/0xd0
> [   22.442970]  __kernel_read+0x160/0x2e0
> [   22.443921]  bprm_execve+0x21b/0x640
> [   22.444809]  do_execveat_common.isra.0+0x1a8/0x220
> [   22.446008]  __x64_sys_execve+0x2d/0x40
> [   22.446920]  do_syscall_64+0x37/0x90
> [   22.447773]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>=20
> This patch fixes this issue by getting vq from vblk, and removes
> virtblk_init_hctx().
>=20
> Fixes: 4e0400525691 ("virtio-blk: support polling I/O")
> Cc: "Suwan Kim" <suwan.kim027@gmail.com>
> Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
> ---
>  drivers/block/virtio_blk.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--bcLkh93uF3UZp5A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmL1OxkACgkQnKSrs4Gr
c8hvGQgAqb5zIzRaOEaXZ2ivoG7O2wTwm7oCynRmDbLHG4d/ZMPYmpapXg8I9ZIu
qmcawFnB0ebhD0RfOqPTUSKWvdc8AbT0G+zZimwgp+k+4iNxmXCSE7cLeS559TMt
AFi2nuaOzSaEXUOy6K3QmVjvlqS+qPfWXUju8mfz9d+DoL0jhpYWUOdiq4ZWrUii
cLHZyDYJC5yn5n26r0YWxNLwekUmcvxT/izwb+rEjFGoCxePM0+5svWnbslFg1Sl
S9BdUDtbwpmqEcT+RGFJjlhgqemKn0w3CusuDS1Niz+F3EnoHNKUlJNojFjbgqq8
OGfKcERg/0sOByl/McAVu9IgygYmIQ==
=nxpY
-----END PGP SIGNATURE-----

--bcLkh93uF3UZp5A6--


--===============2634556155633668248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2634556155633668248==--

