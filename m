Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD4C2A00DD
	for <lists.virtualization@lfdr.de>; Fri, 30 Oct 2020 10:11:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E5EB1868C1;
	Fri, 30 Oct 2020 09:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2RaUuFVUvba6; Fri, 30 Oct 2020 09:11:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 34486868A9;
	Fri, 30 Oct 2020 09:11:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07851C1AD5;
	Fri, 30 Oct 2020 09:11:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 041C3C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 09:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E04B786D85
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 09:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4jMpSW7MTB5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 09:11:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0F1A886CE0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 09:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604049067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vEjyFFVdDRI1CvpF5KW9IORpE6DZMofZZiWLmGCXiyM=;
 b=E16ecNlk9tQ8qa9hkJmX/ZOhU1COnGjoaXrnsoboZ7poTmZpUmdl0d1zRmLzLQ4J4kiySa
 ibQd7s+fKGJ3ifvjPQ+l/MO+FSespHfvz1hEaCXS45xymAh5AL89XvsQkPSZFC7aIhXqEm
 qi/1vsUDX1zrvAqcvzWlNMgDekObVTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-1n2DHti4PbGQTv2He3_xlA-1; Fri, 30 Oct 2020 05:11:03 -0400
X-MC-Unique: 1n2DHti4PbGQTv2He3_xlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11A821006C9B;
 Fri, 30 Oct 2020 09:11:02 +0000 (UTC)
Received: from localhost (ovpn-113-41.ams2.redhat.com [10.36.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A163019C71;
 Fri, 30 Oct 2020 09:10:58 +0000 (UTC)
Date: Fri, 30 Oct 2020 09:10:57 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vhost/vsock: add IOTLB API support
Message-ID: <20201030091057.GB307361@stefanha-x1.localdomain>
References: <20201029174351.134173-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201029174351.134173-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============7242168246235609122=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============7242168246235609122==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 06:43:51PM +0100, Stefano Garzarella wrote:
> This patch enables the IOTLB API support for vhost-vsock devices,
> allowing the userspace to emulate an IOMMU for the guest.
>=20
> These changes were made following vhost-net, in details this patch:
> - exposes VIRTIO_F_ACCESS_PLATFORM feature and inits the iotlb
>   device if the feature is acked
> - implements VHOST_GET_BACKEND_FEATURES and
>   VHOST_SET_BACKEND_FEATURES ioctls
> - calls vq_meta_prefetch() before vq processing to prefetch vq
>   metadata address in IOTLB
> - provides .read_iter, .write_iter, and .poll callbacks for the
>   chardev; they are used by the userspace to exchange IOTLB messages
>=20
> This patch was tested with QEMU and a patch applied [1] to fix a
> simple issue:
>     $ qemu -M q35,accel=3Dkvm,kernel-irqchip=3Dsplit \
>            -drive file=3Dfedora.qcow2,format=3Dqcow2,if=3Dvirtio \
>            -device intel-iommu,intremap=3Don \
>            -device vhost-vsock-pci,guest-cid=3D3,iommu_platform=3Don
>=20
> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg09077.html
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  drivers/vhost/vsock.c | 68 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+b2KEACgkQnKSrs4Gr
c8heawf7BlGCmdi/Ph7QeU55JSh58NjuVO52mV385qiSfOFHZhlEhfLdm0ZoP4GR
OY+LpLUr4g+AkSEYXKh1zOFWnsll0nE1AlTKjX/W13BYTLxgJyca/4cPYU2IkrRA
dYgf0RDKPTWqrkykyN+WQZg3X37Lf6Lnbb9ScSuGAkfgYln6Lsx+k5RuJyS7yhRS
zqjA8mtUZRHlWrhZIg85pRqpE8plGYzw7MDccxQ+V139YskPek6nPXC1/5Mrqqyg
bSBx5i21oD/hWzwaOZTv7Ux/4vdJV6qPNQCRcwGy0TXUwayHY1YolhfYnBtE+0e0
GD/hy5jYsYaCgOcp7o604sYccTV6tg==
=+iwf
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--


--===============7242168246235609122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7242168246235609122==--

