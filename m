Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B33D6041
	for <lists.virtualization@lfdr.de>; Mon, 26 Jul 2021 18:04:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8EE4403A9;
	Mon, 26 Jul 2021 16:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7N9_eOOldrz2; Mon, 26 Jul 2021 16:04:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 50D77403A2;
	Mon, 26 Jul 2021 16:04:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5930C000E;
	Mon, 26 Jul 2021 16:04:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B0EFC000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 16:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0276D403A2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 16:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sI4kdmKJ1W0u
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 16:04:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68551401CA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627315450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QIP/LBs71jmp/6QkKSJbRqY1gCpKITsOxnFKXVkn2OM=;
 b=B/ebodk2deKZKBE26Mx84KqZVnH/Kfq4rtMQjJ2+a3bCLsmWCoJALtago+9Y2Obmuqu0ql
 T4UvtCGqLSc9HPSX0m1EcYGEPz7tuNxwe/8v2gmc7U9CoGSDTTFbPZgDKxACtUi60Gv6ld
 TvzZbrw9jOtxv0yHaPtn2tqqFhfSVo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-M8oZpeUcNbGwK0xKCvjWow-1; Mon, 26 Jul 2021 12:02:44 -0400
X-MC-Unique: M8oZpeUcNbGwK0xKCvjWow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DA3C802928;
 Mon, 26 Jul 2021 16:01:27 +0000 (UTC)
Received: from localhost (ovpn-113-151.ams2.redhat.com [10.36.113.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C167C6091B;
 Mon, 26 Jul 2021 16:01:19 +0000 (UTC)
Date: Mon, 26 Jul 2021 17:01:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [RFC 0/3] cpuidle: add poll_source API and virtio vq polling
Message-ID: <YP7cTjrfipfsJe9O@stefanha-x1.localdomain>
References: <20210713161906.457857-1-stefanha@redhat.com>
 <1008dee4-fce1-2462-1520-f5432bc89a07@redhat.com>
 <YPfryV7qZVRbjNgP@stefanha-x1.localdomain>
 <869a993d-a1b0-1c39-d081-4cdd2b71041f@redhat.com>
 <YP7SEkDEIBOch9U8@stefanha-x1.localdomain>
 <CAJZ5v0h+RrRP-3MtV8dgxmba0rDfqoOw54DsFh0yx3YGUAVRqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0h+RrRP-3MtV8dgxmba0rDfqoOw54DsFh0yx3YGUAVRqw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 Linux PM <linux-pm@vger.kernel.org>, virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============4266818183406414532=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============4266818183406414532==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MI6BC+4T2wQdz2QD"
Content-Disposition: inline


--MI6BC+4T2wQdz2QD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 26, 2021 at 05:47:19PM +0200, Rafael J. Wysocki wrote:
> On Mon, Jul 26, 2021 at 5:17 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Thu, Jul 22, 2021 at 05:04:57PM +0800, Jason Wang wrote:
> > >
> > > =E5=9C=A8 2021/7/21 =E4=B8=8B=E5=8D=885:41, Stefan Hajnoczi =E5=86=99=
=E9=81=93:
> > > > On Wed, Jul 21, 2021 at 11:29:55AM +0800, Jason Wang wrote:
> > > > > =E5=9C=A8 2021/7/14 =E4=B8=8A=E5=8D=8812:19, Stefan Hajnoczi =E5=
=86=99=E9=81=93:
> > > > > > These patches are not polished yet but I would like request fee=
dback on this
> > > > > > approach and share performance results with you.
> > > > > >
> > > > > > Idle CPUs tentatively enter a busy wait loop before halting whe=
n the cpuidle
> > > > > > haltpoll driver is enabled inside a virtual machine. This reduc=
es wakeup
> > > > > > latency for events that occur soon after the vCPU becomes idle.
> > > > > >
> > > > > > This patch series extends the cpuidle busy wait loop with the n=
ew poll_source
> > > > > > API so drivers can participate in polling. Such polling-aware d=
rivers disable
> > > > > > their device's irq during the busy wait loop to avoid the cost =
of interrupts.
> > > > > > This reduces latency further than regular cpuidle haltpoll, whi=
ch still relies
> > > > > > on irqs.
> > > > > >
> > > > > > Virtio drivers are modified to use the poll_source API so all v=
irtio device
> > > > > > types get this feature. The following virtio-blk fio benchmark =
results show the
> > > > > > improvement:
> > > > > >
> > > > > >                IOPS (numjobs=3D4, iodepth=3D1, 4 virtqueues)
> > > > > >                  before   poll_source      io_poll
> > > > > > 4k randread    167102  186049 (+11%)  186654 (+11%)
> > > > > > 4k randwrite   162204  181214 (+11%)  181850 (+12%)
> > > > > > 4k randrw      159520  177071 (+11%)  177928 (+11%)
> > > > > >
> > > > > > The comparison against io_poll shows that cpuidle poll_source a=
chieves
> > > > > > equivalent performance to the block layer's io_poll feature (wh=
ich I
> > > > > > implemented in a separate patch series [1]).
> > > > > >
> > > > > > The advantage of poll_source is that applications do not need t=
o explicitly set
> > > > > > the RWF_HIPRI I/O request flag. The poll_source approach is att=
ractive because
> > > > > > few applications actually use RWF_HIPRI and it takes advantage =
of CPU cycles we
> > > > > > would have spent in cpuidle haltpoll anyway.
> > > > > >
> > > > > > The current series does not improve virtio-net. I haven't inves=
tigated deeply,
> > > > > > but it is possible that NAPI and poll_source do not combine. Se=
e the final
> > > > > > patch for a starting point on making the two work together.
> > > > > >
> > > > > > I have not tried this on bare metal but it might help there too=
=2E The cost of
> > > > > > disabling a device's irq must be less than the savings from avo=
iding irq
> > > > > > handling for this optimization to make sense.
> > > > > >
> > > > > > [1] https://lore.kernel.org/linux-block/20210520141305.355961-1=
-stefanha@redhat.com/
> > > > >
> > > > > Hi Stefan:
> > > > >
> > > > > Some questions:
> > > > >
> > > > > 1) What's the advantages of introducing polling at virtio level i=
nstead of
> > > > > doing it at each subsystems? Polling in virtio level may only wor=
k well if
> > > > > all (or most) of the devices are virtio
> > > > I'm not sure I understand the question. cpuidle haltpoll benefits a=
ll
> > > > devices today, except it incurs interrupt latency. The poll_source =
API
> > > > eliminates the interrupt latency for drivers that can disable device
> > > > interrupts cheaply.
> > > >
> > > > This patch adds poll_source to core virtio code so that all virtio
> > > > drivers get this feature for free. No driver-specific changes are
> > > > needed.
> > > >
> > > > If you mean networking, block layer, etc by "subsystems" then there=
's
> > > > nothing those subsystems can do to help. Whether poll_source can be=
 used
> > > > depends on the specific driver, not the subsystem. If you consider
> > > > drivers/virtio/ a subsystem, then that's exactly what the patch ser=
ies
> > > > is doing.
> > >
> > >
> > > I meant, if we choose to use idle poll, we have some several choices:
> > >
> > > 1) bus level (e.g the virtio)
> > > 2) subsystem level (e.g the networking and block)
> > >
> > > I'm not sure which one is better.
> >
> > This API is intended to be driver- or bus-level. I don't think
> > subsystems can do very much since they don't know the hardware
> > capabilities (cheap interrupt disabling) and in most cases there's no
> > advantage of plumbing it through subsystems when drivers can call the
> > API directly.
> >
> > > > > 2) What's the advantages of using cpuidle instead of using a thre=
ad (and
> > > > > leverage the scheduler)?
> > > > In order to combine with the existing cpuidle infrastructure. No new
> > > > polling loop is introduced and no additional CPU cycles are spent on
> > > > polling.
> > > >
> > > > If cpuidle itself is converted to threads then poll_source would
> > > > automatically operate in a thread too, but this patch series doesn't
> > > > change how the core cpuidle code works.
> > >
> > >
> > > So networking subsystem can use NAPI busy polling in the process cont=
ext
> > > which means it can be leveraged by the scheduler.
> > >
> > > I'm not sure it's a good idea to poll drivers for a specific bus in t=
he
> > > general cpu idle layer.
> >
> > Why? Maybe because the cpuidle execution environment is a little specia=
l?
>=20
> Well, this would be prone to abuse.
>=20
> The time spent in that driver callback counts as CPU idle time while
> it really is the driver running and there is not limit on how much
> time the callback can take, while doing costly things in the idle loop
> is generally avoided, because on wakeup the CPU needs to be available
> to the task needing it as soon as possible.  IOW, the callback
> potentially add unbounded latency to the CPU wakeup path.

How is this different from driver interrupt handlers running during
cpuidle?

Stefan

--MI6BC+4T2wQdz2QD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmD+3E4ACgkQnKSrs4Gr
c8hRBQf+JotrV0ZbnSaJ7lwx3V2P8/CMTWTqCLrxS67BoELl8ThmMuZpu2MoGl7O
F5L4mNr6JSqNrnaUpOWYq6kz0aqWCLTZUsI9Fq8h0FE++dPZ4HNirMwEzPLybARa
6uM3gm5dYaPuvt1y6ZaCOdzzDwSPvzFpITdGNPNFXZqNE7HbRh30xz2PCxnTzzMi
9XD3IdPx9oXqaEjWIPQP94lvRztEHZHBD5NXoIS2rRPsjnUme9LuxpFvvicJqqL2
GJW2XCMgm+AGCJ5p2fo5nzzAb28deMQtxXiMaLZC6vcW55Y/kXmW8Q9ar8o1PihB
ExvwAAIbSPpynlUnYqOsYldwWW2ZNw==
=t0SP
-----END PGP SIGNATURE-----

--MI6BC+4T2wQdz2QD--


--===============4266818183406414532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4266818183406414532==--

