Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A12AB654
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 12:47:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 230722125;
	Fri,  6 Sep 2019 10:47:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9B1482116
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:47:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 611E7623
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:47:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F045D3086218;
	Fri,  6 Sep 2019 10:47:44 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63DDE19C70;
	Fri,  6 Sep 2019 10:47:39 +0000 (UTC)
Date: Fri, 6 Sep 2019 11:47:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 07/18] virtiofs: Stop virtiofs queues when device is
	being removed
Message-ID: <20190906104738.GO5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-8-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-8-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 06 Sep 2019 10:47:45 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: miklos@szeredi.hu, mst@redhat.com, linux-kernel@vger.kernel.org,
	dgilbert@redhat.com, virtio-fs@redhat.com, linux-fsdevel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============0437572114965404073=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============0437572114965404073==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="acOuGx3oQeOcSZJu"
Content-Disposition: inline


--acOuGx3oQeOcSZJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 03:48:48PM -0400, Vivek Goyal wrote:
> Stop all the virt queues when device is going away. This will ensure that
> no new requests are submitted to virtqueue and and request will end with
> error -ENOTCONN.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--acOuGx3oQeOcSZJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1yOUoACgkQnKSrs4Gr
c8hIyQf/VEB8Z1kkLZJY07A6TpGDbf4zwdPwITwfIrZm8CV5Muj+9w7GN5o9QylC
HcWecFIGEfC3JXeQdRnq/5rLiAhKXgFkAXo9qkS7uVwLSR1YS+iutJksY2M0V6z0
sYo8cHSn4X5umbDMrnvlasCdLLAj3IKtaBmHYr8Cm9kOBMLl+H/n77Pvdr36qsoK
BUNaNZtkGMFtKf+n7nJA1BXi/h+G3RhB6o1hyzdTF0VPLm0muWZda5jgc2cXTHnf
gQBGQiO/TqCt3bwqiS/fJLIW38/XcDy683UCXkEJiaXcLwX0LgwfHM1zPAVHyx/v
plygJH26nFKCsOQ2j9GueL6YA3uB2g==
=VU0e
-----END PGP SIGNATURE-----

--acOuGx3oQeOcSZJu--

--===============0437572114965404073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0437572114965404073==--
