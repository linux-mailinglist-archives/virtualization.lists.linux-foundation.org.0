Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1482122AC97
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 12:32:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C48F789A92;
	Thu, 23 Jul 2020 10:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRqTB3aT+nCo; Thu, 23 Jul 2020 10:32:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F27289A9A;
	Thu, 23 Jul 2020 10:32:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A876EC004C;
	Thu, 23 Jul 2020 10:32:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59EFEC004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 10:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5008189657
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 10:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FFe0g6laFSXe
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 10:32:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8ABFD893EA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 10:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595500371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8BUVF6SlITMHB26Pughs8pfVEmVLezQW3LY7bb5i6xY=;
 b=LlxdSpaYWPfvG8lmUE7/RsbEBqxs+WBgyGLqAdAfXFO9yWLp+90qnwOmuCHdrtToV2kxwv
 BZNBlp0uBGSd4W0bhDi4BuRWA+9TuC5EYt6W3R7Juff7kNAOKajrCAbZUzznUna84VCOTB
 hnEkDmvcLsNh68VJgTwAbALidFNzfjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-UqqRNaXhOZ2-dS50f147rw-1; Thu, 23 Jul 2020 06:32:44 -0400
X-MC-Unique: UqqRNaXhOZ2-dS50f147rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04F071005504;
 Thu, 23 Jul 2020 10:32:44 +0000 (UTC)
Received: from localhost (ovpn-114-204.ams2.redhat.com [10.36.114.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE5B261983;
 Thu, 23 Jul 2020 10:32:40 +0000 (UTC)
Date: Thu, 23 Jul 2020 11:32:39 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: Interesting qemu/virt-manager bug about the "rotational"
 attribute on virtio-blk disks
Message-ID: <20200723103239.GD186372@stefanha-x1.localdomain>
References: <20200716080614.GA18456@redhat.com>
 <20200716093344.7molwklwco4sdtvs@steredhat>
MIME-Version: 1.0
In-Reply-To: <20200716093344.7molwklwco4sdtvs@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, qemu-discuss@nongnu.org
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
Content-Type: multipart/mixed; boundary="===============0332307665544436917=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============0332307665544436917==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tNQTSEo8WG/FKZ8E"
Content-Disposition: inline

--tNQTSEo8WG/FKZ8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 11:33:44AM +0200, Stefano Garzarella wrote:
> +Cc Michael, Stefan, virtualization@lists.linux-foundation.org
>=20
> On Thu, Jul 16, 2020 at 09:06:14AM +0100, Richard W.M. Jones wrote:
> >=20
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1857515
> >=20
> > A virtio-blk disk which is backed by a raw file on an SSD,
> > inside the guest shows rotational =3D 1.
> >=20
> > I assumed that qemu must have a "rotational" property for disks and
> > this would be communicated by virtio to the guest, but qemu and virtio
> > don't seem to have this.  Pretty surprising!  Is it called something
> > other than "rotational"?
> >=20
>=20
> I'm not sure if we need to add this property in QEMU, but in Linux
> I found these flags (include/linux/blkdev.h) for the block queues:
>=20
>     #define QUEUE_FLAG_NONROT=096=09/* non-rotational device (SSD) */
>     #define QUEUE_FLAG_VIRT=09=09QUEUE_FLAG_NONROT /* paravirt device */
>=20
> xen-blkfront driver is the only one that sets the QUEUE_FLAG_VIRT,
> should we do the same in the virtio-blk driver regardless of the backend?

The ability to control this flag would be interesting for performance
experiments.

The problem with changing the default is that regressions can be
expected. Certain workloads benefit while others regress.

I suggest:
1. Make it controllable so that QUEUE_FLAG_NONROT can be set or clear
   (not hardcoded to a single value).
2. The device can communicate the optimal setting from the host. The
   SCSI protocol already conveys this information. Virtio-blk needs a
   feature bit and possibly config space field.
3. Make it migration-safe. It needs to be configured explicitly so the
   value doesn't change suddenly across migration.

Stefan

--tNQTSEo8WG/FKZ8E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8ZZ0cACgkQnKSrs4Gr
c8gW8wgAlPxsGR7dHsfx/U6xY5fFlSKncToyAC4LsXOrw6bdavJMNxH2sW0eq8EE
67nOr9dPqRvNqnJRT1a8KmKui8lk6Cka/gKZt9A/vTqTK9gbw1bXCV1jX5p09o0s
KZF0Huh1z2GQKW81YDkRAPU95xCTCMCTpHl7aCo4P0LxskZGU/H2HiJfm1PSpHla
NJPQlbhL0yElehVrqjDEKOyBgq0Q1Ot7r6i6f+MUSooD2hvbKc/6MubHFlmmlxzu
N5A8VWDL1CHp5jzv+Y1axKDWT3ThdC2DOLMtPb8PjTG5asBV02UQ6WbNRzDq0pkK
QT/qNd8eXFIlFSXJn4/bHcH/3/JxYA==
=wtiW
-----END PGP SIGNATURE-----

--tNQTSEo8WG/FKZ8E--


--===============0332307665544436917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0332307665544436917==--

