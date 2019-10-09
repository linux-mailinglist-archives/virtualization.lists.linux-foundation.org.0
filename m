Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2F5D0EF1
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 14:35:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5511AF89;
	Wed,  9 Oct 2019 12:35:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 623ECF5A
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 12:35:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E7017709
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 12:35:27 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f22so2417271wmc.2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zrukuNIIpELS1SFhnaqgjV+S03DcpwgywhfpTJYGiQY=;
	b=YXWWoxP687A4XDYTVavYfNNciK2iQ3bmHf87UHCsApkdu79BpNx2//OcEqWcVxnCyi
	xLJgx28lRn8/3stvBve9smtm0pdcFk5rF6GR32ipf7KGFWBiSDNJ/G313z/GJbOLOyf1
	0GgmM4KMdLcmEr2tkc2lUPvzB9oV1LKtFNj5r1N1ztWPV3Ihq78w4at+y9KLqPFjD2dr
	wCUpV6hILJU9EpH4psIpdxWw/p5i64tRaF8FSoAJB6NFaftHNxo7ruiynw+UvZgN0PXt
	vjlD/f63gHYQPqtUD/uzBOMUaPgw9i4Bx9EbeTD923ox9nnMe3Eo1FhGzxATp5KDB48A
	5spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zrukuNIIpELS1SFhnaqgjV+S03DcpwgywhfpTJYGiQY=;
	b=mPrwf0adsrdR7qYbUv6qa6pM+BAF3KwChf9pbPD4Y4mzgxNnNkF+QnA3VOgwIBZqhO
	YXPL5SGZ7X6+nMGBgLncL/beESy7fJfgaoR31x7+bVGvlegLU+x57AMvSiFOtGmSaXtx
	EA0Eik0RC2+q7/K7gaMZhQWKlhexbnmKUIBaeYHnUBqippg/JdwT1HOJbKEcDVpMDnfz
	lURn9xI0S63pXa/xhAfc0F83pazwTkDPwPeRFmBPHitu60zNdqv8DwWPf2UqoDWyWNfg
	SVa7P0yP4kVjqY/wxB4FrH+xnz6DzWmpSNeLMxDh5+DytSUb6Um5sGdpYCmhVGMVcqLr
	YQpQ==
X-Gm-Message-State: APjAAAX23P2N8PDdpz4xrH1k9dfgK1jbJ3ZTxhEKBAQvwbkpF+yjieDc
	UAbe2JxQTv7iyNwJAJ+a7TnuFbFk3l8=
X-Google-Smtp-Source: APXvYqyIM0rgTcW2Gxf93OV7hWpxtlNpWqt+guqqmn2grspSyMcKu7E2vZauZhYTsT6VIMg9UDo/NQ==
X-Received: by 2002:a1c:a8c7:: with SMTP id r190mr2445724wme.162.1570624526496;
	Wed, 09 Oct 2019 05:35:26 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	d15sm2260310wru.50.2019.10.09.05.35.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 05:35:25 -0700 (PDT)
Date: Wed, 9 Oct 2019 13:35:24 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 09/13] hv_sock: set VMADDR_CID_HOST in the
	hvs_remote_addr_init()
Message-ID: <20191009123524.GJ5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-10-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-10-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============5339365623878655763=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============5339365623878655763==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5me2qT3T17SWzdxI"
Content-Disposition: inline


--5me2qT3T17SWzdxI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 01:26:59PM +0200, Stefano Garzarella wrote:
> Remote peer is always the host, so we set VMADDR_CID_HOST as
> remote CID instead of VMADDR_CID_ANY.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  net/vmw_vsock/hyperv_transport.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--5me2qT3T17SWzdxI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2d1AwACgkQnKSrs4Gr
c8jb5wf/RiXbiexvEEg0hOVPHCNYSDBNEehuU8/ZUOo11ueiWzI9+b5rFidWUcc9
4VZ3SCtzOW/3meXooyF42QP97QPJ0sQO3jpPZjCECe9McxAbm0zum+N3Cb/0AbjT
xrpQ1FHtTgGBHydsxFcsyIcZMvp91o4Q7qNtExg/CB7vbOEJXFkSmh5968GD3o1f
uK0Rqjqgx1Fm30mT41uRe41JvrE7QtJr8yc/uFB2h2JL7RgxRa+G+mIV1+66P2t+
xIwq8Nj/JyQBfvD82Bvezuvf6ITNloJ7/97xTnHgg2U0YcslB/cU8gArZJlWHAKv
O9b3imMu/xyzY1oO4yJ+mmOM3cEtFQ==
=ktlx
-----END PGP SIGNATURE-----

--5me2qT3T17SWzdxI--

--===============5339365623878655763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5339365623878655763==--
