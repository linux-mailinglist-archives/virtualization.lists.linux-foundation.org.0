Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E006D0DD8
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 13:42:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 80E63F5A;
	Wed,  9 Oct 2019 11:42:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9996DF5A
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 11:42:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2681314D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 11:42:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y21so2232613wmi.0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 04:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=c5SSACmthJRQcjJkz/aOKtBtFAYEKfh5z4QTzPsgi4Y=;
	b=j5tdx8nF7X8fZu4hsRKd/9vyZSpHRVdLGFki/5+EuZUC/Vh3+55WPgCkxycSLkeQ2+
	3FLGfFGqHCnDUW6y2RCS+tYGfVY4YTGwpTRPlPzAA35xmR2qLUqwx/eJjnPeqH5Deiz9
	IOQ3jAitlMDxnITZX6li+DSdGpJhlIBS/JeDTYBX4vgyx3T5iLbw/pupJqYhUtpVTwo+
	NLI4HJWk5AsKOYLp4+8bvqqn6s5FkJaK0pnUenMqh5Uhb+vENvSrJ7mM8c6fT7cTNIC2
	I3KFL+WOQlolgxOgQ8w1dERgNuxGpgwa00v4YdnXu2I/+jK0l6aUMEpgp8WMzUAGlmdo
	saOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=c5SSACmthJRQcjJkz/aOKtBtFAYEKfh5z4QTzPsgi4Y=;
	b=FmK6gTSxEE8zCfNRPUIwDhvIN+DtmR8vmK3N0kBFKBa1TGWryjtlMj8js2JxYTcaUE
	cjqj7TEfk0CBstKdPCtUAefu2UP1dhVrf7dWXOchSUBCI25RolNjgZdBPj3o6D5Iny3g
	pgw+ZCsaLnDFPtjdZIMSd8mhe+I4q1rxc/wEeBeOB6KpaXuhkYSnkHSjgyLYMbo392+z
	kjRPZ+mDYpWs+PLbhhIyTiZvifbCEttIsWVJx7l/zJejyZHp3FuCskIdwbP/GxmFRXPr
	meSnWw0VFftfsRsLu4xEae3LVzbcld8YSM8uht3cGHMPvBmnxZV/ToKlZmxUvuzTAh47
	GANg==
X-Gm-Message-State: APjAAAWGx6d2VcY3HTsompLctn5yPtJ8SwOVcyU5P98xVHE6nvszeyap
	zc6t57xN8CofF8C7nzJU7A4=
X-Google-Smtp-Source: APXvYqxDusp37rvnAAD8JV7i111vUFrUvZt0D6U0IlYV2lVUtocVAp+sY2ltqAtjrhtVSpEyY/ib6A==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr2223617wma.16.1570621346629; 
	Wed, 09 Oct 2019 04:42:26 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	v20sm1848031wml.26.2019.10.09.04.42.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 04:42:25 -0700 (PDT)
Date: Wed, 9 Oct 2019 12:42:24 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 02/13] vsock: remove vm_sockets_get_local_cid()
Message-ID: <20191009114224.GC5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-3-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-3-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============3201932903756432392=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============3201932903756432392==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Content-Disposition: inline


--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 01:26:52PM +0200, Stefano Garzarella wrote:
> vm_sockets_get_local_cid() is only used in virtio_transport_common.c.
> We can replace it calling the virtio_transport_get_ops() and
> using the get_local_cid() callback registered by the transport.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/linux/vm_sockets.h              |  2 --
>  net/vmw_vsock/af_vsock.c                | 10 ----------
>  net/vmw_vsock/virtio_transport_common.c |  2 +-
>  3 files changed, 1 insertion(+), 13 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2dx6AACgkQnKSrs4Gr
c8hCTQf7B7NVspFDFsnm05GLUu5jhE/dRHrC3VyeqqicE3uUMPD7T+dn+SoNtnKs
OX/U72s4FYr4zeIPdjJaH4nqrMEmX8Cl6v9T20IEH58vvEnms/9iSyj0w+FdTFD7
ob0Ggxu22UzOtKpdYjzKXO2JyzxEguYGigkvWnN+WNAlLxfI4UyruK7LGhLrngDe
1TdiSHMS/b/HDZgQVbcF8wSEg9D+yg6gJsz+CiYneq3hcTR1ezWBCVLwUmkMGm9E
WOJP23V3t0m5K+Ottl8daxdvvIh58O/y9Xsrd8G4FRAjJvpSGwiai4KPnTfAhHzQ
sLP3Xt853ipwkz1KWXmS9dg8eJEyTQ==
=k7J2
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--

--===============3201932903756432392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3201932903756432392==--
