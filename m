Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1B41735D2
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 12:09:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6AB67880A1;
	Fri, 28 Feb 2020 11:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wpoVpxI-MlZe; Fri, 28 Feb 2020 11:09:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BDDBE880C2;
	Fri, 28 Feb 2020 11:09:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CA46C0177;
	Fri, 28 Feb 2020 11:09:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E37C2C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 11:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D9CF720455
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 11:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cc4vHY5o96+4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 11:09:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id E48522036C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 11:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582888153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CdcJHHojaBcdZb0U4s+xr+dybgYVAue/7YBh8+XEoaQ=;
 b=Sj2d/52K9laUJ8o0cAHuJGHiBcS1oAIZevKBSGDIifnrwtJZtE88ACQTIZwDo4/8W+1mAb
 F6zqI766ozqkw5BDr6Je92RLNUDGryUrizAFWI9zW30vJwJLbW3ycECNlZJ5kiPtO+T/Gk
 rR4XPYqlxVZxdppJVx4O9PjmKklnKvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-UfkJWMbGMZ6p8aUNgvPSQg-1; Fri, 28 Feb 2020 06:09:04 -0500
X-MC-Unique: UfkJWMbGMZ6p8aUNgvPSQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E524800D5A;
 Fri, 28 Feb 2020 11:09:03 +0000 (UTC)
Received: from localhost (unknown [10.36.118.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C572C60BE0;
 Fri, 28 Feb 2020 11:09:02 +0000 (UTC)
Date: Fri, 28 Feb 2020 11:09:01 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [virtio-dev] VIRTIO adoption in other hypervisors
Message-ID: <20200228110901.GB326000@stefanha-x1.localdomain>
References: <87mu93vwy2.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87mu93vwy2.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Wei Liu <liuw@liuw.name>, virtio-dev@lists.oasis-open.org,
 Stefano Stabellini <sstabellini@kernel.org>, jan.kiszka@siemens.com,
 virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============3725215894259064836=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============3725215894259064836==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline

--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 10:16:21AM +0000, Alex Benn=E9e wrote:
> I'm currently trying to get my head around virtio and was wondering how
> widespread adoption of virtio is amongst the various hypervisors and
> emulators out there.
>=20
> Obviously I'm familiar with QEMU both via KVM and even when just doing
> plain emulation (although with some restrictions). As far as I'm aware
> the various Rust based VMMs have vary degrees of support for virtio
> devices over KVM as well. CrosVM specifically is embracing virtio for
> multi-process device emulation.
>=20
> I believe there has been some development work for supporting VIRTIO on
> Xen although it seems to have stalled according to:
>=20
>   https://wiki.xenproject.org/wiki/Virtio_On_Xen
>=20
> Recently at KVM Forum there was Jan's talk about Inter-VM shared memory
> which proposed ivshmemv2 as a VIRTIO transport:
>=20
>   https://events19.linuxfoundation.org/events/kvm-forum-2019/program/sche=
dule/
>=20
> As I understood it this would allow Xen (and other hypervisors) a simple
> way to be able to carry virtio traffic between guest and end point.
>=20
> So some questions:
>=20
>   - Am I missing anything out in that summary?

VirtualBox has virtio-net support:
https://www.virtualbox.org/manual/ch06.html

>   - How about HyperV and the OSX equivalent?

macOS has *guest* drivers for VIRTIO devices:
https://www.kraxel.org/blog/2019/06/macos-qemu-guest/

Stefan

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5Y9M0ACgkQnKSrs4Gr
c8gGwQf+PfpzqW9HhG0kQEVMOWxfC8rWQdXg5yEAwshyMsdbOIHqoQG4X3FlBWXK
nwtSHkasfTyAUh/pW988T1g2kA9WUSs6nOlt8XRUWquGqTzH9wAKMcvIEc9BORsH
gsM/txLsD1WLZskugxnPwSdgqQCeM4djIIowD+UbzBd8uKI/N5uT4mnNBJR3+GCk
xhO/fe3cKE63k1AX0vrlariLvUL50KcrKo2fED+bqu6TnvZidDC1L03KYtzQ8e+e
zPAbIkm1WI8X7eiirIohd/PfNhtlc8xekyldmI6LyABxKYYaxrVC8alXQC4AIoFv
q1jyylUHQgL9B4B0lH2/Y27SF6w0Ow==
=8rQ2
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--


--===============3725215894259064836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3725215894259064836==--

