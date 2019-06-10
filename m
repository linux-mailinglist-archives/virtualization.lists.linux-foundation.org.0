Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1633B5C8
	for <lists.virtualization@lfdr.de>; Mon, 10 Jun 2019 15:09:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DE5CAC4E;
	Mon, 10 Jun 2019 13:09:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 356B6A49
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 13:09:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AB996174
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 13:09:49 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 22so8107754wmg.2
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4DTSuD5WBGBvupNhJtP3X0Pc53PYOTtYrnYbVQidS54=;
	b=Lhn0ve90gOkQsFNoUq6NsPitucSAfMzJxr+bMtR0Fy93dV4FXxbHrupltTorx1cRml
	S7jw6pOe/nl3Pyxr9FVdEequ1Y7K6LfIei+xG2aexjPIwid6Rk9RdW5QHjMw8XYV2qwm
	4L3OIQiP9vwy78cyYtlV2kDtggd/3d3oZgKNdxtOqvWmM5vGCx0s453e6b1BWOF4UOB8
	j5FbNkFK4dY35c4LaTAmAd2hAwtj9hCY+COfkdvqX54jPdZKFK9UIMMmw+jrlBwT47hb
	ei3Vnu7/biVrLn9knWKVbkL5HL4OySxvlhzuFew/PpnLbfuMiD68f97oDK/HvNpMwPIo
	uuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4DTSuD5WBGBvupNhJtP3X0Pc53PYOTtYrnYbVQidS54=;
	b=qhkmDwOHrifgDOUABK7icDi1WlNwZft8OVk1m3CiDP7y++LdU4buY0vY8HYN0HWcV8
	jNlkzbaHm0Xs2cR3ER/VeCNs2Lk4PHgDoR3OXjN3CYptiipUtafU+uLcWSeAFVU9OxZy
	6hnsSm2meDKmQKuITUyQdkYal/bKUcWmuP7HGkSHRCvU4DdVz/yTCW26RjET5aDI6p7a
	SsMT1zaiibAwmxGTYWJvMYZnTs7GA9tk2hls2KikfZunaBESrGmdroUBgEpZr+Tddz2R
	0eeB4VH96TteBQnHu+jO0IBCWNC99fMCA0OMSwcyvNOTUc8qVToVjiZ6804gHnyq1NZL
	DyiA==
X-Gm-Message-State: APjAAAXSa8qR93alDyFoQF90AXXBkheneEz6xGaKWiUUs09yeUfJas3b
	/DZ0DCgBtyHaZtcu3jFd+TE=
X-Google-Smtp-Source: APXvYqx/F1dQJ0k5OUzGxSXySawThyB31BH3NgObyoZRbmpPbYFJ32PH66RsXKRDbKn0+lh0foPMcg==
X-Received: by 2002:a1c:7d13:: with SMTP id y19mr13177531wmc.21.1560172187613; 
	Mon, 10 Jun 2019 06:09:47 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	g8sm10876816wmf.17.2019.06.10.06.09.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 10 Jun 2019 06:09:46 -0700 (PDT)
Date: Mon, 10 Jun 2019 14:09:45 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 0/4] vsock/virtio: several fixes in the .probe() and
	.remove()
Message-ID: <20190610130945.GL14257@stefanha-x1.localdomain>
References: <20190528105623.27983-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190528105623.27983-1-sgarzare@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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
Content-Type: multipart/mixed; boundary="===============2271529800197618317=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============2271529800197618317==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Swj79WlilW4BQYVz"
Content-Disposition: inline


--Swj79WlilW4BQYVz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 12:56:19PM +0200, Stefano Garzarella wrote:
> During the review of "[PATCH] vsock/virtio: Initialize core virtio vsock
> before registering the driver", Stefan pointed out some possible issues
> in the .probe() and .remove() callbacks of the virtio-vsock driver.
>=20
> This series tries to solve these issues:
> - Patch 1 postpones the 'the_virtio_vsock' assignment at the end of the
>   .probe() to avoid that some sockets queue works when the initialization
>   is not finished.
> - Patches 2 and 3 stop workers before to call vdev->config->reset(vdev) to
>   be sure that no one is accessing the device, and adds another flush at =
the
>   end of the .remove() to avoid use after free.
> - Patch 4 free also used buffers in the virtqueues during the .remove().
>=20
> Stefano Garzarella (4):
>   vsock/virtio: fix locking around 'the_virtio_vsock'
>   vsock/virtio: stop workers during the .remove()
>   vsock/virtio: fix flush of works during the .remove()
>   vsock/virtio: free used buffers during the .remove()
>=20
>  net/vmw_vsock/virtio_transport.c | 105 ++++++++++++++++++++++++++-----
>  1 file changed, 90 insertions(+), 15 deletions(-)

Looking forward to v2.  I took a look at the discussion and I'll review
v2 from scratch.  Just keep in mind that the mutex is used more for
mutual exclusion of the init/exit code than to protect the_virtio_vsock,
so we'll still need protection of init/exit code even with RCU.

Stefan

--Swj79WlilW4BQYVz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlz+VpkACgkQnKSrs4Gr
c8gjIAf5AWLeKzDJN89IePr9aSiIQg5UqFqV3MQyrKA4CEklt/RqqcNc5/56tDEy
bvy+2q8wvJ7/OiMV5W11mpCpeLFDR9h4pggfExa/lWg5l+XYFVYD5Zelym/k5KPk
6M0hgDooBw4fm9rL2LalhQTTseflHIlXEdZK29E1lwX2em55BofBt5gRnk943uFm
Su0p8R1u9Jjqe8cypBWNMEIdfJtGhi8Mcs4RYfm/YDmYpyYyOWp5T47VTth0h6Mw
sJdCIlTi4tHHZSH53bZyjPJ8Hl7+kSh2afiMRgzNvuLPyNVhQEGzVWZd5svlNim/
u1Px/8wo39dQECN0sS0MNY07nG327w==
=Jv/l
-----END PGP SIGNATURE-----

--Swj79WlilW4BQYVz--

--===============2271529800197618317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2271529800197618317==--
