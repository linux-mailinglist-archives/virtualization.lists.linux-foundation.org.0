Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3535BF0D
	for <lists.virtualization@lfdr.de>; Mon,  1 Jul 2019 17:08:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0FF1F498A;
	Mon,  1 Jul 2019 15:08:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1C38E45DA
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 15:08:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9C70B832
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 15:08:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n4so14295237wrs.3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 01 Jul 2019 08:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LrbpjkQWerlunh+jeg3XioAotSIW/UwN3t21/vc60iI=;
	b=JXWwK7v6XEcs0OcGV8++JG1skKr/kr821hTyDG9c7CSJo5gWT5oFllmVtyWXK8FXFj
	yf3FfYlSQ51/rEml0Fzx/WmfBKNx3Ut/mbSvITyYvbM5pY6iEdE0BcBprLybJ3hA/LZg
	qiDdj3fOXQiNGT43YPcVPWeL21JoKL7VMRST43yF93hIzxie87lb5+8UwQY+jmXfU3hY
	TUJG19mgj3lF5yWOZI77MANVBqYIdwTwAgO6rE0cGt7Y6oqOsVIvH3lbvanjfv3QRBaX
	u1nhRbZusAzjFGsfNgQuqJe3bWWz+jk6sK6u5c0ZiYhy/2FdHPN0AFOL8ulY5sEBgieX
	Ae1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LrbpjkQWerlunh+jeg3XioAotSIW/UwN3t21/vc60iI=;
	b=NnMilOWcIV757VBFpRSj2KZiwPcQz4ieyyGoKbarBJWbW1t7r3bHlC4CK3p/ZUkGgk
	kTndUXK5JCZIHt74NO7WSTfSmKWmR50jqAz3qSd+SXk2ZY7skE6sA1aO8Ba2n82SfGlN
	PUpu6KpOSCK70TSbFgrqmr26AWUgcL5IPNFvYxDC+1xY8IDxY8UTbSR1fGN3hjZI/4UY
	04uA1cGmbfG2KFxNuQS3q6LGlnu7mCkzHzxjNlaKr+A+R81+vXs4VoSWfVKihc+TR44A
	7Nd1eXzB0waAaX6khjo6bwiGZoE39RcB7AvBJFQCoau3BVi2e8tgNW4BbFMnxr+WRiF2
	ztkQ==
X-Gm-Message-State: APjAAAWo93JiqOEi0MOB08CLgAPOTbHiqove0BS/pf1+sKhPU2TTnoUC
	oKQxeI/PzKeQPnpJ4heREpA=
X-Google-Smtp-Source: APXvYqzZdW0/Y4hmwKKDz/2X7Q0VwEU4tO5q2PLye3hB7/1KoFP9nEEiTBMs9FfvVZZ33rZ/AahFwA==
X-Received: by 2002:a5d:4992:: with SMTP id r18mr19297196wrq.107.1561993716303;
	Mon, 01 Jul 2019 08:08:36 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	n125sm15427370wmf.6.2019.07.01.08.08.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 08:08:35 -0700 (PDT)
Date: Mon, 1 Jul 2019 16:08:34 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 3/3] vsock/virtio: fix flush of works during the
	.remove()
Message-ID: <20190701150834.GB11900@stefanha-x1.localdomain>
References: <20190628123659.139576-1-sgarzare@redhat.com>
	<20190628123659.139576-4-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190628123659.139576-4-sgarzare@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
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
Content-Type: multipart/mixed; boundary="===============5623369206675976036=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============5623369206675976036==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 02:36:59PM +0200, Stefano Garzarella wrote:
> This patch moves the flush of works after vdev->config->del_vqs(vdev),
> because we need to be sure that no workers run before to free the
> 'vsock' object.
>=20
> Since we stopped the workers using the [tx|rx|event]_run flags,
> we are sure no one is accessing the device while we are calling
> vdev->config->reset(vdev), so we can safely move the workers' flush.

What about send_pkt and loopback work?  How were they stopped safely?

For example, if send_pkt work executes then we're in trouble since it
accesses the tx virtqueue which is deleted by ->del_vqs().

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0aIfIACgkQnKSrs4Gr
c8iHxwf/f/ztZPmFyV30cfT2/l/WmLT+ofdX6M4X2Z7eEb3qolhp0sYuGZjAXdAP
FrEZY0n5LGLBskjM4s3HThB2uyV/ByLZPDBKuA7SszFKZWGbB/VgR7Z2BzDCaaz2
7HnJPZoeE7KzeCygCEQ7dneriR+/HgqEW6VZFlaOYX31Nv4X7hUYerrqwmcP9qS+
tMXxWcsEMjZi9bQFxr+MCZqEJoK/Xct0Yt0ssNUxNz6Uv/KAG7XIaRXP/f+GjHXy
Uyw/MJKpC4T3N+YwpR9xfGWvLK7NZqvuorr4JGqB8R49AODaYBJepjdxnd6OD8bY
qmeew3QFothoW6phvjI3A4uKJVsYvw==
=KE3u
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--

--===============5623369206675976036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5623369206675976036==--
