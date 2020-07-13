Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D23AE21D2C4
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 11:28:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8674F89381;
	Mon, 13 Jul 2020 09:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FHuFSiRFBJNy; Mon, 13 Jul 2020 09:28:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F186C89188;
	Mon, 13 Jul 2020 09:28:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC27EC08A0;
	Mon, 13 Jul 2020 09:28:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB465C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 09:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C74131FEBF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 09:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id duUET6oXjyoD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 09:28:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id E5D2B1FE2F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594632527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P+elYLgq2j5qUQKLLEoBv4e9Ba57OCTVDx1n9MkHwGc=;
 b=Shu73sr1Ai4RiNhJTbavFg9vCUiYk4KN3C2ONoNz0PeeV4QgzMJZcui+02mLg8YhZyAaGR
 7P1cuEEVcGspfE6i3EDUvtU9COxrBkP/fhOOFNxqBhY6MCau5V9tkZJ+XHHIl28SCtXW6+
 E/bZLZomk4MtsiteAgyVL/+hixGbx9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-FwrGlKyLNL-IwTkG1UdoMw-1; Mon, 13 Jul 2020 05:28:45 -0400
X-MC-Unique: FwrGlKyLNL-IwTkG1UdoMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 085F51080;
 Mon, 13 Jul 2020 09:28:44 +0000 (UTC)
Received: from localhost (ovpn-114-66.ams2.redhat.com [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3B3D74F44;
 Mon, 13 Jul 2020 09:28:40 +0000 (UTC)
Date: Mon, 13 Jul 2020 10:28:39 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vsock/virtio: annotate 'the_virtio_vsock' RCU pointer
Message-ID: <20200713092839.GD28639@stefanha-x1.localdomain>
References: <20200710121243.120096-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200710121243.120096-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net
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
Content-Type: multipart/mixed; boundary="===============1989179793615063646=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============1989179793615063646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YToU2i3Vx8H2dn7O"
Content-Disposition: inline

--YToU2i3Vx8H2dn7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2020 at 02:12:43PM +0200, Stefano Garzarella wrote:
> Commit 0deab087b16a ("vsock/virtio: use RCU to avoid use-after-free
> on the_virtio_vsock") starts to use RCU to protect 'the_virtio_vsock'
> pointer, but we forgot to annotate it.
>=20
> This patch adds the annotation to fix the following sparse errors:
>=20
>     net/vmw_vsock/virtio_transport.c:73:17: error: incompatible types in =
comparison expression (different address spaces):
>     net/vmw_vsock/virtio_transport.c:73:17:    struct virtio_vsock [noder=
ef] __rcu *
>     net/vmw_vsock/virtio_transport.c:73:17:    struct virtio_vsock *
>     net/vmw_vsock/virtio_transport.c:171:17: error: incompatible types in=
 comparison expression (different address spaces):
>     net/vmw_vsock/virtio_transport.c:171:17:    struct virtio_vsock [node=
ref] __rcu *
>     net/vmw_vsock/virtio_transport.c:171:17:    struct virtio_vsock *
>     net/vmw_vsock/virtio_transport.c:207:17: error: incompatible types in=
 comparison expression (different address spaces):
>     net/vmw_vsock/virtio_transport.c:207:17:    struct virtio_vsock [node=
ref] __rcu *
>     net/vmw_vsock/virtio_transport.c:207:17:    struct virtio_vsock *
>     net/vmw_vsock/virtio_transport.c:561:13: error: incompatible types in=
 comparison expression (different address spaces):
>     net/vmw_vsock/virtio_transport.c:561:13:    struct virtio_vsock [node=
ref] __rcu *
>     net/vmw_vsock/virtio_transport.c:561:13:    struct virtio_vsock *
>     net/vmw_vsock/virtio_transport.c:612:9: error: incompatible types in =
comparison expression (different address spaces):
>     net/vmw_vsock/virtio_transport.c:612:9:    struct virtio_vsock [noder=
ef] __rcu *
>     net/vmw_vsock/virtio_transport.c:612:9:    struct virtio_vsock *
>     net/vmw_vsock/virtio_transport.c:631:9: error: incompatible types in =
comparison expression (different address spaces):
>     net/vmw_vsock/virtio_transport.c:631:9:    struct virtio_vsock [noder=
ef] __rcu *
>     net/vmw_vsock/virtio_transport.c:631:9:    struct virtio_vsock *
>=20
> Fixes: 0deab087b16a ("vsock/virtio: use RCU to avoid use-after-free on th=
e_virtio_vsock")
> Reported-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  net/vmw_vsock/virtio_transport.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--YToU2i3Vx8H2dn7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8MKUcACgkQnKSrs4Gr
c8iLnAf9E+pOReZB1uxaaxHt2z9HjKmxjs6nY1gK0E/aNHGD4C4ZQFpkMMYrgACn
mTAJbmWJG/694IDC1i803aGbRKIq0VIyrezJtZWH7e8KTMG77U1YEDUr/T6yTAqf
MYrz9ylRKbEHjzAmRQtnQGJ/YtshXFVHISJf6maySSPuHHInz+n/rUlXFxxmrOme
x8cvGFTQ71RZUEWpIQxTL2vp4BEob1aIvrrFREvqgR9Xh4W1ZV641dP50QqjkJf9
ebLfHIpb+n9ZrYNa/+WwEZvMhw8r+hWA3giUXEuSwkGZkoi9s5d6WfZYeU7Lcbr7
0VLfCa/y5QsWouWZkkMZ7nLfxrMEsg==
=2Mf5
-----END PGP SIGNATURE-----

--YToU2i3Vx8H2dn7O--


--===============1989179793615063646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1989179793615063646==--

