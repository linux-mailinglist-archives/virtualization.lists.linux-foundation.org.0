Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 785FCD0DD6
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 13:41:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2E2ECF68;
	Wed,  9 Oct 2019 11:41:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C6FBFF68
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 11:41:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 413A55F4
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 11:41:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r3so2516092wrj.6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mMvvYTkM4tkX/zo2Ao0DeJUC7rPkTo80uGcij47czrg=;
	b=TPCovcmHJMC1pvZXwISoRuCV1Sfonuzn0BlRI4oKPe/hzHj3w6Nl8+hnu5qVdPvcBl
	eGA+CYXbem4TVh6WET1EKfA3HwV+lDKzOavXpS2D74h5UWzTp9iQ+4zKkTm4Mbz5ypxg
	9ba2YcuTYX0CqMPqieHUCeefpfHiIFS2Q2AOFAhVQHeDKGZdlZSWKrAqMiHYnAhbcSgf
	GL/99s2KguOl4JzxwCT9LDZEwRZFV7pKOp+1iaZiSYkuZoQ/80MefTf3Ubv8gZD/oeEG
	CS5OLib2PdeApMdcwMiosDnbiSsuNPtD5ls7ElllaEQObVROkac2MzarZ+mJWhrS/z/8
	b68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mMvvYTkM4tkX/zo2Ao0DeJUC7rPkTo80uGcij47czrg=;
	b=CY647MfLa/x6lQ9JlzXugem+povCLtK4inLKxZmaW9/JA9il/WOz9lP4xq4awHmBxV
	qSXROs2L8CcAKLJskDJIaAhy8kIAwQncTRrUIRLOYOUSziNSXwStfoiiijhR24OZt3kj
	DU5QiSAT8SOzkpiaMfQ5SVj0B6Oe8odk2oW5OfoXy6SKRVSRgjsVyBjM8dhdwEqx0IWK
	j1nhZhAfAUnS7YqGQKmluJW+xNl1VbkYpGu3PyhW20YNGqtA5vErBBr3kUzKSl7v7cDp
	evEQt1E10BqF/AqKmtbCjxoj7uVp8c5dqbWbg+bMC/EzgqBan4Jmkc9k/wn+IuG+Ar9R
	W6wQ==
X-Gm-Message-State: APjAAAWGieYbyEeKO39/vWM9VyItqHQOTpWCZrbxdI+50NFuM7bQ+iQY
	m5nulQQ7FuQeudxOA4o71eU=
X-Google-Smtp-Source: APXvYqxuonZuaW/TjLvUCvWw0cX8AjeIVxfiHs749gIi+aa0PGQZLcC696dUFWCro0Q5KN+pZ/fRog==
X-Received: by 2002:a05:6000:1190:: with SMTP id
	g16mr2490550wrx.133.1570621295757; 
	Wed, 09 Oct 2019 04:41:35 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	h63sm3844894wmf.15.2019.10.09.04.41.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 04:41:34 -0700 (PDT)
Date: Wed, 9 Oct 2019 12:41:33 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 01/13] vsock/vmci: remove unused
	VSOCK_DEFAULT_CONNECT_TIMEOUT
Message-ID: <20191009114133.GB5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-2-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-2-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0956305686709165686=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============0956305686709165686==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 01:26:51PM +0200, Stefano Garzarella wrote:
> The VSOCK_DEFAULT_CONNECT_TIMEOUT definition was introduced with
> commit d021c344051af ("VSOCK: Introduce VM Sockets"), but it is
> never used in the net/vmw_vsock/vmci_transport.c.
>=20
> VSOCK_DEFAULT_CONNECT_TIMEOUT is used and defined in
> net/vmw_vsock/af_vsock.c
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  net/vmw_vsock/vmci_transport.c | 5 -----
>  1 file changed, 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2dx20ACgkQnKSrs4Gr
c8hIqAgAvhL+0GDmzG+IqoyqU4u4zMGfhwqu1Tuctdk+5o6AtyHB9jF8qW0lxKfG
m9BlFbKLMcxjmiirqBXOj24o7GMoko98x8mhqBxofFG0/WTAEqe80ibGyAR8f5/t
jNyonyKpw3UU9kuYwlQBDZoCjh6ZAOofpmKrtCbE63GntiCzX3waJ5mlK/5Dqtcy
l7Ol7BjACIKs7gG7i9kF/TtFcU93EcjC8OJuqJ/1bx0y38wMEfCnlpwBkvh2/hQo
K2Lv1qJHosKW+CqXelAYdeT1YWXmAiE2AYfNTPFzVdStra5QV+O3UDGr536IHmDD
Y7Mo+oe8VRerZV4xgiCKHY+E7FUw/A==
=dBuq
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--

--===============0956305686709165686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0956305686709165686==--
