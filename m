Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A71355BF22
	for <lists.virtualization@lfdr.de>; Mon,  1 Jul 2019 17:11:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 359CE4ACA;
	Mon,  1 Jul 2019 15:11:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D83224AC4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 15:11:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 92203832
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 15:11:16 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u8so16352235wmm.1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 01 Jul 2019 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9xME/dQa3QW6saF5XzkO2xPu/1eCliqT/qMLby1c/tY=;
	b=M7oxNk7yb8y0npITu6/6x5XUuAxp5CL/wYMEJocISp1scrqJydrfAFS6U+09TKHr9p
	iIb00LgXaL58BlXvlHPCAjRQHq3BZAajKKjMb4DEJvY1bEYmY+TtUVmEKikHc0ErlFb/
	eDEUAUXSz92o1NvqdmS20RLz/4M3pAar68DgsSZ0ybicz8RPkhd580I81hlJpQQww7zr
	SG5Ogg9c0lYBhO0pL8kJb4+rtvaGmWaa14cZQAQcFFwgfPn0YthNd/jQ49tKSUb8WyFN
	TBMHh4zDoGfPKD9WK2gTW3OQVe077CD9g0GbAZ2IlbOQ20UdQiqX7/I1SfY4h+IRDAUd
	TXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9xME/dQa3QW6saF5XzkO2xPu/1eCliqT/qMLby1c/tY=;
	b=uNP9ovYPRWHKCFvyxWpQd8nqzFy/DaC6w+ufgo1WG5Fx9h+ihdveXVuSXBe22SsL9v
	u/VOfc8o9+PYHT20Z4/hjH0t+YGFffDXoxoxgRfcvqsRdHVGqTvyY9Oi78kR87Hrfnb/
	SkqvGGXeSZLGacckNbEBldb0bHQcLwd0iCB3jRr70OyV1H5BC3bo040jvEiWA2tvwTwz
	+Pirn/AmrUW881nZNHSbE3iOFEXJzkcHD5sE8oU/Q8xXUmtvBp4IRqqedKMqWObcJTny
	ExcXmM2YQ6Npc5qQx0kTlEcHzURpD/mA65N/VyhmA8gEwUzTNm8GlmYhJvudLxtcGj35
	NEiw==
X-Gm-Message-State: APjAAAVhDrBpVeZZgBe0qQBsZaIYKzcJ1Sso2Hv/hMWDq0AN04WmcJL2
	2bdJ4m4tejzXv1gn23UZyu4=
X-Google-Smtp-Source: APXvYqwEROuH3gF+mKHMz0YaiB4ZhIyZrQHn4ihVqefXGC7rRJLV8rdnBmCcmdWk0wXCogNl81ebSA==
X-Received: by 2002:a1c:cf0b:: with SMTP id f11mr18204962wmg.138.1561993875263;
	Mon, 01 Jul 2019 08:11:15 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	g25sm9155251wmk.39.2019.07.01.08.11.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 08:11:14 -0700 (PDT)
Date: Mon, 1 Jul 2019 16:11:13 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 0/3] vsock/virtio: several fixes in the .probe() and
	.remove()
Message-ID: <20190701151113.GE11900@stefanha-x1.localdomain>
References: <20190628123659.139576-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190628123659.139576-1-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============4222670797951173493=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============4222670797951173493==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7LkOrbQMr4cezO2T"
Content-Disposition: inline


--7LkOrbQMr4cezO2T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 02:36:56PM +0200, Stefano Garzarella wrote:
> During the review of "[PATCH] vsock/virtio: Initialize core virtio vsock
> before registering the driver", Stefan pointed out some possible issues
> in the .probe() and .remove() callbacks of the virtio-vsock driver.
>=20
> This series tries to solve these issues:
> - Patch 1 adds RCU critical sections to avoid use-after-free of
>   'the_virtio_vsock' pointer.
> - Patch 2 stops workers before to call vdev->config->reset(vdev) to
>   be sure that no one is accessing the device.
> - Patch 3 moves the works flush at the end of the .remove() to avoid
>   use-after-free of 'vsock' object.
>=20
> v2:
> - Patch 1: use RCU to protect 'the_virtio_vsock' pointer
> - Patch 2: no changes
> - Patch 3: flush works only at the end of .remove()
> - Removed patch 4 because virtqueue_detach_unused_buf() returns all the b=
uffers
>   allocated.
>=20
> v1: https://patchwork.kernel.org/cover/10964733/

This looks good to me.

Did you run any stress tests?  For example an SMP guest constantly
connecting and sending packets together with a script that
hotplug/unplugs vhost-vsock-pci from the host side.

Stefan

--7LkOrbQMr4cezO2T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0aIpEACgkQnKSrs4Gr
c8g5Jgf9G47hJtpF3hJgsnc8qwgARpo4Lohr/kRFkPTC8LuzDXag2AES8zYJIA9E
R/ceQTEan3skEuPHBJEaRxTq0jpx9nKUL+LET20Z9HjmaCZFAMk/WnpYTAI/AZJj
89qIba5WlL9ba+ykkaW1rTBFKSRucoIdmN1sdE0cPR8S9zHSxLQN3C3WmFORXVMQ
nac3hTkbAr3g2twfAT3mcwKpmoODk2T1E0kyWHVXdTuTCr0KajxlZ/kWLRarbbYH
VucypkcnmbBnJ8rc6UXajx+C25ijyqJteBbBjMD8Z3RdeK43TIpNp7uFCyGDUipS
wwhzu5J3xB8hbhp3YtvK/+BTqfIAHg==
=Dzpp
-----END PGP SIGNATURE-----

--7LkOrbQMr4cezO2T--

--===============4222670797951173493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4222670797951173493==--
