Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 530F44D87EC
	for <lists.virtualization@lfdr.de>; Mon, 14 Mar 2022 16:19:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C60E140610;
	Mon, 14 Mar 2022 15:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3lVUDK5qy-JS; Mon, 14 Mar 2022 15:19:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E22B1404F8;
	Mon, 14 Mar 2022 15:19:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66CE4C0084;
	Mon, 14 Mar 2022 15:19:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FC92C000B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 15:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EE44404E9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 15:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sthpdAsrioS2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 15:19:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA9D8404AA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 15:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647271149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EcGGKz8RlX3Si4QbgYu+zBe05ESe0XjnOliYQ9D2ywM=;
 b=W/gSsCw33ca7/lcRQb1ojIASRPGpwlXUvEMMCQM7c07+ct5qozrQFar73La2QaPGUUA3xg
 PLJPMq9gXOBEdMAZMET+aMagdjH89PoZPIxEAdt3175qHpea399/G9EDkIhmprLepW/gta
 4j5HgL6funaQtA3XWCL7ajW7o1JThEQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-lMZuezr9MHCNIsNQijkB4g-1; Mon, 14 Mar 2022 11:19:03 -0400
X-MC-Unique: lMZuezr9MHCNIsNQijkB4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F84B2999B23;
 Mon, 14 Mar 2022 15:19:03 +0000 (UTC)
Received: from localhost (unknown [10.39.195.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAA274050C51;
 Mon, 14 Mar 2022 15:19:02 +0000 (UTC)
Date: Mon, 14 Mar 2022 15:19:01 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Suwan Kim <suwan.kim027@gmail.com>
Subject: Re: [PATCH] virtio-blk: support polling I/O
Message-ID: <Yi9c5bhdDrQ1pLDY@stefanha-x1.localdomain>
References: <20220311152832.17703-1-suwan.kim027@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220311152832.17703-1-suwan.kim027@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Cc: linux-block@vger.kernel.org, pbonzini@redhat.com,
 virtualization@lists.linux-foundation.org, mst@redhat.com
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
Content-Type: multipart/mixed; boundary="===============6910216842758145326=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============6910216842758145326==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FEWaVgTiWV32JW4y"
Content-Disposition: inline


--FEWaVgTiWV32JW4y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 12, 2022 at 12:28:32AM +0900, Suwan Kim wrote:
> This patch supports polling I/O via virtio-blk driver. Polling
> feature is enabled based on "VIRTIO_BLK_F_MQ" feature and the number
> of polling queues can be set by QEMU virtio-blk-pci property
> "num-poll-queues=3DN". This patch improves the polling I/O throughput
> and latency.
>=20
> The virtio-blk driver doesn't not have a poll function and a poll
> queue and it has been operating in interrupt driven method even if
> the polling function is called in the upper layer.
>=20
> virtio-blk polling is implemented upon 'batched completion' of block
> layer. virtblk_poll() queues completed request to io_comp_batch->req_list
> and later, virtblk_complete_batch() calls unmap function and ends
> the requests in batch.
>=20
> virtio-blk reads the number of queues and poll queues from QEMU
> virtio-blk-pci properties ("num-queues=3DN", "num-poll-queues=3DM").
> It allocates N virtqueues to virtio_blk->vqs[N] and it uses [0..(N-M-1)]
> as default queues and [(N-M)..(N-1)] as poll queues. Unlike the default
> queues, the poll queues have no callback function.
>=20
> Regarding HW-SW queue mapping, the default queue mapping uses the
> existing method that condsiders MSI irq vector. But the poll queue
> doesn't have an irq, so it uses the regular blk-mq cpu mapping.
>=20
> To enable poll queues, "num-poll-queues=3DN" property of virtio-blk-pci
> needs to be added to QEMU command line. For that, I temporarily
> implemented the property on QEMU. Please refer to the git repository belo=
w.
>=20
> 	git : https://github.com/asfaca/qemu.git #on master branch commit
>=20
> For verifying the improvement, I did Fio polling I/O performance test
> with io_uring engine with the options below.
> (io_uring, hipri, randread, direct=3D1, bs=3D512, iodepth=3D64 numjobs=3D=
N)
> I set 4 vcpu and 4 virtio-blk queues - 2 default queues and 2 poll
> queues for VM.
> (-device virtio-blk-pci,num-queues=3D4,num-poll-queues=3D2)
> As a result, IOPS and average latency improved about 10%.
>=20
> Test result:
>=20
> - Fio io_uring poll without virtio-blk poll support
> 	-- numjobs=3D1 : IOPS =3D 297K, avg latency =3D 214.59us
> 	-- numjobs=3D2 : IOPS =3D 360K, avg latency =3D 363.88us
> 	-- numjobs=3D4 : IOPS =3D 289K, avg latency =3D 885.42us
>=20
> - Fio io_uring poll with virtio-blk poll support
> 	-- numjobs=3D1 : IOPS =3D 332K, avg latency =3D 192.61us
> 	-- numjobs=3D2 : IOPS =3D 371K, avg latency =3D 348.31us
> 	-- numjobs=3D4 : IOPS =3D 321K, avg latency =3D 795.93us

Last year there was a patch series that switched regular queues into
polling queues when HIPRI requests were in flight:
https://lore.kernel.org/linux-block/20210520141305.355961-1-stefanha@redhat=
=2Ecom/T/

The advantage is that polling is possible without prior device
configuration, making it easier for users.

However, the dynamic approach is a bit more complex and bugs can result
in lost irqs (hung I/O). Christoph Hellwig asked for dedicated polling
queues, which your patch series now delivers.

I think your patch series is worth merging once the comments others have
already made have been addressed. I'll keep an eye out for the VIRTIO
spec change to extend the virtio-blk configuration space, which needs to
be accepted before the Linux can be merged.

> @@ -728,16 +749,82 @@ static const struct attribute_group *virtblk_attr_g=
roups[] =3D {
>  static int virtblk_map_queues(struct blk_mq_tag_set *set)
>  {
>  	struct virtio_blk *vblk =3D set->driver_data;
> +	int i, qoff;
> +
> +	for (i =3D 0, qoff =3D 0; i < set->nr_maps; i++) {
> +		struct blk_mq_queue_map *map =3D &set->map[i];
> +
> +		map->nr_queues =3D vblk->io_queues[i];
> +		map->queue_offset =3D qoff;
> +		qoff +=3D map->nr_queues;
> +
> +		if (map->nr_queues =3D=3D 0)
> +			continue;
> +
> +		if (i =3D=3D HCTX_TYPE_DEFAULT)
> +			blk_mq_virtio_map_queues(&set->map[i], vblk->vdev, 0);
> +		else
> +			blk_mq_map_queues(&set->map[i]);

A comment would be nice here to explain that regular queues have
interrupts and hence CPU affinity is defined by the core virtio code,
but polling queues have no interrupts so we let the block layer assign
CPU affinity.

--FEWaVgTiWV32JW4y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIvXOUACgkQnKSrs4Gr
c8ilCgf9H0OeWiuGa194W7myQbzaAkrBqKHc202/u3swrEeBTAQzKLIB/FcUNFnH
o0OYJ8PuirNF950nDdMBaItyP7D+QCZmIKC0WqgSlE0b4O1I6hbZ+CLSRvjDgk/9
NiP2beTMKdIsvAqSeHs+00/yiW4hXua1a/ztYHfMt2Y5qMRuzDdZwSYyL/p0qAsD
c5ronzYLovvDIj3EnsyDc+JITgc9mT4IozLqDXcpC0CguXdyiNvSvIu+qtJagl7+
QeevdGg7kSOAsToDsngiz7pvNcHIL5BkLGD6jp2CBsoHT/xOtHgpW6r3f0M4Y3vU
gzY7/SwA4dIhqvbBVmqEFn9fVL7J0g==
=Y4z2
-----END PGP SIGNATURE-----

--FEWaVgTiWV32JW4y--


--===============6910216842758145326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6910216842758145326==--

