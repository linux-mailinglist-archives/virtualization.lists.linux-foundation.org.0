Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A24AC4DAF8A
	for <lists.virtualization@lfdr.de>; Wed, 16 Mar 2022 13:20:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12701409BD;
	Wed, 16 Mar 2022 12:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L4jSVPCLfzTv; Wed, 16 Mar 2022 12:20:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5451940949;
	Wed, 16 Mar 2022 12:20:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DD76C0033;
	Wed, 16 Mar 2022 12:20:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF215C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Mar 2022 12:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BB04405AE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Mar 2022 12:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70YpJa_rrCwT
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Mar 2022 12:20:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A63940521
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Mar 2022 12:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647433249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GvPZ4q3oYvS3ih1qFIjOA0tmZwfKmE3lVIEy1I8AP14=;
 b=RFhXgPk4X7OWgOy0SbOCcsyZrUUQcLnRqQ9tBLE9Gj1Zzyc75RvrgXZ7h+h72TAWUzrkRn
 OBAaTI5IqrKuAiyQOMJS8HSGo9nA1ipAJfjrzMX7tHtka/rSewc4zq6cdv0N59cqk40qvO
 7lLjgYVU1gxyWsy8LLAGuP0++mq4XSg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-RArckN-iMaKPbomiJk7udw-1; Wed, 16 Mar 2022 08:20:46 -0400
X-MC-Unique: RArckN-iMaKPbomiJk7udw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06B9A18E5281;
 Wed, 16 Mar 2022 12:20:46 +0000 (UTC)
Received: from localhost (unknown [10.39.193.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E73F3202A447;
 Wed, 16 Mar 2022 12:20:41 +0000 (UTC)
Date: Wed, 16 Mar 2022 12:20:41 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Suwan Kim <suwan.kim027@gmail.com>
Subject: Re: [PATCH] virtio-blk: support polling I/O
Message-ID: <YjHWGWgOHD7HvdUb@stefanha-x1.localdomain>
References: <20220311152832.17703-1-suwan.kim027@gmail.com>
 <Yi9c5bhdDrQ1pLDY@stefanha-x1.localdomain>
 <YjCauO0lb2mzQENJ@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <YjCauO0lb2mzQENJ@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Cc: mgurtovoy@nvidia.com, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============0855481861052280033=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============0855481861052280033==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="13TYcT3iFZ/MtLCe"
Content-Disposition: inline


--13TYcT3iFZ/MtLCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2022 at 10:55:04PM +0900, Suwan Kim wrote:
> On Mon, Mar 14, 2022 at 03:19:01PM +0000, Stefan Hajnoczi wrote:
> > On Sat, Mar 12, 2022 at 12:28:32AM +0900, Suwan Kim wrote:
> > > This patch supports polling I/O via virtio-blk driver. Polling
> > > feature is enabled based on "VIRTIO_BLK_F_MQ" feature and the number
> > > of polling queues can be set by QEMU virtio-blk-pci property
> > > "num-poll-queues=3DN". This patch improves the polling I/O throughput
> > > and latency.
> > >=20
> > > The virtio-blk driver doesn't not have a poll function and a poll
> > > queue and it has been operating in interrupt driven method even if
> > > the polling function is called in the upper layer.
> > >=20
> > > virtio-blk polling is implemented upon 'batched completion' of block
> > > layer. virtblk_poll() queues completed request to io_comp_batch->req_=
list
> > > and later, virtblk_complete_batch() calls unmap function and ends
> > > the requests in batch.
> > >=20
> > > virtio-blk reads the number of queues and poll queues from QEMU
> > > virtio-blk-pci properties ("num-queues=3DN", "num-poll-queues=3DM").
> > > It allocates N virtqueues to virtio_blk->vqs[N] and it uses [0..(N-M-=
1)]
> > > as default queues and [(N-M)..(N-1)] as poll queues. Unlike the defau=
lt
> > > queues, the poll queues have no callback function.
> > >=20
> > > Regarding HW-SW queue mapping, the default queue mapping uses the
> > > existing method that condsiders MSI irq vector. But the poll queue
> > > doesn't have an irq, so it uses the regular blk-mq cpu mapping.
> > >=20
> > > To enable poll queues, "num-poll-queues=3DN" property of virtio-blk-p=
ci
> > > needs to be added to QEMU command line. For that, I temporarily
> > > implemented the property on QEMU. Please refer to the git repository =
below.
> > >=20
> > > 	git : https://github.com/asfaca/qemu.git #on master branch commit
> > >=20
> > > For verifying the improvement, I did Fio polling I/O performance test
> > > with io_uring engine with the options below.
> > > (io_uring, hipri, randread, direct=3D1, bs=3D512, iodepth=3D64 numjob=
s=3DN)
> > > I set 4 vcpu and 4 virtio-blk queues - 2 default queues and 2 poll
> > > queues for VM.
> > > (-device virtio-blk-pci,num-queues=3D4,num-poll-queues=3D2)
> > > As a result, IOPS and average latency improved about 10%.
> > >=20
> > > Test result:
> > >=20
> > > - Fio io_uring poll without virtio-blk poll support
> > > 	-- numjobs=3D1 : IOPS =3D 297K, avg latency =3D 214.59us
> > > 	-- numjobs=3D2 : IOPS =3D 360K, avg latency =3D 363.88us
> > > 	-- numjobs=3D4 : IOPS =3D 289K, avg latency =3D 885.42us
> > >=20
> > > - Fio io_uring poll with virtio-blk poll support
> > > 	-- numjobs=3D1 : IOPS =3D 332K, avg latency =3D 192.61us
> > > 	-- numjobs=3D2 : IOPS =3D 371K, avg latency =3D 348.31us
> > > 	-- numjobs=3D4 : IOPS =3D 321K, avg latency =3D 795.93us
> >=20
> > Last year there was a patch series that switched regular queues into
> > polling queues when HIPRI requests were in flight:
> > https://lore.kernel.org/linux-block/20210520141305.355961-1-stefanha@re=
dhat.com/T/
> >=20
> > The advantage is that polling is possible without prior device
> > configuration, making it easier for users.
> >=20
> > However, the dynamic approach is a bit more complex and bugs can result
> > in lost irqs (hung I/O). Christoph Hellwig asked for dedicated polling
> > queues, which your patch series now delivers.
> >=20
> > I think your patch series is worth merging once the comments others have
> > already made have been addressed. I'll keep an eye out for the VIRTIO
> > spec change to extend the virtio-blk configuration space, which needs to
> > be accepted before the Linux can be merged.
>=20
> Thanks for the feedback :)
> There's a lot of history.. I will try to improve the patch.
>=20
> It might take some time because it need more discussion about qemu
> device property and I do this in my night time.

I see, it's great that you're making this contribution. Don't worry
about the old patch series I linked. I think your approach is fine.

Stefan

--13TYcT3iFZ/MtLCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIx1hgACgkQnKSrs4Gr
c8gPPggAqtPz8MJbtOKRWoA2xIu8mK69zNtUvAqTurWFiw/NBFRgVMOUaoeBtrgw
Z+5BIeiui/YD1948HGWfaBO9UgOea4uBhby8NvnjqGLdadPcuxqJnmJYZL4OkHi7
oEenlhtiZhWwq2trdpvbNz3duKUFRhmqxSRV/+ZSnEue93JA1wABNWgH1vgI3/37
mR0XdKsF3OiApkJ+9pAU0JDlTk5Azz8mWesolpraUzdm7isoQwjO5vKdPc2+WRrD
JzqfghR1x0FvchXwlMewkQWh901MJKn3LFnlpc6mDkKnZ6jShlnH7pquQW+EZL41
H/QXj79qXsyHyhmb313nAwEq6M34aA==
=N4Zi
-----END PGP SIGNATURE-----

--13TYcT3iFZ/MtLCe--


--===============0855481861052280033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0855481861052280033==--

