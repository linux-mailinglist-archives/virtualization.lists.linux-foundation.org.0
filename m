Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2BD27C4F
	for <lists.virtualization@lfdr.de>; Thu, 23 May 2019 14:00:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7744CBA4;
	Thu, 23 May 2019 11:59:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E1DF6AF5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 11:59:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 918D47FB
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 11:59:53 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 15so5481101wmg.5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 04:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=L3mid2STVSIdD8eiNHxsdEidcq87IHDG6jiwp46vKQI=;
	b=GUlsD8QtCK4y8xNjTRgvBmAzYJeh3AvsKd2mwTDPkzNtQQjYLrMYQodh4M/Y5O6sRQ
	VJcoMQKG6pi97qUU1uC14TXPJjGVqHiMUBfq0ETaaUfBIMbD4x8nxmMKqGO/SBwCTBB3
	LoclFZcSgjS8adJYWDiMHwIEMVAfg4LjeLU27HMv2/B7CdBPz5KvB+p10QL/qWRNQmj0
	Z4W0MS4WLn8xoCvC+C+UniXGDmyhlf+hD4TPAXUDtnRVGj44b06Qofq5Q9gtbDaohJKS
	vJus6H7buR7dgwT1cXtpGNdsP7TzZpKHyJUUBQsKN0KWrYJKz74FauWho3sdBOiG41pQ
	+QzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=L3mid2STVSIdD8eiNHxsdEidcq87IHDG6jiwp46vKQI=;
	b=nROYe1gEFP7MgW/8nUzawfNProc7SUyOGI0IU6enf6dD/DJhHR8I68jI69RsrmkMho
	XxxQC6x9QtUIGv8pqb/Wu2S1ldXJtwNl3S2hVKZ0iFEttYC3zkjJnIMP1J4uzPzskEh2
	SGDMe2U995Nka6+bi3cm2Xo4PtuJKJ+3cA4pSYPjduP2WoaVZ8RPx2QcIUmYE8nSfJPz
	RGR4l6nO7rmBr/CwPWHth9XVys0oygPyBCPCL+0CvTQbbk+gfrERCmJFyVvhmXbWZ4MI
	2yUh7WwKcOlXXHlfnAXWKspa4mh1morh8mgefP09OPNtb3BuCUT2PZf8WIVleR0Fm/zp
	ZAsw==
X-Gm-Message-State: APjAAAVifQWAjZsu9p2c107R3vt91tp5w/D7Vn52A6vAW59KewlGwt1y
	p51ow3vyIvEaKyaa+fpto/g=
X-Google-Smtp-Source: APXvYqxR6Be+zenq7GFbSVZx3MBVQ+PtX/+Sdlr65Nnf4//E3fh2cAdrklzAyBYdROqEqIb3M1LGMA==
X-Received: by 2002:a1c:cf4c:: with SMTP id f73mr10886050wmg.118.1558612792215;
	Thu, 23 May 2019 04:59:52 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	m10sm9530008wmf.40.2019.05.23.04.59.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 04:59:51 -0700 (PDT)
Date: Thu, 23 May 2019 12:59:50 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [Qemu-devel] custom virt-io support (in user-mode-linux)
Message-ID: <20190523115950.GH26632@stefanha-x1.localdomain>
References: <0952696452f5ff4e38d2417029243fc60efa33d6.camel@sipsolutions.net>
MIME-Version: 1.0
In-Reply-To: <0952696452f5ff4e38d2417029243fc60efa33d6.camel@sipsolutions.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-um@lists.infradead.org, qemu-devel@nongnu.org,
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
Content-Type: multipart/mixed; boundary="===============0662405066914852243=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============0662405066914852243==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="82evfD9Ogz2JrdWZ"
Content-Disposition: inline


--82evfD9Ogz2JrdWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 03:02:38PM +0200, Johannes Berg wrote:
> Hi,
>=20
> While my main interest is mostly in UML right now [1] I've CC'ed the
> qemu and virtualization lists because something similar might actually
> apply to other types of virtualization.
>=20
> I'm thinking about adding virt-io support to UML, but the tricky part is
> that while I want to use the virt-io basics (because it's a nice
> interface from the 'inside'), I don't actually want the stock drivers
> that are part of the kernel now (like virtio-net etc.) but rather
> something that integrates with wifi (probably building on hwsim).
>=20
> The 'inside' interfaces aren't really a problem - just have a specific
> device ID for this, and then write a normal virtio kernel driver for it.
>=20
> The 'outside' interfaces are where my thinking breaks down right now.
>=20
> Looking at lkl, the outside is just all implemented in lkl as code that
> gets linked to the library, so in UML terms it'd just be extra 'outside'
> code like the timer handling or other netdev stuff we have today.
> Looking at qemu, it's of course also implemented there, and then
> interfaces with the real network, console abstraction, etc.
>=20
> However, like I said above, I really need something very custom and not
> likely to make it upstream to any project (because what point is that if
> you cannot connect to the rest of the environment I'm building), so I'm
> thinking that perhaps it should be possible to write an abstract
> 'outside' that lets you interact with it really from out-of-process?
> Perhaps through some kind of shared memory segment? I think that gets
> tricky with virt-io doing DMA (I think it does?) though, so that part
> would have to be implemented directly and not out-of-process?
>=20
> But really that's why I'm asking - is there a better way than to just
> link the device-side virt-io code into the same binary (be it lkl lib,
> uml binary, qemu binary)?

Hi Johannes,
Check out vhost-user.  It's a protocol for running a subset of a VIRTIO
device's emulation in a separate process (usually just the data plane
with the PCI emulation and other configuration/setup still handled by
QEMU).

vhost-user uses a UNIX domain socket to pass file descriptors to shared
memory regions.  This way the vhost-user device backend process has
access to guest RAM.

This would be quite different for UML since my understanding is you
don't have guest RAM but actual host Linux processes, but vhost-user
might still give you ideas:
https://git.qemu.org/?p=3Dqemu.git;a=3Dblob_plain;f=3Ddocs/interop/vhost-us=
er.rst;hb=3DHEAD

Stefan

--82evfD9Ogz2JrdWZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzmizYACgkQnKSrs4Gr
c8iyiQgAtcvNB/axTFWFW8B8Yja3ssAl/WQoNmZFkMVKrMmaRWNWwkZpLvFuijDm
hKISZpLqpwJLktRbr57OEBdVBGqyORDULJABoB+Tk4le6zQhgXARKoEetmjUQgEM
0CFEvYO5HrlTERLU0hFfudeH39yz8r3xMI+yZ3PWjCkqZC/KYu8Ny2s82Ltc4mnb
6OjybksHD4G5MDYC0BJO/lXeARjOO6/eLgxMGDPTWENAJTXOCeXg1ZvYtdvPsdOs
TFmzkvY63x8j8jKkgR1iJb1QjtGzpLjzhadfIPSl2MQN7hhBmOOsBzvBNJFAqOlo
ue1U9AT0+ZRt1HMcfWx59MyXofnM+Q==
=2T/5
-----END PGP SIGNATURE-----

--82evfD9Ogz2JrdWZ--

--===============0662405066914852243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0662405066914852243==--
