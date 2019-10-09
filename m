Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C3538D0EEC
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 14:34:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0BC81F85;
	Wed,  9 Oct 2019 12:34:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 289F4F4C
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 12:34:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A07F4709
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 12:34:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id o18so2714570wrv.13
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 05:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=M4DGzZVz3C9CsIT3+orcem5mC7xRelRKri3ygcgFcYg=;
	b=Z6Vl8jzwQZv1XXQ8Mh9He/cTpu97fQsfQ1cBmapxrThVkgpqVmy7iiglrNrsC5cwvA
	6IBWyUGhvzVd5dfOS6+lL1zTXjc4zliF5u8ROdz7wF+d4iNr9lc+3q+kGVj91ZHEOJCU
	KWEBZTD6ETHecKoRnKjnjDsrMTsfHZXE4IasyxVGusXKO6jWu7i2N62HMTD3W1mTxpUt
	aIEBA3zVKnhpy140JOHqe+f8Tq0cE/s4Enn5W0O54FTnsp1Jvvw1Q5tB7FkVnOsNisXr
	7mme3cylQ/y7LAc4TxD/ZIps/GWHqcE/hGZ/tggDg4aWu/kUBfnDGjUZtYpFbe2CjSc6
	Y0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=M4DGzZVz3C9CsIT3+orcem5mC7xRelRKri3ygcgFcYg=;
	b=RxXgWcJX0rmWWlTt502tCCURuhzksKsnnxf+BlgX7cmklSt4gZmEkvCiQQNfmDUgA6
	P6C5ga/hw97jstrk3kf7n1zAzNj7M70kdEqLKotS3BUkZzrKTZH7O73hCawmKn/eOlTQ
	+hrZm2Vdcq4BR8tCA/pMQonjik8FMbGG+qWUHvqzXda2CS5EXM8JJguaA1/2+hHJbGbn
	QzmGCv1ARj3XwDRvKDdjR/ZmKBsp0Z5RDA5aZ79LIHJyeKcpaOf9Wpma/7b0OqJ+9kuK
	7xYN/47huoR754mi87C0oFhWnYeWBPbtX0s2DQzvN9t3XfP4/CZUQ1f+1A22CBCtCbBS
	3G6A==
X-Gm-Message-State: APjAAAWtrRTNZOgPXGPOLxvdGaHO5ecgCkneBT8KnqCEp3r1ZbeBDDXf
	oRbvRwIydA/wyZheG+NFuxs=
X-Google-Smtp-Source: APXvYqwApF/DZjfteDasDL2Kkb76g7OqjJVm+JG00dcX3k7i+hz7lkgviUk2SMygweyq2OJ7IZaCyQ==
X-Received: by 2002:adf:e284:: with SMTP id v4mr2653792wri.21.1570624466138;
	Wed, 09 Oct 2019 05:34:26 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	t13sm4438023wra.70.2019.10.09.05.34.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 05:34:25 -0700 (PDT)
Date: Wed, 9 Oct 2019 13:34:23 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 08/13] vsock: move vsock_insert_unbound() in the
	vsock_create()
Message-ID: <20191009123423.GI5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-9-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-9-sgarzare@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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
Content-Type: multipart/mixed; boundary="===============5868878294701454401=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============5868878294701454401==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+PbGPm1eXpwOoWkI"
Content-Disposition: inline


--+PbGPm1eXpwOoWkI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 01:26:58PM +0200, Stefano Garzarella wrote:
> vsock_insert_unbound() was called only when 'sock' parameter of
> __vsock_create() was not null. This only happened when
> __vsock_create() was called by vsock_create().
>=20
> In order to simplify the multi-transports support, this patch
> moves vsock_insert_unbound() at the end of vsock_create().
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  net/vmw_vsock/af_vsock.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Maybe transports shouldn't call __vsock_create() directly.  They always
pass NULL as the parent socket, so we could have a more specific
function that transports call without a parent sock argument.  This
would eliminate any concern over moving vsock_insert_unbound() out of
this function.  In any case, I've checked the code and this patch is
correct.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--+PbGPm1eXpwOoWkI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2d088ACgkQnKSrs4Gr
c8jGUgf/flGT/To2png0jPgQV5oe1jDDk+0D39ubcCGjdMLuOwLdwey4BUbOWK3I
KFEzw7U6CmXNnW15vqqckacUNgL6OXgHKrOxKpiwYvonz2/C0JNLMaTIbsSfcR8u
sXWnnoihq8NTRIJhSxHFaWgqBLWFW8G3sAfFA2oCIiNI8HQhewIy0Sfh2vfuyypU
SjCHAwlodeIMuEmeIlTUEd4RKWqZ3dDAOs5xnl87OWUdzTtgmKEccQLZSvJ/t2Qi
QVVO07S3r7ASe2bpjmTgQuV1ZZ3iz/jyFOYAD3WmE6D6a+afcU+4gUTa9Tbu1TL4
en7c7jB5XF98CqjwO5kjMLozykqVWg==
=Fgki
-----END PGP SIGNATURE-----

--+PbGPm1eXpwOoWkI--

--===============5868878294701454401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5868878294701454401==--
