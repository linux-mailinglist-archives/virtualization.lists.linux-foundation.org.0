Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC1D101B
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 15:30:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 409BABA4;
	Wed,  9 Oct 2019 13:29:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C5F132F
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 13:29:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 40D735F4
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 13:29:55 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id i16so2614791wmd.3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kPARn1gRAGISUDOuIMr4FiKWck9MsiA5kLmQAdvS720=;
	b=NErizZG0azQ4tnzTvztnRozTwie1h5j4oXuZTEdWR3b+2rNM9uOMvA5cIcZ2luy5RG
	Udr430wAbIizmD/GzgVPCorn2j0BVoreSQ/dM0z8jz4zU+OL1iWL5kllkS0+udAY1PS3
	L74tBc5ZuMt5SW41BsutQIJI2RrM0WJ35l+6UVv4r5E0SNsmPfMKRmjZhueqN+7RErIA
	um+b455mA8/y/1hRX3kenVgcEpTVi9ZZSt3W846FqtlsHwRFU8pQrur9LWyMrByg29Gn
	Qc7pV07JoBOrJ3NMbHZBteZOEjcB70gh+gSRbKtUisfHto6d3jvsB5FKe5LIVtumEVRo
	2jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kPARn1gRAGISUDOuIMr4FiKWck9MsiA5kLmQAdvS720=;
	b=YqQ4zic/2/ky7mKstrVKygLlXyjS/Ht0eWI4Zk5ZkJzQ9y7QSFmC9U+HJOHAfN4mBt
	TuIozzpEOpNViF/sCSeJ5Hvqm4YG4qwipKZhxTzncy1fUehR2Gdeblerz4heqBCzt4/t
	5f3xQoZdLJvOgloNZyJJ68yRnMM0WOc9hUtSrpcLv1JW+JBwp+ZKjXqq6sEmYFdJ+LgT
	N8rMDqGVJLidO9cinz5SIeh+nUKvkU5biiU/FGgC74HN3JzXEVAJMGF58rvzldre+rKD
	sniecrWi8gYlaezt3B5aoMh9Al8F1hrxOGBLxTYtRD6YDtB+jXngg4G7wufd5wxr1cIw
	KMYw==
X-Gm-Message-State: APjAAAUSRjm64Z5wc1bUB7etsuWMbpNa8pykvXd98LLDgZGUgIF633V4
	nF8RJm7H7Vd+Uv5YfWGpcglsTBJkN1o=
X-Google-Smtp-Source: APXvYqzOZya/RwBPXyofFayWNyGbtAoU9HS//lK8oaKkFf5O/NaPrJ1GkbFV3HXNfJ2FijPkk9i+Kw==
X-Received: by 2002:a1c:55c8:: with SMTP id j191mr2601345wmb.54.1570627793829; 
	Wed, 09 Oct 2019 06:29:53 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id z5sm3676203wrs.54.2019.10.09.06.29.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 06:29:53 -0700 (PDT)
Date: Wed, 9 Oct 2019 14:29:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 00/13] vsock: add multi-transports support
Message-ID: <20191009132952.GO5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-1-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============8271682762921606467=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============8271682762921606467==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E+IgQzR66AIOcbjA"
Content-Disposition: inline


--E+IgQzR66AIOcbjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 27, 2019 at 01:26:50PM +0200, Stefano Garzarella wrote:
> Hi all,
> this series adds the multi-transports support to vsock, following
> this proposal:
> https://www.spinics.net/lists/netdev/msg575792.html

Nice series!  I have left a few comments but overall it looks promising.

Stefan

--E+IgQzR66AIOcbjA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2d4M8ACgkQnKSrs4Gr
c8hxCQgAvBCgXesjZRNdIi6a/BOoOtpjAFvdIAVMUPXSLpgkAAwwm/PP7tAvx1MJ
YhMxO/wQRSz0MM8hB5SXpylSlELvGW60PDeBGeQXn9mza8dNK+G1Q1gW+k0+iJId
gcqRKa56j0w0ZwF11MWPE3Z5NTAm3UqDkvnAkzkE6QBRtV6yoQfh7pXVWjL/7it/
Y+D8zOxmNIH8rnCyWudTorhTXZdaXu0HQa0G5Kgj4FQlBimBC9LWVVpc0kch0OIY
CzPrOAhxCXgPjXo7W2rw3e+D3lgiqSfV8RsUkfcWjZR0xv9w0ycyU73HsIlPtvrF
iAvhxHWYhtUV+1CUQEHabyPmMNNclg==
=y58O
-----END PGP SIGNATURE-----

--E+IgQzR66AIOcbjA--

--===============8271682762921606467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8271682762921606467==--
