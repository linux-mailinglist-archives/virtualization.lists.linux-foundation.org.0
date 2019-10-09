Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD23D1016
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 15:28:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B08CFB65;
	Wed,  9 Oct 2019 13:28:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E9BAC2F
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 13:28:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7366F5F4
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 13:28:37 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p7so2611694wmp.4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=I7jMF/Qy1gpLzvR/kN34jEJdNQ3gvhWQW+1n1B3riaI=;
	b=LMKtmy8hlP943Yo/NfDhtwq/wBaNOX0zpKbxyEeVZyrNN1kGf7yoo+/6R2c9OZNEZs
	k/fQbrQhamPPC4uKg8s4ic+2Hm3gLRfw7nwlsDdVUc5CYMtR9mFFosPvhv2gPkBu0q5j
	Fr31uCccDz26FsVg/EeINyhgyvEWsKjCIfZzCsr4gTkbWHo6YOJoG9pWmGWtCX+QVEqc
	9X4bhfhfHqfVOamQ3hFW4xhq1sG8HU9vDQhFlzc7Aya/VFqeKTNlgFtCKSBIIbVXu3dx
	/+IUVX6MghDY4n+V08lebyJDwIdWQeCzV72IK8gWQWEf5Sq2ff1Bb5ZhhXVk41uvhGvm
	HrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=I7jMF/Qy1gpLzvR/kN34jEJdNQ3gvhWQW+1n1B3riaI=;
	b=qnC0alLppbwqSZ3BTMa5TS32WBTrgVrPj8x2cLuUVgchKdzISYj3aTAgHNZ7s+3vD7
	rZL6zinIDjdmk5s1FZ78MG1FGIBlOT+V0Hn4W2P+Z7UwnFnxg2bGcD/rVxT6xjZHhBUq
	XIVH3vI1XrVkrbqxwVKZk+XLsnVhmOL8hM+D31xV3WnPDrC4C2k3NcADb5rVs2P8h6Zw
	OLeQbWmCk0VbACKB6LI2Y/sKEKdW3v8DJ6ZunUGChXfX+P/y1zlGNkv53yrbRyfwwGyZ
	s2g2/Sh7rbd3AsimGtpK/6DmsUC7GSI3YedqON3eLTn3JhdLHxLuIruHVOP8TsqgT24B
	dhgQ==
X-Gm-Message-State: APjAAAXA1T8upHqYg9xppanqsJ+7gqNlAiZ7mRUKYaRSR2OhJOYsWk+F
	lVn6ihdEkP4XGQAp1mWLIkI=
X-Google-Smtp-Source: APXvYqxKwJu6lkxS1KK3M8WqeAE93yjTEj4R/WrVk3k/UcBmQ2RJXQeaqdeRl98n5f6etP6D+PHErw==
X-Received: by 2002:a1c:658a:: with SMTP id z132mr2596866wmb.174.1570627715977;
	Wed, 09 Oct 2019 06:28:35 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id b7sm2763342wrx.56.2019.10.09.06.28.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 06:28:35 -0700 (PDT)
Date: Wed, 9 Oct 2019 14:28:33 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 12/13] vsock: prevent transport modules unloading
Message-ID: <20191009132833.GM5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-13-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-13-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1159089283140870608=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============1159089283140870608==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kunpHVz1op/+13PW"
Content-Disposition: inline


--kunpHVz1op/+13PW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 01:27:02PM +0200, Stefano Garzarella wrote:
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index c5f46b8242ce..750b62711b01 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -416,13 +416,28 @@ int vsock_assign_transport(struct vsock_sock *vsk, =
struct vsock_sock *psk)
>  		return -ESOCKTNOSUPPORT;
>  	}
> =20
> -	if (!vsk->transport)
> +	/* We increase the module refcnt to prevent the tranport unloading

s/tranport/transport/

Otherwise:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--kunpHVz1op/+13PW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2d4IEACgkQnKSrs4Gr
c8gJ2gf/fEP3ucMouPO/fhEeGplHc1JeWTI82mmjT2/LiJgxHaNqylqpIMASW19q
7nn9yxlVS1rBu7D/Os+q4CtQwAc3ea5KvmwwHgFa4v/N1Sm25jklsw/zWMyus6gw
0xc5zcifHOfttIiSKldJuRCc1nYYUnUrakwm1MJjlzB+LEIYUm2/264mLBbyxWqa
TxQBVZSI0BlpISSAry9LKNQIqZU/3gWBa1sIHT3PElSZQ5Z9be7XQciuLi84Hfag
uOky8F3zdmzG2REAu8mKuF0thOyFpPP05O2qo6GML9+ERqf1PwR2qenlTO/cMBzS
KwNQ3ydpast9dLj7idIKHuiQgTIxcQ==
=qIxu
-----END PGP SIGNATURE-----

--kunpHVz1op/+13PW--

--===============1159089283140870608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1159089283140870608==--
