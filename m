Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F061AD0DDE
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 13:43:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C6753F5A;
	Wed,  9 Oct 2019 11:43:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C3069F5A
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 11:43:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 22C2D14D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 11:43:15 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 5so2187870wmg.0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 04:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=un54BHtF8/awpbVtp/5g79CNHp0Pmiod9UP21TSYdIs=;
	b=cfMf0bjET/C22i1LZv7PCr+g/yJ9RnLl9uGwurRAvBjn0NYDYYQRs1gIqnv8uGj/NQ
	2Ozi08WMklKmYKIPAf0vzXFyxKPSgIafOdCfrdUleJ2gUGUb6MJH6HcG8XJMt/RRG06q
	11xh9mP1omeOfOR6xBznOdBhuMdMnBHXRiFst9dWjXoGXrFGac1aZkQTzLEhjWTaPrGd
	PfjV15f9vGdTf1YzNGJXq9etjhmNZTgUobdSaBSJsxR+SD9HMh7vIayhHEEHrnE+GmCs
	7hk0FM1Dfus0zIN+FBYhTTmtYRVThG5Pqqm4nHAXqKvQKl/P94MG+RlM26LTQr+OOGKX
	LmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=un54BHtF8/awpbVtp/5g79CNHp0Pmiod9UP21TSYdIs=;
	b=FTYqVLSHxXDmUpfffStF9xSDFQDiP+dPgf1BBHY1VylsQ79+ugyqjeJiVusmxA/dKB
	ubevU+m3N1SRGasiy0ZuVwxBuW3oQm0foh6q2ge+sY7YJ38u7z1sJjfEPZofH0jbo4l/
	gtuMzXRdQrhtJiaC9D+fg+PtFXjnWBlGNg6v19OydvKHrDToTa01Q202G/P+gm+zd60r
	OxHQtL3LBzs73eetYvjbcP59CU+2FUyRLsIiuverDHcaxPwVajq2ufC1uWoIM6O2BY/Y
	d+KbDFAYzz53FSxq2aEY99OHLC4vHZIBqCnXW2TRVry4Bc7oYW0gTDcz7U7jbitNgQU1
	75Yg==
X-Gm-Message-State: APjAAAWnFmasOD9rtlzgVLlNswjIdHyLtqvgzkfzazeH243hrg9pqqeh
	7P1EjgxAwCT9bhnqWuVLxnw=
X-Google-Smtp-Source: APXvYqwLwyMkVEpNNJPRSOBI4ea7XjQ9JE2cU8KiTuH7Of7THeIGHSWgXddwJKHY1bi+w7iTxsprIQ==
X-Received: by 2002:a7b:c8d9:: with SMTP id f25mr2332753wml.153.1570621393615; 
	Wed, 09 Oct 2019 04:43:13 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id p5sm2915817wmi.4.2019.10.09.04.43.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 04:43:12 -0700 (PDT)
Date: Wed, 9 Oct 2019 12:43:11 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 03/13] vsock: remove include/linux/vm_sockets.h file
Message-ID: <20191009114311.GD5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-4-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-4-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============3212301308155736846=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============3212301308155736846==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Content-Disposition: inline


--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 01:26:53PM +0200, Stefano Garzarella wrote:
> This header file now only includes the "uapi/linux/vm_sockets.h".
> We can include directly it when needed.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/linux/vm_sockets.h            | 13 -------------
>  include/net/af_vsock.h                |  2 +-
>  include/net/vsock_addr.h              |  2 +-
>  net/vmw_vsock/vmci_transport_notify.h |  1 -
>  4 files changed, 2 insertions(+), 16 deletions(-)
>  delete mode 100644 include/linux/vm_sockets.h

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2dx88ACgkQnKSrs4Gr
c8g54wf+PL7xAZ3eI74ytwJozmNe/9DWAw5l7bnOPC5lh3yi3O6H/afVtuNy65xz
NYAwGHyFqaMtLm4reJeETuun6duQ7+ZKHr8NJHdUkQJFCQIfHJLI7JXfjDD2VSbp
xn9tbLC2eFnCvlnT7Ke8Er9e1KOI2IBGggkOVvn4HbowDVF8/aeCh0aoPt6bYBVf
FXFaWL0WeGoaalzf14LEf3uDMQptQaMFfcXudbWsv4Xfdmtu9EULADXwa2o4rNVx
1c7Iiu7NOXS7jiD/2NzveQvH0lxrPvUQtgNth9abPF1XA+6yJev9DrLnlYTKCn5q
rmIv4DoNGcc8wrcQ6ZB+Quid23UtAg==
=13TI
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--

--===============3212301308155736846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3212301308155736846==--
