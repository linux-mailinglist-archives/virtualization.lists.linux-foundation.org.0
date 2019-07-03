Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4565E0BB
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 11:16:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A9A4F1163;
	Wed,  3 Jul 2019 09:16:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6289A115C
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 09:14:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CB104854
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 09:14:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p13so1857527wru.10
	for <virtualization@lists.linux-foundation.org>;
	Wed, 03 Jul 2019 02:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lMART3am9pWyOxnMhWlb45/gJVQGInIr11h4R6xfxH4=;
	b=f2qyXvKO8+f+AuUjin7CqwXeE0Ga3HeWuyEYBaaGc+UwaFejqxHfryHROkXHME8FVm
	6cPDGURKrLajBSDB5utM0xsCZaUabbFOrG+2XFvmbYZUHrxr3vgl1DOVYBYhg9Gp3Fke
	bDwJtfXwC47tA8rOx0XMa7+yoHyrS/9KvykBXxpgXpz3j9fFzrJUg1J4F+ipFHFCrawG
	2nJ0Cm+iBz3IRm9WIYGSwS+QYx1YPn8rZ/k8Am5vZwXO5dJVcHjg/fEcHlZ9QDVUxwQ2
	NXgh3/xHAgoeUv7K6QLjQlwN9YUIFsd5zHBiSp26KsLJaLDUOUZkGrLkO/XEtcHuMLd3
	2R4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lMART3am9pWyOxnMhWlb45/gJVQGInIr11h4R6xfxH4=;
	b=CPvaG564tWgVDqPKy6bkMQprr/FtiqfzuRrLpW0VNiczQtwSUKgKZZPF9oERW2WOhW
	dHE2IitHyTPb5UP0eny8Qe3jULLDa3f2U0/JdE95Dg7P/YPe35pT6jv82Y/WrdNJ0jEC
	EKR23oHNw5Yw3cZsqzc0OvPSsWT8MKjud3+2ekUTJKbjgvNrUPYVgfJaksEHAqkkUHkF
	NyX4eq9fNRWqGQXenNuuM20JvAg7kYJRQXs1OplEjMjhZg+7IvQ7HPFykszByFoxfGn8
	3PlVQvNFXLuLMJtvNTaOSZkjN8H6tKV3eLP3A/SBZETmndFuO/TavC8TxwiDZ+ZgP5EY
	HokA==
X-Gm-Message-State: APjAAAUcJX7b3y447OZZaF+qaF44Og04vqroKt2+wzzQZ5jW3lfc4M5Z
	hYrwmd8wIp2aU7YOHJPHAic=
X-Google-Smtp-Source: APXvYqzasBfYpcZTJ2DlrlFwe3DY2hUvRtKYYQff/WD1ChvV/9imQB0Ha2M7v94UGw7/KW2Dc9TQZQ==
X-Received: by 2002:adf:e803:: with SMTP id o3mr4360588wrm.69.1562145295443;
	Wed, 03 Jul 2019 02:14:55 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id b2sm1921496wrp.72.2019.07.03.02.14.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Jul 2019 02:14:54 -0700 (PDT)
Date: Wed, 3 Jul 2019 10:14:53 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 0/3] vsock/virtio: several fixes in the .probe() and
	.remove()
Message-ID: <20190703091453.GA11844@stefanha-x1.localdomain>
References: <20190628123659.139576-1-sgarzare@redhat.com>
	<20190701151113.GE11900@stefanha-x1.localdomain>
	<20190701170357.jtuhy3ank7mv6izb@steredhat>
MIME-Version: 1.0
In-Reply-To: <20190701170357.jtuhy3ank7mv6izb@steredhat>
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
Content-Type: multipart/mixed; boundary="===============4343557009544201301=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============4343557009544201301==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2019 at 07:03:57PM +0200, Stefano Garzarella wrote:
> On Mon, Jul 01, 2019 at 04:11:13PM +0100, Stefan Hajnoczi wrote:
> > On Fri, Jun 28, 2019 at 02:36:56PM +0200, Stefano Garzarella wrote:
> > > During the review of "[PATCH] vsock/virtio: Initialize core virtio vs=
ock
> > > before registering the driver", Stefan pointed out some possible issu=
es
> > > in the .probe() and .remove() callbacks of the virtio-vsock driver.
> > >=20
> > > This series tries to solve these issues:
> > > - Patch 1 adds RCU critical sections to avoid use-after-free of
> > >   'the_virtio_vsock' pointer.
> > > - Patch 2 stops workers before to call vdev->config->reset(vdev) to
> > >   be sure that no one is accessing the device.
> > > - Patch 3 moves the works flush at the end of the .remove() to avoid
> > >   use-after-free of 'vsock' object.
> > >=20
> > > v2:
> > > - Patch 1: use RCU to protect 'the_virtio_vsock' pointer
> > > - Patch 2: no changes
> > > - Patch 3: flush works only at the end of .remove()
> > > - Removed patch 4 because virtqueue_detach_unused_buf() returns all t=
he buffers
> > >   allocated.
> > >=20
> > > v1: https://patchwork.kernel.org/cover/10964733/
> >=20
> > This looks good to me.
>=20
> Thanks for the review!
>=20
> >=20
> > Did you run any stress tests?  For example an SMP guest constantly
> > connecting and sending packets together with a script that
> > hotplug/unplugs vhost-vsock-pci from the host side.
>=20
> Yes, I started an SMP guest (-smp 4 -monitor tcp:127.0.0.1:1234,server,no=
wait)
> and I run these scripts to stress the .probe()/.remove() path:
>=20
> - guest
>   while true; do
>       cat /dev/urandom | nc-vsock -l 4321 > /dev/null &
>       cat /dev/urandom | nc-vsock -l 5321 > /dev/null &
>       cat /dev/urandom | nc-vsock -l 6321 > /dev/null &
>       cat /dev/urandom | nc-vsock -l 7321 > /dev/null &
>       wait
>   done
>=20
> - host
>   while true; do
>       cat /dev/urandom | nc-vsock 3 4321 > /dev/null &
>       cat /dev/urandom | nc-vsock 3 5321 > /dev/null &
>       cat /dev/urandom | nc-vsock 3 6321 > /dev/null &
>       cat /dev/urandom | nc-vsock 3 7321 > /dev/null &
>       sleep 2
>       echo "device_del v1" | nc 127.0.0.1 1234
>       sleep 1
>       echo "device_add vhost-vsock-pci,id=3Dv1,guest-cid=3D3" | nc 127.0.=
0.1 1234
>       sleep 1
>   done
>=20
> Do you think is enough or is better to have a test more accurate?

That's good when left running overnight so that thousands of hotplug
events are tested.

Stefan

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0ccg0ACgkQnKSrs4Gr
c8hyTQgAmrtuLTRHUWq+SnSxTw9xESj0gUVZd4sbTh6S0V4rPGdVbra3YbPfZfkH
IaakopaoNOkTWrPnhYmwgU30HpR8IAq/y7clSCsRIfPUYDSZok/iyag75Cy5oKno
lVANXMQYQ4Kgkq07R+BER41HW3MELCrSAX57rIat1F1OD3KouG6YicgmP7wetWcU
HVXVfjP7u1a2lUmuBdlcgPKX05STySKyNEQ3QdtLI6bgM6rGkx8OYn38Qe9cQuyi
zVG7+8JLFoJav87vvcIIB0IT8ifWocctQY//efyVVnrfHN6T5/35TPcM4bBW8HrK
Zs+bh7qyccexuuow4DrBHexFCIdtCw==
=jl/1
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--

--===============4343557009544201301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4343557009544201301==--
