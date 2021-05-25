Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A8B3906E1
	for <lists.virtualization@lfdr.de>; Tue, 25 May 2021 18:47:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B858E83C3F;
	Tue, 25 May 2021 16:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kqFctoSL9rai; Tue, 25 May 2021 16:47:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92CA783C51;
	Tue, 25 May 2021 16:47:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44ED0C0001;
	Tue, 25 May 2021 16:47:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50F08C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 16:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 319E240425
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 16:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpKMe62PG452
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 16:47:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43531403D8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 16:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621961265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fL6Y/duGHBMJKkmMDJ4jflONRQgZgnAzPjAPflMfB2s=;
 b=RgbSGu+lhQHnRft0j81wAXgHvzlObGu8Vyxe/Nks8Fueu/5g9amDIqLF4lkDQiNv31n8qm
 VxW+2ie8N/TVt81trQxicqTFMKfqpSIp9z6xMioEBpnzQ1EMiMUkH05HMh7Url33Ki8nqy
 Hi1XRqi+Slz/hW3dflHL0TDu7f6d1Ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-M1ILaIflOF2vHlFCyOjrRg-1; Tue, 25 May 2021 12:47:42 -0400
X-MC-Unique: M1ILaIflOF2vHlFCyOjrRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B8AA180FD66;
 Tue, 25 May 2021 16:47:41 +0000 (UTC)
Received: from localhost (ovpn-115-80.ams2.redhat.com [10.36.115.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 449B9421F;
 Tue, 25 May 2021 16:47:37 +0000 (UTC)
Date: Tue, 25 May 2021 17:47:36 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [RFC] virtio_scsi: to poll and kick the virtqueue in timeout
 handler
Message-ID: <YK0qKMF0I8Wm1euN@stefanha-x1.localdomain>
References: <20210523063843.1177-1-dongli.zhang@oracle.com>
 <ac161748-15d2-2962-402e-23abca469623@suse.de>
 <YKupFeOtc6Pr5KS2@stefanha-x1.localdomain>
 <a0404035-2ab7-6b9c-f393-0bb0417c4b3d@oracle.com>
MIME-Version: 1.0
In-Reply-To: <a0404035-2ab7-6b9c-f393-0bb0417c4b3d@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: srinivas.eeda@oracle.com, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, mst@redhat.com, joe.jin@oracle.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, pbonzini@redhat.com, junxiao.bi@oracle.com,
 jejb@linux.ibm.com
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
Content-Type: multipart/mixed; boundary="===============1500010335000237675=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============1500010335000237675==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VNMvGmWXBqxStO+j"
Content-Disposition: inline


--VNMvGmWXBqxStO+j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 11:33:33PM -0700, Dongli Zhang wrote:
> On 5/24/21 6:24 AM, Stefan Hajnoczi wrote:
> > On Sun, May 23, 2021 at 09:39:51AM +0200, Hannes Reinecke wrote:
> >> On 5/23/21 8:38 AM, Dongli Zhang wrote:
> >>> This RFC is to trigger the discussion about to poll and kick the
> >>> virtqueue on purpose in virtio-scsi timeout handler.
> >>>
> >>> The virtio-scsi relies on the virtio vring shared between VM and host.
> >>> The VM side produces requests to vring and kicks the virtqueue, while=
 the
> >>> host side produces responses to vring and interrupts the VM side.
> >>>
> >>> By default the virtio-scsi handler depends on the host timeout handler
> >>> by BLK_EH_RESET_TIMER to give host a chance to perform EH.
> >>>
> >>> However, this is not helpful for the case that the responses are avai=
lable
> >>> on vring but the notification from host to VM is lost.
> >>>
> >> How can this happen?
> >> If responses are lost the communication between VM and host is broken,=
 and
> >> we should rather reset the virtio rings themselves.
> >=20
> > I agree. In principle it's fine to poll the virtqueue at any time, but I
> > don't understand the failure scenario here. It's not clear to me why the
> > device-to-driver vq notification could be lost.
> >=20
>=20
> One example is the CPU hotplug issue before the commit bf0beec0607d ("blk=
-mq:
> drain I/O when all CPUs in a hctx are offline") was available. The issue =
is
> equivalent to loss of interrupt. Without the CPU hotplug fix, while NVMe =
driver
> relies on the timeout handler to complete inflight IO requests, the PV
> virtio-scsi may hang permanently.
>=20
> In addition, as the virtio/vhost/QEMU are complex software, we are not ab=
le to
> guarantee there is no further lost of interrupt/kick issue in the future.=
 It is
> really painful if we encounter such issue in production environment.

Any number of hardware or software bugs might exist that we don't know
about, yet we don't pre-emptively add workarounds for them because where
do you draw the line?

I checked other SCSI/block drivers and found it's rare to poll in the
timeout function so there does not seem to be a consensus that it's
useful to do this.

That said, it's technically fine to do it, the virtqueue APIs are there
and can be used like this. So if you and others think this is necessary,
then it's a pretty small change and I'm not against merging a patch like
this.

Stefan

--VNMvGmWXBqxStO+j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCtKigACgkQnKSrs4Gr
c8jE6gf/SzpIij5k5NFqXRfDYjrAoN/hHDK0f8rALj06t2cmrKq1LugoGygtb4nd
MmJypVvxZZW037iS8fChHC5kcqvBA9Y/N+0tABVJNT8GHLnvDZI8diTONgXVUCzj
X/u0+3EjQNz2TX6W9pZbEJmeVv0z7JiWCQKcLf9DYq77Xei8U4U5Xv4k0Nks1b1A
PFH+j4R42eYdziIwwxCPgAQtlCWlTgWbGO9B14kqeybM7I9pq2Ar+WQXIItptuuA
9R3RBQ6n1cOqtiOHwOXjz2Y4zSa3o4jrLeV8/u3MEmZAwpc2+1A7QL+fW2uxpWJf
7geSWXbXMdwb7odJ+yKHBNAMOjZqmA==
=d024
-----END PGP SIGNATURE-----

--VNMvGmWXBqxStO+j--


--===============1500010335000237675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1500010335000237675==--

