Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE7C202A0
	for <lists.virtualization@lfdr.de>; Thu, 16 May 2019 11:34:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 08277C11;
	Thu, 16 May 2019 09:34:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 78C2EB4B
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 09:34:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 48DB687C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 09:34:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C61E8307D945;
	Thu, 16 May 2019 09:33:56 +0000 (UTC)
Received: from localhost (ovpn-117-183.ams2.redhat.com [10.36.117.183])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC6A9608A6;
	Thu, 16 May 2019 09:33:53 +0000 (UTC)
Date: Thu, 16 May 2019 10:33:52 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net 3/4] vhost: vsock: add weight support
Message-ID: <20190516093352.GQ29507@stefanha-x1.localdomain>
References: <1557992862-27320-1-git-send-email-jasowang@redhat.com>
	<1557992862-27320-4-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1557992862-27320-4-git-send-email-jasowang@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 16 May 2019 09:33:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, pbonzini@redhat.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0508861305249481839=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============0508861305249481839==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AFQGHouA0VN8Ovbt"
Content-Disposition: inline


--AFQGHouA0VN8Ovbt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 03:47:41AM -0400, Jason Wang wrote:
> @@ -183,7 +184,8 @@ static struct vhost_vsock *vhost_vsock_get(u32 guest_=
cid)
>  		virtio_transport_deliver_tap_pkt(pkt);
> =20
>  		virtio_transport_free_pkt(pkt);
> -	}
> +		total_len +=3D pkt->len;

Please increment total_len before virtio_transport_free_pkt(pkt) to
avoid use-after-free.

--AFQGHouA0VN8Ovbt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzdLoAACgkQnKSrs4Gr
c8garggAkwbbSkEoposz2FA5FIKLYtHjdQpn8NA8HSvaFqi/DcE0ejKYtN/BImRo
9Sed+GFqfzmP9ZIQni5Sh0boykMdrp8ZqK4JcFS4tTXZ4Ac0Smob4EA15WxIFX+p
H35N34MvKnfTivYZKoezEXqFiiz8re5znN+PgUWWz1u/gOqK1XfmPayal3nP/c4v
D3EYs+vIa4zOUsNI7g7Mn/KUG6z7kpMFsCKLzWWuInPsdFzKX3tE+xo907y8vlVX
vympegUH07yJlISmuaTfKi2r2AmGOJEXq6nh1L4mIkHRVconV0GcU+Q33OT546Mq
putACagRBiMVZtgw3+Fppx1fb9SvfA==
=mlka
-----END PGP SIGNATURE-----

--AFQGHouA0VN8Ovbt--

--===============0508861305249481839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0508861305249481839==--
