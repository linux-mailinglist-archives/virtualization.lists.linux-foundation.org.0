Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AB9D1019
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 15:29:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F2602B65;
	Wed,  9 Oct 2019 13:29:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 417EB2F
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 13:29:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C1A165F4
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 13:29:22 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r19so2623503wmh.2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GDuh8wOWud4/h7FBqgUO27K9UbX8e3rhEg2xYH7BQNg=;
	b=f+nXm2f/x4SFc3z61bN/4O+TQEsVxwJLm1a8Ysx2R0Jwt5UoKtc7Rb9yu4+9HgkILs
	2wvIwU68sXGIVb1+YrM4MaTImBjZfYmarAqMC2Y7wZCPqcBvarWKAZ06VBSN8aGr/yhu
	CFfyXyi9K+DxQ8OHAp3bJFHDFyGpXl+PfCZPVC9Rmphk88/T5Y2xYIxo91ECmlJC8BZk
	9H6aB0DiFx3hQa1Z9M2a4UJbePb/vpazuPthF2V4dtM+Qx0r8gHkCyjKoAqa0IzscDd2
	GeUfBWin4JZN/V8wtLAGvLX3g816AfgCZG/57Xt3zlpLYNh+I6iatUhB3mS76zoyZ0ss
	ZNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GDuh8wOWud4/h7FBqgUO27K9UbX8e3rhEg2xYH7BQNg=;
	b=jYYu+aOL9tduPKKWIEv3lTUbBAL03CrSpW11/uUdfphX8l/6iZNm1GuiiyCh/iO9fY
	buFo/ihRNk111QVzHfoohHXW5JaNodnUnVgLmAXmuP1azvo3ezI0xHhYleX3CGPN5FIv
	Zuka7efCr3Q2De3pPhahaFYUu1PDIThkFUPQcESSqVeFFD0ypGDj9CsRjXSu6LtRXskO
	prCPHJJyn+Gmt/5mbpzZCN2HUB30JLEPnJItrZ/73Yd/WDfqeqkoxSleQ+rsYxo4ycEJ
	EzPaWoEERiVgSq9sYHdUk/rDrZJNsXFievnOU/NedPXI9oeg69/V9Y3jFCLeMZHTnz84
	QMoA==
X-Gm-Message-State: APjAAAX6ORNxoR20/NOdYiY63EoF47FBPqxYP4jeq4fQlHUe8UgrCfii
	N4rjAmQCvUwGuR/4jvou1es=
X-Google-Smtp-Source: APXvYqw1aUJubsYg5UUcikhG5dviUNyvuNRUtpwlBrEioF409+G2sxwGyLDf1q0QhLloVC316zvwsQ==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr2434290wmc.24.1570627761339; 
	Wed, 09 Oct 2019 06:29:21 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	t83sm3862315wmt.18.2019.10.09.06.29.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 06:29:20 -0700 (PDT)
Date: Wed, 9 Oct 2019 14:29:19 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 13/13] vsock: fix bind() behaviour taking care of CID
Message-ID: <20191009132919.GN5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-14-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-14-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============3364202245680554682=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============3364202245680554682==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cs5saTBZh7UZl2eX"
Content-Disposition: inline


--cs5saTBZh7UZl2eX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 01:27:03PM +0200, Stefano Garzarella wrote:
> When we are looking for a socket bound to a specific address,
> we also have to take into account the CID.
>=20
> This patch is useful with multi-transports support because it
> allows the binding of the same port with different CID, and
> it prevents a connection to a wrong socket bound to the same
> port, but with different CID.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  net/vmw_vsock/af_vsock.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--cs5saTBZh7UZl2eX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2d4K8ACgkQnKSrs4Gr
c8jIHQgArLXLyHXwZu55EHHu9yiNNFHasNE5dRT3AdGHmJvK/neRvEFmuyQ2w9Xr
Ap1yzIgihhRbUNxJaiyxXeuB1KwSQmWUSs15m027eetOieQFnnPZodUYF1PVRloj
+2ol43xqmHW4vOlqdXbTrl6Ggr97gSNylVBDC5naNbR/r7/md1MYEmkpRTGHlUFe
IPQ5Ip2z8hWKLnK70fs1yYKmj8Tbb+pZBDN68i3iC5+98SzrvY9Tix1SfeQwVSn+
HKXhugUiYvtl2VwaqSEud28/3Hqcxe3wnfZcYXFJkPhj5p0/gprCBUeLUfP4jwlz
b42+Ttg66N+HW7vXgrTesK83l3PpJA==
=f3oL
-----END PGP SIGNATURE-----

--cs5saTBZh7UZl2eX--

--===============3364202245680554682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3364202245680554682==--
