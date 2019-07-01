Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D06E25BF15
	for <lists.virtualization@lfdr.de>; Mon,  1 Jul 2019 17:09:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 771344AB8;
	Mon,  1 Jul 2019 15:09:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B1DE74AA9
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 15:09:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 656DF832
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 15:09:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p11so3071672wro.5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 01 Jul 2019 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4C4Lsu6+V7qtjWkraF0dM4sZxy290UNJTs54g0izEto=;
	b=jjR9NZKB2J5/AEFttizEwb76mDO1keVW74L2qvV94wb2MYoEgGQ2FmJJO6m2v2i1uI
	VTr/XTqh3KP1/Pjupv/aIg8YHlosim/e+iutOtUlbzUoW+n3TxBV2VH8nkaYfTsuW5UJ
	iSSYHGJa0TF0ekiYvyw+pdGjm00UC3LwcuyYYaxUlR3TbTguwCTshvLIFIJ8xrIxNveL
	oV1EsrJjIU4Kw/t8NEThDleWzCxn7r/jJL+qDXXc4VHK4bSJO49XDhPAF3/nx2042pgK
	7S4mAqFogQNpr1pxh7NQMmm+xoxOL7yoVpssGiFHd7XVOKsFn/EyirIjqS9IuiPd5Vw+
	rStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4C4Lsu6+V7qtjWkraF0dM4sZxy290UNJTs54g0izEto=;
	b=ZAlJx3txquoQU2uJn6t+n+yVV1I7bM1bkfv8X1Nh95DJDPSOr9oUiAbXuwFRmIzAj4
	F5mTYrDVMNYMmM14bAYurv7zWFTQvCHqOrmufO3XIVX4EZg9AZIKKYB3C1UN98g44uYe
	9PWFfPTvrBavU77ysynIMgaQZA/Q/XxVAlsa4Nquk3761RF/WF7YMubaxsJISuaJOOB0
	7u/2tP6sIL2Eonx3CnSotHFmYeusekg7Bb746FD09SpUWQzxXIIL4UrGOSatnyIj3R42
	iK+3EvpM2Pggf9SvelM0Xp658oVmbjQBOde+3B6qbL5OZ3xOS5b15Pt1788m23xIsqHK
	YKrw==
X-Gm-Message-State: APjAAAUWDZJd9gTbAukvClHyj8qcx7wpjybBqxQ2p2WL9GULhgeo2kCi
	TWcn13jd5VeYbAWn4qqrkffeKNXxO0BKlA==
X-Google-Smtp-Source: APXvYqyEm9Wo0QZCeQ35gfCp9yrIfyCDfY+4RnpuaSdyIFpwVtBTECH0YXWHs+2sB5JZoKOcoo1TdQ==
X-Received: by 2002:adf:f589:: with SMTP id f9mr19949550wro.90.1561993772081; 
	Mon, 01 Jul 2019 08:09:32 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	z17sm10088062wru.21.2019.07.01.08.09.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 08:09:31 -0700 (PDT)
Date: Mon, 1 Jul 2019 16:09:30 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 3/3] vsock/virtio: fix flush of works during the
	.remove()
Message-ID: <20190701150930.GC11900@stefanha-x1.localdomain>
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
Content-Type: multipart/mixed; boundary="===============8536416661845978402=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============8536416661845978402==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline


--s9fJI615cBHmzTOP
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
>=20
> Before the vdev->config->del_vqs(vdev), workers can be scheduled
> by VQ callbacks, so we must flush them after del_vqs(), to avoid
> use-after-free of 'vsock' object.

Nevermind, I looked back at Patch 2 and saw the send_pkt and loopback
work functions were also updated.  Thanks!

Stefan

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0aIioACgkQnKSrs4Gr
c8gVvwgAlt7pHdcde/naMvD5PfdMiGprB/OgOkcK9tf8VKz5xBE7qoJwvBTlAhve
22I66Q75nW7fhsMkGMn6g1wkNQDxc0aG/jPhVy1JHx/Y3NDmXvqHF0joilOYNSsm
ryxStJrhsY+0+Jpff3uPnmNKgbBJzWdzGnmn3fXIl+E3PrkvLy672DebqpaoXOr0
ISdOZG+VUuVtoVkUl90lc2uzXMY6j4s986/zPdAwnGZsI4N+GGx6Sbnb03C8h6xP
3ovvhQMqwltt+5w6qDXKpowK7L62a7EkaSPrF4Zt+y9sJudpQ6ZXMQ+J1EsbdMx/
rzsxB4KWcyBsQm2kzgSa2FmwBOPiow==
=w4hz
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--

--===============8536416661845978402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8536416661845978402==--
